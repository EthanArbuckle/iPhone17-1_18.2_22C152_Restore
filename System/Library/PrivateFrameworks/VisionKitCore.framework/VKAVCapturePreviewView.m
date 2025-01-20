@interface VKAVCapturePreviewView
+ (Class)layerClass;
- (double)videoRotationAngle;
- (id)delegate;
- (id)previewLayer;
- (id)setDelegate:(id *)result;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setVideoRotationAngle:(void *)a1;
@end

@implementation VKAVCapturePreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)previewLayer
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_opt_class();
    v3 = [v1 layer];
    VKDynamicCast(v2, (uint64_t)v3);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)VKAVCapturePreviewView;
  [(VKAVCapturePreviewView *)&v5 didMoveToWindow];
  v3 = -[VKAVCapturePreviewView delegate]((id *)&self->super.super.super.isa);
  v4 = [(VKAVCapturePreviewView *)self window];
  [v3 previewView:self didMoveToWindow:v4];
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 55);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)layoutSubviews
{
  p_bounds = &self->_bounds;
  [(VKAVCapturePreviewView *)self bounds];
  if (!VKMNearlyEqualRects(p_bounds->origin.x, p_bounds->origin.y, p_bounds->size.width, p_bounds->size.height, v4, v5, v6, v7))
  {
    [(VKAVCapturePreviewView *)self bounds];
    p_bounds->origin.x = v8;
    p_bounds->origin.y = v9;
    p_bounds->size.width = v10;
    p_bounds->size.height = v11;
    v12 = -[VKAVCapturePreviewView delegate]((id *)&self->super.super.super.isa);
    [v12 didChangeBoundsForPreviewView:self];
  }
  v13.receiver = self;
  v13.super_class = (Class)VKAVCapturePreviewView;
  [(VKAVCapturePreviewView *)&v13 layoutSubviews];
}

- (double)videoRotationAngle
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = -[VKAVCapturePreviewView previewLayer](a1);
  uint64_t v2 = [v1 connection];
  [v2 videoRotationAngle];
  double v4 = v3;

  return v4;
}

- (void)setVideoRotationAngle:(void *)a1
{
  if (a1)
  {
    double v3 = -[VKAVCapturePreviewView previewLayer](a1);
    id v4 = [v3 connection];

    [v4 setVideoRotationAngle:a2];
  }
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 55, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end