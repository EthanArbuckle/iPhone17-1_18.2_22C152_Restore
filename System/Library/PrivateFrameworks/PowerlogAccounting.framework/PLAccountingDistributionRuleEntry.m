@interface PLAccountingDistributionRuleEntry
+ (id)entryKey;
+ (void)load;
- (BOOL)isEqual:(id)a3;
- (NSNumber)distributionID;
- (NSNumber)nodeID;
- (NSNumber)rootNodeID;
- (PLAccountingDistributionRuleEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withDistributionID:(id)a5 withEntryDate:(id)a6;
- (id)description;
- (unint64_t)hash;
@end

@implementation PLAccountingDistributionRuleEntry

- (NSNumber)distributionID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F768]];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionRuleEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_10 != -1) {
    dispatch_once(&entryKey_onceToken_10, &__block_literal_global_12);
  }
  objc_super v2 = (void *)entryKey_entryKey_10;
  return v2;
}

uint64_t __45__PLAccountingDistributionRuleEntry_entryKey__block_invoke()
{
  entryKey_entryKey_10 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8B0] andName:*MEMORY[0x263F5F760]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingDistributionRuleEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withDistributionID:(id)a5 withEntryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((int)[v10 intValue] < 1
    || (int)[v11 intValue] < 1
    || (int)[v12 intValue] < 1)
  {
    v16 = 0;
  }
  else
  {
    v14 = [(id)objc_opt_class() entryKey];
    if (v13)
    {
      v20.receiver = self;
      v20.super_class = (Class)PLAccountingDistributionRuleEntry;
      v15 = [(PLEntry *)&v20 initWithEntryKey:v14 withDate:v13];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PLAccountingDistributionRuleEntry;
      v15 = [(PLEntry *)&v19 initWithEntryKey:v14];
    }
    v17 = v15;

    if (v17)
    {
      [(PLEntry *)v17 setObject:v10 forKeyedSubscript:*MEMORY[0x263F5F770]];
      [(PLEntry *)v17 setObject:v11 forKeyedSubscript:*MEMORY[0x263F5F778]];
      [(PLEntry *)v17 setObject:v12 forKeyedSubscript:*MEMORY[0x263F5F768]];
    }
    self = v17;
    v16 = self;
  }

  return v16;
}

- (NSNumber)nodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F770]];
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F778]];
}

- (unint64_t)hash
{
  v3 = [(PLAccountingDistributionRuleEntry *)self nodeID];
  int v4 = [v3 intValue];
  v5 = [(PLAccountingDistributionRuleEntry *)self rootNodeID];
  int v6 = [v5 intValue] + v4;
  v7 = [(PLAccountingDistributionRuleEntry *)self distributionID];
  unint64_t v8 = (int)(v6 + [v7 intValue]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 nodeID];
  int v6 = [(PLAccountingDistributionRuleEntry *)self nodeID];
  if ([v5 isEqual:v6])
  {
    v7 = [v4 rootNodeID];
    unint64_t v8 = [(PLAccountingDistributionRuleEntry *)self rootNodeID];
    if ([v7 isEqual:v8])
    {
      v9 = [v4 distributionID];
      id v10 = [(PLAccountingDistributionRuleEntry *)self distributionID];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PLAccountingDistributionRuleEntry *)self nodeID];
  v5 = [(PLAccountingDistributionRuleEntry *)self rootNodeID];
  int v6 = [(PLAccountingDistributionRuleEntry *)self distributionID];
  v7 = [v3 stringWithFormat:@"(nodeID=%@, rootNodeID=%@, distributionID=%@)", v4, v5, v6];

  return v7;
}

@end