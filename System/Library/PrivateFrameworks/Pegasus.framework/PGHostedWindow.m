@interface PGHostedWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)canBecomeFirstResponder;
- (PGHostedWindow)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation PGHostedWindow

- (PGHostedWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v10.receiver = self;
  v10.super_class = (Class)PGHostedWindow;
  return -[_UIHostedWindow initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (void)dealloc
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v4.receiver = self;
  v4.super_class = (Class)PGHostedWindow;
  [(_UIHostedWindow *)&v4 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end