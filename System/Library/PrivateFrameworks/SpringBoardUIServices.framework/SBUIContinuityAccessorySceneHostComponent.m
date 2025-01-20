@interface SBUIContinuityAccessorySceneHostComponent
- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4;
- (void)setScene:(id)a3;
@end

@implementation SBUIContinuityAccessorySceneHostComponent

- (void)setScene:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBUIContinuityAccessorySceneHostComponent;
  [(FBSSceneComponent *)&v8 setScene:a3];
  v4 = +[SBUIContinuityAccessorySceneManager sharedInstance];
  v5 = [(FBSSceneComponent *)self hostScene];
  v6 = [v4 registerAccessoryScene:v5];
  sceneRegistration = self->_sceneRegistration;
  self->_sceneRegistration = v6;
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  [(BSInvalidatable *)self->_sceneRegistration invalidate];
  sceneRegistration = self->_sceneRegistration;
  self->_sceneRegistration = 0;
}

- (void).cxx_destruct
{
}

@end