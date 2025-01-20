@interface NonRotatingARSCNView
- (int64_t)lockedOrientation;
- (void)layoutSubviews;
- (void)lockRendererOrientation;
- (void)setLockedOrientation:(int64_t)a3;
- (void)windowWillAnimateRotateNotification:(id)a3;
@end

@implementation NonRotatingARSCNView

- (void)setLockedOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
  [(NonRotatingARSCNView *)self lockRendererOrientation];
  id v5 = +[NSNotificationCenter defaultCenter];
  v4 = [(NonRotatingARSCNView *)self renderer];
  [v5 removeObserver:v4 name:UIApplicationDidChangeStatusBarOrientationNotification object:0];
}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  id v4 = [(NonRotatingARSCNView *)self renderer];
  [v4 _setInterfaceOrientation:[self lockedOrientation]];
}

- (void)layoutSubviews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000061D4;
  v2[3] = &unk_100485230;
  v2[4] = self;
  +[UIWindowScene performWhileInterfaceOrientationLocked:v2];
}

- (void)lockRendererOrientation
{
  id v3 = [(NonRotatingARSCNView *)self renderer];
  [v3 _setInterfaceOrientation:[self lockedOrientation]];
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

@end