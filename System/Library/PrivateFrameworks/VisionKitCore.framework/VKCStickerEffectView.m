@interface VKCStickerEffectView
+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4;
- (BOOL)boundsIncludeStroke;
- (BOOL)isPaused;
- (CGSize)intrinsicContentSize;
- (NSData)videoData;
- (UIImage)_image;
- (UIImage)image;
- (VKCStickerEffect)effect;
- (VKCStickerEffectView)init;
- (VKCStickerEffectView)initWithDevice:(id)a3;
- (VKCStickerVideoDecoder)videoDecoder;
- (VKStickerEffectViewInternal)internalView;
- (double)curlPosition;
- (id)imageWithImage:(id)a3 scaledToSize:(CGSize)a4;
- (void)didMoveToWindow;
- (void)displayLinkFired:(id)a3;
- (void)layoutSubviews;
- (void)playSettlingAnimation;
- (void)setBoundsIncludeStroke:(BOOL)a3;
- (void)setCurlPosition:(double)a3;
- (void)setEffect:(id)a3;
- (void)setImage:(id)a3;
- (void)setInternalView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setVideoData:(id)a3;
- (void)setVideoDecoder:(id)a3;
- (void)set_image:(id)a3;
- (void)snapshotWithCompletionHandler:(id)a3;
- (void)startPlaybackIfNecessary;
@end

@implementation VKCStickerEffectView

- (VKCStickerEffectView)init
{
  id v3 = MTLCreateSystemDefaultDevice();
  v4 = [(VKCStickerEffectView *)self initWithDevice:v3];

  return v4;
}

- (VKCStickerEffectView)initWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCStickerEffectView;
  v5 = [(VKCStickerEffectView *)&v9 init];
  if (v5)
  {
    uint64_t v6 = VKInternalStickerEffectViewWithDevice();
    internalView = v5->_internalView;
    v5->_internalView = (VKStickerEffectViewInternal *)v6;

    [(VKStickerEffectViewInternal *)v5->_internalView setAutoresizingMask:18];
    [(VKCStickerEffectView *)v5 bounds];
    -[VKStickerEffectViewInternal setFrame:](v5->_internalView, "setFrame:");
    [(VKCStickerEffectView *)v5 addSubview:v5->_internalView];
  }

  return v5;
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)VKCStickerEffectView;
  [(VKCStickerEffectView *)&v11 didMoveToWindow];
  id v3 = [(VKCStickerEffectView *)self window];
  id v4 = [v3 screen];

  if (v4)
  {
    v5 = [v4 displayLinkWithTarget:self selector:sel_displayLinkFired_];
    displayLink = self->_displayLink;
    self->_displayLink = v5;

    v7 = self->_displayLink;
    v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink setPaused:1];
    [(VKCStickerEffectView *)self startPlaybackIfNecessary];
  }
  else
  {
    objc_super v9 = self->_displayLink;
    if (v9)
    {
      [(CADisplayLink *)v9 invalidate];
      v10 = self->_displayLink;
      self->_displayLink = 0;
    }
  }
}

- (void)startPlaybackIfNecessary
{
  if (![(VKCStickerEffectView *)self isPaused]
    && ([(VKCStickerEffectView *)self videoData], (id v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v4 = self->_displayLink, v3, v4))
  {
    [(CADisplayLink *)self->_displayLink setPaused:0];
    self->_startTimeInterval = CACurrentMediaTime();
  }
  else
  {
    displayLink = self->_displayLink;
    if (displayLink)
    {
      [(CADisplayLink *)displayLink setPaused:1];
    }
  }
}

- (void)displayLinkFired:(id)a3
{
  [a3 targetTimestamp];
  long double v5 = v4 - self->_startTimeInterval;
  uint64_t v6 = [(VKCStickerEffectView *)self videoDecoder];
  uint64_t v7 = -[VKCStickerVideoDecoder frameForTargetTimestamp:](v6, v5);

  id v8 = [MEMORY[0x1E4F42A80] imageWithCGImage:v7];
  [(VKCStickerEffectView *)self set_image:v8];
}

- (VKCStickerVideoDecoder)videoDecoder
{
  videoDecoder = self->_videoDecoder;
  if (!videoDecoder)
  {
    double v4 = objc_alloc_init(VKCStickerVideoDecoder);
    long double v5 = self->_videoDecoder;
    self->_videoDecoder = v4;

    -[VKCStickerVideoDecoder setDelegate:]((id *)&self->_videoDecoder->super.isa, self);
    videoDecoder = self->_videoDecoder;
  }
  return videoDecoder;
}

- (void)setEffect:(id)a3
{
  id v5 = [a3 internalEffect];
  double v4 = [(VKCStickerEffectView *)self internalView];
  objc_msgSend(v4, "set_effect:", v5);
}

- (VKCStickerEffect)effect
{
  v2 = [(VKCStickerEffectView *)self internalView];
  id v3 = [v2 _effect];
  double v4 = +[VKCStickerEffect effectFromInternalEffect:v3];

  return (VKCStickerEffect *)v4;
}

- (void)setVideoData:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    fullSizeImage = self->_fullSizeImage;
    self->_fullSizeImage = 0;
  }
  [(CADisplayLink *)self->_displayLink setPaused:1];
  id v5 = [(VKCStickerEffectView *)self videoDecoder];
  -[VKCStickerVideoDecoder setVideoData:](v5, v7);

  uint64_t v6 = [(VKCStickerEffectView *)self internalView];
  [v6 setReRenderOnMotion:v7 == 0];
}

- (NSData)videoData
{
  return (NSData *)-[VKCStickerVideoDecoder videoData]((uint64_t)self->_videoDecoder);
}

- (void)set_image:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCStickerEffectView *)self internalView];
  [v5 setImage:v4];
}

- (UIImage)_image
{
  v2 = [(VKCStickerEffectView *)self internalView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = (UIImage *)a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = VKDynamicCast(v5, (uint64_t)v4);
  if (v4 && !v6)
  {
    objc_super v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VKCStickerEffectView setImage:]((uint64_t)v4, v9);
    }

    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unsupported Image Format" reason:*MEMORY[0x1E4F1C3C8] userInfo:0];
    objc_exception_throw(v10);
  }
  fullSizeImage = self->_fullSizeImage;
  self->_fullSizeImage = v4;
  id v11 = (id)v6;
  id v8 = v4;

  [(CADisplayLink *)self->_displayLink setPaused:1];
  [(VKCStickerEffectView *)self setVideoData:0];
  [(VKCStickerEffectView *)self setPaused:[(VKCStickerEffectView *)self isPaused]];
  self->_size = (CGSize)*MEMORY[0x1E4F1DB30];
  [(VKCStickerEffectView *)self setNeedsLayout];
}

- (id)imageWithImage:(id)a3 scaledToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 size];
  VKMScaleSizeWithinSize(v7, v8, width, height);
  v23.origin.double x = VKMRectWithSize();
  double x = v23.origin.x;
  double y = v23.origin.y;
  double v11 = v23.size.width;
  double v12 = v23.size.height;
  if (!CGRectIsEmpty(v23))
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithBounds:", x, y, v11, v12);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__VKCStickerEffectView_imageWithImage_scaledToSize___block_invoke;
    v16[3] = &unk_1E6BF1970;
    id v17 = v6;
    double v18 = x;
    double v19 = y;
    double v20 = v11;
    double v21 = v12;
    id v14 = v6;
    id v6 = [v13 imageWithActions:v16];
  }
  return v6;
}

uint64_t __52__VKCStickerEffectView_imageWithImage_scaledToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)VKCStickerEffectView;
  [(VKCStickerEffectView *)&v7 layoutSubviews];
  [(VKCStickerEffectView *)self bounds];
  if (v3 != self->_size.width || v4 != self->_size.height)
  {
    self->_size.double width = v3;
    self->_size.double height = v4;
    if (self->_fullSizeImage)
    {
      id v6 = [(VKCStickerEffectView *)self imageWithImage:v3 scaledToSize:v4];
      [(VKCStickerEffectView *)self set_image:v6];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(VKCStickerEffectView *)self internalView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (UIImage)image
{
  double v3 = [(VKCStickerEffectView *)self videoData];
  if (v3) {
    fullSizeImage = 0;
  }
  else {
    fullSizeImage = self->_fullSizeImage;
  }
  double v5 = fullSizeImage;

  return v5;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VKCStickerEffectView *)self internalView];
  [v5 setIsPaused:v3];

  [(VKCStickerEffectView *)self startPlaybackIfNecessary];
}

- (BOOL)isPaused
{
  v2 = [(VKCStickerEffectView *)self internalView];
  char v3 = [v2 isPaused];

  return v3;
}

- (void)setCurlPosition:(double)a3
{
  float v3 = a3;
  id v5 = [(VKCStickerEffectView *)self internalView];
  *(float *)&double v4 = v3;
  [v5 setCurlPosition:v4];
}

- (double)curlPosition
{
  v2 = [(VKCStickerEffectView *)self internalView];
  [v2 curlPosition];
  double v4 = v3;

  return v4;
}

+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4
{
  MEMORY[0x1F41679E0](a3, a2, (__n128)a4.origin, *(__n128 *)&a4.origin.y, (__n128)a4.size, *(__n128 *)&a4.size.height);
  return result;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCStickerEffectView *)self internalView];
  [v4 setBoundsIncludeStroke:v3];
}

- (BOOL)boundsIncludeStroke
{
  v2 = [(VKCStickerEffectView *)self internalView];
  char v3 = [v2 boundsIncludeStroke];

  return v3;
}

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCStickerEffectView *)self _image];
  if (v5)
  {
  }
  else if (self->_fullSizeImage)
  {
    -[VKCStickerEffectView set_image:](self, "set_image:");
  }
  id v6 = [(VKCStickerEffectView *)self internalView];
  [v6 snapshotWithCompletionHandler:v4];
}

- (void)playSettlingAnimation
{
  id v2 = [(VKCStickerEffectView *)self internalView];
  [v2 playSettlingAnimation];
}

- (VKStickerEffectViewInternal)internalView
{
  return self->_internalView;
}

- (void)setInternalView:(id)a3
{
}

- (void)setVideoDecoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDecoder, 0);
  objc_storeStrong((id *)&self->_internalView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_fullSizeImage, 0);
}

- (void)setImage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Trying to pass image of class: %@, but is not a UIImage", (uint8_t *)&v5, 0xCu);
}

@end