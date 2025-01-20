@interface TRIParsedFactorPackSet
+ (id)setWithIdent:(id)a3 packs:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (NSArray)packs;
- (TRIFactorPackSetId)ident;
- (TRIParsedFactorPackSet)initWithIdent:(id)a3 packs:(id)a4;
- (id)copyWithReplacementIdent:(id)a3;
- (id)copyWithReplacementPacks:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIParsedFactorPackSet

- (TRIParsedFactorPackSet)initWithIdent:(id)a3 packs:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1627, @"Invalid parameter not satisfying: %@", @"ident != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1628, @"Invalid parameter not satisfying: %@", @"packs != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIParsedFactorPackSet;
  v11 = [(TRIParsedFactorPackSet *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ident, a3);
    objc_storeStrong((id *)&v12->_packs, a4);
  }

  return v12;
}

+ (id)setWithIdent:(id)a3 packs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIdent:v7 packs:v6];

  return v8;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdent:v4 packs:self->_packs];

  return v5;
}

- (id)copyWithReplacementPacks:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdent:self->_ident packs:v4];

  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_ident != 0;
  id v7 = [v4 ident];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  ident = self->_ident;
  if (ident)
  {
    v10 = [v5 ident];
    int v11 = [(TRIFactorPackSetId *)ident isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_packs != 0;
  v13 = [v5 packs];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    packs = self->_packs;
    if (packs)
    {
      objc_super v16 = [v5 packs];
      char v17 = [(NSArray *)packs isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIParsedFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIParsedFactorPackSet *)self isEqualToSet:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIFactorPackSetId *)self->_ident hash];
  return [(NSArray *)self->_packs hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIParsedFactorPackSet | ident:%@ packs:%@>", self->_ident, self->_packs];
  return v2;
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (NSArray)packs
{
  return self->_packs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packs, 0);
  objc_storeStrong((id *)&self->_ident, 0);
}

@end