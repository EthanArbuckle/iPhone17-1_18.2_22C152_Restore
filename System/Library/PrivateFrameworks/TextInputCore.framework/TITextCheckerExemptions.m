@interface TITextCheckerExemptions
- (BOOL)assertsObservers;
- (BOOL)stringIsExemptFromChecker:(id)a3;
- (void)dealloc;
- (void)setAssertsObservers:(BOOL)a3;
@end

@implementation TITextCheckerExemptions

- (BOOL)stringIsExemptFromChecker:(id)a3
{
  id v3 = a3;
  v4 = +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl];
  char v5 = [v4 stringIsExemptFromChecker:v3];

  return v5;
}

- (void)setAssertsObservers:(BOOL)a3
{
  if (self->_assertsObservers != a3)
  {
    BOOL v3 = a3;
    self->_assertsObservers = a3;
    v4 = +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl];
    id v5 = v4;
    if (v3) {
      [v4 addObserverAssertion];
    }
    else {
      [v4 removeObserverAssertion];
    }
  }
}

- (BOOL)assertsObservers
{
  return self->_assertsObservers;
}

- (void)dealloc
{
  if (self->_assertsObservers)
  {
    BOOL v3 = +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl];
    [v3 removeObserverAssertion];
  }
  v4.receiver = self;
  v4.super_class = (Class)TITextCheckerExemptions;
  [(TITextCheckerExemptions *)&v4 dealloc];
}

@end