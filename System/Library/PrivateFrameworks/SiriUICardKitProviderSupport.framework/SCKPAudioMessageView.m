@interface SCKPAudioMessageView
- (CGSize)sizeThatFits:(CGSize)result;
- (SCKPAudioMessageView)initWithAudioMessageURL:(id)a3 delegate:(id)a4;
- (int64_t)playButtonState;
- (void)_playButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setPlayButtonState:(int64_t)a3;
@end

@implementation SCKPAudioMessageView

- (SCKPAudioMessageView)initWithAudioMessageURL:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCKPAudioMessageView;
  v8 = [(SCKPAudioMessageView *)&v32 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = [MEMORY[0x263F1C6C8] configurationWithPointSize:38.0];
    uint64_t v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play.circle.fill" withConfiguration:v10];
    playImage = v9->_playImage;
    v9->_playImage = (UIImage *)v11;

    uint64_t v13 = [(UIImage *)v9->_playImage imageWithRenderingMode:2];
    v14 = v9->_playImage;
    v9->_playImage = (UIImage *)v13;

    uint64_t v15 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pause.circle.fill" withConfiguration:v10];
    pauseImage = v9->_pauseImage;
    v9->_pauseImage = (UIImage *)v15;

    uint64_t v17 = [(UIImage *)v9->_pauseImage imageWithRenderingMode:2];
    v18 = v9->_pauseImage;
    v9->_pauseImage = (UIImage *)v17;

    v19 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
    playButton = v9->_playButton;
    v9->_playButton = v19;

    [(UIButton *)v9->_playButton setImage:v9->_playImage forState:0];
    v21 = v9->_playButton;
    v22 = [MEMORY[0x263F1C550] labelColor];
    v23 = [v22 colorWithAlphaComponent:0.5];
    [(UIButton *)v21 setTintColor:v23];

    [(UIButton *)v9->_playButton addTarget:v9 action:sel__playButtonPressed_ forControlEvents:64];
    [(SCKPAudioMessageView *)v9 addSubview:v9->_playButton];
    [(SCKPAudioMessageView *)v9 setPlayButtonState:0];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2050000000;
    v24 = (void *)getCKMediaObjectManagerClass_softClass;
    uint64_t v37 = getCKMediaObjectManagerClass_softClass;
    if (!getCKMediaObjectManagerClass_softClass)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __getCKMediaObjectManagerClass_block_invoke;
      v33[3] = &unk_26484DE68;
      v33[4] = &v34;
      __getCKMediaObjectManagerClass_block_invoke((uint64_t)v33);
      v24 = (void *)v35[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v34, 8);
    v26 = [v25 sharedInstance];
    v27 = [v26 mediaObjectWithFileURL:v6 filename:0 transcoderUserInfo:0];
    v28 = [v27 composeWaveformForWidth:1 orientation:300.0];
    v29 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    waveformImageView = v9->_waveformImageView;
    v9->_waveformImageView = v29;

    [(UIImageView *)v9->_waveformImageView setImage:v28];
    [(SCKPAudioMessageView *)v9 addSubview:v9->_waveformImageView];
  }
  return v9;
}

- (void)setPlayButtonState:(int64_t)a3
{
  if (self->_playButtonState != a3)
  {
    self->_playButtonState = a3;
    if (!a3)
    {
      v3 = &OBJC_IVAR___SCKPAudioMessageView__playImage;
      goto LABEL_7;
    }
    if (a3 == 1)
    {
      v3 = &OBJC_IVAR___SCKPAudioMessageView__pauseImage;
LABEL_7:
      [(UIButton *)self->_playButton setImage:*(Class *)((char *)&self->super.super.super.isa + *v3) forState:0];
    }
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SCKPAudioMessageView;
  [(SCKPAudioMessageView *)&v10 layoutSubviews];
  [(SCKPAudioMessageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[UIButton setFrame:](self->_playButton, "setFrame:");
  [(UIButton *)self->_playButton size];
  -[UIImageView setFrame:](self->_waveformImageView, "setFrame:", v9 + 10.0, v4, v6 - v8 + -10.0, v8);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 38.0;
  result.height = v3;
  return result;
}

- (void)_playButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained audioMessagePlayButtonTapped:self];
}

- (int64_t)playButtonState
{
  return self->_playButtonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_playButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end