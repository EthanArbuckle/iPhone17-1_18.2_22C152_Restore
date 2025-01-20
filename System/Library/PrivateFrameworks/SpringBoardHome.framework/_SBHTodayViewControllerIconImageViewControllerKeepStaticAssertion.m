@interface _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion
- (BOOL)isInvalidated;
- (NSString)reason;
- (SBHTodayViewController)todayViewController;
- (_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion)initWithTodayViewController:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion

- (_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion)initWithTodayViewController:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion;
  v8 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_todayViewController, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  if (![(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      NSLog(&cfstr_AssertionRelea.isa);
    }
  }
  [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion;
  [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self isInvalidated])
  {
    [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self setInvalidated:1];
    id v3 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self todayViewController];
    [v3 _removeIconImageViewControllerKeepStaticAssertion:self];
  }
}

- (id)succinctDescription
{
  v2 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self succinctDescriptionBuilder];
  objc_super v5 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self todayViewController];
  id v6 = (id)[v4 appendPointer:v5 withName:@"todayViewController"];

  id v7 = [(_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  id v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion isInvalidated](self, "isInvalidated"), @"isInvalidated", 1);
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBHTodayViewController)todayViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_todayViewController);
  return (SBHTodayViewController *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_todayViewController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end