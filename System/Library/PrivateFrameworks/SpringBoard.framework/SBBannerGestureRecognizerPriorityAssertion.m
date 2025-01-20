@interface SBBannerGestureRecognizerPriorityAssertion
+ (BOOL)isValidBannerGestureRecognizerPriority:(int64_t)a3;
- (BOOL)isEnabled;
- (NSString)description;
- (NSString)reason;
- (SBBannerGestureRecognizerPriorityAssertion)initWithPriority:(int64_t)a3 reason:(id)a4 enablementChangeHandler:(id)a5 invalidationHandler:(id)a6;
- (int64_t)priority;
- (void)dealloc;
- (void)invalidate;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SBBannerGestureRecognizerPriorityAssertion

- (void)dealloc
{
  [(SBBannerGestureRecognizerPriorityAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBBannerGestureRecognizerPriorityAssertion;
  [(SBBannerGestureRecognizerPriorityAssertion *)&v3 dealloc];
}

+ (BOOL)isValidBannerGestureRecognizerPriority:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    (*((void (**)(void))self->_enablementChangeHandler + 2))();
  }
}

- (void)invalidate
{
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v5 = (void (**)(id, SBBannerGestureRecognizerPriorityAssertion *))[invalidationHandler copy];
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    v5[2](v5, self);
  }
}

- (SBBannerGestureRecognizerPriorityAssertion)initWithPriority:(int64_t)a3 reason:(id)a4 enablementChangeHandler:(id)a5 invalidationHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)objc_opt_class() isValidBannerGestureRecognizerPriority:a3])
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBBannerGestureRecognizerPriorityAssertion.m", 46, @"Invalid parameter not satisfying: %@", @"[[self class] isValidBannerGestureRecognizerPriority:priority]" object file lineNumber description];

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_10:
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SBBannerGestureRecognizerPriorityAssertion.m", 48, @"Invalid parameter not satisfying: %@", @"enablementChangeHandler" object file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBBannerGestureRecognizerPriorityAssertion.m", 47, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_11:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBBannerGestureRecognizerPriorityAssertion.m", 49, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)SBBannerGestureRecognizerPriorityAssertion;
  v14 = [(SBBannerGestureRecognizerPriorityAssertion *)&v27 init];
  v15 = v14;
  if (v14)
  {
    v14->_enabled = 1;
    v14->_priority = a3;
    uint64_t v16 = [v11 copy];
    reason = v15->_reason;
    v15->_reason = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    id enablementChangeHandler = v15->_enablementChangeHandler;
    v15->_id enablementChangeHandler = (id)v18;

    uint64_t v20 = [v13 copy];
    id invalidationHandler = v15->_invalidationHandler;
    v15->_id invalidationHandler = (id)v20;
  }
  return v15;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t priority = self->_priority;
  reason = self->_reason;
  v7 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; priority: %ld; reason: %@; isEnabled: %@>",
    v4,
    self,
    priority,
    reason,
  v8 = v7);

  return (NSString *)v8;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_enablementChangeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end