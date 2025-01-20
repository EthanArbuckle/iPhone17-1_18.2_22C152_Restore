@interface VUIImageProxyAnimator
- (BOOL)isAnimating;
- (BOOL)isCachingEnabled;
- (NSArray)imageProxies;
- (NSTimer)transitionTimer;
- (VUIImageProxyAnimator)init;
- (VUIImageProxyAnimator)initWithImageView:(id)a3 andProxies:(id)a4;
- (_TVImageView)imageView;
- (double)animationDuration;
- (double)transitionInterval;
- (unint64_t)animationOptions;
- (unint64_t)displayImageIndex;
- (unint64_t)indexOfFetchedImage;
- (void)_displayIntervalTimerFired:(id)a3;
- (void)_fetchNext;
- (void)_setImage:(id)a3 animated:(BOOL)a4;
- (void)_updateImageWithIndex:(unint64_t)a3;
- (void)loadImageProxy:(id)a3 withWeakObject:(id)a4 completionHandler:(id)a5;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setCachingEnabled:(BOOL)a3;
- (void)setDisplayImageIndex:(unint64_t)a3;
- (void)setImageProxies:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIndexOfFetchedImage:(unint64_t)a3;
- (void)setTransitionInterval:(double)a3;
- (void)setTransitionTimer:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation VUIImageProxyAnimator

- (VUIImageProxyAnimator)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA9CE0]);
  v4 = [(VUIImageProxyAnimator *)self initWithImageView:v3 andProxies:0];

  return v4;
}

- (VUIImageProxyAnimator)initWithImageView:(id)a3 andProxies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIImageProxyAnimator;
  v9 = [(VUIImageProxyAnimator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_cachingEnabled = 1;
    objc_storeStrong((id *)&v9->_imageProxies, a4);
    *(_OWORD *)&v10->_displayImageIndex = xmmword_1E38FDA90;
    objc_storeStrong((id *)&v10->_imageView, a3);
    v10->_animating = 0;
    v10->_animationOptions = 5243008;
    *(_OWORD *)&v10->_animationDuration = xmmword_1E38FDAA0;
    [(VUIImageProxyAnimator *)v10 _fetchNext];
  }

  return v10;
}

- (void)startAnimation
{
  id v3 = [(VUIImageProxyAnimator *)self imageProxies];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    [(VUIImageProxyAnimator *)self setAnimating:1];
    v5 = (void *)MEMORY[0x1E4F1CB00];
    [(VUIImageProxyAnimator *)self transitionInterval];
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__displayIntervalTimerFired_, 0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(VUIImageProxyAnimator *)self setTransitionTimer:v6];
  }
}

- (void)stopAnimation
{
  id v3 = [(VUIImageProxyAnimator *)self transitionTimer];
  [v3 invalidate];

  [(VUIImageProxyAnimator *)self setTransitionTimer:0];
  [(VUIImageProxyAnimator *)self setAnimating:0];
}

- (void)_setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VUIImageProxyAnimator *)self imageView];

  if (v7)
  {
    if (v4)
    {
      id v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9 = [(VUIImageProxyAnimator *)self imageView];
      [(VUIImageProxyAnimator *)self animationDuration];
      double v11 = v10;
      unint64_t v12 = [(VUIImageProxyAnimator *)self animationOptions];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__VUIImageProxyAnimator__setImage_animated___block_invoke;
      v14[3] = &unk_1E6DF3F68;
      v14[4] = self;
      id v15 = v6;
      [v8 transitionWithView:v9 duration:v12 options:v14 animations:0 completion:v11];
    }
    else
    {
      v13 = [(VUIImageProxyAnimator *)self imageView];
      [v13 setImage:v6];
    }
  }
}

void __44__VUIImageProxyAnimator__setImage_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:*(void *)(a1 + 40)];
}

- (void)loadImageProxy:(id)a3 withWeakObject:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__VUIImageProxyAnimator_loadImageProxy_withWeakObject_completionHandler___block_invoke;
  v11[3] = &unk_1E6DF5D38;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v12 = v10;
  [v7 setCompletionHandler:v11];
  [v7 load];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __73__VUIImageProxyAnimator_loadImageProxy_withWeakObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCompletionHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id, id, id, uint64_t))(v10 + 16))(v10, v9, v11, v7, a4);
    }
  }
}

- (void)_updateImageWithIndex:(unint64_t)a3
{
  v5 = [(VUIImageProxyAnimator *)self imageProxies];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    id v7 = [(VUIImageProxyAnimator *)self imageProxies];
    id v8 = [v7 objectAtIndexedSubscript:a3];

    if ([(VUIImageProxyAnimator *)self isCachingEnabled])
    {
      [v8 setLoadSynchronouslyIfCached:1];
      [v8 setCacheOnLoad:1];
    }
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke;
    v9[3] = &unk_1E6DF5D88;
    v10[1] = (id)a3;
    v9[4] = self;
    objc_copyWeak(v10, &location);
    [(VUIImageProxyAnimator *)self loadImageProxy:v8 withWeakObject:self completionHandler:v9];
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke_2;
  block[3] = &unk_1E6DF5D60;
  id v11 = v6;
  id v12 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  v14[1] = *(id *)(a1 + 48);
  uint64_t v13 = v7;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(v14, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v14);
}

void __47__VUIImageProxyAnimator__updateImageWithIndex___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    BOOL v4 = [v2 uiImage];
    [v3 _setImage:v4 animated:1];

    [*(id *)(a1 + 40) setDisplayImageIndex:*(void *)(a1 + 64)];
    if (![*(id *)(a1 + 48) isAnimating]) {
      return;
    }
    id v5 = [*(id *)(a1 + 40) transitionTimer];
    if (v5) {
      goto LABEL_14;
    }
    id v6 = [*(id *)(a1 + 40) imageProxies];
    unint64_t v7 = [v6 count];

    if (v7 < 2) {
      return;
    }
    id v8 = (void *)MEMORY[0x1E4F1CB00];
    [*(id *)(a1 + 40) transitionInterval];
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 40), sel__displayIntervalTimerFired_, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setTransitionTimer:v16];
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = [*(id *)(a1 + 40) imageProxies];
    unint64_t v11 = [v10 count];

    if (v9 >= v11) {
      return;
    }
    id v12 = [*(id *)(a1 + 40) imageProxies];
    id v16 = (id)[v12 mutableCopy];

    [v16 removeObjectAtIndex:*(void *)(a1 + 64)];
    [*(id *)(a1 + 40) setImageProxies:v16];
    unint64_t v13 = *(void *)(a1 + 64);
    if (v13 >= [v16 count]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = *(void *)(a1 + 64);
    }
    if ([v16 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [WeakRetained _updateImageWithIndex:v14];
    }
  }
  id v5 = v16;
LABEL_14:
}

- (void)_fetchNext
{
  if ([(VUIImageProxyAnimator *)self indexOfFetchedImage] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = [(VUIImageProxyAnimator *)self indexOfFetchedImage] + 1;
  }
  BOOL v4 = [(VUIImageProxyAnimator *)self imageProxies];
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    while (1)
    {
      id v6 = [(VUIImageProxyAnimator *)self imageProxies];
      unint64_t v7 = [v6 objectAtIndex:v3];

      if (([v7 isImageAvailable] & 1) == 0) {
        break;
      }
      ++v3;

      if (v5 == v3) {
        return;
      }
    }
    objc_initWeak(&location, v7);
    [(VUIImageProxyAnimator *)self setIndexOfFetchedImage:v3];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __35__VUIImageProxyAnimator__fetchNext__block_invoke;
    unint64_t v11 = &unk_1E6DF5DB0;
    objc_copyWeak(&v12, &location);
    [(VUIImageProxyAnimator *)self loadImageProxy:v7 withWeakObject:self completionHandler:&v8];
    objc_msgSend(v7, "load", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __35__VUIImageProxyAnimator__fetchNext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VUIImageProxyAnimator__fetchNext__block_invoke_2;
  block[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __35__VUIImageProxyAnimator__fetchNext__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!*(void *)(a1 + 32)
    && [*(id *)(a1 + 40) indexOfFetchedImage] != 0x7FFFFFFFFFFFFFFFLL
    && WeakRetained != 0)
  {
    unint64_t v3 = [*(id *)(a1 + 40) imageProxies];
    BOOL v4 = (void *)[v3 mutableCopy];

    uint64_t v5 = [v4 indexOfObjectIdenticalTo:WeakRetained];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 removeObjectAtIndex:v5];
      [*(id *)(a1 + 40) setImageProxies:v4];
    }
  }
  [*(id *)(a1 + 40) _fetchNext];
}

- (void)_displayIntervalTimerFired:(id)a3
{
  BOOL v4 = [(VUIImageProxyAnimator *)self transitionTimer];
  [v4 invalidate];

  [(VUIImageProxyAnimator *)self setTransitionTimer:0];
  unint64_t v5 = [(VUIImageProxyAnimator *)self displayImageIndex] + 1;
  id v6 = [(VUIImageProxyAnimator *)self imageProxies];
  unint64_t v7 = 0;
  if (v5 < [v6 count]) {
    unint64_t v7 = [(VUIImageProxyAnimator *)self displayImageIndex] + 1;
  }

  [(VUIImageProxyAnimator *)self _updateImageWithIndex:v7];
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)transitionInterval
{
  return self->_transitionInterval;
}

- (void)setTransitionInterval:(double)a3
{
  self->_transitionInterval = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (unint64_t)displayImageIndex
{
  return self->_displayImageIndex;
}

- (void)setDisplayImageIndex:(unint64_t)a3
{
  self->_displayImageIndex = a3;
}

- (unint64_t)indexOfFetchedImage
{
  return self->_indexOfFetchedImage;
}

- (void)setIndexOfFetchedImage:(unint64_t)a3
{
  self->_indexOfFetchedImage = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSTimer)transitionTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setTransitionTimer:(id)a3
{
}

- (BOOL)isCachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionTimer);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
}

@end