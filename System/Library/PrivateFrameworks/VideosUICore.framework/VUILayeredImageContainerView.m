@interface VUILayeredImageContainerView
- (BOOL)fixedFrameOverlayView;
- (BOOL)isLayeredImageLoaded;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImage)loadedImage;
- (UIView)overlayView;
- (VUILayeredImageContainerView)initWithFrame:(CGRect)a3;
- (VUILayeredImageContainerView)initWithLayeredImageProxy:(id)a3;
- (VUILayeredImageProxy)layeredImageProxy;
- (void)_loadLayeredImage;
- (void)setFixedFrameOverlayView:(BOOL)a3;
- (void)setLayeredImageLoaded:(BOOL)a3;
- (void)setLayeredImageProxy:(id)a3;
- (void)setLoadedImage:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setOverlayView:(id)a3 masked:(BOOL)a4;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)willMoveToWindow:(id)a3;
@end

@implementation VUILayeredImageContainerView

- (VUILayeredImageContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUILayeredImageContainerView;
  v3 = -[_UIStackedImageContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_UIStackedImageContainerView *)v3 config];
    [v5 setMaximumParallaxImages:6];
  }
  return v4;
}

- (VUILayeredImageContainerView)initWithLayeredImageProxy:(id)a3
{
  id v5 = a3;
  v6 = -[VUILayeredImageContainerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layeredImageProxy, a3);
    [(VUILayeredImageContainerView *)v7 setAutoresizingMask:18];
  }

  return v7;
}

- (void)setOverlayView:(id)a3
{
}

- (void)setOverlayView:(id)a3 masked:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  p_overlayView = &self->_overlayView;
  objc_storeStrong((id *)&self->_overlayView, a3);
  v8 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
  v9 = v8;
  if (v4)
  {
    v10 = [(UIView *)*p_overlayView layer];
    [v9 _setOverlayLayer:v10];

    v11 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
    [v11 _setUnmaskedOverlayLayer:0];
  }
  else
  {
    [v8 _setOverlayLayer:0];

    v11 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
    v12 = [(UIView *)*p_overlayView layer];
    [v11 _setUnmaskedOverlayLayer:v12];
  }
}

- (void)setFixedFrameOverlayView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIStackedImageContainerView *)self config];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(_UIStackedImageContainerView *)self config];
    [v7 setOverlayFixedFrame:v3];
  }
  if (v3
    || ([(VUILayeredImageContainerView *)self layeredImageContainerLayer],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 _selectionStyle],
        v8,
        v9 == 1))
  {
    id v11 = [(_UIStackedImageContainerView *)self config];
    [v11 setSpecularOpacity:0.0];
  }
  else
  {
    id v11 = [(_UIStackedImageContainerView *)self config];
    v10 = (void *)[MEMORY[0x1E4F432F8] newStandardConfiguration];
    [v10 specularOpacity];
    objc_msgSend(v11, "setSpecularOpacity:");
  }
}

- (BOOL)fixedFrameOverlayView
{
  BOOL v3 = [(_UIStackedImageContainerView *)self config];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(_UIStackedImageContainerView *)self config];
  char v6 = [v5 overlayFixedFrame];

  return v6;
}

- (void)setLayeredImageProxy:(id)a3
{
  p_layeredImageProxy = &self->_layeredImageProxy;
  id v7 = a3;
  if (([v7 isEqual:*p_layeredImageProxy] & 1) == 0)
  {
    [(VUILayeredImageProxy *)*p_layeredImageProxy cancel];
    objc_storeStrong((id *)&self->_layeredImageProxy, a3);
    [(VUILayeredImageContainerView *)self setLayeredImageLoaded:0];
    char v6 = [(VUILayeredImageContainerView *)self window];

    if (v6) {
      [(VUILayeredImageContainerView *)self _loadLayeredImage];
    }
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    [(VUILayeredImageContainerView *)self bounds];
    double width = v6;
    double height = v7;
  }
  else
  {
    double width = a3.width;
  }
  v8 = (void *)MEMORY[0x1E4F43300];
  uint64_t v9 = [(_UIStackedImageContainerView *)self config];
  [v9 scaleSizeIncrease];
  double v11 = v10;
  v12 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
  objc_msgSend(v8, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", objc_msgSend(v12, "_selectionStyle"), width, height, v11);
  double v14 = v13;
  double v16 = v15;

  double v17 = floor((v14 - width) * 0.5);
  double v18 = floor((v16 - height) * 0.5);
  double v19 = v18;
  double v20 = v17;
  result.right = v20;
  result.bottom = v19;
  result.left = v17;
  result.top = v18;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUILayeredImageContainerView;
  -[VUILayeredImageContainerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    if (![(VUILayeredImageContainerView *)self isLayeredImageLoaded]) {
      [(VUILayeredImageContainerView *)self _loadLayeredImage];
    }
  }
  else
  {
    [(VUILayeredImageProxy *)self->_layeredImageProxy cancel];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[_UIStackedImageContainerView setStackFocused:](self, "setStackFocused:");
  overlayView = self->_overlayView;
  [(UIView *)overlayView vui_setSelected:v5 animated:v4 withAnimationCoordinator:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(_UIStackedImageContainerView *)self setStackFocused:v6 withFocusAnimationCoordinator:v8];
  [(UIView *)self->_overlayView vui_setSelected:v6 animated:v5 withAnimationCoordinator:v8];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(_UIStackedImageContainerView *)self setStackFocused:v6 withFocusAnimationCoordinator:v8];
  [(UIView *)self->_overlayView vui_setSelected:v6 animated:v5 withAnimationCoordinator:v8];
}

- (void)setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
  [v4 setPressed:v3];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
  [v6 setPressed:v5 animated:v4];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(VUILayeredImageContainerView *)self layeredImageContainerLayer];
  [v9 setPressed:v6 animated:v5 completion:v8];
}

- (void)_loadLayeredImage
{
  if (![(VUILayeredImageProxy *)self->_layeredImageProxy isLoading])
  {
    BOOL v3 = [(_UIStackedImageContainerView *)self constructedStackImage];
    BOOL v4 = [(_UIStackedImageContainerView *)self stackImage];
    [(_UIStackedImageContainerView *)self setConstructedStackImage:0];
    [(_UIStackedImageContainerView *)self setStackImage:0];
    [(VUILayeredImageContainerView *)self setLoadedImage:0];
    if (v3) {
      VUIDeferredRelease(v3);
    }
    if (v4) {
      VUIDeferredRelease(v4);
    }
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_layeredImageProxy);
    [(VUILayeredImageContainerView *)self bounds];
    BOOL v6 = v5;
    id v8 = v7;
    id v9 = objc_loadWeakRetained(&from);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke;
    v10[3] = &unk_1E6DDD4C8;
    objc_copyWeak(&v11, &location);
    v12[1] = v6;
    v12[2] = v8;
    objc_copyWeak(v12, &from);
    [v9 loadWithCompletion:v10];

    objc_destroyWeak(v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -999) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v10 = [WeakRetained config];
  if (v5)
  {
    if (+[VUICoreUtilities canHandleDecodingOnRenderThread])
    {
      +[VUINamedLayerStack namedLayerStackWithImage:v5];
    }
    else
    {
      [v10 cornerRadius];
      +[VUINamedLayerStack decodedNamedLayerStackWithImage:size:cornerRadius:](VUINamedLayerStack, "decodedNamedLayerStackWithImage:size:cornerRadius:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), v12);
    id v11 = };
  }
  else
  {
    id v11 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke_2;
  v14[3] = &unk_1E6DDD4A0;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v15 = v11;
  id v16 = v5;
  id v13 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);

LABEL_12:
}

void __49__VUILayeredImageContainerView__loadLayeredImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = v2;
  if (WeakRetained && (id)WeakRetained[57] == v2)
  {
    [WeakRetained setLayeredImageLoaded:1];
    [WeakRetained setConstructedStackImage:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32) ? 0 : *(void *)(a1 + 40);
    [WeakRetained setStackImage:v4];
    if (+[VUICoreUtilities canHandleDecodingOnRenderThread])
    {
      [WeakRetained setLoadedImage:*(void *)(a1 + 40)];
    }
  }
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (VUILayeredImageProxy)layeredImageProxy
{
  return self->_layeredImageProxy;
}

- (BOOL)isLayeredImageLoaded
{
  return self->_layeredImageLoaded;
}

- (void)setLayeredImageLoaded:(BOOL)a3
{
  self->_layeredImageLoaded = a3;
}

- (UIImage)loadedImage
{
  return self->_loadedImage;
}

- (void)setLoadedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImage, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_layeredImageProxy, 0);
}

@end