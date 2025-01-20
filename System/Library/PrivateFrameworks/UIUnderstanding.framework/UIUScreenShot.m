@interface UIUScreenShot
- (ScreenShotCompat)underlyingObject;
- (UIUScreenShot)initWithContents:(id)a3;
@end

@implementation UIUScreenShot

- (UIUScreenShot)initWithContents:(id)a3
{
  v4 = (ScreenShotCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUScreenShot;
  v5 = [(UIUScreenShot *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (ScreenShotCompat)underlyingObject
{
  return (ScreenShotCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end