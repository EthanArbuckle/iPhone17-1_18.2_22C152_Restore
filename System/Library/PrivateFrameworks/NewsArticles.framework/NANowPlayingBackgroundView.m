@interface NANowPlayingBackgroundView
- (NANowPlayingBackgroundView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UIVisualEffectView)visualEffectsView;
- (void)setImage:(id)a3;
@end

@implementation NANowPlayingBackgroundView

- (NANowPlayingBackgroundView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NANowPlayingBackgroundView;
  v3 = -[NANowPlayingBackgroundView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke;
    v14[3] = &unk_1E6406068;
    v5 = v3;
    v15 = v5;
    uint64_t v6 = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke((uint64_t)v14);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v6;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2;
    v12[3] = &unk_1E6406090;
    v8 = v5;
    v13 = v8;
    uint64_t v9 = __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2((uint64_t)v12);
    visualEffectsView = v8->_visualEffectsView;
    v8->_visualEffectsView = (UIVisualEffectView *)v9;
  }
  return v4;
}

id __44__NANowPlayingBackgroundView_initWithFrame___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setContentMode:2];
  [v3 setAutoresizingMask:18];
  [*(id *)(a1 + 32) addSubview:v3];
  return v3;
}

id __44__NANowPlayingBackgroundView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:18];
  v4 = (void *)[v2 initWithEffect:v3];

  [v4 setAutoresizingMask:18];
  [*(id *)(a1 + 32) addSubview:v4];
  return v4;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v6 = [(NANowPlayingBackgroundView *)self imageView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NANowPlayingBackgroundView_setImage___block_invoke;
  v8[3] = &unk_1E64060B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 transitionWithView:v6 duration:5242880 options:v8 animations:0 completion:0.25];
}

void __39__NANowPlayingBackgroundView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIVisualEffectView)visualEffectsView
{
  return self->_visualEffectsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectsView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end