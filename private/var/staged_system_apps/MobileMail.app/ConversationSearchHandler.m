@interface ConversationSearchHandler
- (ConversationSearchHandler)init;
- (void)aggregationContextDidFinish:(id)a3 withLoadingController:(id)a4 successfully:(BOOL)a5;
@end

@implementation ConversationSearchHandler

- (ConversationSearchHandler)init
{
  v24.receiver = self;
  v24.super_class = (Class)ConversationSearchHandler;
  id v2 = [(ConversationSearchHandler *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mail.conversationsearchHandlerQueue", v4);
    v6 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v5;

    uint64_t v7 = +[EFScheduler dispatchQueueSchedulerWithQueue:*((void *)v2 + 12)];
    v8 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mail.conversationsearchManagementQueue", v10);
    v12 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v13;

    uint64_t v15 = 3;
    do
    {
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v2 + 18));
      --v15;
    }
    while (v15);
    uint64_t v16 = objc_opt_new();
    v17 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v16;

    uint64_t v18 = objc_opt_new();
    v19 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v18;

    *((void *)v2 + 7) = 0;
    uint64_t v20 = objc_opt_new();
    v21 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v20;

    v22 = sub_100068CD4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v26 = v2;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Created handler: %p", buf, 0xCu);
    }
  }
  return (ConversationSearchHandler *)v2;
}

- (void)aggregationContextDidFinish:(id)a3 withLoadingController:(id)a4 successfully:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self) {
    managementQueue = self->_managementQueue;
  }
  else {
    managementQueue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006BFFC;
  block[3] = &unk_100604668;
  id v13 = v7;
  v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(managementQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchesWaitingForLoadingController, 0);
  objc_storeStrong((id *)&self->_loaderPool, 0);
  objc_storeStrong((id *)&self->_loaderPoolSem, 0);
  objc_storeStrong((id *)&self->_aggregationContexts, 0);
  objc_storeStrong((id *)&self->_allItemIDs, 0);
  objc_storeStrong((id *)&self->_messageProcessingScheduler, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_searchOptions, 0);
  objc_storeStrong((id *)&self->_resultAggregator, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_highlightedRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_comparisonWebView, 0);
  objc_storeStrong((id *)&self->completedItemIndexes, 0);

  objc_storeStrong((id *)&self->resultsPendingCompletion, 0);
}

@end