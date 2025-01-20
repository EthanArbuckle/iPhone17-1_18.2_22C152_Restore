@interface TRITaskQueueGuardedData
@end

@implementation TRITaskQueueGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizeBlocks, 0);
  objc_storeStrong(&self->taskQueueCompletionBlock, 0);
  objc_storeStrong((id *)&self->xpcDescriptorToState, 0);
  objc_storeStrong((id *)&self->nextScheduledTaskStartTime, 0);
  objc_storeStrong((id *)&self->queuedTasks, 0);
  objc_storeStrong((id *)&self->taskStore, 0);
}

@end