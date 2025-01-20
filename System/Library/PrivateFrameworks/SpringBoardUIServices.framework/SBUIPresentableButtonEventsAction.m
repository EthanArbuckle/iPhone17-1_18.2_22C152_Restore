@interface SBUIPresentableButtonEventsAction
- (BOOL)_expectsResponse;
- (NSString)reason;
- (SBUIPresentableButtonEventsAction)initWithButtonEvent:(int64_t)a3 reason:(id)a4 handler:(id)a5;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 debug:(BOOL)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)presentableButtonEvent;
- (void)handleButtonEvent;
- (void)invalidate;
@end

@implementation SBUIPresentableButtonEventsAction

- (SBUIPresentableButtonEventsAction)initWithButtonEvent:(int64_t)a3 reason:(id)a4 handler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (a3 == 1)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBUIPresentableButtonEventsAction.m", 49, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBUIPresentableButtonEventsAction.m", 48, @"Invalid button evemt: %ld'", a3);

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBUIPresentableButtonEventsAction.m", 50, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_4:
  v11 = (NSString *)[v9 copy];
  reason = self->_reason;
  self->_reason = v11;

  v13 = SBLogBanners();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1A7607000, v13, OS_LOG_TYPE_DEFAULT, "Acquired button events assertion: %{public}@", buf, 0xCu);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v15 = [NSNumber numberWithInteger:a3];
  [v14 setObject:v15 forSetting:1];

  v16 = (void *)MEMORY[0x1E4F4F670];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __72__SBUIPresentableButtonEventsAction_initWithButtonEvent_reason_handler___block_invoke;
  v25[3] = &unk_1E5CCCED8;
  id v26 = v10;
  id v17 = v10;
  v18 = [v16 responderWithHandler:v25];
  v24.receiver = self;
  v24.super_class = (Class)SBUIPresentableButtonEventsAction;
  v19 = [(SBUIPresentableButtonEventsAction *)&v24 initWithInfo:v14 responder:v18];

  return v19;
}

void __72__SBUIPresentableButtonEventsAction_initWithButtonEvent_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 info];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLForSetting:2]);
}

- (void)handleButtonEvent
{
  if ([(SBUIPresentableButtonEventsAction *)self isValid]
    && [(SBUIPresentableButtonEventsAction *)self canSendResponse])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v4 setFlag:1 forSetting:2];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:v4 error:0];
    [(SBUIPresentableButtonEventsAction *)self sendResponse:v3];
  }
}

- (BOOL)_expectsResponse
{
  return 1;
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 debug:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBUIPresentableButtonEventsAction;
  v5 = [(SBUIPresentableButtonEventsAction *)&v10 _descriptionBuilderWithMultilinePrefix:a3 debug:a4];
  int64_t v6 = [(SBUIPresentableButtonEventsAction *)self presentableButtonEvent];
  v7 = @"[INVALID]";
  if (v6 == 1) {
    v7 = @"homeButtonPress";
  }
  if (v6) {
    v8 = v7;
  }
  else {
    v8 = @"noEvent";
  }
  [v5 appendString:v8 withName:@"presentableButtonEvent"];
  [v5 appendString:self->_reason withName:@"reason"];
  return v5;
}

- (int64_t)presentableButtonEvent
{
  uint64_t v2 = [(SBUIPresentableButtonEventsAction *)self info];
  id v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBUIPresentableButtonEventsAction *)self isValid];
  v5.receiver = self;
  v5.super_class = (Class)SBUIPresentableButtonEventsAction;
  [(SBUIPresentableButtonEventsAction *)&v5 invalidate];
  if (v3)
  {
    int64_t v4 = SBLogBanners();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated button events assertion: %{public}@", buf, 0xCu);
    }
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  int v3 = @"success";
  if (a3 != 2) {
    int v3 = 0;
  }
  if (a3 == 1) {
    return @"buttonEvent";
  }
  else {
    return v3;
  }
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end