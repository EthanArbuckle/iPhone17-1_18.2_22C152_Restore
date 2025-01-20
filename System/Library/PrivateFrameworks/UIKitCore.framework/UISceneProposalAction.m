@interface UISceneProposalAction
- (BSAction)action;
- (NSString)persistentIdentifier;
- (UISceneProposalAction)initWithPersistentIdentifier:(id)a3 action:(id)a4 queue:(id)a5 completion:(id)a6;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISceneProposalAction

- (UISceneProposalAction)initWithPersistentIdentifier:(id)a3 action:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UISceneProposalAction.m", 68, @"Invalid parameter not satisfying: %@", @"persistentIdentifier" object file lineNumber description];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v16 = (void *)[v11 copy];
  [v15 setObject:v16 forSetting:10];

  unint64_t v17 = [v12 UIActionType];
  v18 = [NSNumber numberWithInteger:v17];
  [v15 setObject:v18 forSetting:11];

  if (v17 <= 0x1A && ((1 << v17) & 0x4020042) != 0)
  {
    v19 = [v12 info];
    [v15 applySettings:v19];
  }
  v23.receiver = self;
  v23.super_class = (Class)UISceneProposalAction;
  v20 = [(UISceneProposalAction *)&v23 initWithInfo:v15 timeout:v13 forResponseOnQueue:v14 withHandler:5.0];

  return v20;
}

- (NSString)persistentIdentifier
{
  v2 = [(UISceneProposalAction *)self info];
  id v3 = [v2 objectForSetting:10];

  return (NSString *)v3;
}

- (BSAction)action
{
  id v3 = [(UISceneProposalAction *)self info];
  v4 = [v3 objectForSetting:11];
  uint64_t v5 = [v4 integerValue];

  v6 = 0;
  if (v5 > 16)
  {
    if (v5 == 17)
    {
      id v13 = [UIHandleApplicationShortcutAction alloc];
      v9 = [(UISceneProposalAction *)self info];
      v10 = [v9 objectForSetting:1];
      uint64_t v11 = [(UISHandleApplicationShortcutAction *)v13 initWithSBSShortcutItem:v10];
    }
    else
    {
      if (v5 != 26) {
        goto LABEL_13;
      }
      v8 = [UINotificationResponseAction alloc];
      v9 = [(UISceneProposalAction *)self info];
      v10 = [v9 objectForSetting:1];
      uint64_t v11 = [(UISNotificationResponseAction *)v8 initWithResponse:v10 withHandler:0];
    }
    v6 = (void *)v11;
  }
  else
  {
    if (v5 == 1)
    {
      v7 = UIOpenURLAction;
    }
    else
    {
      if (v5 != 6) {
        goto LABEL_13;
      }
      v7 = UIActivityContinuationAction;
    }
    id v12 = [v7 alloc];
    v9 = [(UISceneProposalAction *)self info];
    v6 = (void *)[v12 initWithInfo:v9 timeout:0 forResponseOnQueue:0 withHandler:0.0];
  }

LABEL_13:
  return (BSAction *)v6;
}

- (int64_t)UIActionType
{
  return 34;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  id v3 = @"actionValues";
  if (a3 == 11) {
    id v3 = @"actionType";
  }
  if (a3 == 10) {
    return @"sceneID";
  }
  else {
    return v3;
  }
}

@end