@interface _UIProductivityGestureAction
- (BKSHIDEventAuthenticationMessage)authenticationMessage;
- (_UIProductivityGestureAction)initWithGestureDirection:(int64_t)a3 authenticationMessage:(id)a4;
- (int64_t)UIActionType;
- (int64_t)gestureDirection;
- (void)_handleActionForWindowScene:(id)a3;
@end

@implementation _UIProductivityGestureAction

- (int64_t)UIActionType
{
  return 46;
}

- (_UIProductivityGestureAction)initWithGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  if (v6) {
    [v7 setObject:v6 forSetting:2];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIProductivityGestureAction;
  v9 = [(_UIProductivityGestureAction *)&v11 initWithInfo:v7 responder:0];

  return v9;
}

- (int64_t)gestureDirection
{
  v2 = [(_UIProductivityGestureAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  v2 = [(_UIProductivityGestureAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (BKSHIDEventAuthenticationMessage *)v3;
}

- (void)_handleActionForWindowScene:(id)a3
{
  v13 = (id *)a3;
  int64_t v4 = -[UIWindowScene _keyWindow](v13);
  v5 = [v4 firstResponder];

  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 updateIdleDetection:5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = [(_UIProductivityGestureAction *)self gestureDirection];
    v8 = [(_UIProductivityGestureAction *)self authenticationMessage];
    objc_msgSend(v5, "__didReceiveGestureDirection:authenticationMessage:", v7, v8);
  }
  else
  {
    v8 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v13];
    v9 = [v8 editingOverlayViewController];
    v10 = [v9 undoInteraction];
    int64_t v11 = [(_UIProductivityGestureAction *)self gestureDirection];
    v12 = [(_UIProductivityGestureAction *)self authenticationMessage];
    [v10 performGestureWithDirection:v11 authenticationMessage:v12];
  }
}

@end