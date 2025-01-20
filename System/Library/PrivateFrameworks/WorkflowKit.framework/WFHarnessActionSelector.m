@interface WFHarnessActionSelector
+ (WFHarnessActionSelector)matchAll;
- (BOOL)matchesContext:(id)a3;
- (NSPredicate)predicate;
- (WFHarnessActionSelector)initWithPredicate:(id)a3;
@end

@implementation WFHarnessActionSelector

- (void).cxx_destruct
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)matchesContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFHarnessActionSelector.m", 49, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v6 = [(WFHarnessActionSelector *)self predicate];
  [v6 allowEvaluation];

  v7 = [(WFHarnessActionSelector *)self predicate];
  LOBYTE(v6) = [v7 evaluateWithObject:v5];

  return (char)v6;
}

- (WFHarnessActionSelector)initWithPredicate:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFHarnessActionSelector.m", 32, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessActionSelector;
  v7 = [(WFHarnessActionSelector *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_predicate, a3);
    v9 = v8;
  }

  return v8;
}

+ (WFHarnessActionSelector)matchAll
{
  v2 = [WFHarnessActionSelector alloc];
  v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v4 = [(WFHarnessActionSelector *)v2 initWithPredicate:v3];

  return v4;
}

@end