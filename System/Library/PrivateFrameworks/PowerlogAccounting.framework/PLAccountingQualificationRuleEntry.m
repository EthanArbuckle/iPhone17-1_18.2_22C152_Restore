@interface PLAccountingQualificationRuleEntry
+ (id)entryKey;
+ (void)load;
- (BOOL)isEqual:(id)a3;
- (NSNumber)qualificationID;
- (NSNumber)rootNodeID;
- (PLAccountingQualificationRuleEntry)initWithRootNodeID:(id)a3 withQualificationID:(id)a4 withEntryDate:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation PLAccountingQualificationRuleEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationRuleEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_4 != -1) {
    dispatch_once(&entryKey_onceToken_4, &__block_literal_global_6);
  }
  objc_super v2 = (void *)entryKey_entryKey_4;
  return v2;
}

uint64_t __46__PLAccountingQualificationRuleEntry_entryKey__block_invoke()
{
  entryKey_entryKey_4 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8B0] andName:*MEMORY[0x263F5F798]];
  return MEMORY[0x270F9A758]();
}

- (PLAccountingQualificationRuleEntry)initWithRootNodeID:(id)a3 withQualificationID:(id)a4 withEntryDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)[v8 intValue] < 1 || (int)objc_msgSend(v9, "intValue") < 1)
  {
    v13 = 0;
  }
  else
  {
    v11 = [(id)objc_opt_class() entryKey];
    if (v10)
    {
      v17.receiver = self;
      v17.super_class = (Class)PLAccountingQualificationRuleEntry;
      v12 = [(PLEntry *)&v17 initWithEntryKey:v11 withDate:v10];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PLAccountingQualificationRuleEntry;
      v12 = [(PLEntry *)&v16 initWithEntryKey:v11];
    }
    v14 = v12;

    if (v14)
    {
      [(PLEntry *)v14 setObject:v8 forKeyedSubscript:*MEMORY[0x263F5F7A8]];
      [(PLEntry *)v14 setObject:v9 forKeyedSubscript:*MEMORY[0x263F5F7A0]];
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7A8]];
}

- (NSNumber)qualificationID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7A0]];
}

- (unint64_t)hash
{
  v3 = [(PLAccountingQualificationRuleEntry *)self rootNodeID];
  int v4 = [v3 intValue];
  v5 = [(PLAccountingQualificationRuleEntry *)self qualificationID];
  unint64_t v6 = (int)([v5 intValue] + v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 rootNodeID];
  unint64_t v6 = [(PLAccountingQualificationRuleEntry *)self rootNodeID];
  if ([v5 isEqual:v6])
  {
    v7 = [v4 qualificationID];
    id v8 = [(PLAccountingQualificationRuleEntry *)self qualificationID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PLAccountingQualificationRuleEntry *)self rootNodeID];
  v5 = [(PLAccountingQualificationRuleEntry *)self qualificationID];
  unint64_t v6 = [v3 stringWithFormat:@"(rootNodeID=%@, qualificationID=%@)", v4, v5];

  return v6;
}

@end