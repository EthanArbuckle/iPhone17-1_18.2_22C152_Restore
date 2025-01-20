@interface WFControlFlowAttributionTracker
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)attributionSetsInScope;
- (WFControlFlowAttributionTracker)init;
- (WFControlFlowAttributionTracker)initWithAttributionSetsInScope:(id)a3;
- (WFControlFlowAttributionTracker)initWithCoder:(id)a3;
- (id)attributionSetForCurrentScope;
- (id)contentCollectionByTaintingContentCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enteredScopeOfControlFlowAction:(id)a3 withInput:(id)a4;
- (void)leftScopeOfControlFlowAction:(id)a3;
@end

@implementation WFControlFlowAttributionTracker

- (void).cxx_destruct
{
}

- (NSMutableDictionary)attributionSetsInScope
{
  return self->_attributionSetsInScope;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFControlFlowAttributionTracker *)self attributionSetsInScope];
  [v4 encodeObject:v5 forKey:@"attributionSetsInScope"];
}

- (WFControlFlowAttributionTracker)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"attributionSetsInScope"];

  v10 = [(WFControlFlowAttributionTracker *)self initWithAttributionSetsInScope:v9];
  return v10;
}

- (id)attributionSetForCurrentScope
{
  v2 = (void *)MEMORY[0x1E4F5A828];
  v3 = [(WFControlFlowAttributionTracker *)self attributionSetsInScope];
  id v4 = [v3 allValues];
  id v5 = [v2 attributionSetByMergingAttributionSets:v4];

  return v5;
}

- (id)contentCollectionByTaintingContentCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(WFControlFlowAttributionTracker *)self attributionSetsInScope];
  uint64_t v6 = [v5 allValues];

  if ([v6 count])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
    v8 = [v4 attributionSet];
    [v7 addObject:v8];

    v9 = [MEMORY[0x1E4F5A828] attributionSetByMergingAttributionSets:v7];
    id v10 = [v4 collectionByMergingAttributionSet:v9];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (void)leftScopeOfControlFlowAction:(id)a3
{
  id v4 = a3;
  id v6 = [(WFControlFlowAttributionTracker *)self attributionSetsInScope];
  id v5 = [v4 groupingIdentifier];

  [v6 removeObjectForKey:v5];
}

- (void)enteredScopeOfControlFlowAction:(id)a3 withInput:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 attributionSet];
  uint64_t v8 = [v7 derivedDisclosureLevel];

  if (v8 == 1)
  {
    v9 = [(WFControlFlowAttributionTracker *)self attributionSetsInScope];
    id v10 = [v6 attributionSet];
    v11 = [v12 groupingIdentifier];
    [v9 setObject:v10 forKey:v11];
  }
}

- (WFControlFlowAttributionTracker)initWithAttributionSetsInScope:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFControlFlowAttributionTracker;
  id v6 = [(WFControlFlowAttributionTracker *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionSetsInScope, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

- (WFControlFlowAttributionTracker)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(WFControlFlowAttributionTracker *)self initWithAttributionSetsInScope:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end