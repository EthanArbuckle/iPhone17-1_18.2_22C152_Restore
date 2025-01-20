@interface _UISceneUnassociatedContext
- (UIScene)scene;
- (UISceneSession)session;
- (void)setScene:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation _UISceneUnassociatedContext

- (UIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (UISceneSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end