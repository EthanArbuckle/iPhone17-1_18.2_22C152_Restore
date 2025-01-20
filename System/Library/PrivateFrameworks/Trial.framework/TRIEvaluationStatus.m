@interface TRIEvaluationStatus
+ (BOOL)supportsSecureCoding;
+ (id)defaultProvider;
+ (id)freshProvider;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)evaluationId;
- (TRIEvaluationStatus)initWithCoder:(id)a3;
- (TRIEvaluationStatus)initWithType:(unsigned __int8)a3 evaluationId:(id)a4 date:(id)a5 evalState:(id)a6;
- (TRIFactorsState)evalState;
- (unint64_t)hash;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIEvaluationStatus

- (TRIEvaluationStatus)initWithType:(unsigned __int8)a3 evaluationId:(id)a4 date:(id)a5 evalState:(id)a6
{
  int v9 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 300, @"Invalid parameter not satisfying: %@", @"evaluationId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_10:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 301, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  if (v9 == 1 && !v14)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v21.receiver = self;
  v21.super_class = (Class)TRIEvaluationStatus;
  v15 = [(TRIEvaluationStatus *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = v9;
    objc_storeStrong((id *)&v15->_evaluationId, a4);
    objc_storeStrong((id *)&v16->_date, a5);
    objc_storeStrong((id *)&v16->_evalState, a6);
  }

  return v16;
}

+ (id)freshProvider
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__TRIEvaluationStatus_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB3B77B0 != -1) {
    dispatch_once(&qword_1EB3B77B0, block);
  }
  v2 = (void *)_MergedGlobals_5;
  return v2;
}

void __38__TRIEvaluationStatus_defaultProvider__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v3 = [*(id *)(a1 + 32) freshProvider];
  v4 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIEvaluationStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    if (v4 && [(TRIEvaluationStatus *)v4 isMemberOfClass:objc_opt_class()])
    {
      v6 = v5;
      int type = self->_type;
      if (type != [(TRIEvaluationStatus *)v6 type])
      {
        char v15 = 0;
LABEL_21:

        goto LABEL_22;
      }
      date = self->_date;
      int v9 = [(TRIEvaluationStatus *)v6 date];
      if (![(NSDate *)date isEqualToDate:v9])
      {
        char v15 = 0;
LABEL_20:

        goto LABEL_21;
      }
      evaluationId = self->_evaluationId;
      v11 = [(TRIEvaluationStatus *)v6 evaluationId];
      if ([evaluationId isEqualToString:v11])
      {
        evalState = self->_evalState;
        id v13 = evalState;
        if (!evalState)
        {
          evaluationId = [(TRIEvaluationStatus *)v6 evalState];
          if (!evaluationId)
          {
            char v15 = 1;
LABEL_18:

            goto LABEL_19;
          }
          id v13 = self->_evalState;
        }
        id v14 = [(TRIEvaluationStatus *)v6 evalState];
        char v15 = [(TRIFactorsState *)v13 isEqual:v14];

        if (!evalState) {
          goto LABEL_18;
        }
      }
      else
      {
        char v15 = 0;
      }
LABEL_19:

      goto LABEL_20;
    }
    char v15 = 0;
  }
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  unsigned int type = self->_type;
  NSUInteger v4 = [(NSString *)self->_evaluationId hash] + 37 * type;
  uint64_t v5 = [(NSDate *)self->_date hash] + 37 * v4;
  return [(TRIFactorsState *)self->_evalState hash] + 37 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setType:self->_type];
  [v5 setEvaluationId:self->_evaluationId];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB05F0]) initWithDate:self->_date];
  [v5 setTimestamp:v6];

  evalState = self->_evalState;
  if (evalState)
  {
    v8 = [(TRIFactorsState *)evalState persisted];
    [v5 setEvalState:v8];
  }
  int v9 = [v5 data];
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 373, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v11 encodeObject:v9 forKey:@"data"];
}

- (TRIEvaluationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v17 = 0;
    v6 = +[TRIPBMessage parseFromData:v5 error:&v17];
    id v7 = v17;
    if (v6)
    {
      if ([v6 hasType]
        && [v6 hasEvaluationId]
        && [v6 hasTimestamp])
      {
        if ([v6 hasEvalState])
        {
          v8 = [TRIFactorsState alloc];
          int v9 = [v6 evalState];
          v10 = [(TRIFactorsState *)v8 initWithPersisted:v9];
        }
        else
        {
          v10 = 0;
        }
        if ([v6 type] != 1 || v10)
        {
          unsigned __int8 v13 = [v6 type];
          id v14 = [v6 evaluationId];
          char v15 = [v6 timestamp];
          v16 = [v15 date];
          self = [(TRIEvaluationStatus *)self initWithType:v13 evaluationId:v14 date:v16 evalState:v10];

          id v11 = self;
        }
        else
        {
          id v11 = 0;
        }

        goto LABEL_11;
      }
    }
    else
    {
      [v4 failWithError:v7];
    }
    id v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)evaluationId
{
  return self->_evaluationId;
}

- (NSDate)date
{
  return self->_date;
}

- (TRIFactorsState)evalState
{
  return self->_evalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evalState, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_evaluationId, 0);
}

@end