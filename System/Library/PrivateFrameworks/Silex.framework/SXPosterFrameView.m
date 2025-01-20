@interface SXPosterFrameView
- (BOOL)accessibilityIgnoresInvertColors;
- (SVVideoPlayButton)playButton;
- (SXPosterFrameView)initWithFrame:(CGRect)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setPlayButton:(id)a3;
@end

@implementation SXPosterFrameView

- (SXPosterFrameView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SXPosterFrameView;
  v3 = -[SXPosterFrameView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SXPosterFrameView *)v3 setContentMode:2];
    [(SXPosterFrameView *)v4 setUserInteractionEnabled:1];
    v5 = [MEMORY[0x263F1C550] blackColor];
    [(SXPosterFrameView *)v4 setBackgroundColor:v5];

    [(SXPosterFrameView *)v4 setClipsToBounds:1];
    id v6 = objc_alloc(MEMORY[0x263F6C6B0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    playButton = v4->_playButton;
    v4->_playButton = (SVVideoPlayButton *)v7;

    [(SVVideoPlayButton *)v4->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SXPosterFrameView *)v4 addSubview:v4->_playButton];
    v9 = [(SXPosterFrameView *)v4 playButton];
    v10 = [v9 centerXAnchor];
    v11 = [(SXPosterFrameView *)v4 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(SXPosterFrameView *)v4 playButton];
    v14 = [v13 centerYAnchor];
    v15 = [(SXPosterFrameView *)v4 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(SXPosterFrameView *)v4 playButton];
    v18 = [v17 widthAnchor];
    v19 = [v18 constraintEqualToConstant:80.0];
    [v19 setActive:1];

    v20 = [(SXPosterFrameView *)v4 playButton];
    v21 = [v20 heightAnchor];
    v22 = [v21 constraintEqualToConstant:80.0];
    [v22 setActive:1];
  }
  return v4;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x263F1CB60];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__SXPosterFrameView_setImage_animated___block_invoke;
    v9[3] = &unk_264651158;
    v9[4] = self;
    id v10 = v6;
    [v8 transitionWithView:self duration:5242880 options:v9 animations:0 completion:0.100000001];
  }
  else
  {
    [(SXPosterFrameView *)self setImage:v6];
  }
}

uint64_t __39__SXPosterFrameView_setImage_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SVVideoPlayButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end