@interface SWQueueableScriptWithCompletion
- (SWQueueableScriptWithCompletion)initWithScript:(id)a3 completion:(id)a4;
- (SWScript)script;
- (id)completion;
@end

@implementation SWQueueableScriptWithCompletion

- (SWQueueableScriptWithCompletion)initWithScript:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWQueueableScriptWithCompletion;
  v9 = [(SWQueueableScriptWithCompletion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_script, a3);
    uint64_t v11 = MEMORY[0x22A621430](v8);
    id completion = v10->_completion;
    v10->_id completion = (id)v11;
  }
  return v10;
}

- (SWScript)script
{
  return self->_script;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_script, 0);
}

@end