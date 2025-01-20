@interface JavaScriptDialogState
- (JavaScriptDialogState)initWithMessage:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (NSString)currentInput;
- (NSString)message;
- (id)completionHandler;
- (int64_t)type;
- (void)setCurrentInput:(id)a3;
@end

@implementation JavaScriptDialogState

- (JavaScriptDialogState)initWithMessage:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)JavaScriptDialogState;
  v10 = [(JavaScriptDialogState *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    message = v10->_message;
    v10->_message = (NSString *)v11;

    v10->_type = a4;
    uint64_t v13 = MEMORY[0x1E4E42950](v9);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v13;

    v15 = v10;
  }

  return v10;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)currentInput
{
  return self->_currentInput;
}

- (void)setCurrentInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end