@interface SVXServiceCommandDelayedAction
- (SAUIDelayedActionCommand)command;
- (SVXServiceCommandDelayedAction)initWithCommand:(id)a3 taskTracker:(id)a4;
- (SVXTaskTracking)taskTracker;
@end

@implementation SVXServiceCommandDelayedAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (SAUIDelayedActionCommand)command
{
  return self->_command;
}

- (SVXServiceCommandDelayedAction)initWithCommand:(id)a3 taskTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXServiceCommandDelayedAction;
  v8 = [(SVXServiceCommandDelayedAction *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    command = v8->_command;
    v8->_command = (SAUIDelayedActionCommand *)v9;

    objc_storeStrong((id *)&v8->_taskTracker, a4);
  }

  return v8;
}

@end