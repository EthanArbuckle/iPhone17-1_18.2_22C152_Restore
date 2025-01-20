@interface SiriTasksEvaluationResult
- (BOOL)isEffectiveTask;
- (BOOL)isSuccessfulTask;
- (NSString)taskId;
- (SiriTasksEvaluationResult)initWithDictionary:(id)a3;
- (SiriTasksEvaluationResult)initWithJSONData:(id)a3;
- (SiriTasksEvaluationResult)initWithTaskId:(id)a3 isEffectiveTask:(BOOL)a4 isSuccessfulTask:(BOOL)a5;
- (id)toJSON;
- (void)setIsEffectiveTask:(BOOL)a3;
- (void)setIsSuccessfulTask:(BOOL)a3;
- (void)setTaskId:(id)a3;
@end

@implementation SiriTasksEvaluationResult

- (SiriTasksEvaluationResult)initWithTaskId:(id)a3 isEffectiveTask:(BOOL)a4 isSuccessfulTask:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriTasksEvaluationResult;
  v10 = [(SiriTasksEvaluationResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_taskId, a3);
    v11->_isEffectiveTask = a4;
    v11->_isSuccessfulTask = a5;
  }

  return v11;
}

- (SiriTasksEvaluationResult)initWithJSONData:(id)a3
{
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (!v4)
  {
    NSLog(&cfstr_ErrorDeseriali.isa, v5);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = objc_opt_class();
    NSLog(&cfstr_GotAnInvalidJs.isa, v9);
    goto LABEL_6;
  }
  self = [(SiriTasksEvaluationResult *)self initWithDictionary:v4];
  v7 = self;
LABEL_7:

  return v7;
}

- (SiriTasksEvaluationResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriTasksEvaluationResult;
  id v5 = [(SiriTasksEvaluationResult *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskId"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (void *)[v6 copy];
      [(SiriTasksEvaluationResult *)v5 setTaskId:v7];

      v8 = [v4 objectForKeyedSubscript:@"isEffectiveTask"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[SiriTasksEvaluationResult setIsEffectiveTask:](v5, "setIsEffectiveTask:", [v8 BOOLValue]);
        uint64_t v9 = [v4 objectForKeyedSubscript:@"isSuccessfulTask"];
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[SiriTasksEvaluationResult setIsSuccessfulTask:](v5, "setIsSuccessfulTask:", [v9 BOOLValue]);
          id v10 = v5;
        }
        else
        {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)toJSON
{
  v11[3] = *MEMORY[0x263EF8340];
  v11[0] = self->_taskId;
  v10[0] = @"taskId";
  v10[1] = @"isEffectiveTask";
  v3 = [NSNumber numberWithBool:self->_isEffectiveTask];
  v11[1] = v3;
  v10[2] = @"isSuccessfulTask";
  id v4 = [NSNumber numberWithBool:self->_isSuccessfulTask];
  v11[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  uint64_t v9 = 0;
  v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v9];
  v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];

  return v7;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
}

- (BOOL)isEffectiveTask
{
  return self->_isEffectiveTask;
}

- (void)setIsEffectiveTask:(BOOL)a3
{
  self->_isEffectiveTask = a3;
}

- (BOOL)isSuccessfulTask
{
  return self->_isSuccessfulTask;
}

- (void)setIsSuccessfulTask:(BOOL)a3
{
  self->_isSuccessfulTask = a3;
}

- (void).cxx_destruct
{
}

@end