@interface GQDPath
- (BOOL)hasHorizontalFlip;
- (BOOL)hasVerticalFlip;
- (BOOL)horizontalFlip;
- (BOOL)isRect;
- (BOOL)isRectangular;
- (BOOL)verticalFlip;
- (CGPath)createBezierPath;
- (char)pathStr;
- (void)dealloc;
@end

@implementation GQDPath

- (void)dealloc
{
  mPathString = self->mPathString;
  if (mPathString) {
    xmlFree(mPathString);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDPath;
  [(GQDPath *)&v4 dealloc];
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isRect
{
  return [(GQDPath *)self isRectangular];
}

- (CGPath)createBezierPath
{
  return 0;
}

- (char)pathStr
{
  if (!self->mPathString)
  {
    v3 = [(GQDPath *)self createBezierPath];
    if (v3)
    {
      objc_super v4 = v3;
      self->mPathString = sub_437B4(v3);
      CFRelease(v4);
    }
  }
  return self->mPathString;
}

- (BOOL)hasVerticalFlip
{
  return 0;
}

- (BOOL)hasHorizontalFlip
{
  return 0;
}

- (BOOL)verticalFlip
{
  return 0;
}

- (BOOL)horizontalFlip
{
  return 0;
}

@end