@interface PKImageSequenceView
- (id)initWitImages:(id)a3;
- (void)_finishedTransitionToImage:(id)a3;
- (void)_transitionToImage:(id)a3 immedately:(BOOL)a4 fast:(BOOL)a5;
- (void)layoutSubviews;
- (void)startAnimation;
- (void)stopAnimation;
- (void)updateImages:(id)a3;
@end

@implementation PKImageSequenceView

- (id)initWitImages:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKImageSequenceView;
  v5 = -[PKImageSequenceView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    images = v5->_images;
    v5->_images = (NSArray *)v6;

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v5->_imageView;
    v5->_imageView = v8;

    v10 = v5->_imageView;
    v11 = [(NSArray *)v5->_images firstObject];
    [(UIImageView *)v10 setImage:v11];

    [(UIImageView *)v5->_imageView setContentMode:1];
    [(UIImageView *)v5->_imageView setAccessibilityIgnoresInvertColors:1];
    [(PKImageSequenceView *)v5 addSubview:v5->_imageView];
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    fadeInImageView = v5->_fadeInImageView;
    v5->_fadeInImageView = v12;

    [(UIImageView *)v5->_fadeInImageView setContentMode:1];
    [(UIImageView *)v5->_fadeInImageView setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v5->_fadeInImageView setAlpha:0.0];
    [(PKImageSequenceView *)v5 addSubview:v5->_fadeInImageView];
    if (![v4 count])
    {
      v14 = [MEMORY[0x1E4FB1618] lightGrayColor];
      [(PKImageSequenceView *)v5 setBackgroundColor:v14];
    }
  }

  return v5;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKImageSequenceView;
  [(PKImageSequenceView *)&v5 layoutSubviews];
  imageView = self->_imageView;
  [(PKImageSequenceView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
  fadeInImageView = self->_fadeInImageView;
  [(PKImageSequenceView *)self bounds];
  -[UIImageView setFrame:](fadeInImageView, "setFrame:");
}

- (void)updateImages:(id)a3
{
  if (a3)
  {
    id v4 = (NSArray *)[a3 copy];
    images = self->_images;
    self->_images = v4;

    [(PKImageSequenceView *)self startAnimation];
  }
}

- (void)startAnimation
{
  if (![(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    NSUInteger v3 = [(NSArray *)self->_images count];
    if (!self->_isAnimating && v3 != 0)
    {
      self->_isAnimating = 1;
      NSUInteger v5 = [(NSArray *)self->_images count];
      uint64_t v6 = [(NSArray *)self->_images firstObject];
      id v13 = (id)v6;
      if (v5 < 2)
      {
        uint64_t v12 = v6;
        v9 = self;
        uint64_t v8 = v12;
        uint64_t v10 = 1;
        uint64_t v11 = 1;
      }
      else
      {
        id v7 = [(UIImageView *)self->_imageView image];
        self->_activeImageIndex = v13 == v7;

        uint64_t v8 = [(NSArray *)self->_images objectAtIndex:self->_activeImageIndex];
        v9 = self;
        id v13 = (id)v8;
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      [(PKImageSequenceView *)v9 _transitionToImage:v8 immedately:v10 fast:v11];
    }
  }
}

- (void)stopAnimation
{
  self->_isAnimating = 0;
  ++self->_animationContext;
}

- (void)_transitionToImage:(id)a3 immedately:(BOOL)a4 fast:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_initWeak(&location, self);
  animationContext = (void *)self->_animationContext;
  [(UIImageView *)self->_fadeInImageView setAlpha:0.0];
  [(UIImageView *)self->_fadeInImageView setImage:v8];
  [(PKImageSequenceView *)self bringSubviewToFront:self->_fadeInImageView];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke;
  aBlock[3] = &unk_1E59DA938;
  aBlock[4] = self;
  v18[1] = animationContext;
  BOOL v19 = a5;
  objc_copyWeak(v18, &location);
  id v10 = v8;
  id v17 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = v11;
  if (v6)
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
  else
  {
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_4;
    block[3] = &unk_1E59CAA98;
    id v15 = v12;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 416) == *(void *)(a1 + 56))
  {
    NSUInteger v3 = (void *)MEMORY[0x1E4FB1EB0];
    if (*(unsigned char *)(a1 + 64)) {
      double v4 = 0.25;
    }
    else {
      double v4 = 1.0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_2;
    v9[3] = &unk_1E59CA7A8;
    v9[4] = v1;
    NSUInteger v5 = (id *)(a1 + 48);
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_3;
    v6[3] = &unk_1E59CB268;
    objc_copyWeak(&v8, v5);
    id v7 = *(id *)(a1 + 40);
    [v3 animateWithDuration:0x10000 delay:v9 options:v6 animations:v4 completion:0.0];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
  }
}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  [WeakRetained setBackgroundColor:v2];
}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _finishedTransitionToImage:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

uint64_t __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_finishedTransitionToImage:(id)a3
{
  p_fadeInImageView = &self->_fadeInImageView;
  fadeInImageView = self->_fadeInImageView;
  id v8 = fadeInImageView;
  objc_storeStrong((id *)p_fadeInImageView, self->_imageView);
  objc_storeStrong((id *)&self->_imageView, fadeInImageView);
  if (self->_isAnimating && [(NSArray *)self->_images count] >= 2)
  {
    unint64_t v6 = self->_activeImageIndex + 1;
    self->_activeImageIndex = v6 % [(NSArray *)self->_images count];
    id v7 = -[NSArray objectAtIndex:](self->_images, "objectAtIndex:");
    [(PKImageSequenceView *)self _transitionToImage:v7 immedately:0 fast:0];
  }
  else
  {
    [(PKImageSequenceView *)self stopAnimation];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_fadeInImageView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end