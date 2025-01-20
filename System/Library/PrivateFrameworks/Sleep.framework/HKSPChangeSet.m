@interface HKSPChangeSet
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChangeForPropertyIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKSPChangeSet)init;
- (HKSPChangeSet)initWithChangeDictionary:(id)a3;
- (HKSPChangeSet)initWithCoder:(id)a3;
- (NSArray)changes;
- (NSMutableDictionary)changeDictionary;
- (NSSet)topLevelChangeKeys;
- (NSString)description;
- (id)changedValueForPropertyIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopy;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)originalValueForPropertyIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)addChange:(id)a3;
- (void)applyChangeSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllChanges;
@end

@implementation HKSPChangeSet

- (void)addChange:(id)a3
{
  changeDictionary = self->_changeDictionary;
  id v4 = a3;
  id v6 = [v4 property];
  v5 = [v6 identifier];
  [(NSMutableDictionary *)changeDictionary setObject:v4 forKeyedSubscript:v5];
}

- (HKSPChangeSet)init
{
  return [(HKSPChangeSet *)self initWithChangeDictionary:MEMORY[0x1E4F1CC08]];
}

- (HKSPChangeSet)initWithChangeDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPChangeSet;
  v5 = [(HKSPChangeSet *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    changeDictionary = v5->_changeDictionary;
    v5->_changeDictionary = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)hasChangeForPropertyIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_changeDictionary objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)changedValueForPropertyIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_changeDictionary objectForKeyedSubscript:a3];
  BOOL v4 = [v3 changedValue];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(HKSPChangeSet);
  v5 = [(HKSPChangeSet *)self changeDictionary];
  uint64_t v6 = [v5 mutableCopy];
  changeDictionary = v4->_changeDictionary;
  v4->_changeDictionary = (NSMutableDictionary *)v6;

  return v4;
}

- (id)deepCopy
{
  v3 = objc_alloc_init(HKSPChangeSet);
  BOOL v4 = [(NSMutableDictionary *)self->_changeDictionary na_dictionaryByMappingValues:&__block_literal_global_4];
  uint64_t v5 = [v4 mutableCopy];
  changeDictionary = v3->_changeDictionary;
  v3->_changeDictionary = (NSMutableDictionary *)v5;

  return v3;
}

uint64_t __25__HKSPChangeSet_deepCopy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 deepCopy];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKSPChangeSet)initWithCoder:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPChangeSet;
  uint64_t v5 = [(HKSPChangeSet *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HKSPChanges"];
    changeDictionary = v5->_changeDictionary;
    v5->_changeDictionary = (NSMutableDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPChangeSet *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      changeDictionary = self->_changeDictionary;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __25__HKSPChangeSet_isEqual___block_invoke;
      v12[3] = &unk_1E5D32320;
      objc_super v13 = v5;
      v8 = v5;
      id v9 = (id)[v6 appendObject:changeDictionary counterpart:v12];
      char v10 = [v6 isEqual];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

uint64_t __25__HKSPChangeSet_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeDictionary];
}

- (void)removeAllChanges
{
}

- (void)applyChangeSet:(id)a3
{
  id v4 = [a3 changes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__HKSPChangeSet_applyChangeSet___block_invoke;
  v5[3] = &unk_1E5D32348;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);
}

uint64_t __32__HKSPChangeSet_applyChangeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChange:a2];
}

- (NSArray)changes
{
  v2 = [(NSMutableDictionary *)self->_changeDictionary allValues];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSSet)topLevelChangeKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_changeDictionary allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)originalValueForPropertyIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_changeDictionary objectForKeyedSubscript:a3];
  id v4 = [v3 originalValue];

  return v4;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(HKSPChangeSet *)self changes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __21__HKSPChangeSet_hash__block_invoke;
  v8[3] = &unk_1E5D32348;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  unint64_t v6 = [v5 hash];
  return v6;
}

id __21__HKSPChangeSet_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (NSString)description
{
  return (NSString *)[(HKSPChangeSet *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPChangeSet *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  unint64_t v6 = [v4 builderWithObject:self];
  v7 = [(HKSPChangeSet *)self changes];
  [v6 appendArraySection:v7 withName:@"changes" multilinePrefix:v5 skipIfEmpty:0];

  return v6;
}

- (id)succinctDescription
{
  v2 = [(HKSPChangeSet *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPChangeSet *)self changes];
  id v5 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v4, "count"), @"changes");

  return v3;
}

- (NSMutableDictionary)changeDictionary
{
  return self->_changeDictionary;
}

@end