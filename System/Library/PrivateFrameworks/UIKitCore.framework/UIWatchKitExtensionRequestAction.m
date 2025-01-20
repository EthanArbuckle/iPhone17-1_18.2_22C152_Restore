@interface UIWatchKitExtensionRequestAction
- (NSDictionary)request;
- (UIWatchKitExtensionRequestAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UIWatchKitExtensionRequestAction)initWithRequest:(id)a3 withHandler:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
- (void)sendResponse:(id)a3;
@end

@implementation UIWatchKitExtensionRequestAction

- (UIWatchKitExtensionRequestAction)initWithRequest:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
    id v8 = a3;
    id v9 = objc_alloc_init(v7);
    [v9 setObject:v8 forSetting:1];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__UIWatchKitExtensionRequestAction_initWithRequest_withHandler___block_invoke;
    v12[3] = &unk_1E52EE548;
    id v13 = v6;
    v11.receiver = self;
    v11.super_class = (Class)UIWatchKitExtensionRequestAction;
    self = [(UIWatchKitExtensionRequestAction *)&v11 initWithInfo:v9 timeout:0 forResponseOnQueue:v12 withHandler:0.0];

    a3 = self;
  }

  return (UIWatchKitExtensionRequestAction *)a3;
}

uint64_t __64__UIWatchKitExtensionRequestAction_initWithRequest_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIWatchKitExtensionRequestAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return 0;
}

- (NSDictionary)request
{
  v2 = [(UIWatchKitExtensionRequestAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSDictionary *)v3;
}

- (int64_t)UIActionType
{
  return 14;
}

- (void)sendResponse:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIWatchKitExtensionRequestAction.m", 86, @"you sent back the wrong response class -> %@", v5 object file lineNumber description];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__95;
  v20 = __Block_byref_object_dispose__95;
  id v21 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F4E280]);
  uint64_t v7 = getpid();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke;
  v12[3] = &unk_1E52EF048;
  v14 = self;
  v15 = &v16;
  id v13 = v5;
  id v8 = v5;
  uint64_t v9 = [v6 initWithPID:v7 flags:1 reason:4 name:@"UIWatchKitExtensionRequestAction action reply" withHandler:v12];
  v10 = (void *)v17[5];
  v17[5] = v9;

  _Block_object_dispose(&v16, 8);
}

id __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke(void *a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_SFailedToAcqui.isa, "-[UIWatchKitExtensionRequestAction sendResponse:]_block_invoke");
  }
  uint64_t v3 = a1[4];
  v4 = (void *)a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke_2;
  v7[3] = &unk_1E52E7DF0;
  v7[4] = a1[6];
  v6.receiver = v4;
  v6.super_class = (Class)UIWatchKitExtensionRequestAction;
  return objc_msgSendSuper2(&v6, sel_sendResponse_withCompletion_, v3, v7);
}

uint64_t __49__UIWatchKitExtensionRequestAction_sendResponse___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"payload";
  }
  else {
    return 0;
  }
}

@end