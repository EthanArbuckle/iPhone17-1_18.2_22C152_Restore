@interface TRIRuleQualifiedFactorPackSetId
+ (id)factorPackSetIdWithIdent:(id)a3 targetingRuleIndex:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFactorPackSetId:(id)a3;
- (TRIFactorPackSetId)ident;
- (TRIRuleQualifiedFactorPackSetId)initWithIdent:(id)a3 targetingRuleIndex:(int)a4;
- (id)copyWithReplacementIdent:(id)a3;
- (id)copyWithReplacementTargetingRuleIndex:(int)a3;
- (id)description;
- (int)targetingRuleIndex;
- (unint64_t)hash;
@end

@implementation TRIRuleQualifiedFactorPackSetId

- (TRIRuleQualifiedFactorPackSetId)initWithIdent:(id)a3 targetingRuleIndex:(int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 4720, @"Invalid parameter not satisfying: %@", @"ident != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIRuleQualifiedFactorPackSetId;
  v9 = [(TRIRuleQualifiedFactorPackSetId *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ident, a3);
    v10->_targetingRuleIndex = a4;
  }

  return v10;
}

+ (id)factorPackSetIdWithIdent:(id)a3 targetingRuleIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithIdent:v6 targetingRuleIndex:v4];

  return v7;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdent:v4 targetingRuleIndex:self->_targetingRuleIndex];

  return v5;
}

- (id)copyWithReplacementTargetingRuleIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  ident = self->_ident;
  return (id)[v5 initWithIdent:ident targetingRuleIndex:v3];
}

- (BOOL)isEqualToFactorPackSetId:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_ident != 0;
  v7 = [v4 ident];
  int v8 = v7 == 0;

  if (v6 == v8
    || (ident = self->_ident) != 0
    && ([v5 ident],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(TRIFactorPackSetId *)ident isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    int targetingRuleIndex = self->_targetingRuleIndex;
    BOOL v13 = targetingRuleIndex == [v5 targetingRuleIndex];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRuleQualifiedFactorPackSetId *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIRuleQualifiedFactorPackSetId *)self isEqualToFactorPackSetId:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIFactorPackSetId *)self->_ident hash];
  return self->_targetingRuleIndex - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  ident = self->_ident;
  id v5 = [NSNumber numberWithInt:self->_targetingRuleIndex];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIRuleQualifiedFactorPackSetId | ident:%@ targetingRuleIndex:%@>", ident, v5];

  return v6;
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (int)targetingRuleIndex
{
  return self->_targetingRuleIndex;
}

- (void).cxx_destruct
{
}

@end