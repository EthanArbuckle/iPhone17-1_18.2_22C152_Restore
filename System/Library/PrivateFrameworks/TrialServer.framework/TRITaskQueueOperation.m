@interface TRITaskQueueOperation
- (BOOL)inProgress;
- (TRITask)task;
- (void)setInProgress:(BOOL)a3;
- (void)setTask:(id)a3;
@end

@implementation TRITaskQueueOperation

- (TRITask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (void).cxx_destruct
{
}

@end