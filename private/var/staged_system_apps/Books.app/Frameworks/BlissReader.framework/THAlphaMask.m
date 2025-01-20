@interface THAlphaMask
- (BOOL)testPoint:(CGPoint)a3;
- (CGSize)p_maxSizeForResolution:(int)a3 naturalSize:(CGSize)result;
- (THAlphaMask)initWithSize:(CGSize)a3 resolution:(int)a4 renderBlock:(id)a5;
- (void)dealloc;
@end

@implementation THAlphaMask

- (THAlphaMask)initWithSize:(CGSize)a3 resolution:(int)a4 renderBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)THAlphaMask;
  v9 = [(THAlphaMask *)&v23 init];
  v10 = v9;
  if (v9)
  {
    -[THAlphaMask p_maxSizeForResolution:naturalSize:](v9, "p_maxSizeForResolution:naturalSize:", v6, width, height);
    double v13 = fmin(v11 / width, v12 / height);
    TSDMultiplySizeScalar();
    TSDCeilSize();
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    v18 = (CGContext *)TSDBitmapContextCreate();
    v10->_bitmapContext = v18;
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.double width = v15;
    v24.size.double height = v17;
    CGContextClearRect(v18, v24);
    CGContextScaleCTM(v10->_bitmapContext, v13, v13);
    if (a5) {
      (*((void (**)(id, CGContext *))a5 + 2))(a5, v10->_bitmapContext);
    }
    CGAffineTransformMakeScale(&v22, v13, v13);
    long long v20 = *(_OWORD *)&v22.c;
    long long v19 = *(_OWORD *)&v22.tx;
    *(_OWORD *)&v10->_naturalToBitmapTransform.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v10->_naturalToBitmapTransform.c = v20;
    *(_OWORD *)&v10->_naturalToBitmapTransform.tx = v19;
  }
  return v10;
}

- (void)dealloc
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext) {
    CGContextRelease(bitmapContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)THAlphaMask;
  [(THAlphaMask *)&v4 dealloc];
}

- (BOOL)testPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_bitmapContext)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAlphaMask testPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THAlphaMask.m") lineNumber:67 description:@"no bitmap context"];
    if (!self->_bitmapContext) {
      return 0;
    }
  }
  BOOL result = 0;
  if (self->_naturalToBitmapTransform.tx
     + y * self->_naturalToBitmapTransform.c
     + self->_naturalToBitmapTransform.a * x >= 0.0
    && self->_naturalToBitmapTransform.ty
     + y * self->_naturalToBitmapTransform.d
     + self->_naturalToBitmapTransform.b * x >= 0.0)
  {
    TSURound();
    size_t v8 = (unint64_t)v7;
    TSURound();
    double v10 = v9;
    if (CGBitmapContextGetHeight(self->_bitmapContext) > v8
      && CGBitmapContextGetWidth(self->_bitmapContext) > (unint64_t)v10)
    {
      unint64_t v11 = (unint64_t)v10 + CGBitmapContextGetBytesPerRow(self->_bitmapContext) * v8;
      return *((unsigned char *)CGBitmapContextGetData(self->_bitmapContext) + v11) != 0;
    }
    return 0;
  }
  return result;
}

- (CGSize)p_maxSizeForResolution:(int)a3 naturalSize:(CGSize)result
{
  if (a3 == 2)
  {
    CGFloat v4 = 64.0;
LABEL_7:
    result.double height = v4;
    result.double width = v4;
    return result;
  }
  if (a3 == 1)
  {
    CGFloat v4 = 640.0;
    goto LABEL_7;
  }
  if (a3)
  {
    result.double width = CGSizeZero.width;
    result.double height = CGSizeZero.height;
  }
  return result;
}

@end