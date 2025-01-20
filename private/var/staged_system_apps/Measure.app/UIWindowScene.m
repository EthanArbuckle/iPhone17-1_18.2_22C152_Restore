@interface UIWindowScene
+ (BOOL)interfaceLockedToPortrait;
+ (void)load;
+ (void)performWhileInterfaceOrientationLocked:(id)a3;
+ (void)setInterfaceLockedToPortrait:(BOOL)a3;
- (int64_t)xxx_interfaceOrientation;
@end

@implementation UIWindowScene

+ (void)setInterfaceLockedToPortrait:(BOOL)a3
{
  byte_1004D3F10 = a3;
}

+ (BOOL)interfaceLockedToPortrait
{
  return byte_1004D3F10;
}

+ (void)performWhileInterfaceOrientationLocked:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = [a1 interfaceLockedToPortrait];
  [a1 setInterfaceLockedToPortrait:1];
  v4[2](v4);

  [a1 setInterfaceLockedToPortrait:v5];
}

+ (void)load
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E98;
  block[3] = &unk_100485200;
  block[4] = a1;
  if (qword_1004D3F18 != -1) {
    dispatch_once(&qword_1004D3F18, block);
  }
}

- (int64_t)xxx_interfaceOrientation
{
  if (+[UIWindowScene interfaceLockedToPortrait]) {
    return 1;
  }

  return [(UIWindowScene *)self xxx_interfaceOrientation];
}

@end