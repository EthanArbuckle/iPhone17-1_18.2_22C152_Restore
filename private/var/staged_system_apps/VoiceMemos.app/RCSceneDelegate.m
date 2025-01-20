@interface RCSceneDelegate
- (BOOL)isInAndromeda;
- (BOOL)isInForeground;
- (UIWindow)window;
- (id)recorderAppDelegate;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
@end

@implementation RCSceneDelegate

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v14 = a3;
  id v8 = a6;
  if ([v8 isInAndromeda])
  {
    unsigned int v9 = 0;
  }
  else
  {
    v10 = [v14 traitCollection];
    unsigned int v9 = [v10 isInAndromeda];
  }
  if ([v8 isInAndromeda])
  {
    v11 = [v14 traitCollection];
    unsigned int v12 = [v11 isInAndromeda] ^ 1;
  }
  else
  {
    unsigned int v12 = 0;
  }
  if ((v9 | v12) == 1)
  {
    v13 = [(RCSceneDelegate *)self recorderAppDelegate];
    [v13 reconcileApplicationState];
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isInForeground
{
  v2 = [(RCSceneDelegate *)self window];
  v3 = [v2 windowScene];
  BOOL v4 = [v3 activationState] == 0;

  return v4;
}

- (BOOL)isInAndromeda
{
  v2 = [(RCSceneDelegate *)self window];
  v3 = [v2 windowScene];
  BOOL v4 = [v3 traitCollection];
  unsigned __int8 v5 = [v4 isInAndromeda];

  return v5;
}

- (id)recorderAppDelegate
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned __int8 v5 = +[UIApplication sharedApplication];
    v6 = [v5 delegate];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end