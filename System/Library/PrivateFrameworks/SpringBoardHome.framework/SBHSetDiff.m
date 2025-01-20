@interface SBHSetDiff
+ (id)diffFromSet:(id)a3 toSet:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)additions;
- (NSSet)deletions;
- (NSSet)fromSet;
- (NSSet)toSet;
- (NSSet)updates;
- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7;
- (id)description;
- (unint64_t)hash;
@end

@implementation SBHSetDiff

+ (id)diffFromSet:(id)a3 toSet:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 setWithSet:v6];
  [v8 minusSet:v7];
  v9 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
  [v9 minusSet:v6];
  v10 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
  [v10 minusSet:v8];
  [v10 minusSet:v9];
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFromSet:v7 toSet:v6 additions:v8 deletions:v9 updates:v10];

  return v11;
}

- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBHSetDiff;
  v17 = [(SBHSetDiff *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromSet, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (unint64_t)hash
{
  v2 = [(SBHSetDiff *)self fromSet];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHSetDiff *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(SBHSetDiff *)v5 fromSet];
      id v7 = [(SBHSetDiff *)self fromSet];
      if (v6 == v7)
      {
        int v10 = 1;
      }
      else
      {
        v8 = [(SBHSetDiff *)v5 fromSet];
        v9 = [(SBHSetDiff *)self fromSet];
        int v10 = [v8 isEqual:v9];
      }
      v12 = [(SBHSetDiff *)v5 toSet];
      id v13 = [(SBHSetDiff *)self toSet];
      if (v12 == v13)
      {
        BOOL v11 = v10 != 0;
      }
      else
      {
        id v14 = [(SBHSetDiff *)v5 toSet];
        id v15 = [(SBHSetDiff *)self toSet];
        char v16 = [v14 isEqual:v15];
        if (v10) {
          BOOL v11 = v16;
        }
        else {
          BOOL v11 = 0;
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBHSetDiff *)self fromSet];
  id v5 = (id)[v3 appendObject:v4 withName:@"fromSet"];

  id v6 = [(SBHSetDiff *)self toSet];
  id v7 = (id)[v3 appendObject:v6 withName:@"toSet"];

  v8 = [(SBHSetDiff *)self additions];
  id v9 = (id)[v3 appendObject:v8 withName:@"additions"];

  int v10 = [(SBHSetDiff *)self deletions];
  id v11 = (id)[v3 appendObject:v10 withName:@"deletions"];

  v12 = [(SBHSetDiff *)self updates];
  id v13 = (id)[v3 appendObject:v12 withName:@"updates"];

  id v14 = [v3 build];

  return v14;
}

- (NSSet)additions
{
  return self->_additions;
}

- (NSSet)deletions
{
  return self->_deletions;
}

- (NSSet)updates
{
  return self->_updates;
}

- (NSSet)fromSet
{
  return self->_fromSet;
}

- (NSSet)toSet
{
  return self->_toSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_toSet, 0);
  objc_storeStrong((id *)&self->_fromSet, 0);
}

@end