@interface SUIBOrchestrationTask
+ (BOOL)supportsSecureCoding;
- (NSUUID)taskId;
- (SUIBOrchestrationTask)init;
- (SUIBOrchestrationTask)initWithBuilder:(id)a3;
- (SUIBOrchestrationTask)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBOrchestrationTask

- (SUIBOrchestrationTask)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBOrchestrationTaskMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBOrchestrationTask;
  v5 = [(SUIBOrchestrationTask *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBOrchestrationTaskMutation);
    v4[2](v4, v7);
    v8 = [(SUIBOrchestrationTaskMutation *)v7 taskId];
    uint64_t v9 = [v8 copy];
    taskId = v6->_taskId;
    v6->_taskId = (NSUUID *)v9;
  }
  return v6;
}

- (SUIBOrchestrationTask)init
{
  return [(SUIBOrchestrationTask *)self initWithBuilder:&__block_literal_global_3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBOrchestrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBOrchestrationTask::taskId"];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SUIBOrchestrationTask_initWithCoder___block_invoke;
  v9[3] = &unk_265517ED8;
  id v10 = v5;
  id v6 = v5;
  v7 = [(SUIBOrchestrationTask *)self initWithBuilder:v9];

  return v7;
}

uint64_t __39__SUIBOrchestrationTask_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTaskId:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSUUID)taskId
{
  return self->_taskId;
}

- (void).cxx_destruct
{
}

@end