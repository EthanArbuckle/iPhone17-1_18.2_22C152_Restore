@interface SAStack
@end

@implementation SAStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryImagesHitByTask, 0);
  objc_storeStrong((id *)&self->_rootObjects, 0);
  objc_storeStrong((id *)&self->_timeWhenFirstAttemptedToSample, 0);
  objc_storeStrong((id *)&self->_threadName, 0);
  objc_storeStrong((id *)&self->_threadIds, 0);
  objc_storeStrong((id *)&self->_swiftTasks, 0);
  objc_storeStrong((id *)&self->_dispatchQueues, 0);
}

@end