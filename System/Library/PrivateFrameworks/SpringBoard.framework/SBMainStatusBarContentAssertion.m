@interface SBMainStatusBarContentAssertion
- (BOOL)animated;
- (BOOL)dateAndTimeVisible;
- (SBMainStatusBarContentAssertion)initWithIdentifier:(id)a3 forReason:(id)a4;
- (double)duration;
- (void)setAnimated:(BOOL)a3;
- (void)setDateAndTimeVisible:(BOOL)a3;
- (void)setDuration:(double)a3;
@end

@implementation SBMainStatusBarContentAssertion

- (SBMainStatusBarContentAssertion)initWithIdentifier:(id)a3 forReason:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBMainStatusBarContentAssertion;
  v4 = [(BSSimpleAssertion *)&v8 initWithIdentifier:a3 forReason:a4 invalidationBlock:&__block_literal_global_143];
  v5 = v4;
  if (v4)
  {
    v4->_dateAndTimeVisible = 1;
    v4->_animated = 1;
    v4->_duration = 0.3;
    v6 = +[SBMainStatusBarStateProvider sharedInstance];
    [v6 acquireContentAssertion:v5];
  }
  return v5;
}

void __64__SBMainStatusBarContentAssertion_initWithIdentifier_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = +[SBMainStatusBarStateProvider sharedInstance];
  [v4 relinquishContentAssertion:v5];
}

- (void)setDateAndTimeVisible:(BOOL)a3
{
  if (self->_dateAndTimeVisible != a3)
  {
    self->_dateAndTimeVisible = a3;
    id v4 = +[SBMainStatusBarStateProvider sharedInstance];
    [v4 didUpdateContentAssertion:self];
  }
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)dateAndTimeVisible
{
  return self->_dateAndTimeVisible;
}

@end