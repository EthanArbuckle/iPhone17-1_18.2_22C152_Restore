@interface TRIMLRuntimeActiveEvaluationTuple
+ (BOOL)supportsSecureCoding;
+ (id)tupleWithEval:(id)a3 factorsState:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTuple:(id)a3;
- (TRIFactorsState)factorsState;
- (TRIMLRuntimeActiveEvaluationTuple)initWithCoder:(id)a3;
- (TRIMLRuntimeActiveEvaluationTuple)initWithEval:(id)a3 factorsState:(id)a4;
- (TRIMLRuntimeEvaluation)eval;
- (id)copyWithReplacementEval:(id)a3;
- (id)copyWithReplacementFactorsState:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIMLRuntimeActiveEvaluationTuple

- (TRIMLRuntimeActiveEvaluationTuple)initWithEval:(id)a3 factorsState:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1872, @"Invalid parameter not satisfying: %@", @"eval != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1873, @"Invalid parameter not satisfying: %@", @"factorsState != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMLRuntimeActiveEvaluationTuple;
  v11 = [(TRIMLRuntimeActiveEvaluationTuple *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eval, a3);
    objc_storeStrong((id *)&v12->_factorsState, a4);
  }

  return v12;
}

+ (id)tupleWithEval:(id)a3 factorsState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithEval:v7 factorsState:v6];

  return v8;
}

- (id)copyWithReplacementEval:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEval:v4 factorsState:self->_factorsState];

  return v5;
}

- (id)copyWithReplacementFactorsState:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEval:self->_eval factorsState:v4];

  return v5;
}

- (BOOL)isEqualToTuple:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_eval != 0;
  id v7 = [v4 eval];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  eval = self->_eval;
  if (eval)
  {
    v10 = [v5 eval];
    int v11 = [(TRIMLRuntimeEvaluation *)eval isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_factorsState != 0;
  v13 = [v5 factorsState];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    factorsState = self->_factorsState;
    if (factorsState)
    {
      objc_super v16 = [v5 factorsState];
      char v17 = [(TRIFactorsState *)factorsState isEqual:v16];
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
  id v4 = (TRIMLRuntimeActiveEvaluationTuple *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIMLRuntimeActiveEvaluationTuple *)self isEqualToTuple:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIMLRuntimeEvaluation *)self->_eval hash];
  return [(TRIFactorsState *)self->_factorsState hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMLRuntimeActiveEvaluationTuple)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eval"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorsState"];
    if (v6)
    {
      id v7 = (void *)v6;
      self = [(TRIMLRuntimeActiveEvaluationTuple *)self initWithEval:v5 factorsState:v6];
      int v8 = self;
LABEL_11:

      goto LABEL_12;
    }
    v10 = [v4 error];

    if (!v10)
    {
      uint64_t v15 = *MEMORY[0x1E4F28568];
      objc_super v16 = @"Retrieved nil serialized value for nonnull TRIMLRuntimeActiveEvaluationTuple.factorsState";
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIMLRuntimeActiveEvaluationTupleOCNTErrorDomain" code:2 userInfo:v11];
      [v4 failWithError:v12];
    }
    id v7 = 0;
LABEL_10:
    int v8 = 0;
    goto LABEL_11;
  }
  id v9 = [v4 error];

  if (!v9)
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"Retrieved nil serialized value for nonnull TRIMLRuntimeActiveEvaluationTuple.eval";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIMLRuntimeActiveEvaluationTupleOCNTErrorDomain" code:2 userInfo:v7];
    [v4 failWithError:v13];

    goto LABEL_10;
  }
  int v8 = 0;
LABEL_12:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  eval = self->_eval;
  id v7 = v4;
  if (eval)
  {
    [v4 encodeObject:eval forKey:@"eval"];
    id v4 = v7;
  }
  factorsState = self->_factorsState;
  if (factorsState)
  {
    [v7 encodeObject:factorsState forKey:@"factorsState"];
    id v4 = v7;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIMLRuntimeActiveEvaluationTuple | eval:%@ factorsState:%@>", self->_eval, self->_factorsState];
  return v2;
}

- (TRIMLRuntimeEvaluation)eval
{
  return self->_eval;
}

- (TRIFactorsState)factorsState
{
  return self->_factorsState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_eval, 0);
}

@end