@interface RCPlatterStopButtonCAPackageManager
+ (id)stopButtonPackageManager;
- (BSUICAPackageView)packageView;
- (NSBundle)bundle;
- (NSString)packageName;
- (RCPlatterStopButtonCAPackageManager)initWithPackageName:(id)a3 inBundle:(id)a4;
- (UIView)view;
- (id)_stringForMicaState:(unint64_t)a3;
- (unint64_t)micaState;
- (void)_setMicaState:(unint64_t)a3 animated:(BOOL)a4;
- (void)pauseAnimations;
- (void)resumeAnimations;
- (void)setBundle:(id)a3;
- (void)setMicaState:(unint64_t)a3;
- (void)setPackageName:(id)a3;
- (void)setPackageView:(id)a3;
@end

@implementation RCPlatterStopButtonCAPackageManager

+ (id)stopButtonPackageManager
{
  v2 = [RCPlatterStopButtonCAPackageManager alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [(RCPlatterStopButtonCAPackageManager *)v2 initWithPackageName:@"PlatterStopButton" inBundle:v3];

  return v4;
}

- (RCPlatterStopButtonCAPackageManager)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCPlatterStopButtonCAPackageManager;
  v8 = [(RCPlatterStopButtonCAPackageManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(RCPlatterStopButtonCAPackageManager *)v8 setPackageName:v6];
    [(RCPlatterStopButtonCAPackageManager *)v9 setBundle:v7];
  }

  return v9;
}

- (void)setMicaState:(unint64_t)a3
{
  if (self->_micaState != a3)
  {
    self->_micaState = a3;
    -[RCPlatterStopButtonCAPackageManager _setMicaState:animated:](self, "_setMicaState:animated:");
  }
}

- (UIView)view
{
  v3 = [(RCPlatterStopButtonCAPackageManager *)self packageView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)BSUICAPackageView);
    v5 = [(RCPlatterStopButtonCAPackageManager *)self packageName];
    id v6 = [(RCPlatterStopButtonCAPackageManager *)self bundle];
    id v7 = [v4 initWithPackageName:v5 inBundle:v6];
    [(RCPlatterStopButtonCAPackageManager *)self setPackageView:v7];

    [(RCPlatterStopButtonCAPackageManager *)self _setMicaState:self->_micaState animated:1];
  }

  return (UIView *)[(RCPlatterStopButtonCAPackageManager *)self packageView];
}

- (void)pauseAnimations
{
}

- (void)resumeAnimations
{
}

- (void)_setMicaState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = (float)a4;
  v8 = [(RCPlatterStopButtonCAPackageManager *)self packageView];
  v9 = [v8 layer];
  *(float *)&double v10 = v7;
  [v9 setSpeed:v10];

  id v17 = [(RCPlatterStopButtonCAPackageManager *)self _stringForMicaState:a3];
  objc_super v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v11 platterStopButtonStateTransitionDuration];
  double v13 = v12;

  v14 = [(RCPlatterStopButtonCAPackageManager *)self packageView];
  v15 = v14;
  double v16 = 0.0;
  if (v4) {
    double v16 = v13;
  }
  [v14 setState:v17 animated:v4 transitionSpeed:0 completion:v16];
}

- (id)_stringForMicaState:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_100221338 + a3);
  }
}

- (unint64_t)micaState
{
  return self->_micaState;
}

- (BSUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (NSString)packageName
{
  return self->_packageName;
}

- (void)setPackageName:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_packageName, 0);

  objc_storeStrong((id *)&self->_packageView, 0);
}

@end