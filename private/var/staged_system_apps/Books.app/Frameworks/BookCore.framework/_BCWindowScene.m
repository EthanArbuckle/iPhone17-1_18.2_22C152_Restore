@interface _BCWindowScene
- (BAAnalyticsController)ba_analyticsController;
- (BCSceneControlling)controller;
- (void)attemptRotateToPortraitWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setController:(id)a3;
@end

@implementation _BCWindowScene

- (BAAnalyticsController)ba_analyticsController
{
  v2 = [(_BCWindowScene *)self controller];
  v3 = [v2 ba_analyticsController];

  return (BAAnalyticsController *)v3;
}

- (void)attemptRotateToPortraitWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(_BCWindowScene *)self effectiveGeometry];
  v6 = (char *)[v5 interfaceOrientation] - 3;

  if ((unint64_t)v6 > 1)
  {
    v4[2](v4, 0);
  }
  else
  {
    v7 = objc_retainBlock(v4);
    id rotateCompletion = self->_rotateCompletion;
    self->_id rotateCompletion = v7;

    [(_BCWindowScene *)self addObserver:self forKeyPath:@"effectiveGeometry" options:1 context:off_341D50];
    id v9 = [objc_alloc((Class)UIWindowSceneGeometryPreferencesIOS) initWithInterfaceOrientations:2];
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_124730;
    v14[3] = &unk_2C9678;
    objc_copyWeak(&v15, &location);
    [(_BCWindowScene *)self requestGeometryUpdateWithPreferences:v9 errorHandler:v14];
    [UIApp windowRotationDuration];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_124930;
    v13[3] = &unk_2C96A0;
    v13[4] = self;
    v11 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v13 block:v10 + 0.3];
    rotateTimeoutTimer = self->_rotateTimeoutTimer;
    self->_rotateTimeoutTimer = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_341D50 == a6)
  {
    v7 = [(_BCWindowScene *)self effectiveGeometry];
    v8 = (char *)[v7 interfaceOrientation] - 1;

    if ((unint64_t)v8 <= 1)
    {
      [(NSTimer *)self->_rotateTimeoutTimer invalidate];
      rotateTimeoutTimer = self->_rotateTimeoutTimer;
      self->_rotateTimeoutTimer = 0;

      v11 = (void (**)(id, void))objc_retainBlock(self->_rotateCompletion);
      if (v11) {
        v11[2](v11, 0);
      }
      id rotateCompletion = self->_rotateCompletion;
      self->_id rotateCompletion = 0;
    }
  }
}

- (BCSceneControlling)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (BCSceneControlling *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rotateTimeoutTimer, 0);

  objc_storeStrong(&self->_rotateCompletion, 0);
}

@end