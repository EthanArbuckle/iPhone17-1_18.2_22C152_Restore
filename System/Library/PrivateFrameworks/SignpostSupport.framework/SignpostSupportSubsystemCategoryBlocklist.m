@interface SignpostSupportSubsystemCategoryBlocklist
- (BOOL)_wantsNotSubsystem;
- (BOOL)passesSubsystem:(id)a3 category:(id)a4;
- (unint64_t)_compoundPredicateType;
- (void)_forceInclusionOfSubsystem:(id)a3 category:(id)a4;
@end

@implementation SignpostSupportSubsystemCategoryBlocklist

- (BOOL)_wantsNotSubsystem
{
  return 1;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (BOOL)passesSubsystem:(id)a3 category:(id)a4
{
  return ![(SignpostSupportSubsystemCategoryFilter *)self matchesSubsystem:a3 category:a4];
}

- (void)_forceInclusionOfSubsystem:(id)a3 category:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
  v8 = [v7 objectForKeyedSubscript:v11];

  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {
    v10 = [(SignpostSupportSubsystemCategoryFilter *)self subsystemsDict];
    [v10 removeObjectForKey:v11];
  }
  else
  {
    [v8 removeObject:v6];
  }
}

@end