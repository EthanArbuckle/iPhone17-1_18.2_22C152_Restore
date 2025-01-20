@interface WDAAnchor
+ (id)stringForTextWrappingModeType:(int)a3;
- (BOOL)allowOverlap;
- (CGRect)bounds;
- (NSArray)textWrapPoints;
- (WDAAnchor)init;
- (double)wrapDistanceBottom;
- (double)wrapDistanceLeft;
- (double)wrapDistanceRight;
- (double)wrapDistanceTop;
- (id)description;
- (int)horizontalPosition;
- (int)relativeHorizontalPosition;
- (int)relativeVerticalPosition;
- (int)textWrappingMode;
- (int)textWrappingModeType;
- (int)verticalPosition;
- (int64_t)zIndex;
- (void)setAllowOverlap:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setHorizontalPosition:(int)a3;
- (void)setRelativeHorizontalPosition:(int)a3;
- (void)setRelativeVerticalPosition:(int)a3;
- (void)setTextWrapPoints:(id)a3;
- (void)setTextWrappingMode:(int)a3;
- (void)setTextWrappingModeType:(int)a3;
- (void)setVerticalPosition:(int)a3;
- (void)setWrapDistanceBottom:(double)a3;
- (void)setWrapDistanceLeft:(double)a3;
- (void)setWrapDistanceRight:(double)a3;
- (void)setWrapDistanceTop:(double)a3;
- (void)setZIndex:(int64_t)a3;
@end

@implementation WDAAnchor

- (WDAAnchor)init
{
  v6.receiver = self;
  v6.super_class = (Class)WDAAnchor;
  v2 = [(WDAAnchor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->mTextWrappingMode = 3;
    mTextWrapPoints = v2->mTextWrapPoints;
    v2->mTextWrapPoints = 0;

    *(_OWORD *)&v3->mHorizontalPosition = xmmword_238EEEDA0;
    *(_OWORD *)&v3->mWrapDistanceLeft = xmmword_238EEEDB0;
    *(_OWORD *)&v3->mWrapDistanceRight = xmmword_238EEEDB0;
    v3->mAllowOverlap = 1;
    v3->mZIndex = 0;
  }
  return v3;
}

- (void)setHorizontalPosition:(int)a3
{
  self->mHorizontalPosition = a3;
}

- (void)setRelativeHorizontalPosition:(int)a3
{
  self->mRelativeHorizontalPosition = a3;
}

- (void)setVerticalPosition:(int)a3
{
  self->mVerticalPosition = a3;
}

- (void)setRelativeVerticalPosition:(int)a3
{
  self->mRelativeVerticalPosition = a3;
}

- (void)setWrapDistanceLeft:(double)a3
{
  self->mWrapDistanceLeft = a3;
}

- (void)setWrapDistanceTop:(double)a3
{
  self->mWrapDistanceTop = a3;
}

- (void)setWrapDistanceRight:(double)a3
{
  self->mWrapDistanceRight = a3;
}

- (void)setWrapDistanceBottom:(double)a3
{
  self->mWrapDistanceBottom = a3;
}

- (void)setAllowOverlap:(BOOL)a3
{
  self->mAllowOverlap = a3;
}

- (void)setZIndex:(int64_t)a3
{
  self->mZIndex = a3;
}

- (void)setTextWrappingMode:(int)a3
{
  self->mTextWrappingMode = a3;
}

- (void)setTextWrappingModeType:(int)a3
{
  self->mTextWrappingModeType = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)relativeVerticalPosition
{
  return self->mRelativeVerticalPosition;
}

- (int)textWrappingMode
{
  return self->mTextWrappingMode;
}

- (int)relativeHorizontalPosition
{
  return self->mRelativeHorizontalPosition;
}

- (int64_t)zIndex
{
  return self->mZIndex;
}

+ (id)stringForTextWrappingModeType:(int)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_264D68390[a3];
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDAAnchor;
  v2 = [(WDAAnchor *)&v4 description];
  return v2;
}

- (int)textWrappingModeType
{
  return self->mTextWrappingModeType;
}

- (NSArray)textWrapPoints
{
  return self->mTextWrapPoints;
}

- (void)setTextWrapPoints:(id)a3
{
}

- (double)wrapDistanceLeft
{
  return self->mWrapDistanceLeft;
}

- (double)wrapDistanceRight
{
  return self->mWrapDistanceRight;
}

- (double)wrapDistanceTop
{
  return self->mWrapDistanceTop;
}

- (double)wrapDistanceBottom
{
  return self->mWrapDistanceBottom;
}

- (int)horizontalPosition
{
  return self->mHorizontalPosition;
}

- (int)verticalPosition
{
  return self->mVerticalPosition;
}

- (BOOL)allowOverlap
{
  return self->mAllowOverlap;
}

- (void).cxx_destruct
{
}

@end