@interface FRApplication
- (BOOL)shouldChangeWindowFrameSize;
- (BOOL)shouldRecordExtendedLaunchTime;
- (FRApplication)init;
- (UIOpenURLAction)launchURLAction;
- (id)_extendLaunchTest;
- (void)registerPlatformSpecificLaunchOptions:(id)a3 transitionContext:(id)a4;
- (void)sendEvent:(id)a3;
- (void)setShouldChangeWindowFrameSize:(BOOL)a3;
- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
@end

@implementation FRApplication

- (void)registerPlatformSpecificLaunchOptions:(id)a3 transitionContext:(id)a4
{
  v12 = (void (**)(id, void *, const UIApplicationLaunchOptionsKey))a3;
  id v6 = a4;
  v7 = [(FRApplication *)self launchURLAction];

  if (v7)
  {
    v8 = [(FRApplication *)self launchURLAction];
    v9 = [v8 url];
    v12[2](v12, v9, UIApplicationLaunchOptionsURLKey);

    v10 = [(FRApplication *)self launchURLAction];
    v11 = +[NSSet setWithObject:v10];
    [v6 setActions:v11];
  }
}

- (FRApplication)init
{
  v10.receiver = self;
  v10.super_class = (Class)FRApplication;
  v2 = [(FRApplication *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->shouldChangeWindowFrameSize = 0;
    v4 = NewsCoreUserDefaults();
    v5 = [v4 objectForKey:@"news.ppt.extendedLaunchURL"];

    if (v5)
    {
      id v6 = +[NSURL URLWithString:v5];
      v7 = (UIOpenURLAction *)[objc_alloc((Class)UIOpenURLAction) initWithURL:v6];
      launchURLAction = v3->_launchURLAction;
      v3->_launchURLAction = v7;
    }
  }
  return v3;
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(FRApplication *)self launchURLAction];

  if (v14)
  {
    v15 = [(FRApplication *)self launchURLAction];
    v16 = +[NSSet setWithObject:v15];
    [v12 setActions:v16];
  }
  if (+[UIApplication instancesRespondToSelector:"workspace:didCreateScene:withTransitionContext:completion:"])
  {
    v17.receiver = self;
    v17.super_class = (Class)FRApplication;
    [(FRApplication *)&v17 workspace:v10 didCreateScene:v11 withTransitionContext:v12 completion:v13];
  }
}

- (id)_extendLaunchTest
{
  return @"ExtendedLaunch";
}

- (UIOpenURLAction)launchURLAction
{
  return self->_launchURLAction;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (void)sendEvent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FRApplication;
  [(FRApplication *)&v3 sendEvent:a3];
}

- (BOOL)shouldChangeWindowFrameSize
{
  return self->shouldChangeWindowFrameSize;
}

- (void)setShouldChangeWindowFrameSize:(BOOL)a3
{
  self->shouldChangeWindowFrameSize = a3;
}

- (void).cxx_destruct
{
}

@end