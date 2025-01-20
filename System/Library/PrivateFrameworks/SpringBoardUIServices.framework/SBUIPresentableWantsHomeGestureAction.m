@interface SBUIPresentableWantsHomeGestureAction
- (BOOL)wantsHomeGesture;
- (SBUIPresentableWantsHomeGestureAction)initWithWantsHomeGesture:(BOOL)a3 handler:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)setSuccessful:(BOOL)a3;
@end

@implementation SBUIPresentableWantsHomeGestureAction

- (SBUIPresentableWantsHomeGestureAction)initWithWantsHomeGesture:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIPresentableWantsHomeGestureAction.m", 21, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v8 setFlag:v4 forSetting:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__SBUIPresentableWantsHomeGestureAction_initWithWantsHomeGesture_handler___block_invoke;
  v14[3] = &unk_1E5CCCED8;
  id v15 = v7;
  v13.receiver = self;
  v13.super_class = (Class)SBUIPresentableWantsHomeGestureAction;
  id v9 = v7;
  v10 = [(SBUIPresentableWantsHomeGestureAction *)&v13 initWithInfo:v8 timeout:0 forResponseOnQueue:v14 withHandler:0.0];

  return v10;
}

void __74__SBUIPresentableWantsHomeGestureAction_initWithWantsHomeGesture_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 info];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLForSetting:2]);
}

- (BOOL)wantsHomeGesture
{
  uint64_t v2 = [(SBUIPresentableWantsHomeGestureAction *)self info];
  char v3 = [v2 BOOLForSetting:1];

  return v3;
}

- (void)setSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUIPresentableWantsHomeGestureAction *)self isValid]
    && [(SBUIPresentableWantsHomeGestureAction *)self canSendResponse])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v6 setFlag:v3 forSetting:2];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:v6 error:0];
    [(SBUIPresentableWantsHomeGestureAction *)self sendResponse:v5];
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  BOOL v3 = @"success";
  if (a3 != 2) {
    BOOL v3 = 0;
  }
  if (a3 == 1) {
    return @"wantsHomeGesture";
  }
  else {
    return v3;
  }
}

@end