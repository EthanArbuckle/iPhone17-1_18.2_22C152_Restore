@interface SBUIPresentableHomeAffordanceThresholdAction
- (SBUIPresentableHomeAffordanceThresholdAction)initWithHandler:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)setSuccessful:(BOOL)a3;
@end

@implementation SBUIPresentableHomeAffordanceThresholdAction

- (SBUIPresentableHomeAffordanceThresholdAction)initWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBUIPresentableHomeAffordanceThresholdAction.m", 22, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SBUIPresentableHomeAffordanceThresholdAction_initWithHandler___block_invoke;
  v11[3] = &unk_1E5CCCED8;
  id v12 = v5;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPresentableHomeAffordanceThresholdAction;
  id v6 = v5;
  v7 = [(SBUIPresentableHomeAffordanceThresholdAction *)&v10 initWithInfo:0 timeout:0 forResponseOnQueue:v11 withHandler:0.0];

  return v7;
}

void __64__SBUIPresentableHomeAffordanceThresholdAction_initWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 info];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLForSetting:1]);
}

- (void)setSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUIPresentableHomeAffordanceThresholdAction *)self isValid]
    && [(SBUIPresentableHomeAffordanceThresholdAction *)self canSendResponse])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v6 setFlag:v3 forSetting:1];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:v6 error:0];
    [(SBUIPresentableHomeAffordanceThresholdAction *)self sendResponse:v5];
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"success";
  }
  else {
    return 0;
  }
}

@end