@interface PXStoryCurationChangeList
+ (id)changeListByCombiningChangeList:(id)a3 withChangeList:(id)a4;
- (BOOL)hasAnyChange;
- (BOOL)isEqual:(id)a3;
- (NSSet)demotedIdentifiers;
- (NSSet)promotedIdentifiers;
- (PXStoryCurationChangeList)init;
- (PXStoryCurationChangeList)initWithPromotedIdentifiers:(id)a3 demotedIdentifiers:(id)a4;
- (id)changeListByApplyingChangeList:(id)a3;
- (id)changeListByDemotingIdentifiers:(id)a3;
- (id)changeListByPromotingIdentifiers:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXStoryCurationChangeList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demotedIdentifiers, 0);
  objc_storeStrong((id *)&self->_promotedIdentifiers, 0);
}

- (NSSet)demotedIdentifiers
{
  return self->_demotedIdentifiers;
}

- (NSSet)promotedIdentifiers
{
  return self->_promotedIdentifiers;
}

- (BOOL)hasAnyChange
{
  return self->_hasAnyChange;
}

- (id)changeListByApplyingChangeList:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryCurationChangeList *)self promotedIdentifiers];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(PXStoryCurationChangeList *)self demotedIdentifiers];
  v8 = (void *)[v7 mutableCopy];

  v9 = [v4 promotedIdentifiers];
  [v6 unionSet:v9];

  v10 = [v4 demotedIdentifiers];
  [v6 minusSet:v10];

  v11 = [v4 promotedIdentifiers];
  [v8 minusSet:v11];

  v12 = [v4 demotedIdentifiers];

  [v8 unionSet:v12];
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPromotedIdentifiers:v6 demotedIdentifiers:v8];

  return v13;
}

- (id)changeListByDemotingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [PXStoryCurationChangeList alloc];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  v7 = [(PXStoryCurationChangeList *)v5 initWithPromotedIdentifiers:0 demotedIdentifiers:v6];
  v8 = [(PXStoryCurationChangeList *)self changeListByApplyingChangeList:v7];

  return v8;
}

- (id)changeListByPromotingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [PXStoryCurationChangeList alloc];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  v7 = [(PXStoryCurationChangeList *)v5 initWithPromotedIdentifiers:v6 demotedIdentifiers:0];
  v8 = [(PXStoryCurationChangeList *)self changeListByApplyingChangeList:v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(PXStoryCurationChangeList *)self promotedIdentifiers];
  uint64_t v4 = [v3 hash];

  v5 = [(PXStoryCurationChangeList *)self demotedIdentifiers];
  unint64_t v6 = v4 ^ (2 * [v5 hash]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryCurationChangeList *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(PXStoryCurationChangeList *)self promotedIdentifiers];
      v7 = [(PXStoryCurationChangeList *)v5 promotedIdentifiers];
      if ([v6 isEqualToSet:v7])
      {
        v8 = [(PXStoryCurationChangeList *)self demotedIdentifiers];
        v9 = [(PXStoryCurationChangeList *)v5 demotedIdentifiers];
        char v10 = [v8 isEqualToSet:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PXStoryCurationChangeList *)self promotedIdentifiers];
  v7 = [(PXStoryCurationChangeList *)self demotedIdentifiers];
  v8 = (void *)[v3 initWithFormat:@"<%@: %p, promoted: %@, demoted: %@>", v5, self, v6, v7];

  return v8;
}

- (PXStoryCurationChangeList)initWithPromotedIdentifiers:(id)a3 demotedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryCurationChangeList;
  v8 = [(PXStoryCurationChangeList *)&v19 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    char v10 = v9;
    if (v9) {
      v11 = v9;
    }
    else {
      v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    promotedIdentifiers = v8->_promotedIdentifiers;
    v8->_promotedIdentifiers = v11;

    v13 = (void *)[v7 copy];
    v14 = v13;
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    demotedIdentifiers = v8->_demotedIdentifiers;
    v8->_demotedIdentifiers = v15;

    if ([(NSSet *)v8->_promotedIdentifiers count]) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = [(NSSet *)v8->_demotedIdentifiers count] != 0;
    }
    v8->_hasAnyChange = v17;
  }

  return v8;
}

- (PXStoryCurationChangeList)init
{
  return [(PXStoryCurationChangeList *)self initWithPromotedIdentifiers:0 demotedIdentifiers:0];
}

+ (id)changeListByCombiningChangeList:(id)a3 withChangeList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 changeListByApplyingChangeList:v6];
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

@end