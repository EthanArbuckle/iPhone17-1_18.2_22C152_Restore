@interface MeasureApplication
+ (MeasureApplication)sharedApplication;
- (BOOL)isOverriddingStatusBarOrientation;
- (MeasureApplication)init;
- (int64_t)overriddenStatusBarOrientation;
- (int64_t)statusBarOrientation;
- (void)performWhileOverriddingStatusBarOrientation:(int64_t)a3 block:(id)a4;
- (void)setOverriddenStatusBarOrientation:(int64_t)a3;
- (void)setOverriddingStatusBarOrientation:(BOOL)a3;
@end

@implementation MeasureApplication

- (MeasureApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)MeasureApplication;
  result = [(MeasureApplication *)&v3 init];
  if (result)
  {
    result->_overriddingStatusBarOrientation = 0;
    result->_overriddenStatusBarOrientation = 0;
  }
  return result;
}

+ (MeasureApplication)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MeasureApplication;
  v2 = [super sharedApplication];

  return (MeasureApplication *)v2;
}

- (void)performWhileOverriddingStatusBarOrientation:(int64_t)a3 block:(id)a4
{
  v6 = (void (**)(void))a4;
  BOOL v7 = [(MeasureApplication *)self isOverriddingStatusBarOrientation];
  int64_t v8 = [(MeasureApplication *)self statusBarOrientation];
  [(MeasureApplication *)self setOverriddingStatusBarOrientation:1];
  [(MeasureApplication *)self setOverriddenStatusBarOrientation:a3];
  v6[2](v6);

  [(MeasureApplication *)self setOverriddingStatusBarOrientation:v7];

  [(MeasureApplication *)self setOverriddenStatusBarOrientation:v8];
}

- (int64_t)statusBarOrientation
{
  if ([(MeasureApplication *)self isOverriddingStatusBarOrientation])
  {
    return [(MeasureApplication *)self overriddenStatusBarOrientation];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MeasureApplication;
    return [(MeasureApplication *)&v4 statusBarOrientation];
  }
}

- (BOOL)isOverriddingStatusBarOrientation
{
  return self->_overriddingStatusBarOrientation;
}

- (void)setOverriddingStatusBarOrientation:(BOOL)a3
{
  self->_overriddingStatusBarOrientation = a3;
}

- (int64_t)overriddenStatusBarOrientation
{
  return self->_overriddenStatusBarOrientation;
}

- (void)setOverriddenStatusBarOrientation:(int64_t)a3
{
  self->_overriddenStatusBarOrientation = a3;
}

@end