@interface TSDTexturedRectangle
+ (id)setupMetalShaderForContext:(id)a3;
- (BOOL)hasLiveTexturedRectangleSource;
- (BOOL)isBackgroundTexture;
- (BOOL)isFlattened;
- (BOOL)isMetalTextureSetup;
- (BOOL)isRenderable;
- (BOOL)isVerticalText;
- (BOOL)shouldGenerateMipmap;
- (BOOL)shouldUseDisplayLinkPresentationTime;
- (CALayer)layer;
- (CALayer)parentLayer;
- (CATransform3D)transformFromAttributes;
- (CGColorSpace)colorSpace;
- (CGColorSpace)p_colorSpace;
- (CGImage)image;
- (CGImage)p_newImageAndBufferWithAngle:(double)a3 scale:(double)a4 offset:(CGPoint)a5;
- (CGPoint)offset;
- (CGPoint)originalPosition;
- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4;
- (CGRect)contentRect;
- (CGRect)frame;
- (CGRect)frameOnCanvas;
- (CGSize)p_textureSizeWithDevice:(id)a3 maxSize:(CGSize)a4;
- (CGSize)size;
- (MTLTexture)metalTexture;
- (NSMutableArray)tags;
- (NSMutableDictionary)attributes;
- (NSString)text;
- (TSDTextureSet)parent;
- (TSDTexturedRectangle)initWithCGImage:(CGImage *)a3;
- (TSDTexturedRectangle)initWithLayer:(id)a3;
- (TSDTexturedRectangle)initWithSize:(CGSize)a3 image:(CGImage *)a4;
- (TSDTexturedRectangle)initWithSize:(CGSize)a3 offset:(CGPoint)a4 renderBlock:(id)a5;
- (TSUColor)backgroundColor;
- (TSUColor)textColor;
- (_NSRange)textRange;
- (char)p_setupTextureDataWithSize:(CGSize)a3 isBGRA:(BOOL)a4;
- (double)bakedScale;
- (double)singleTextureOpacity;
- (double)textBaseline;
- (double)textXHeight;
- (double)textureOpacity;
- (float)opacityFromAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)metalTextureWithContext:(id)a3;
- (id)p_allocateMetalTextureForDevice:(id)a3;
- (id)p_allocateMetalTextureForDevice:(id)a3 renderTarget:(BOOL)a4 writable:(BOOL)a5 private:(BOOL)a6 maxSize:(CGSize)a7;
- (id)p_latestTextureNotAfterLayerTime:(double)a3;
- (int)textureType;
- (unsigned)singleTextureName;
- (unsigned)singleTextureTarget;
- (void)adjustAnchorRelativeToParentsCenterOfRotation:(CGPoint)a3 isMagicMove:(BOOL)a4;
- (void)bakeLayerWithAngle:(double)a3 scale:(double)a4;
- (void)dealloc;
- (void)drawFrameAtLayerTime:(double)a3 context:(id)a4;
- (void)releaseMetalTexture;
- (void)releaseSingleTexture;
- (void)renderIntoContext:(CGContext *)a3;
- (void)renderLayerContentsIfNeeded;
- (void)resetAnchorPoint;
- (void)resetToSourceImage;
- (void)setAttributes:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setContentRect:(CGRect)a3;
- (void)setFrameOnCanvas:(CGRect)a3;
- (void)setIsFlattened:(BOOL)a3;
- (void)setIsVerticalText:(BOOL)a3;
- (void)setLiveTexturedRectangleSource:(id)a3;
- (void)setLiveTexturedRectangleSourceProxy:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOriginalPosition:(CGPoint)a3;
- (void)setParent:(id)a3;
- (void)setShouldGenerateMipmap:(BOOL)a3;
- (void)setShouldUseDisplayLinkPresentationTime:(BOOL)a3;
- (void)setTags:(id)a3;
- (void)setText:(id)a3;
- (void)setTextBaseline:(double)a3;
- (void)setTextColor:(id)a3;
- (void)setTextRange:(_NSRange)a3;
- (void)setTextXHeight:(double)a3;
- (void)setTextureOpacity:(double)a3;
- (void)setTextureType:(int)a3;
- (void)setupMetalTextureForDevice:(id)a3;
- (void)setupSingleTexture;
- (void)setupSingleTextureAndGenerateMipMaps:(BOOL)a3;
- (void)teardown;
@end

@implementation TSDTexturedRectangle

- (TSDTexturedRectangle)initWithSize:(CGSize)a3 offset:(CGPoint)a4 renderBlock:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TSDTexturedRectangle;
  v11 = [(TSDTexturedRectangle *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    v13 = (void *)*((void *)v11 + 16);
    *((void *)v11 + 16) = v12;

    *((void *)v11 + 20) = 0x3FF0000000000000;
    id v14 = objc_alloc_init(MEMORY[0x263F157E8]);
    v15 = (void *)*((void *)v11 + 15);
    *((void *)v11 + 15) = v14;

    [*((id *)v11 + 15) setEdgeAntialiasingMask:0];
    [*((id *)v11 + 15) setAllowsEdgeAntialiasing:1];
    v16 = (void *)*((void *)v11 + 15);
    v17 = [NSNumber numberWithBool:1];
    [v16 setValue:v17 forKey:@"kTSDTextureLayerKeyHasContents"];

    v18 = (void *)*((void *)v11 + 15);
    v19 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v11];
    [v18 setValue:v19 forKey:@"kTSDTextureLayerKeyTexturedRectangle"];

    *((CGFloat *)v11 + 5) = width;
    *((CGFloat *)v11 + 6) = height;
    objc_msgSend(v11, "setOffset:", x, y);
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 8) = 0;
    *(_OWORD *)(v11 + 72) = *(_OWORD *)(v11 + 40);
  }

  return (TSDTexturedRectangle *)v11;
}

- (TSDTexturedRectangle)initWithLayer:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TSDTexturedRectangle;
  v6 = [(TSDTexturedRectangle *)&v25 init];
  v7 = v6;
  if (v6)
  {
    id mRenderBlock = v6->mRenderBlock;
    v6->id mRenderBlock = 0;

    [v5 frame];
    v7->mSize.CGFloat width = v9;
    v7->mSize.CGFloat height = v10;
    [v5 frame];
    v7->mOffset.double x = v11;
    v7->mOffset.double y = v12;
    [v5 position];
    v7->mOriginalPosition.double x = v13;
    v7->mOriginalPosition.double y = v14;
    [v5 frame];
    v7->mOriginalFrame.origin.double x = v15;
    v7->mOriginalFrame.origin.double y = v16;
    v7->mOriginalFrame.size.CGFloat width = v17;
    v7->mOriginalFrame.size.CGFloat height = v18;
    v7->mContentRect.origin.double x = 0.0;
    v7->mContentRect.origin.double y = 0.0;
    v7->mContentRect.size = v7->mSize;
    v7->mTextureOpacitdouble y = 1.0;
    objc_storeStrong((id *)&v7->mLayer, a3);
    mLayer = v7->mLayer;
    v20 = [NSNumber numberWithBool:1];
    [(CALayer *)mLayer setValue:v20 forKey:@"kTSDTextureLayerKeyHasContents"];

    objc_super v21 = v7->mLayer;
    v22 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v7];
    [(CALayer *)v21 setValue:v22 forKey:@"kTSDTextureLayerKeyTexturedRectangle"];

    v23 = v7;
  }

  return v7;
}

- (TSDTexturedRectangle)initWithSize:(CGSize)a3 image:(CGImage *)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  result = [(TSDTexturedRectangle *)self initWithCGImage:a4];
  result->mSize.CGFloat width = width;
  result->mSize.CGFloat height = height;
  return result;
}

- (TSDTexturedRectangle)initWithCGImage:(CGImage *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)TSDTexturedRectangle;
  v4 = [(TSDTexturedRectangle *)&v22 init];
  if (v4)
  {
    *((void *)v4 + 17) = CGImageRetain(a3);
    *((void *)v4 + 20) = 0x3FF0000000000000;
    *((double *)v4 + 5) = (double)CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    *((double *)v4 + 6) = (double)Height;
    *(_OWORD *)(v4 + 8) = *MEMORY[0x263F00148];
    uint64_t v6 = *((void *)v4 + 5);
    *((void *)v4 + 7) = 0;
    *((void *)v4 + 8) = 0;
    *((void *)v4 + 9) = v6;
    *((double *)v4 + 10) = (double)Height;
    [MEMORY[0x263F158F8] begin];
    id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
    v8 = (void *)*((void *)v4 + 15);
    *((void *)v4 + 15) = v7;

    [*((id *)v4 + 15) setContents:a3];
    double Width = (double)CGImageGetWidth(a3);
    objc_msgSend(*((id *)v4 + 15), "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(a3));
    objc_msgSend(*((id *)v4 + 15), "setPosition:", *((double *)v4 + 5) * 0.5, *((double *)v4 + 6) * 0.5);
    [*((id *)v4 + 15) setEdgeAntialiasingMask:0];
    [*((id *)v4 + 15) position];
    *((void *)v4 + 3) = v10;
    *((void *)v4 + 4) = v11;
    [*((id *)v4 + 15) frame];
    *((void *)v4 + 11) = v12;
    *((void *)v4 + 12) = v13;
    *((void *)v4 + 13) = v14;
    *((void *)v4 + 14) = v15;
    CGFloat v16 = (void *)*((void *)v4 + 15);
    CGFloat v17 = [NSNumber numberWithBool:1];
    [v16 setValue:v17 forKey:@"kTSDTextureLayerKeyHasContents"];

    CGFloat v18 = (void *)*((void *)v4 + 15);
    v19 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];
    [v18 setValue:v19 forKey:@"kTSDTextureLayerKeyTexturedRectangle"];

    [MEMORY[0x263F158F8] commit];
    v20 = v4;
  }

  return (TSDTexturedRectangle *)v4;
}

- (void)teardown
{
  id mRenderBlock = self->mRenderBlock;
  self->id mRenderBlock = 0;

  [(TSDTexturedRectangle *)self releaseSingleTexture];
}

- (void)dealloc
{
  [(TSDTexturedRectangle *)self releaseSingleTexture];
  mBakedImage = self->mBakedImage;
  if (mBakedImage) {
    CGImageRelease(mBakedImage);
  }
  mSourceImage = self->mSourceImage;
  if (mSourceImage) {
    CGImageRelease(mSourceImage);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDTexturedRectangle;
  [(TSDTexturedRectangle *)&v5 dealloc];
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = TSDStringFromTextureType([(TSDTexturedRectangle *)self textureType]);
  [v3 appendFormat:@"textureType:%@", v4];

  [(TSDTexturedRectangle *)self frame];
  objc_super v5 = NSStringFromCGRect(v12);
  [v3 appendFormat:@" frame:%@", v5];

  uint64_t v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)TSDTexturedRectangle;
  id v7 = [(TSDTexturedRectangle *)&v10 description];
  v8 = [v6 stringWithFormat:@"%@: {%@}", v7, v3];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->mRenderBlock)
  {
    objc_super v5 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:](+[TSDTexturedRectangle allocWithZone:](TSDTexturedRectangle, "allocWithZone:", a3), "initWithSize:offset:renderBlock:", self->mRenderBlock, self->mOriginalFrame.size.width, self->mOriginalFrame.size.height, self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y);
  }
  else
  {
    if (!self->mSourceImage)
    {
      objc_super v10 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle copyWithZone:]"];
      CGRect v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
      [v10 handleFailureInFunction:v11 file:v12 lineNumber:259 description:@"Trying to make a copy from a texture with no content"];

      uint64_t v6 = 0;
      goto LABEL_6;
    }
    objc_super v5 = [+[TSDTexturedRectangle allocWithZone:a3] initWithCGImage:self->mSourceImage];
  }
  uint64_t v6 = v5;
LABEL_6:
  -[TSDTexturedRectangle setOffset:](v6, "setOffset:", self->mOffset.x, self->mOffset.y);
  [(TSDTexturedRectangle *)v6 setTextureType:self->mTextureType];
  id v7 = (void *)[(NSMutableDictionary *)self->mAttributes copyWithZone:a3];
  [(TSDTexturedRectangle *)v6 setAttributes:v7];

  [(TSDTexturedRectangle *)v6 setTextureOpacity:self->mTextureOpacity];
  -[TSDTexturedRectangle setContentRect:](v6, "setContentRect:", self->mContentRect.origin.x, self->mContentRect.origin.y, self->mContentRect.size.width, self->mContentRect.size.height);
  v8 = (void *)[(NSMutableArray *)self->mTags copyWithZone:a3];
  [(TSDTexturedRectangle *)v6 setTags:v8];

  [(TSDTexturedRectangle *)v6 setText:self->_text];
  [(TSDTexturedRectangle *)v6 setTextColor:self->_textColor];
  -[TSDTexturedRectangle setTextRange:](v6, "setTextRange:", self->_textRange.location, self->_textRange.length);
  [(TSDTexturedRectangle *)v6 setTextXHeight:self->_textXHeight];
  return v6;
}

- (float)opacityFromAttributes
{
  v2 = [(NSMutableDictionary *)self->mAttributes objectForKey:@"kSFXOpacity"];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 1.0;
  }

  return v5;
}

- (CATransform3D)transformFromAttributes
{
  float v4 = [(NSMutableDictionary *)self->mAttributes objectForKey:@"kSFXAngle"];
  id v7 = v4;
  if (v4) {
    [v4 floatValue];
  }
  else {
    float v5 = 0.0;
  }
  CATransform3DMakeRotation(retstr, v5 / 180.0 * -3.14159265, 0.0, 0.0, 1.0);

  return result;
}

- (CGPoint)offset
{
  double x = self->mOffset.x;
  double y = self->mOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->mOffset = a3;
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  [(CALayer *)self->mLayer position];
  self->mOriginalPosition.double x = v4;
  self->mOriginalPosition.double y = v5;
  [(CALayer *)self->mLayer frame];
  self->mOriginalFrame.origin.double x = v6;
  self->mOriginalFrame.origin.double y = v7;
  self->mOriginalFrame.size.CGFloat width = v8;
  self->mOriginalFrame.size.CGFloat height = v9;
}

- (CGRect)frame
{
  [(TSDTexturedRectangle *)self offset];
  double v4 = v3;
  double v6 = v5;
  [(TSDTexturedRectangle *)self size];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v8;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)adjustAnchorRelativeToParentsCenterOfRotation:(CGPoint)a3 isMagicMove:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4 || (self->mTextureType & 0xFFFFFFFE) != 2)
  {
    double x = a3.x;
    double y = a3.y;
    double width = self->mOriginalFrame.size.width;
    double height = self->mOriginalFrame.size.height;
    double v8 = TSDCenterOfRect(self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y, width, height);
    double v9 = TSDSubtractPoints(x, y, v8);
    -[CALayer setAnchorPoint:](self->mLayer, "setAnchorPoint:", v9 / width + 0.5, v10 / height + 0.5);
    -[CALayer setPosition:](self->mLayer, "setPosition:", x, y);
    if (v4 && [(TSDTexturedRectangle *)self textureType] != 9)
    {
      double v11 = [(CALayer *)self->mLayer superlayer];
      [v11 bounds];
      double v16 = TSDCenterOfRect(v12, v13, v14, v15);
      CGFloat v18 = v17;

      long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v31.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v31.c = v19;
      *(_OWORD *)&v31.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformTranslate(&v32, &v31, v16, v18);
      long long v25 = *(_OWORD *)&v32.c;
      long long v27 = *(_OWORD *)&v32.a;
      tdouble x = v32.tx;
      tdouble y = v32.ty;
      objc_super v22 = [(TSDTexturedRectangle *)self parent];
      [v22 textureAngle];
      *(_OWORD *)&v31.a = v27;
      *(_OWORD *)&v31.c = v25;
      v31.tdouble x = tx;
      v31.tdouble y = ty;
      CGAffineTransformRotate(&v32, &v31, -v23);
      long long v26 = *(_OWORD *)&v32.c;
      long long v28 = *(_OWORD *)&v32.a;
      long long v24 = *(_OWORD *)&v32.tx;

      *(_OWORD *)&v31.a = v28;
      *(_OWORD *)&v31.c = v26;
      *(_OWORD *)&v31.tdouble x = v24;
      CGAffineTransformTranslate(&v32, &v31, -v16, -v18);
      [(CALayer *)self->mLayer setPosition:vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, y), *(float64x2_t *)&v32.a, x))];
    }
    self->mOriginalPosition.double x = x;
    self->mOriginalPosition.double y = y;
  }
}

- (void)resetAnchorPoint
{
  -[CALayer setAnchorPoint:](self->mLayer, "setAnchorPoint:", 0.5, 0.5);
  [(CALayer *)self->mLayer bounds];
  double v4 = self->mOffset.x + v3 * 0.5;
  [(CALayer *)self->mLayer bounds];
  double v6 = self->mOffset.y + v5 * 0.5;
  mLayer = self->mLayer;

  -[CALayer setPosition:](mLayer, "setPosition:", v4, v6);
}

- (void)setTextureType:(int)a3
{
  if (self->mTextureType != a3)
  {
    self->mTextureType = a3;
    TSDStringFromTextureType([(TSDTexturedRectangle *)self textureType]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CALayer *)self->mLayer setName:v4];
  }
}

- (CGColorSpace)p_colorSpace
{
  double v3 = (CGColorSpace *)TSUDeviceRGBColorSpace();
  CGRect result = self->mColorSpace;
  if (!result)
  {
    p_mParent = &self->mParent;
    id WeakRetained = objc_loadWeakRetained((id *)p_mParent);
    uint64_t v7 = [WeakRetained colorSpace];

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_mParent);
      double v9 = (CGColorSpace *)[v8 colorSpace];

      return v9;
    }
    else
    {
      return v3;
    }
  }
  return result;
}

- (CGImage)p_newImageAndBufferWithAngle:(double)a3 scale:(double)a4 offset:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  double v10 = CGBitmapContextCreate(0, (unint64_t)self->mSize.width, (unint64_t)self->mSize.height, 8uLL, 4 * (unint64_t)self->mSize.width, [(TSDTexturedRectangle *)self p_colorSpace], 1u);
  TSDSetCGContextInfo((uint64_t)v10, 0, 0, 0, 0, 1.0);
  CGContextTranslateCTM(v10, 0.0, self->mSize.height);
  CGContextScaleCTM(v10, 1.0, -1.0);
  CGContextTranslateCTM(v10, x, y);
  if (a3 != 0.0 || a4 != 1.0)
  {
    long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v39.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v39.c = v35;
    *(_OWORD *)&v39.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(CALayer *)self->mLayer frame];
    CGFloat v12 = -v11;
    [(CALayer *)self->mLayer frame];
    *(_OWORD *)&transform.a = v34;
    *(_OWORD *)&transform.c = v36;
    *(_OWORD *)&transform.tCGFloat x = v33;
    CGAffineTransformTranslate(&v39, &transform, v12, -v13);
    [(CALayer *)self->mLayer position];
    CGFloat v15 = v14;
    [(CALayer *)self->mLayer position];
    CGAffineTransform v37 = v39;
    CGAffineTransformTranslate(&transform, &v37, v15, v16);
    CGAffineTransform v39 = transform;
    CGAffineTransform v37 = transform;
    CGAffineTransformScale(&transform, &v37, a4, a4);
    CGAffineTransform v39 = transform;
    CGAffineTransform v37 = transform;
    CGAffineTransformRotate(&transform, &v37, a3);
    CGAffineTransform v39 = transform;
    [(CALayer *)self->mLayer anchorPoint];
    double v18 = v17;
    double v20 = v19;
    [(CALayer *)self->mLayer bounds];
    double v22 = TSDMultiplyPointBySize(v18, v20, v21);
    CGAffineTransform v37 = v39;
    CGAffineTransformTranslate(&transform, &v37, -v22, -v23);
    CGAffineTransform v39 = transform;
    CGContextConcatCTM(v10, &transform);
  }
  id mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
  if (mRenderBlock)
  {
    mRenderBlock[2](mRenderBlock, v10);
  }
  else
  {
    mSourceImage = self->mSourceImage;
    if (mSourceImage)
    {
      size_t Height = CGImageGetHeight(mSourceImage);
      CGContextTranslateCTM(v10, 0.0, (double)Height);
      CGContextScaleCTM(v10, 1.0, -1.0);
      CGFloat Width = (double)CGImageGetWidth(self->mSourceImage);
      v40.size.double height = (double)CGImageGetHeight(self->mSourceImage);
      v40.origin.CGFloat x = 0.0;
      v40.origin.CGFloat y = 0.0;
      v40.size.double width = Width;
      CGContextDrawImage(v10, v40, self->mSourceImage);
    }
    else
    {
      long long v28 = [MEMORY[0x263F7C7F0] currentHandler];
      v29 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:]"];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
      [v28 handleFailureInFunction:v29 file:v30 lineNumber:423 description:@"Nothing to render from."];
    }
  }
  TSDClearCGContextInfo((uint64_t)v10);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (void)resetToSourceImage
{
  CGImageRelease(self->mBakedImage);
  self->mBakedImage = 0;
  -[CALayer setFrame:](self->mLayer, "setFrame:", self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y, self->mOriginalFrame.size.width, self->mOriginalFrame.size.height);
  [(CALayer *)self->mLayer setContents:self->mSourceImage];
  self->mSize = self->mOriginalFrame.size;
  self->mOffset = self->mOriginalFrame.origin;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  [WeakRetained setIsBaked:0];
}

- (BOOL)isRenderable
{
  return self->mSourceImage || self->mRenderBlock != 0;
}

- (void)renderLayerContentsIfNeeded
{
  double v3 = [(CALayer *)self->mLayer contents];

  if (v3)
  {
    if (self->mBakedImage)
    {
      id v4 = [(CALayer *)self->mLayer contents];
      if (v4 == self->mBakedImage)
      {
        double v13 = v4;
        double v11 = [(CALayer *)self->mLayer superlayer];
        CGFloat v12 = [v11 superlayer];

        if (!v12)
        {
          [(TSDTexturedRectangle *)self resetToSourceImage];
        }
      }
      else
      {
      }
    }
  }
  else
  {
    if (!self->mRenderBlock && !self->mSourceImage)
    {
      double v5 = [MEMORY[0x263F7C7F0] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle renderLayerContentsIfNeeded]"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
      [v5 handleFailureInFunction:v6 file:v7 lineNumber:455 description:@"Nothing to render from"];
    }
    mSourceImage = self->mSourceImage;
    if (!mSourceImage)
    {
      mSourceImage = -[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:](self, "p_newImageAndBufferWithAngle:scale:offset:", 0.0, 1.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      self->mSourceImage = mSourceImage;
    }
    [(CALayer *)self->mLayer setContents:mSourceImage];
    mTextureOpacitCGFloat y = self->mTextureOpacity;
    *(float *)&mTextureOpacitCGFloat y = mTextureOpacity;
    mLayer = self->mLayer;
    [(CALayer *)mLayer setOpacity:mTextureOpacity];
  }
}

- (void)setupSingleTextureAndGenerateMipMaps:(BOOL)a3
{
  if (!self->mSingleTextureName || a3 && !self->mSingleTextureContainsMipmaps)
  {
    [(TSDTexturedRectangle *)self releaseSingleTexture];
    double width = self->mSize.width;
    double height = self->mSize.height;
    double v6 = [(TSDTexturedRectangle *)self image];
    uint64_t v7 = malloc_type_malloc(4 * (unint64_t)width * (unint64_t)height, 0x774322F7uLL);
    id v8 = CGBitmapContextCreate(v7, (unint64_t)width, (unint64_t)height, 8uLL, 4 * (unint64_t)width, [(TSDTexturedRectangle *)self p_colorSpace], 1u);
    TSDSetCGContextInfo((uint64_t)v8, 0, 0, 0, 0, 1.0);
    CGContextScaleCTM(v8, 1.0, -1.0);
    CGFloat v9 = (double)(unint64_t)height;
    CGContextTranslateCTM(v8, 0.0, -v9);
    v17.size.double width = (double)(unint64_t)width;
    v17.origin.CGFloat x = 0.0;
    v17.origin.CGFloat y = 0.0;
    v17.size.double height = v9;
    CGContextClearRect(v8, v17);
    if (v6)
    {
      size_t v10 = CGImageGetHeight(v6);
      CGContextTranslateCTM(v8, 0.0, (double)v10);
      CGContextScaleCTM(v8, 1.0, -1.0);
      CGFloat v11 = (double)CGImageGetWidth(v6);
      v18.size.double height = (double)CGImageGetHeight(v6);
      v18.origin.CGFloat x = 0.0;
      v18.origin.CGFloat y = 0.0;
      v18.size.double width = v11;
      CGContextDrawImage(v8, v18, v6);
    }
    else
    {
      id mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
      if (mRenderBlock)
      {
        mRenderBlock[2](mRenderBlock, v8);
      }
      else
      {
        double v13 = [MEMORY[0x263F7C7F0] currentHandler];
        double v14 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle setupSingleTextureAndGenerateMipMaps:]"];
        CGFloat v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
        [v13 handleFailureInFunction:v14 file:v15 lineNumber:501 description:@"Nothing to render from"];
      }
    }
    TSDClearCGContextInfo((uint64_t)v8);
    CGContextRelease(v8);
  }
}

- (void)setupSingleTexture
{
}

- (unsigned)singleTextureName
{
  return self->mSingleTextureName;
}

- (unsigned)singleTextureTarget
{
  return 3553;
}

- (void)releaseSingleTexture
{
  if (self->mSingleTextureName) {
    self->mSingleTextureName = 0;
  }
}

- (double)singleTextureOpacity
{
  double v3 = [(TSDTexturedRectangle *)self layer];
  [v3 opacity];
  double v5 = v4;

  double v6 = [(TSDTexturedRectangle *)self parent];

  if (v6)
  {
    uint64_t v7 = [(TSDTexturedRectangle *)self parent];
    id v8 = [v7 layer];
    [v8 opacity];
    double v5 = v5 * v9;
  }
  return v5;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (CGImage)image
{
  mBakedImage = self->mBakedImage;
  if (mBakedImage) {
    return mBakedImage;
  }
  mBakedImage = self->mSourceImage;
  if (mBakedImage) {
    return mBakedImage;
  }
  mLayer = self->mLayer;
  if (!mLayer)
  {
    double v5 = [MEMORY[0x263F7C7F0] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle image]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:573 description:@"Can't make an image from this TSDTexturedRectangle!"];

    return 0;
  }

  return [(CALayer *)mLayer newRasterizedImageRef];
}

- (void)bakeLayerWithAngle:(double)a3 scale:(double)a4
{
  mLayer = self->mLayer;
  if (mLayer)
  {
    uint64_t v8 = [(CALayer *)mLayer setContents:0];
    [(CALayer *)self->mLayer setBounds:TSDRectWithOriginAndSize(v8, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), self->mOriginalFrame.size.width, self->mOriginalFrame.size.height)];
    float v9 = [(CALayer *)self->mLayer superlayer];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    [(CALayer *)self->mLayer frame];
    double v15 = TSDAddPoints(v11, v13, v14);
    double v17 = v16;

    uint64_t v18 = [(CALayer *)self->mLayer frame];
    v40.origin.double x = TSDRectWithOriginAndSize(v18, v15, v17, v19, v20);
    double x = v40.origin.x;
    double y = v40.origin.y;
    CGRect v41 = CGRectIntegral(v40);
    double v23 = v41.origin.x;
    double v24 = v41.origin.y;
    self->mSize.double width = v41.size.width;
    self->mSize.double height = v41.size.height;
    long long v25 = [(CALayer *)self->mLayer superlayer];
    [v25 frame];
    self->mOffset.double x = TSDSubtractPoints(v23, v24, v26);
    self->mOffset.double y = v27;

    mBakedImage = self->mBakedImage;
    if (mBakedImage) {
      CGImageRelease(mBakedImage);
    }
    double v29 = TSDSubtractPoints(x, y, v23);
    CGAffineTransform v31 = -[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:](self, "p_newImageAndBufferWithAngle:scale:offset:", a3, a4, v29, v30);
    self->mBakedImage = v31;
    [(CALayer *)self->mLayer setContents:v31];
    if (a3 != 0.0) {
      [(CALayer *)self->mLayer setValue:&unk_26D73A858 forKeyPath:@"transform.rotation.z"];
    }
    if (a4 != 1.0) {
      [(CALayer *)self->mLayer setValue:&unk_26D73A868 forKeyPath:@"transform.scale.xy"];
    }
    CGAffineTransform v32 = self->mLayer;
    long long v33 = [NSNumber numberWithDouble:a4];
    [(CALayer *)v32 setValue:v33 forKey:@"kTSDTextureLayerKeyBakedScale"];

    long long v34 = self->mLayer;
    long long v35 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v39[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v39[5] = v35;
    long long v36 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v39[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v39[7] = v36;
    long long v37 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v39[0] = *MEMORY[0x263F15740];
    v39[1] = v37;
    long long v38 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v39[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v39[3] = v38;
    [(CALayer *)self->mLayer setFrame:TSDRectWithOriginAndSize([(CALayer *)v34 setTransform:v39], self->mOffset.x, self->mOffset.y, self->mSize.width, self->mSize.height)];
  }
}

- (void)renderIntoContext:(CGContext *)a3
{
  if (![(CALayer *)self->mLayer isHidden])
  {
    CGContextSaveGState(a3);
    [(CALayer *)self->mLayer position];
    CGFloat v6 = v5;
    [(CALayer *)self->mLayer position];
    CGContextTranslateCTM(a3, v6, v7);
    mLayer = self->mLayer;
    if (mLayer) {
      [(CALayer *)mLayer transform];
    }
    else {
      memset(&v26, 0, sizeof(v26));
    }
    if (!CATransform3DIsIdentity(&v26))
    {
      float v9 = self->mLayer;
      if (v9) {
        [(CALayer *)v9 affineTransform];
      }
      else {
        memset(&v25, 0, sizeof(v25));
      }
      CGContextConcatCTM(a3, &v25);
    }
    -[CALayer bounds](self->mLayer, "bounds", *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx, *(void *)&v26.m11, *(void *)&v26.m12, *(void *)&v26.m13, *(void *)&v26.m14, *(void *)&v26.m21, *(void *)&v26.m22, *(void *)&v26.m23, *(void *)&v26.m24, *(void *)&v26.m31, *(void *)&v26.m32, *(void *)&v26.m33, *(void *)&v26.m34, *(void *)&v26.m41, *(void *)&v26.m42,
      *(void *)&v26.m43,
      *(void *)&v26.m44);
    double v11 = v10;
    [(CALayer *)self->mLayer anchorPoint];
    CGFloat v13 = -(v11 * v12);
    [(CALayer *)self->mLayer bounds];
    double v15 = v14;
    [(CALayer *)self->mLayer anchorPoint];
    CGContextTranslateCTM(a3, v13, -(v15 * v16));
    mTextureOpacitdouble y = self->mTextureOpacity;
    if (mTextureOpacity != 1.0)
    {
      CGContextSetAlpha(a3, mTextureOpacity);
      CGContextBeginTransparencyLayer(a3, 0);
    }
    id mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
    if (mRenderBlock)
    {
      mRenderBlock[2](mRenderBlock, a3);
    }
    else
    {
      mSourceImage = self->mSourceImage;
      if (mSourceImage)
      {
        size_t Height = CGImageGetHeight(mSourceImage);
        CGContextTranslateCTM(a3, 0.0, (double)Height);
        CGContextScaleCTM(a3, 1.0, -1.0);
        CGFloat Width = (double)CGImageGetWidth(self->mSourceImage);
        v27.size.double height = (double)CGImageGetHeight(self->mSourceImage);
        v27.origin.double x = 0.0;
        v27.origin.double y = 0.0;
        v27.size.double width = Width;
        CGContextDrawImage(a3, v27, self->mSourceImage);
      }
      else
      {
        double v22 = [MEMORY[0x263F7C7F0] currentHandler];
        double v23 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle renderIntoContext:]"];
        double v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
        [v22 handleFailureInFunction:v23 file:v24 lineNumber:639 description:@"Nothing to render from."];
      }
    }
    if (self->mTextureOpacity != 1.0) {
      CGContextEndTransparencyLayer(a3);
    }
    CGContextRestoreGState(a3);
  }
}

- (BOOL)isBackgroundTexture
{
  double v3 = [(TSDTexturedRectangle *)self parent];

  if (!v3) {
    return 0;
  }
  float v4 = [(TSDTexturedRectangle *)self parent];
  char v5 = [v4 isBackgroundTexture:self];

  return v5;
}

- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  BOOL v4 = a4;
  [(TSDTexturedRectangle *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(TSDTexturedRectangle *)self parent];

  if (v15)
  {
    double v16 = [(TSDTexturedRectangle *)self parent];
    [v16 boundingRectForStage:a3 isBuildIn:v4];
    double v8 = v17;
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
  }
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CALayer)parentLayer
{
  double v3 = [(TSDTexturedRectangle *)self parent];

  if (v3)
  {
    BOOL v4 = [(TSDTexturedRectangle *)self parent];
    char v5 = [v4 layer];
  }
  else
  {
    char v5 = 0;
  }

  return (CALayer *)v5;
}

- (CGRect)frameOnCanvas
{
  double x = self->mFrameOnCanvas.origin.x;
  double y = self->mFrameOnCanvas.origin.y;
  CGFloat width = self->mFrameOnCanvas.size.width;
  CGFloat height = self->mFrameOnCanvas.size.height;
  double v7 = [(TSDTexturedRectangle *)self parent];

  if (v7)
  {
    [(TSDTexturedRectangle *)self frame];
    double v9 = v8;
    double v10 = [(TSDTexturedRectangle *)self parent];
    [v10 frame];
    double x = v9 + v11;
    double v12 = [(TSDTexturedRectangle *)self parent];
    [v12 frame];
    double v14 = v13;
    [(TSDTexturedRectangle *)self frame];
    double y = v14 + CGRectGetMaxY(v24);

    [(TSDTexturedRectangle *)self frame];
    CGFloat width = v15;
    [(TSDTexturedRectangle *)self frame];
    CGFloat height = v16;
  }
  if (CGRectIsEmpty(self->mFrameOnCanvas))
  {
    [(TSDTexturedRectangle *)self frame];
    double x = v17;
    [(TSDTexturedRectangle *)self frame];
    double y = CGRectGetMaxY(v25);
    [(TSDTexturedRectangle *)self frame];
    CGFloat width = v18;
    [(TSDTexturedRectangle *)self frame];
    CGFloat height = v19;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (char)p_setupTextureDataWithSize:(CGSize)a3 isBGRA:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  mBakedImage = self->mBakedImage;
  if (!mBakedImage) {
    mBakedImage = self->mSourceImage;
  }
  size_t v9 = (unint64_t)a3.width;
  double v11 = self->mSize.width;
  double v10 = self->mSize.height;
  double v12 = [(TSDTexturedRectangle *)self p_colorSpace];
  uint64_t v13 = TSUP3ColorSpace();
  if (v12 == (CGColorSpace *)v13)
  {
    space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
    size_t v14 = 8 * v9;
    uint32_t v15 = 4353;
    size_t v16 = 16;
  }
  else
  {
    size_t v14 = 4 * v9;
    if (v4) {
      uint32_t v15 = 8194;
    }
    else {
      uint32_t v15 = 1;
    }
    size_t v16 = 8;
    space = v12;
  }
  size_t v17 = (unint64_t)height;
  id mRenderBlock = self->mRenderBlock;
  if (mRenderBlock)
  {
    LODWORD(mRenderBlock) = 0;
  }
  else
  {
    mLayer = self->mLayer;
    if (mLayer && !mBakedImage)
    {
      mBakedImage = [(CALayer *)mLayer newRasterizedImageRef];
      LODWORD(mRenderBlock) = 1;
    }
  }
  int v32 = (int)mRenderBlock;
  double v20 = width / v11;
  double v21 = height / v10;
  double v22 = malloc_type_malloc(v14 * v17, 0xBC658E53uLL);
  if ([(TSDTexturedRectangle *)self textureType] == 7 && mBakedImage)
  {
    if (v12 == (CGColorSpace *)v13) {
      CGColorSpaceRelease(space);
    }
    ColorSpace = CGImageGetColorSpace(mBakedImage);
    CGRect v24 = CGBitmapContextCreate(v22, v9, v17, v16, v14, ColorSpace, v15);
  }
  else
  {
    CGRect v24 = CGBitmapContextCreate(v22, v9, v17, v16, v14, space, v15);
    if (v12 == (CGColorSpace *)v13) {
      CGColorSpaceRelease(space);
    }
  }
  TSDSetCGContextInfo((uint64_t)v24, 0, 0, 0, 0, 1.0);
  CGContextScaleCTM(v24, 1.0, -1.0);
  CGContextTranslateCTM(v24, 0.0, -(double)v17);
  CGContextScaleCTM(v24, v20, v21);
  v33.size.double width = (double)v9;
  v33.origin.double x = 0.0;
  v33.origin.double y = 0.0;
  v33.size.double height = (double)v17;
  CGContextClearRect(v24, v33);
  if ([(TSDTexturedRectangle *)self textureType] == 7) {
    CGContextSetInterpolationQuality(v24, kCGInterpolationNone);
  }
  if (mBakedImage)
  {
    [(CALayer *)self->mLayer bounds];
    CGContextTranslateCTM(v24, 0.0, v25);
    CGContextScaleCTM(v24, 1.0, -1.0);
    [(CALayer *)self->mLayer bounds];
    CGContextDrawImage(v24, v34, mBakedImage);
  }
  else
  {
    CATransform3D v26 = (void (**)(id, CGContext *))self->mRenderBlock;
    if (v26)
    {
      v26[2](v26, v24);
    }
    else
    {
      CGRect v27 = [MEMORY[0x263F7C7F0] currentHandler];
      long long v28 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle p_setupTextureDataWithSize:isBGRA:]"];
      double v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 757, @"%p - Nothing to render from", self);
    }
  }
  if (v32) {
    CGImageRelease(mBakedImage);
  }
  TSDClearCGContextInfo((uint64_t)v24);
  CGContextRelease(v24);
  return (char *)v22;
}

- (BOOL)isMetalTextureSetup
{
  return self->_metalTexture != 0;
}

- (void)releaseMetalTexture
{
  self->_metalTexture = 0;
  MEMORY[0x270F9A758]();
}

- (id)p_allocateMetalTextureForDevice:(id)a3
{
  id v4 = a3;
  char v5 = +[TSDCapabilities currentCapabilities];
  [v5 maximumMetalTextureSizeForDevice:v4];

  CGFloat v6 = [(TSDTexturedRectangle *)self p_colorSpace];
  if (v6 == (CGColorSpace *)TSUP3ColorSpace()) {
    uint64_t v7 = 115;
  }
  else {
    uint64_t v7 = 80;
  }
  TSUShrinkSizeToFitInSize();
  double v10 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v7 width:(unint64_t)v9 height:(unint64_t)v8 mipmapped:0];
  double v11 = (void *)[v4 newTextureWithDescriptor:v10];

  return v11;
}

- (void)setupMetalTextureForDevice:(id)a3
{
  id v4 = a3;
  if (!self->_metalTexture)
  {
    char v5 = [(TSDTexturedRectangle *)self p_allocateMetalTextureForDevice:v4];
    metalTexture = self->_metalTexture;
    self->_metalTexture = v5;

    unint64_t v7 = [(MTLTexture *)self->_metalTexture width];
    unint64_t v8 = [(MTLTexture *)self->_metalTexture height];
    uint64_t v9 = [(MTLTexture *)self->_metalTexture pixelFormat];
    char v10 = 2;
    if (v9 == 115) {
      char v10 = 3;
    }
    unint64_t v11 = v7 << v10;
    double v12 = -[TSDTexturedRectangle p_setupTextureDataWithSize:isBGRA:](self, "p_setupTextureDataWithSize:isBGRA:", 1, (double)v7, (double)v8);
    memset(v17, 0, 24);
    uint64_t v13 = self->_metalTexture;
    v17[3] = v7;
    v17[4] = v8;
    v17[5] = 1;
    [(MTLTexture *)v13 replaceRegion:v17 mipmapLevel:0 withBytes:v12 bytesPerRow:v11];
    if ((unint64_t)[(MTLTexture *)self->_metalTexture mipmapLevelCount] >= 2)
    {
      size_t v14 = (void *)[v4 newCommandQueue];
      uint32_t v15 = [v14 commandBuffer];
      size_t v16 = [v15 blitCommandEncoder];
      [v16 generateMipmapsForTexture:self->_metalTexture];
      [v16 endEncoding];
      [v15 commit];
    }
    free(v12);
  }
}

+ (id)setupMetalShaderForContext:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263F7C7F0] currentHandler];
    char v5 = [NSString stringWithUTF8String:"+[TSDTexturedRectangle setupMetalShaderForContext:]"];
    CGFloat v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 846, @"invalid nil value for '%s'", "context");
  }
  unint64_t v7 = [v3 device];

  if (!v7)
  {
    unint64_t v8 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"+[TSDTexturedRectangle setupMetalShaderForContext:]"];
    char v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 847, @"invalid nil value for '%s'", "context.device");
  }
  id v11 = objc_alloc_init(MEMORY[0x263F129B0]);
  objc_msgSend(v11, "setPixelFormat:", objc_msgSend(v3, "pixelFormat"));
  [v11 setBlendingEnabled:1];
  [v11 setRgbBlendOperation:0];
  [v11 setAlphaBlendOperation:0];
  [v11 setSourceRGBBlendFactor:1];
  [v11 setSourceAlphaBlendFactor:1];
  [v11 setDestinationAlphaBlendFactor:5];
  [v11 setDestinationRGBBlendFactor:5];
  double v12 = [TSDMetalShader alloc];
  uint64_t v13 = [v3 device];
  id v14 = [(TSDMetalShader *)v12 initDefaultTextureAndOpacityShaderWithDevice:v13 colorAttachment:v11];

  return v14;
}

- (void)drawFrameAtLayerTime:(double)a3 context:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    CGFloat v6 = [MEMORY[0x263F7C7F0] currentHandler];
    unint64_t v7 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle drawFrameAtLayerTime:context:]"];
    unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 867, @"invalid nil value for '%s'", "context");
  }
  [(TSDTexturedRectangle *)self frameOnCanvas];
  double v10 = v9;
  [v5 layerSize];
  double v12 = v11;
  [(TSDTexturedRectangle *)self frameOnCanvas];
  double v14 = v12 - v13;
  [(TSDTexturedRectangle *)self frameOnCanvas];
  double v16 = v14 - v15;
  [(TSDTexturedRectangle *)self frameOnCanvas];
  double v18 = v17;
  [(TSDTexturedRectangle *)self frameOnCanvas];
  double v20 = v19;
  double v21 = [v5 device];
  id v22 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v21, v10, v16, v18, v20, *MEMORY[0x263F7C928], *(double *)(MEMORY[0x263F7C928] + 8), *(double *)(MEMORY[0x263F7C928] + 16), *(double *)(MEMORY[0x263F7C928] + 24));

  [v5 layerSize];
  double v24 = v23;
  double v26 = v25;
  CGRect v27 = [v5 shader];

  if (!v27)
  {
    long long v28 = [MEMORY[0x263F7C7F0] currentHandler];
    double v29 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle drawFrameAtLayerTime:context:]"];
    double v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 874, @"invalid nil value for '%s'", "context.shader");
  }
  CGAffineTransform v31 = [v5 renderEncoder];

  if (!v31)
  {
    int v32 = [MEMORY[0x263F7C7F0] currentHandler];
    CGRect v33 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle drawFrameAtLayerTime:context:]"];
    CGRect v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, v34, 875, @"invalid nil value for '%s'", "context.renderEncoder");
  }
  float64x2_t v49 = 0u;
  float64x2_t v50 = 0u;
  float64x2_t v47 = 0u;
  float64x2_t v48 = 0u;
  float64x2_t v45 = 0u;
  float64x2_t v46 = 0u;
  float64x2_t v43 = 0u;
  float64x2_t v44 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v43, 0.0, v24, 0.0, v26, -1.0, 1.0);
  v51[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v43), v44);
  v51[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v45), v46);
  v51[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v48);
  v51[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v50);
  [(TSDTexturedRectangle *)self singleTextureOpacity];
  *(float *)&double v35 = v35;
  int v42 = LODWORD(v35);
  long long v36 = [v5 renderEncoder];
  long long v37 = [(TSDTexturedRectangle *)self metalTexture];
  [v36 setFragmentTexture:v37 atIndex:0];

  long long v38 = [v5 shader];
  CGAffineTransform v39 = [v5 renderEncoder];
  [v38 setPipelineStateWithEncoder:v39 vertexBytes:v51 fragmentBytes:&v42];

  CGRect v40 = [v5 renderEncoder];
  CGRect v41 = [v5 shader];
  objc_msgSend(v22, "drawWithEncoder:atIndex:", v40, objc_msgSend(v41, "bufferIndex"));
}

- (id)metalTextureWithContext:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);
    unint64_t v7 = [v6 metalTextureWithContext:v4];

    goto LABEL_3;
  }
  if (!self->_liveTexturedRectangleSource)
  {
    unint64_t v7 = [(TSDTexturedRectangle *)self metalTexture];
    goto LABEL_3;
  }
  BOOL shouldUseDisplayLinkPresentationTime = self->_shouldUseDisplayLinkPresentationTime;
  [v4 timingInfo];
  if (shouldUseDisplayLinkPresentationTime) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  double v13 = self;
  objc_sync_enter(v13);
  if (!v13->_liveMetalTexturePool)
  {
    v13->_liveMetalTexturePoolIndedouble x = -1;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(3);
    liveMetalTexturesSemaphore = v13->_liveMetalTexturesSemaphore;
    v13->_liveMetalTexturesSemaphore = (OS_dispatch_semaphore *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    liveMetalTextureToTimestamp = v13->_liveMetalTextureToTimestamp;
    v13->_liveMetalTextureToTimestamp = (NSMutableDictionary *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    liveMetalTimestampToTexture = v13->_liveMetalTimestampToTexture;
    v13->_liveMetalTimestampToTexture = (NSMutableDictionary *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    liveMetalTexturePool = v13->_liveMetalTexturePool;
    v13->_liveMetalTexturePool = (NSMutableArray *)v20;
  }
  id v22 = v13->_liveMetalTimestampToTexture;
  double v23 = [NSNumber numberWithDouble:v12];
  double v24 = [(NSMutableDictionary *)v22 objectForKey:v23];

  if (v24)
  {
    id v25 = v24;
LABEL_29:
    unint64_t v7 = v25;
    LODWORD(v33) = 0;
    goto LABEL_30;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(TSDLiveTexturedRectangleSource *)self->_liveTexturedRectangleSource requiresOffscreenPass] & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v25 = [(TSDLiveTexturedRectangleSource *)self->_liveTexturedRectangleSource metalTextureWithContext:v4];
    goto LABEL_29;
  }
  if (([(TSDLiveTexturedRectangleSource *)self->_liveTexturedRectangleSource shouldDrawToMetalTextureWithContext:v4] & 1) == 0)
  {
    id v25 = [(TSDTexturedRectangle *)v13 p_latestTextureNotAfterLayerTime:v12];
    goto LABEL_29;
  }
  if ((unint64_t)[(NSMutableArray *)v13->_liveMetalTexturePool count] > 2)
  {
LABEL_23:
    if (!v13->_liveTextureSourceShader)
    {
      if (!v4)
      {
        CGRect v34 = [MEMORY[0x263F7C7F0] currentHandler];
        double v35 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle metalTextureWithContext:]"];
        long long v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 949, @"invalid nil value for '%s'", "callingMetalContext");
      }
      id v37 = objc_alloc_init(MEMORY[0x263F129B0]);
      long long v38 = [(NSMutableArray *)v13->_liveMetalTexturePool firstObject];
      objc_msgSend(v37, "setPixelFormat:", objc_msgSend(v38, "pixelFormat"));

      [v37 setBlendingEnabled:1];
      [v37 setRgbBlendOperation:0];
      [v37 setAlphaBlendOperation:0];
      [v37 setSourceRGBBlendFactor:1];
      [v37 setSourceAlphaBlendFactor:1];
      [v37 setDestinationAlphaBlendFactor:5];
      [v37 setDestinationRGBBlendFactor:5];
      CGAffineTransform v39 = [TSDMetalShader alloc];
      CGRect v40 = [v4 device];
      uint64_t v41 = [(TSDMetalShader *)v39 initDefaultTextureAndOpacityShaderWithDevice:v40 colorAttachment:v37];
      liveTextureSourceShader = v13->_liveTextureSourceShader;
      v13->_liveTextureSourceShader = (TSDMetalShader *)v41;
    }
    unint64_t v7 = 0;
    LODWORD(v33) = 1;
    goto LABEL_30;
  }
  double v26 = +[TSDCapabilities currentCapabilities];
  CGRect v27 = [v4 device];
  [v26 maximumMetalTextureSizeForDevice:v27];
  double v29 = v28;
  double v31 = v30;

  int v32 = [v4 device];
  CGRect v33 = -[TSDTexturedRectangle p_allocateMetalTextureForDevice:renderTarget:writable:private:maxSize:](v13, "p_allocateMetalTextureForDevice:renderTarget:writable:private:maxSize:", v32, 1, 0, 1, v29, v31);

  if (v33)
  {
    [(NSMutableArray *)v13->_liveMetalTexturePool addObject:v33];

    goto LABEL_23;
  }
  unint64_t v7 = 0;
LABEL_30:

  objc_sync_exit(v13);
  if (v33)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)v13->_liveMetalTexturesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    float64x2_t v43 = v13->_liveMetalTexturePool;
    v13->_liveMetalTexturePoolIndedouble x = (v13->_liveMetalTexturePoolIndex + 1) % 3;
    unint64_t v7 = -[NSMutableArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:");
    float64x2_t v44 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v7];
    float64x2_t v45 = [MEMORY[0x263F129A0] renderPassDescriptor];
    float64x2_t v46 = [v45 colorAttachments];
    float64x2_t v47 = [v46 objectAtIndexedSubscript:0];
    [v47 setTexture:v7];

    float64x2_t v48 = [v45 colorAttachments];
    float64x2_t v49 = [v48 objectAtIndexedSubscript:0];
    [v49 setLoadAction:2];

    float64x2_t v50 = [v45 colorAttachments];
    v51 = [v50 objectAtIndexedSubscript:0];
    [v51 setStoreAction:1];

    v52 = [v45 colorAttachments];
    v53 = [v52 objectAtIndexedSubscript:0];
    objc_msgSend(v53, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    v54 = (void *)[v4 copy];
    v55 = [(NSMutableArray *)v13->_liveMetalTexturePool firstObject];
    objc_msgSend(v54, "setPixelFormat:", objc_msgSend(v55, "pixelFormat"));

    v56 = [(TSDTexturedRectangle *)v13 metalTexture];
    double v57 = (double)(unint64_t)[v56 width];
    v58 = [(TSDTexturedRectangle *)v13 metalTexture];
    objc_msgSend(v54, "setLayerSize:", v57, (double)(unint64_t)objc_msgSend(v58, "height"));

    [v54 setShader:v13->_liveTextureSourceShader];
    [v54 setCurrentBuffer:v13->_liveMetalTexturePoolIndex];
    v59 = [v54 commandQueue];
    uint64_t v60 = [v59 commandBuffer];

    v77 = (void *)v60;
    [v54 setCommandBuffer:v60];
    v61 = [v54 commandBuffer];

    if (!v61)
    {
      v62 = [MEMORY[0x263F7C7F0] currentHandler];
      v63 = v44;
      v64 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle metalTextureWithContext:]"];
      v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
      objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v64, v65, 991, @"invalid nil value for '%s'", "context.commandBuffer");

      float64x2_t v44 = v63;
    }
    [v54 setPassDescriptor:v45];
    v66 = [v54 commandBuffer];
    v67 = [v54 passDescriptor];
    uint64_t v68 = [v66 renderCommandEncoderWithDescriptor:v67];

    v76 = (void *)v68;
    [v54 setRenderEncoder:v68];
    v69 = v13;
    objc_sync_enter(v69);
    v70 = [v69[30] objectForKey:v44];
    if (v70)
    {
      [v69[30] removeObjectForKey:v44];
      [(NSMutableDictionary *)v13->_liveMetalTimestampToTexture removeObjectForKey:v70];
    }

    objc_sync_exit(v69);
    [(TSDLiveTexturedRectangleSource *)self->_liveTexturedRectangleSource drawToMetalTextureWithContext:v54];
    v71 = [v54 renderEncoder];
    [v71 endEncoding];

    objc_initWeak(&location, v13->_liveMetalTexturesSemaphore);
    v72 = [v54 commandBuffer];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __48__TSDTexturedRectangle_metalTextureWithContext___block_invoke;
    v78[3] = &unk_2646B1C50;
    objc_copyWeak(&v79, &location);
    [v72 addCompletedHandler:v78];

    v73 = [v54 commandBuffer];
    [v73 commit];

    v74 = v69;
    objc_sync_enter(v74);
    v75 = [NSNumber numberWithDouble:v12];
    [v69[30] setObject:v75 forKey:v44];
    [(NSMutableDictionary *)v13->_liveMetalTimestampToTexture setObject:v7 forKey:v75];

    objc_sync_exit(v74);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&location);
  }
LABEL_3:

  return v7;
}

void __48__TSDTexturedRectangle_metalTextureWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_semaphore_signal(WeakRetained);
}

- (CGSize)p_textureSizeWithDevice:(id)a3 maxSize:(CGSize)a4
{
  [(CALayer *)self->mLayer contentsRect];
  if (v5 != 0.0)
  {
    [(CALayer *)self->mLayer contentsRect];
    if (v6 != 0.0)
    {
      [(CALayer *)self->mLayer contentsRect];
      [(CALayer *)self->mLayer contentsRect];
    }
  }
  TSUShrinkSizeToFitInSize();
  if (self->mSize.width != 0.0)
  {
    double v9 = fmax(v7, 1.0);
    double v10 = fmax(v8, 1.0);
    if (self->mSize.height != 0.0)
    {
      double v8 = v10;
      double v7 = v9;
    }
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)p_allocateMetalTextureForDevice:(id)a3 renderTarget:(BOOL)a4 writable:(BOOL)a5 private:(BOOL)a6 maxSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v13 = a3;
  -[TSDTexturedRectangle p_textureSizeWithDevice:maxSize:](self, "p_textureSizeWithDevice:maxSize:", v13, width, height);
  unint64_t v15 = (unint64_t)v14;
  unint64_t v17 = (unint64_t)v16;
  if ((unint64_t)v14) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    double v19 = 0;
    goto LABEL_21;
  }
  uint64_t v20 = [(TSDTexturedRectangle *)self p_colorSpace];
  uint64_t v21 = TSUP3ColorSpace();
  uint64_t v22 = 70;
  if (v11) {
    uint64_t v22 = 80;
  }
  uint64_t v23 = 115;
  if (v11) {
    uint64_t v23 = 552;
  }
  if (v20 == (CGColorSpace *)v21) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v22;
  }
  id v25 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v24 width:v15 height:v17 mipmapped:self->mShouldGenerateMipmap];
  double v26 = v25;
  if (!v11)
  {
    if (!v10) {
      goto LABEL_16;
    }
LABEL_25:
    objc_msgSend(v26, "setUsage:", objc_msgSend(v26, "usage") | 2);
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  [v25 setUsage:5];
  if (v10) {
    goto LABEL_25;
  }
LABEL_16:
  if (v9)
  {
LABEL_17:
    [v26 setResourceOptions:32];
    [v26 setStorageMode:2];
  }
LABEL_18:
  double v19 = (void *)[v13 newTextureWithDescriptor:v26];

  if (v19 && [v19 width]) {
    [v19 height];
  }
LABEL_21:

  return v19;
}

- (id)p_latestTextureNotAfterLayerTime:(double)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_liveMetalTexturePool count])
  {
    BOOL v11 = [(TSDTexturedRectangle *)self metalTexture];
    goto LABEL_22;
  }
  double v5 = [(NSMutableDictionary *)self->_liveMetalTimestampToTexture allKeys];
  double v6 = [NSNumber numberWithDouble:a3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8)
  {
    BOOL v10 = 0;
    BOOL v11 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  BOOL v10 = 0;
  BOOL v11 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v7);
      }
      double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (!v11)
      {
        BOOL v11 = -[NSMutableDictionary objectForKey:](self->_liveMetalTimestampToTexture, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
        id v23 = v14;
        goto LABEL_15;
      }
      [v6 doubleValue];
      double v16 = v15;
      [v10 doubleValue];
      double v18 = v17;
      [v14 doubleValue];
      BOOL v20 = v19 > v16;
      double v21 = v16 - v19;
      if (!v20 && v21 < v16 - v18)
      {
        id v23 = v14;

        [(NSMutableDictionary *)self->_liveMetalTimestampToTexture objectForKey:v23];
        v11 = BOOL v10 = v11;
LABEL_15:

        BOOL v10 = v23;
        continue;
      }
    }
    uint64_t v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v21);
  }
  while (v9);
LABEL_21:

LABEL_22:

  return v11;
}

- (void)setLiveTexturedRectangleSource:(id)a3
{
  id v4 = (TSDLiveTexturedRectangleSource *)a3;
  objc_storeWeak((id *)&self->_liveTexturedRectangleSourceProxy, 0);
  liveTexturedRectangleSource = self->_liveTexturedRectangleSource;
  self->_liveTexturedRectangleSource = v4;
}

- (void)setLiveTexturedRectangleSourceProxy:(id)a3
{
  id obj = a3;
  if (self->_liveTexturedRectangleSource)
  {
    id v4 = [MEMORY[0x263F7C7F0] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[TSDTexturedRectangle setLiveTexturedRectangleSourceProxy:]"];
    double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 1165, @"expected nil value for '%s'", "_liveTexturedRectangleSource");
  }
  objc_storeWeak((id *)&self->_liveTexturedRectangleSourceProxy, obj);
}

- (BOOL)hasLiveTexturedRectangleSource
{
  if (self->_liveTexturedRectangleSource) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);
  BOOL v2 = WeakRetained != 0;

  return v2;
}

- (NSMutableDictionary)attributes
{
  return self->mAttributes;
}

- (void)setAttributes:(id)a3
{
}

- (CGRect)contentRect
{
  double x = self->mContentRect.origin.x;
  double y = self->mContentRect.origin.y;
  double width = self->mContentRect.size.width;
  double height = self->mContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->mContentRect = a3;
}

- (CGColorSpace)colorSpace
{
  return self->mColorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->mColorSpace = a3;
}

- (CALayer)layer
{
  return self->mLayer;
}

- (BOOL)isFlattened
{
  return self->mIsFlattened;
}

- (void)setIsFlattened:(BOOL)a3
{
  self->mIsFlattened = a3;
}

- (CGPoint)originalPosition
{
  double x = self->mOriginalPosition.x;
  double y = self->mOriginalPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->mOriginalPosition = a3;
}

- (TSDTextureSet)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParent);

  return (TSDTextureSet *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)textureType
{
  return self->mTextureType;
}

- (double)textureOpacity
{
  return self->mTextureOpacity;
}

- (void)setTextureOpacity:(double)a3
{
  self->mTextureOpacitdouble y = a3;
}

- (NSMutableArray)tags
{
  return self->mTags;
}

- (void)setTags:(id)a3
{
}

- (void)setFrameOnCanvas:(CGRect)a3
{
  self->mFrameOnCanvas = a3;
}

- (BOOL)shouldUseDisplayLinkPresentationTime
{
  return self->_shouldUseDisplayLinkPresentationTime;
}

- (void)setShouldUseDisplayLinkPresentationTime:(BOOL)a3
{
  self->_BOOL shouldUseDisplayLinkPresentationTime = a3;
}

- (BOOL)shouldGenerateMipmap
{
  return self->mShouldGenerateMipmap;
}

- (void)setShouldGenerateMipmap:(BOOL)a3
{
  self->mShouldGenerateMipmap = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)textBaseline
{
  return self->_textBaseline;
}

- (void)setTextBaseline:(double)a3
{
  self->_textBaseline = a3;
}

- (void)setTextColor:(id)a3
{
}

- (_NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (double)textXHeight
{
  return self->_textXHeight;
}

- (void)setTextXHeight:(double)a3
{
  self->_textXsize_t Height = a3;
}

- (TSUColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (double)bakedScale
{
  return self->_bakedScale;
}

- (BOOL)isVerticalText
{
  return self->_isVerticalText;
}

- (void)setIsVerticalText:(BOOL)a3
{
  self->_isVerticalText = a3;
}

- (MTLTexture)metalTexture
{
  return self->_metalTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalTexture, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->mParent);
  objc_storeStrong((id *)&self->_liveTextureSourceShader, 0);
  objc_storeStrong((id *)&self->_liveMetalTimestampToTexture, 0);
  objc_storeStrong((id *)&self->_liveMetalTextureToTimestamp, 0);
  objc_storeStrong((id *)&self->_liveMetalTexturePool, 0);
  objc_destroyWeak((id *)&self->_liveTexturedRectangleSourceProxy);
  objc_storeStrong((id *)&self->_liveTexturedRectangleSource, 0);
  objc_storeStrong((id *)&self->_liveMetalTexturesSemaphore, 0);
  objc_storeStrong((id *)&self->mTags, 0);
  objc_storeStrong((id *)&self->mAttributes, 0);
  objc_storeStrong(&self->mRenderBlock, 0);

  objc_storeStrong((id *)&self->mLayer, 0);
}

@end