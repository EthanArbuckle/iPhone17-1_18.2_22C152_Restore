@interface MFPriorityLoadingQueue
- (MFPriorityLoadingQueue)initWithScheduler:(id)a3;
- (NSArray)allObjects;
- (id)comparator;
- (id)dequeue;
- (id)drain;
- (id)itemHandler;
- (void)_locked_cancelWorkItem;
- (void)_locked_processQueue;
- (void)_locked_reorderQueue;
- (void)_noteQueueNeedsProcessing;
- (void)_performItem:(id)a3 handler:(id)a4 cancelationToken:(id)a5;
- (void)_processQueue;
- (void)dealloc;
- (void)dequeueObject:(id)a3;
- (void)enqueue:(id)a3;
- (void)immediatelyProcessQueue;
- (void)setComparator:(id)a3;
- (void)setItemHandler:(id)a3;
@end

@implementation MFPriorityLoadingQueue

- (MFPriorityLoadingQueue)initWithScheduler:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFPriorityLoadingQueue;
  v6 = [(MFPriorityLoadingQueue *)&v12 init];
  if (v6)
  {
    id v7 = [&stru_10060CB80 copy];
    id comparator = v6->_comparator;
    v6->_id comparator = v7;

    objc_storeStrong((id *)&v6->_scheduler, a3);
    uint64_t v9 = +[EFQueue priorityQueueWithComparator:v6->_comparator];
    queue = v6->_queue;
    v6->_queue = (EFQueue *)v9;
  }
  return v6;
}

- (void)_locked_reorderQueue
{
  v3 = [(EFQueue *)self->_queue drain];
  v4 = +[EFQueue priorityQueueWithComparator:self->_comparator];
  queue = self->_queue;
  self->_queue = v4;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[EFQueue enqueue:](self->_queue, "enqueue:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setComparator:(id)a3
{
  id v4 = a3;
  id v5 = (Block_layout *)[v4 copy];
  id v6 = v5;
  if (!v5) {
    id v5 = &stru_10060CB80;
  }
  uint64_t v9 = objc_retainBlock(v5);

  os_unfair_lock_lock(&self->_lock);
  if (self->_comparator != v9)
  {
    id v7 = objc_retainBlock(v9);
    id comparator = self->_comparator;
    self->_id comparator = v7;

    [(MFPriorityLoadingQueue *)self _locked_reorderQueue];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setItemHandler:(id)a3
{
}

- (void)dealloc
{
  [(MFPriorityLoadingQueue *)self _locked_cancelWorkItem];
  v3.receiver = self;
  v3.super_class = (Class)MFPriorityLoadingQueue;
  [(MFPriorityLoadingQueue *)&v3 dealloc];
}

- (void)_locked_cancelWorkItem
{
  if (self->_workItemCancelable)
  {
    objc_super v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      workItemCancelable = self->_workItemCancelable;
      int v5 = 134217984;
      id v6 = workItemCancelable;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#priorityLoadingQueue canceling token: %p", (uint8_t *)&v5, 0xCu);
    }

    [(EFCancelable *)self->_workItemCancelable cancel];
  }
}

- (void)immediatelyProcessQueue
{
}

- (void)_processQueue
{
  if (pthread_main_np() != 1)
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MFPriorityLoadingQueue.m" lineNumber:81 description:@"Current thread must be main"];
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_processQueue" object:0];
  os_unfair_lock_lock(&self->_lock);
  [(MFPriorityLoadingQueue *)self _locked_processQueue];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_locked_processQueue
{
  if (!self->_workItemCancelable)
  {
    objc_super v3 = [(EFQueue *)self->_queue dequeue];
    if (v3)
    {
      id v4 = objc_retainBlock(self->_itemHandler);
      scheduler = self->_scheduler;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001D76FC;
      v11[3] = &unk_10060CBA8;
      v11[4] = self;
      v11[5] = v3;
      id v6 = v4;
      id v12 = v6;
      id v7 = [(EFScheduler *)scheduler performCancelableBlock:v11];
      workItemCancelable = self->_workItemCancelable;
      self->_workItemCancelable = v7;

      uint64_t v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        long long v10 = self->_workItemCancelable;
        *(_DWORD *)buf = 138412546;
        v14 = v3;
        __int16 v15 = 2048;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#priorityLoadingQueue scheduled work %@ with token: %p", buf, 0x16u);
      }
    }
  }
}

- (void)_performItem:(id)a3 handler:(id)a4 cancelationToken:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id, id))a4;
  long long v10 = (EFCancelable *)a5;
  if ([(EFCancelable *)v10 isCanceled])
  {
    long long v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#priorityLoadingQueue token already canceled, not calling item handler: %p", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#priorityLoadingQueue calling item handler with token: %p", (uint8_t *)&v17, 0xCu);
    }

    v9[2](v9, v8, v10);
  }
  os_unfair_lock_lock(&self->_lock);
  long long v13 = MFLogGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    workItemCancelable = self->_workItemCancelable;
    int v17 = 134217984;
    v18 = workItemCancelable;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#priorityLoadingQueue finished work for token: %p", (uint8_t *)&v17, 0xCu);
  }

  __int16 v15 = self->_workItemCancelable;
  self->_workItemCancelable = 0;

  id v16 = [(EFQueue *)self->_queue count];
  os_unfair_lock_unlock(&self->_lock);
  if (v16) {
    [(MFPriorityLoadingQueue *)self _noteQueueNeedsProcessing];
  }
}

- (void)_noteQueueNeedsProcessing
{
  objc_super v3 = +[EFScheduler mainThreadScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D79D0;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)enqueue:(id)a3
{
  id v4 = a3;
  int v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#priorityLoadingQueue enquing work item: %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  [(EFQueue *)self->_queue enqueue:v4 replaceIfExists:1];
  os_unfair_lock_unlock(&self->_lock);
  [(MFPriorityLoadingQueue *)self _noteQueueNeedsProcessing];
}

- (id)dequeue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(EFQueue *)self->_queue dequeue];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)dequeueObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(EFQueue *)self->_queue dequeueObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)drain
{
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#priorityLoadingQueue removing all work items", v6, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v4 = [(EFQueue *)self->_queue drain];
  [(MFPriorityLoadingQueue *)self _locked_cancelWorkItem];
  os_unfair_lock_unlock(&self->_lock);

  return v4;
}

- (NSArray)allObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(EFQueue *)self->_queue allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)comparator
{
  return self->_comparator;
}

- (id)itemHandler
{
  return self->_itemHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemHandler, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_workItemCancelable, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end