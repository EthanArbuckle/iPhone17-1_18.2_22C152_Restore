@interface PXSharedLibraryRule
+ (id)customizedRuleWithStartDate:(id)a3 personUUIDs:(id)a4;
+ (id)everythingRule;
+ (id)manualRule;
+ (id)manualRuleWithAssetLocalIdentifiers:(id)a3;
- (NSArray)assetLocalIdentifiers;
- (NSArray)personUUIDs;
- (NSDate)startDate;
- (PXSharedLibraryRule)init;
- (id)_initWithAutoSharePolicy:(int64_t)a3 startDate:(id)a4 personUUIDs:(id)a5 assetLocalIdentifiers:(id)a6;
- (id)description;
- (int64_t)autoSharePolicy;
@end

@implementation PXSharedLibraryRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = PXSharedLibraryAutoSharePolicyDescription(self->_autoSharePolicy);
  startDate = self->_startDate;
  v7 = [(NSArray *)self->_personUUIDs componentsJoinedByString:@", "];
  v8 = [v3 stringWithFormat:@"<%@:%p, policy:%@, startDate:%@, personUUIDs:(%@)>", v4, self, v5, startDate, v7];

  return v8;
}

- (id)_initWithAutoSharePolicy:(int64_t)a3 startDate:(id)a4 personUUIDs:(id)a5 assetLocalIdentifiers:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXSharedLibraryRule.m", 22, @"Invalid parameter not satisfying: %@", @"personUUIDs" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)PXSharedLibraryRule;
  v14 = [(PXSharedLibraryRule *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_autoSharePolicy = a3;
    uint64_t v16 = [v11 copy];
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    uint64_t v18 = [v12 copy];
    personUUIDs = v15->_personUUIDs;
    v15->_personUUIDs = (NSArray *)v18;

    uint64_t v20 = [v13 copy];
    assetLocalIdentifiers = v15->_assetLocalIdentifiers;
    v15->_assetLocalIdentifiers = (NSArray *)v20;
  }
  return v15;
}

- (PXSharedLibraryRule)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryRule.m", 18, @"%s is not available as initializer", "-[PXSharedLibraryRule init]");

  abort();
}

+ (id)customizedRuleWithStartDate:(id)a3 personUUIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithAutoSharePolicy:2 startDate:v7 personUUIDs:v6 assetLocalIdentifiers:0];

  return v8;
}

+ (id)everythingRule
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 _initWithAutoSharePolicy:1 startDate:0 personUUIDs:MEMORY[0x1E4F1CBF0] assetLocalIdentifiers:0];
  return v3;
}

+ (id)manualRuleWithAssetLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (void *)[v5 _initWithAutoSharePolicy:0 startDate:0 personUUIDs:MEMORY[0x1E4F1CBF0] assetLocalIdentifiers:v4];

  return v6;
}

+ (id)manualRule
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 _initWithAutoSharePolicy:0 startDate:0 personUUIDs:MEMORY[0x1E4F1CBF0] assetLocalIdentifiers:0];
  return v3;
}

@end