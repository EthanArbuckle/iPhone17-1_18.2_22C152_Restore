@interface _TUIFeedViewControllerQueueContext
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)userInitiatedCallbackQueue;
- (OS_dispatch_queue)userInteractiveCallbackQueue;
- (_TUIFeedViewControllerQueueContext)init;
@end

@implementation _TUIFeedViewControllerQueueContext

- (_TUIFeedViewControllerQueueContext)init
{
  v16.receiver = self;
  v16.super_class = (Class)_TUIFeedViewControllerQueueContext;
  id v2 = [(_TUIFeedViewControllerQueueContext *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("_TUIFeedViewControllerQueueContext.callbackQueue", v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("_TUIFeedViewControllerQueueContext.userInteractiveCallbackQueue", v8, *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2("_TUIFeedViewControllerQueueContext.userInitiatedCallbackQueue", v12, *((dispatch_queue_t *)v2 + 1));
    v14 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v13;
  }
  return (_TUIFeedViewControllerQueueContext *)v2;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)userInteractiveCallbackQueue
{
  return self->_userInteractiveCallbackQueue;
}

- (OS_dispatch_queue)userInitiatedCallbackQueue
{
  return self->_userInitiatedCallbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInitiatedCallbackQueue, 0);
  objc_storeStrong((id *)&self->_userInteractiveCallbackQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end