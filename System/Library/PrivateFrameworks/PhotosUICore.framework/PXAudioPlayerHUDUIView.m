@interface PXAudioPlayerHUDUIView
- (PXAudioPlayer)audioPlayer;
- (PXAudioPlayerHUDUIView)initWithFrame:(CGRect)a3 audioPlayer:(id)a4;
- (void)_updateDisplayLink;
- (void)_updateInfoText;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAudioPlayer:(id)a3;
@end

@implementation PXAudioPlayerHUDUIView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
}

- (void)setAudioPlayer:(id)a3
{
}

- (PXAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)_updateDisplayLink
{
  v3 = [(PXAudioPlayerHUDUIView *)self window];

  displayLink = self->_displayLink;
  if (v3)
  {
    if (displayLink) {
      return;
    }
    v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleDisplayLink_];
    v6 = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    uint64_t v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];
    v8 = (CADisplayLink *)v9;
  }
  else
  {
    if (!displayLink) {
      return;
    }
    [(CADisplayLink *)displayLink invalidate];
    v8 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_updateInfoText
{
  audioPlayer = self->_audioPlayer;
  [(UILabel *)self->_trackLabel bounds];
  -[PXAudioPlayer lcdStringForSize:](audioPlayer, "lcdStringForSize:", v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_trackLabel setText:v6];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayerHUDUIView;
  [(PXAudioPlayerHUDUIView *)&v3 layoutSubviews];
  [(PXAudioPlayerHUDUIView *)self bounds];
  CGRect v5 = CGRectInset(v4, 30.0, 30.0);
  -[UILabel setFrame:](self->_trackLabel, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayerHUDUIView;
  [(PXAudioPlayerHUDUIView *)&v3 didMoveToWindow];
  [(PXAudioPlayerHUDUIView *)self _updateDisplayLink];
}

- (PXAudioPlayerHUDUIView)initWithFrame:(CGRect)a3 audioPlayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXAudioPlayerHUDUIView;
  v11 = -[PXAudioPlayerHUDUIView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioPlayer, a4);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    trackLabel = v12->_trackLabel;
    v12->_trackLabel = v13;

    [(UILabel *)v12->_trackLabel setNumberOfLines:0];
    [(UILabel *)v12->_trackLabel setTextAlignment:0];
    [(PXAudioPlayerHUDUIView *)v12 addSubview:v12->_trackLabel];
    v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXAudioPlayerHUDUIView *)v12 setBackgroundColor:v15];

    [(PXAudioPlayerHUDUIView *)v12 _updateInfoText];
  }

  return v12;
}

@end