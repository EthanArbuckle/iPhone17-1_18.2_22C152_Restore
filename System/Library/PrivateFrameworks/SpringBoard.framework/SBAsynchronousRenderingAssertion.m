@interface SBAsynchronousRenderingAssertion
- (BOOL)wantsMinificationFilter;
- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3;
- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3 wantsMinificationFilter:(BOOL)a4;
- (void)setWantsMinificationFilter:(BOOL)a3;
@end

@implementation SBAsynchronousRenderingAssertion

- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3 wantsMinificationFilter:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBAsynchronousRenderingAssertion.m", 16, @"Invalid parameter not satisfying: %@", @"asynchronousRenderingReason != nil" object file lineNumber description];
  }
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v14.receiver = self;
  v14.super_class = (Class)SBAsynchronousRenderingAssertion;
  v10 = [(BSSimpleAssertion *)&v14 initWithIdentifier:v9 forReason:v7 queue:MEMORY[0x1E4F14428] invalidationBlock:&__block_literal_global_131];

  if (v10)
  {
    v10->_wantsMinificationFilter = a4;
    v11 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v11 _acquireAssertion:v10];
  }
  return v10;
}

void __75__SBAsynchronousRenderingAssertion_initWithReason_wantsMinificationFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v4 _reqlinquishAssertion:v5];
}

- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3
{
  return [(SBAsynchronousRenderingAssertion *)self initWithReason:a3 wantsMinificationFilter:0];
}

- (void)setWantsMinificationFilter:(BOOL)a3
{
  if (self->_wantsMinificationFilter != a3)
  {
    self->_wantsMinificationFilter = a3;
    id v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    [v4 _updateAssertion:self];
  }
}

- (BOOL)wantsMinificationFilter
{
  return self->_wantsMinificationFilter;
}

@end