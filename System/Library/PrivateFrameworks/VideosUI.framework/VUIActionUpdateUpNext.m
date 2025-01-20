@interface VUIActionUpdateUpNext
- (BOOL)confirmationShouldWaitCompletion;
- (BOOL)isAccountRequired;
- (NSString)itemID;
- (NSString)state;
- (VUIActionUpdateUpNext)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setConfirmationShouldWaitCompletion:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation VUIActionUpdateUpNext

- (VUIActionUpdateUpNext)initWithContextData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionUpdateUpNext;
  v5 = [(VUIActionUpdateUpNext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"itemID");
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"state");
    state = v5->_state;
    v5->_state = (NSString *)v8;

    v5->_confirmationShouldWaitCompletion = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"confirmationShouldWaitCompletion", 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  p_state = (uint64_t *)&self->_state;
  uint64_t v7 = [(NSString *)self->_state isEqualToString:@"added"];
  p_itemID = (uint64_t *)&self->_itemID;
  if (self->_itemID && *p_state)
  {
    v9 = +[VUIUpNextRequestManager sharedInstance];
    [v9 sendRequestForCanonicalID:*p_itemID action:v7 confirmationShouldWaitCompletion:self->_confirmationShouldWaitCompletion];

    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[VUIActionUpdateUpNext performWithTargetResponder:completionHandler:](p_itemID, p_state, v10);
  }

  if (v5) {
LABEL_8:
  }
    v5[2](v5, 1);
LABEL_9:
  objc_super v11 = +[VUIAppReviewManager sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__VUIActionUpdateUpNext_performWithTargetResponder_completionHandler___block_invoke;
  v12[3] = &__block_descriptor_40_e8_v12__0B8l;
  v12[4] = v7;
  [v11 isFeatureEnabled:v12];
}

void __70__VUIActionUpdateUpNext_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2 && !*(void *)(a1 + 32))
  {
    id v2 = +[VUIAppReviewManager sharedInstance];
    [v2 processAddToUpNext];
  }
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (BOOL)confirmationShouldWaitCompletion
{
  return self->_confirmationShouldWaitCompletion;
}

- (void)setConfirmationShouldWaitCompletion:(BOOL)a3
{
  self->_confirmationShouldWaitCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionUpdateUpNext failed for itemID [%@] state [%@]", (uint8_t *)&v5, 0x16u);
}

@end