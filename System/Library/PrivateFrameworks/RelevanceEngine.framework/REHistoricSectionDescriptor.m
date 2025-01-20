@interface REHistoricSectionDescriptor
- (BOOL)invertsRanking;
- (BOOL)isEqual:(id)a3;
- (NSArray)orderedRules;
- (NSSet)rules;
- (NSString)name;
- (REHistoricSectionDescriptor)init;
- (RESectionDescriptor)parentDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxElementCount;
- (unint64_t)hash;
- (void)setInvertsRanking:(BOOL)a3;
- (void)setMaxElementCount:(int64_t)a3;
- (void)setOrderedRules:(id)a3;
- (void)setParentDescriptor:(id)a3;
- (void)setRules:(id)a3;
@end

@implementation REHistoricSectionDescriptor

- (REHistoricSectionDescriptor)init
{
  v7.receiver = self;
  v7.super_class = (Class)REHistoricSectionDescriptor;
  v2 = [(REHistoricSectionDescriptor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_invertsRanking = 1;
    v2->_maxElementCount = -1;
    uint64_t v4 = [MEMORY[0x263EFF9D8] orderedSet];
    rules = v3->_rules;
    v3->_rules = (NSOrderedSet *)v4;
  }
  return v3;
}

- (NSString)name
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDescriptor);
  v3 = [WeakRetained name];

  if (v3)
  {
    uint64_t v4 = [v3 stringByAppendingString:@"_historic"];
  }
  else
  {
    uint64_t v4 = &stru_26CFA57D0;
  }

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REHistoricSectionDescriptor *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_maxElementCount == v5->_maxElementCount && self->_invertsRanking == v5->_invertsRanking)
      {
        rules = self->_rules;
        v8 = v5->_rules;
        v9 = rules;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSOrderedSet *)v9 isEqual:v8];
        }
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
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v2 = self->_maxElementCount ^ self->_invertsRanking;
  return v2 ^ [(NSOrderedSet *)self->_rules hash];
}

- (NSSet)rules
{
  int64_t v2 = [(NSOrderedSet *)self->_rules set];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)setRules:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFF9D8] orderedSetWithSet:a3];
  rules = self->_rules;
  self->_rules = v4;
  MEMORY[0x270F9A758](v4, rules);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setInvertsRanking:self->_invertsRanking];
  [v4 setMaxElementCount:self->_maxElementCount];
  objc_storeStrong(v4 + 1, self->_rules);
  return v4;
}

- (BOOL)invertsRanking
{
  return self->_invertsRanking;
}

- (void)setInvertsRanking:(BOOL)a3
{
  self->_invertsRanking = a3;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (RESectionDescriptor)parentDescriptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDescriptor);
  return (RESectionDescriptor *)WeakRetained;
}

- (void)setParentDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDescriptor);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (NSArray)orderedRules
{
  return [(NSOrderedSet *)self->_rules array];
}

- (void)setOrderedRules:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFF9D8] orderedSetWithArray:a3];
  rules = self->_rules;
  self->_rules = v4;
  MEMORY[0x270F9A758](v4, rules);
}

@end