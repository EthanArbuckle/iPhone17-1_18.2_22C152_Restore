@interface AEHighlightLine
- (BOOL)includesCapSpace;
- (BOOL)lightenBlend;
- (CALayer)contentLayer;
- (CGImage)multiplyImage;
- (CGRect)currentLineRect;
- (CGRect)fullLineRect;
- (double)underlinePosition;
- (int)underlineDirection;
- (void)dealloc;
- (void)setContentLayer:(id)a3;
- (void)setCurrentLineRect:(CGRect)a3;
- (void)setFullLineRect:(CGRect)a3;
- (void)setIncludesCapSpace:(BOOL)a3;
- (void)setLightenBlend:(BOOL)a3;
- (void)setMultiplyImage:(CGImage *)a3;
- (void)setUnderlineDirection:(int)a3;
- (void)setUnderlinePosition:(double)a3;
@end

@implementation AEHighlightLine

- (void)dealloc
{
  [(AEHighlightLine *)self setMultiplyImage:0];
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightLine;
  [(AEHighlightLine *)&v3 dealloc];
}

- (void)setMultiplyImage:(CGImage *)a3
{
  mMultiplyImage = self->mMultiplyImage;
  if (mMultiplyImage != a3)
  {
    if (mMultiplyImage) {
      CFRelease(mMultiplyImage);
    }
    self->mMultiplyImage = 0;
    if (a3) {
      self->mMultiplyImage = (CGImage *)CFRetain(a3);
    }
  }
}

- (CALayer)contentLayer
{
  return self->mContentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CGRect)fullLineRect
{
  double x = self->mFullLineRect.origin.x;
  double y = self->mFullLineRect.origin.y;
  double width = self->mFullLineRect.size.width;
  double height = self->mFullLineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullLineRect:(CGRect)a3
{
  self->mFullLineRect = a3;
}

- (CGRect)currentLineRect
{
  double x = self->mCurrentLineRect.origin.x;
  double y = self->mCurrentLineRect.origin.y;
  double width = self->mCurrentLineRect.size.width;
  double height = self->mCurrentLineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentLineRect:(CGRect)a3
{
  self->mCurrentLineRect = a3;
}

- (double)underlinePosition
{
  return self->mUnderlinePosition;
}

- (void)setUnderlinePosition:(double)a3
{
  self->mUnderlinePosition = a3;
}

- (int)underlineDirection
{
  return self->mUnderlineDirection;
}

- (void)setUnderlineDirection:(int)a3
{
  self->mUnderlineDirection = a3;
}

- (CGImage)multiplyImage
{
  return self->mMultiplyImage;
}

- (BOOL)lightenBlend
{
  return self->mLightenBlend;
}

- (void)setLightenBlend:(BOOL)a3
{
  self->mLightenBlend = a3;
}

- (BOOL)includesCapSpace
{
  return self->mIncludesCapSpace;
}

- (void)setIncludesCapSpace:(BOOL)a3
{
  self->mIncludesCapSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentLayer, 0);

  objc_storeStrong((id *)&self->mLayer, 0);
}

@end