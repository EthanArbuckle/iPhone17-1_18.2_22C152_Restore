@interface SBUIBackgroundActivityAction
- (NSString)backgroundActivityIdentifier;
- (SBUIBackgroundActivityAction)initWithBackgroundActivityIdentifier:(id)a3 handler:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)setProceed:(BOOL)a3;
@end

@implementation SBUIBackgroundActivityAction

- (SBUIBackgroundActivityAction)initWithBackgroundActivityIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBUIBackgroundActivityAction.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBUIBackgroundActivityAction.m", 21, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v10 setObject:v7 forSetting:2];
  v11 = (void *)MEMORY[0x1E4F4F670];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__SBUIBackgroundActivityAction_initWithBackgroundActivityIdentifier_handler___block_invoke;
  v19[3] = &unk_1E5CCCED8;
  id v20 = v9;
  id v12 = v9;
  v13 = [v11 responderWithHandler:v19];
  v18.receiver = self;
  v18.super_class = (Class)SBUIBackgroundActivityAction;
  v14 = [(SBUIBackgroundActivityAction *)&v18 initWithInfo:v10 responder:v13];

  return v14;
}

void __77__SBUIBackgroundActivityAction_initWithBackgroundActivityIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 error];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  else
  {
    v5 = [v6 info];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v5 BOOLForSetting:1]);
  }
}

- (void)setProceed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUIBackgroundActivityAction *)self isValid]
    && [(SBUIBackgroundActivityAction *)self canSendResponse])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v6 setFlag:v3 forSetting:1];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:v6 error:0];
    [(SBUIBackgroundActivityAction *)self sendResponse:v5];
  }
}

- (NSString)backgroundActivityIdentifier
{
  v2 = [(SBUIBackgroundActivityAction *)self info];
  BOOL v3 = [v2 objectForSetting:2];

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  BOOL v3 = @"backgroundActivityIdentifier";
  if (a3 != 2) {
    BOOL v3 = 0;
  }
  if (a3 == 1) {
    return @"proceed";
  }
  else {
    return v3;
  }
}

@end