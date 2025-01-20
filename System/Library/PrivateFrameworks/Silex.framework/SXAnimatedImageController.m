@interface SXAnimatedImageController
- (id)initWithImageComponentView:(void *)a3 viewport:(void *)a4 imageView:;
- (void)registerForViewportChanges;
- (void)unregisterForViewportChanges;
- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4;
@end

@implementation SXAnimatedImageController

- (id)initWithImageComponentView:(void *)a3 viewport:(void *)a4 imageView:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXAnimatedImageController;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 5, v7);
      objc_storeWeak(a1 + 2, v8);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  id v26 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v6 = [WeakRetained visibilityState];

  if (v6 != 1) {
    goto LABEL_35;
  }
  if (self) {
    id v7 = objc_loadWeakRetained((id *)&self->_viewport);
  }
  else {
    id v7 = 0;
  }
  [v7 dynamicBounds];
  double v9 = v8;

  [v26 bounds];
  double Height = CGRectGetHeight(v28);
  if (self) {
    id v11 = objc_loadWeakRetained((id *)&self->_componentView);
  }
  else {
    id v11 = 0;
  }
  [v11 frame];
  double v12 = Height + CGRectGetHeight(v29) * -0.6;
  if (self) {
    imageView = self->_imageView;
  }
  else {
    imageView = 0;
  }
  v14 = [(SXImageView *)imageView animatedImage];
  double v15 = v12 / (double)(unint64_t)[v14 numberOfFrames];

  if (self) {
    v16 = self->_imageView;
  }
  else {
    v16 = 0;
  }
  double v17 = fmin(v15, 15.0);
  uint64_t v18 = [(SXImageView *)v16 frameIndex];
  uint64_t v19 = v18;
  if (self)
  {
    double previousYOffset = self->_previousYOffset;
    if (v9 > v17 + previousYOffset)
    {
      v21 = self->_imageView;
      goto LABEL_15;
    }
LABEL_25:
    if (v9 < previousYOffset - v17)
    {
      if (v18 <= 1) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v18;
      }
      uint64_t v19 = v24 - 1;
    }
    goto LABEL_30;
  }
  double previousYOffset = 0.0;
  if (v9 <= v17 + 0.0) {
    goto LABEL_25;
  }
  v21 = 0;
LABEL_15:
  v22 = [(SXImageView *)v21 animatedImage];
  unint64_t v23 = [v22 numberOfFrames] - 1;

  if (v19 + 1 < v23) {
    ++v19;
  }
  else {
    uint64_t v19 = v23;
  }
LABEL_30:
  if (self) {
    v25 = self->_imageView;
  }
  else {
    v25 = 0;
  }
  if (v19 != [(SXImageView *)v25 frameIndex])
  {
    if (self)
    {
      [(SXImageView *)self->_imageView setFrameIndex:v19];
      self->_double previousYOffset = v9;
    }
    else
    {
      [0 setFrameIndex:v19];
    }
  }
LABEL_35:
}

- (void)registerForViewportChanges
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 8))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained addViewportChangeListener:a1 forOptions:2];
    }
    *(unsigned char *)(a1 + 8) = 1;
  }
}

- (void)unregisterForViewportChanges
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained removeViewportChangeListener:a1 forOptions:2];
    }
    *(unsigned char *)(a1 + 8) = 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_componentView);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_viewport);
}

@end