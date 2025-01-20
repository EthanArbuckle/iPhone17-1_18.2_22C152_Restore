@interface TRIMLRuntimeEvaluationHistoryRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithEvaluation:(id)a3 status:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (TRIEvaluationStatus)status;
- (TRIMLRuntimeEvaluation)evaluation;
- (TRIMLRuntimeEvaluationHistoryRecord)initWithCoder:(id)a3;
- (TRIMLRuntimeEvaluationHistoryRecord)initWithEvaluation:(id)a3 status:(id)a4;
- (id)copyWithReplacementEvaluation:(id)a3;
- (id)copyWithReplacementStatus:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIMLRuntimeEvaluationHistoryRecord

- (TRIMLRuntimeEvaluationHistoryRecord)initWithEvaluation:(id)a3 status:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1981, @"Invalid parameter not satisfying: %@", @"evaluation != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1982, @"Invalid parameter not satisfying: %@", @"status != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMLRuntimeEvaluationHistoryRecord;
  v11 = [(TRIMLRuntimeEvaluationHistoryRecord *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_evaluation, a3);
    objc_storeStrong((id *)&v12->_status, a4);
  }

  return v12;
}

+ (id)recordWithEvaluation:(id)a3 status:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithEvaluation:v7 status:v6];

  return v8;
}

- (id)copyWithReplacementEvaluation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEvaluation:v4 status:self->_status];

  return v5;
}

- (id)copyWithReplacementStatus:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEvaluation:self->_evaluation status:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_evaluation != 0;
  id v7 = [v4 evaluation];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  evaluation = self->_evaluation;
  if (evaluation)
  {
    v10 = [v5 evaluation];
    int v11 = [(TRIMLRuntimeEvaluation *)evaluation isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_status != 0;
  v13 = [v5 status];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    status = self->_status;
    if (status)
    {
      objc_super v16 = [v5 status];
      char v17 = [(TRIEvaluationStatus *)status isEqual:v16];
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
  id v4 = (TRIMLRuntimeEvaluationHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIMLRuntimeEvaluationHistoryRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIMLRuntimeEvaluation *)self->_evaluation hash];
  return [(TRIEvaluationStatus *)self->_status hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMLRuntimeEvaluationHistoryRecord)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"evaluation"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    if (v6)
    {
      id v7 = (void *)v6;
      self = [(TRIMLRuntimeEvaluationHistoryRecord *)self initWithEvaluation:v5 status:v6];
      int v8 = self;
LABEL_11:

      goto LABEL_12;
    }
    v10 = [v4 error];

    if (!v10)
    {
      uint64_t v15 = *MEMORY[0x1E4F28568];
      objc_super v16 = @"Retrieved nil serialized value for nonnull TRIMLRuntimeEvaluationHistoryRecord.status";
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIMLRuntimeEvaluationHistoryRecordOCNTErrorDomain" code:2 userInfo:v11];
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
    v18[0] = @"Retrieved nil serialized value for nonnull TRIMLRuntimeEvaluationHistoryRecord.evaluation";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIMLRuntimeEvaluationHistoryRecordOCNTErrorDomain" code:2 userInfo:v7];
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
  evaluation = self->_evaluation;
  id v7 = v4;
  if (evaluation)
  {
    [v4 encodeObject:evaluation forKey:@"evaluation"];
    id v4 = v7;
  }
  status = self->_status;
  if (status)
  {
    [v7 encodeObject:status forKey:@"status"];
    id v4 = v7;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIMLRuntimeEvaluationHistoryRecord | evaluation:%@ status:%@>", self->_evaluation, self->_status];
  return v2;
}

- (TRIMLRuntimeEvaluation)evaluation
{
  return self->_evaluation;
}

- (TRIEvaluationStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
}

@end