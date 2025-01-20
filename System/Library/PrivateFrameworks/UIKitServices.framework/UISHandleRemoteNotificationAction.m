@interface UISHandleRemoteNotificationAction
- (UISHandleRemoteNotificationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 withHandler:(id)a6;
- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 withHandler:(id)a5;
- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 withHandler:(id)a4;
- (id)_initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 type:(unint64_t)a6 withHandler:(id)a7;
- (id)action;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)payload;
- (id)userResponse;
- (unint64_t)UIActionType;
- (void)sendResponse:(id)a3;
@end

@implementation UISHandleRemoteNotificationAction

- (id)_initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 type:(unint64_t)a6 withHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UISHandleRemoteNotificationAction.m", 20, @"Invalid parameter not satisfying: %@", @"payload" object file lineNumber description];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F62860]);
  [v17 setObject:v13 forSetting:1];
  [v17 setObject:v14 forSetting:2];
  [v17 setObject:v15 forSetting:4];
  v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a6];
  [v17 setObject:v18 forSetting:3];

  if (v16)
  {
    v19 = [MEMORY[0x1E4F627D0] responderWithHandler:v16];
  }
  else
  {
    v19 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)UISHandleRemoteNotificationAction;
  v20 = [(UISHandleRemoteNotificationAction *)&v23 initWithInfo:v17 responder:v19];

  return v20;
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 withHandler:(id)a4
{
  return (UISHandleRemoteNotificationAction *)[(UISHandleRemoteNotificationAction *)self _initWithRemoteNotificationPayload:a3 action:0 userResponse:0 type:3 withHandler:a4];
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 withHandler:(id)a5
{
  return (UISHandleRemoteNotificationAction *)[(UISHandleRemoteNotificationAction *)self _initWithRemoteNotificationPayload:a3 action:a4 userResponse:0 type:4 withHandler:a5];
}

- (UISHandleRemoteNotificationAction)initWithRemoteNotificationPayload:(id)a3 action:(id)a4 userResponse:(id)a5 withHandler:(id)a6
{
  return (UISHandleRemoteNotificationAction *)[(UISHandleRemoteNotificationAction *)self _initWithRemoteNotificationPayload:a3 action:a4 userResponse:a5 type:4 withHandler:a6];
}

- (UISHandleRemoteNotificationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return (UISHandleRemoteNotificationAction *)-[UISHandleRemoteNotificationAction _initWithRemoteNotificationPayload:action:userResponse:type:withHandler:](self, "_initWithRemoteNotificationPayload:action:userResponse:type:withHandler:", 0, 0, 0, 3, 0, a4);
}

- (id)payload
{
  v2 = [(UISHandleRemoteNotificationAction *)self info];
  v3 = [v2 objectForSetting:1];

  return v3;
}

- (id)action
{
  if ([(UISHandleRemoteNotificationAction *)self UIActionType] != 4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISHandleRemoteNotificationAction.m" lineNumber:53 description:@"You're trying to get the action but this is just a simple remote notification"];
  }
  v4 = [(UISHandleRemoteNotificationAction *)self info];
  v5 = [v4 objectForSetting:2];

  return v5;
}

- (id)userResponse
{
  v2 = [(UISHandleRemoteNotificationAction *)self info];
  v3 = [v2 objectForSetting:4];

  return v3;
}

- (unint64_t)UIActionType
{
  v2 = [(UISHandleRemoteNotificationAction *)self info];
  v3 = [v2 objectForSetting:3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (void)sendResponse:(id)a3
{
  id v5 = a3;
  if ([(UISHandleRemoteNotificationAction *)self UIActionType] == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"UISHandleRemoteNotificationAction.m", 68, @"You sent back the wrong response class -> %@", v5 object file lineNumber description];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UISHandleRemoteNotificationAction;
  [(UISHandleRemoteNotificationAction *)&v7 sendResponse:v5];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_1E5735198[a3 - 1];
  }
}

@end