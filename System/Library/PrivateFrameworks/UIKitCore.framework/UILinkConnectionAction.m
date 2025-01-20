@interface UILinkConnectionAction
- (LNConnectionAction)action;
- (UILinkConnectionAction)initWithAction:(id)a3 responseHandler:(id)a4;
- (UILinkConnectionAction)initWithAction:(id)a3 responseQueue:(id)a4 responseHandler:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UILinkConnectionAction

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"connection action";
  }
}

- (int64_t)UIActionType
{
  return 43;
}

- (LNConnectionAction)action
{
  v2 = [(UILinkConnectionAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (LNConnectionAction *)v3;
}

void __71__UILinkConnectionAction_initWithAction_responseQueue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v5 actionResponse];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (UILinkConnectionAction)initWithAction:(id)a3 responseQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  [v12 setObject:v11 forSetting:0];

  if (v9)
  {
    v13 = (void *)MEMORY[0x1E4F4F670];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__UILinkConnectionAction_initWithAction_responseQueue_responseHandler___block_invoke;
    v18[3] = &unk_1E52EE548;
    id v19 = v9;
    v14 = [v13 responderWithHandler:v18];
    v15 = v14;
    if (v8) {
      [v14 setQueue:v8];
    }
    objc_msgSend(v15, "setTimeout:", dispatch_time(0, 60000000000));

    v16 = [(UILinkConnectionAction *)self initWithInfo:v12 responder:v15];
  }
  else
  {
    v16 = [(UILinkConnectionAction *)self initWithInfo:v12 responder:0];
  }

  return v16;
}

- (UILinkConnectionAction)initWithAction:(id)a3 responseHandler:(id)a4
{
  return [(UILinkConnectionAction *)self initWithAction:a3 responseQueue:0 responseHandler:a4];
}

@end