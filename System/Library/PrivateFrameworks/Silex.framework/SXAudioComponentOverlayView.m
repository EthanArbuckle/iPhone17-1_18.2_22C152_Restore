@interface SXAudioComponentOverlayView
- (SXAudioComponentOverlayView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UIButton)playButton;
- (UIImage)audioIndicatorImage;
- (id)image;
- (void)setImage:(id)a3;
- (void)startActivityIndicator;
- (void)stopActivityIndicator;
@end

@implementation SXAudioComponentOverlayView

- (SXAudioComponentOverlayView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SXAudioComponentOverlayView;
  v3 = -[SXAudioComponentOverlayView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F1C6B0];
    v5 = SXBundle();
    v6 = [v4 imageNamed:@"SXAudioOnlyIndicator" inBundle:v5];
    v7 = [MEMORY[0x263F1C550] systemGrayColor];
    uint64_t v8 = [v6 _flatImageWithColor:v7];
    audioIndicatorImage = v3->_audioIndicatorImage;
    v3->_audioIndicatorImage = (UIImage *)v8;

    [(SXAudioComponentOverlayView *)v3 setImage:v3->_audioIndicatorImage];
    [(SXAudioComponentOverlayView *)v3 setContentMode:4];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:0];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v10;

    [(UIActivityIndicatorView *)v3->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v3->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SXAudioComponentOverlayView *)v3 addSubview:v3->_activityIndicator];
    v12 = [(UIActivityIndicatorView *)v3->_activityIndicator centerXAnchor];
    v13 = [(SXAudioComponentOverlayView *)v3 centerXAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [(UIActivityIndicatorView *)v3->_activityIndicator centerYAnchor];
    v16 = [(SXAudioComponentOverlayView *)v3 centerYAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    id v18 = objc_alloc(MEMORY[0x263F6C6B0]);
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    playButton = v3->_playButton;
    v3->_playButton = (UIButton *)v19;

    [(UIButton *)v3->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SXAudioComponentOverlayView *)v3 addSubview:v3->_playButton];
    v21 = [(UIButton *)v3->_playButton centerXAnchor];
    v22 = [(SXAudioComponentOverlayView *)v3 centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(UIButton *)v3->_playButton centerYAnchor];
    v25 = [(SXAudioComponentOverlayView *)v3 centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIButton *)v3->_playButton widthAnchor];
    v28 = [v27 constraintEqualToConstant:80.0];
    [v28 setActive:1];

    v29 = [(UIButton *)v3->_playButton heightAnchor];
    v30 = [v29 constraintEqualToConstant:80.0];
    [v30 setActive:1];
  }
  return v3;
}

- (id)image
{
  v6.receiver = self;
  v6.super_class = (Class)SXAudioComponentOverlayView;
  v3 = [(SXAudioComponentOverlayView *)&v6 image];
  v4 = [(SXAudioComponentOverlayView *)self audioIndicatorImage];

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SXAudioComponentOverlayView *)self audioIndicatorImage];

  if (v5 != v4) {
    [(SXAudioComponentOverlayView *)self setContentMode:1];
  }
  v6.receiver = self;
  v6.super_class = (Class)SXAudioComponentOverlayView;
  [(SXAudioComponentOverlayView *)&v6 setImage:v4];
}

- (void)startActivityIndicator
{
  v3 = [(SXAudioComponentOverlayView *)self activityIndicator];
  [v3 setAlpha:0.0];

  id v4 = [(SXAudioComponentOverlayView *)self activityIndicator];
  [v4 setHidden:0];

  id v5 = [(SXAudioComponentOverlayView *)self activityIndicator];
  [v5 startAnimating];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke;
  v7[3] = &unk_2646511F8;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke_2;
  v6[3] = &unk_2646521E0;
  v6[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:v6 completion:0.2];
}

void __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playButton];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) activityIndicator];
  [v3 setAlpha:1.0];
}

void __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playButton];
  [v1 setHidden:1];
}

- (void)stopActivityIndicator
{
  id v3 = [(SXAudioComponentOverlayView *)self playButton];
  [v3 setHidden:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke;
  v5[3] = &unk_2646511F8;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke_2;
  v4[3] = &unk_2646521E0;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:v4 completion:0.2];
}

void __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) activityIndicator];
  [v3 setAlpha:0.0];
}

void __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activityIndicator];
  [v2 stopAnimating];

  id v3 = [*(id *)(a1 + 32) activityIndicator];
  [v3 setHidden:1];
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (UIImage)audioIndicatorImage
{
  return self->_audioIndicatorImage;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_audioIndicatorImage, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
}

@end