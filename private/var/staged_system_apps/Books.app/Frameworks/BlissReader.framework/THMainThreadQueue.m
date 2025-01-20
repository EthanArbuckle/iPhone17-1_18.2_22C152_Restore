@interface THMainThreadQueue
+ (id)queue;
- (NSMutableSet)queuedOperations;
- (NSMutableSet)waitingBlockTimers;
- (THMainThreadQueue)init;
- (void)cancel;
- (void)dealloc;
- (void)enqueueMainThreadBlock:(id)a3;
- (void)enqueueMainThreadBlock:(id)a3 afterDelay:(double)a4;
- (void)p_dispatchTimedMainThreadBlock:(id)a3;
- (void)setQueuedOperations:(id)a3;
- (void)setWaitingBlockTimers:(id)a3;
@end

@implementation THMainThreadQueue

- (THMainThreadQueue)init
{
  v4.receiver = self;
  v4.super_class = (Class)THMainThreadQueue;
  v2 = [(THMainThreadQueue *)&v4 init];
  if (v2)
  {
    [(THMainThreadQueue *)v2 setWaitingBlockTimers:+[NSMutableSet set]];
    [(THMainThreadQueue *)v2 setQueuedOperations:+[NSMutableSet set]];
  }
  return v2;
}

+ (id)queue
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)dealloc
{
  [(THMainThreadQueue *)self cancel];
  [(THMainThreadQueue *)self setQueuedOperations:0];
  [(THMainThreadQueue *)self setWaitingBlockTimers:0];
  v3.receiver = self;
  v3.super_class = (Class)THMainThreadQueue;
  [(THMainThreadQueue *)&v3 dealloc];
}

- (void)cancel
{
  objc_sync_enter(self);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v3 = [(THMainThreadQueue *)self waitingBlockTimers];
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v6) invalidate];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v4);
  }
  [(NSMutableSet *)[(THMainThreadQueue *)self waitingBlockTimers] removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v7 = [(THMainThreadQueue *)self queuedOperations];
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) cancel];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v8);
  }
  [(NSMutableSet *)[(THMainThreadQueue *)self queuedOperations] removeAllObjects];
  objc_sync_exit(self);
}

- (void)enqueueMainThreadBlock:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THMainThreadQueue enqueueMainThreadBlock:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMainThreadQueue.m"] lineNumber:58 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"block"];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = sub_6B724;
  v15[4] = sub_6B734;
  v15[5] = self;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = sub_6B724;
  long long v13 = sub_6B734;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6B740;
  v8[3] = &unk_457F70;
  v8[5] = v15;
  v8[6] = &v9;
  v8[4] = a3;
  uint64_t v5 = +[NSBlockOperation blockOperationWithBlock:v8];
  v10[5] = (uint64_t)v5;
  objc_sync_enter(self);
  v6 = +[NSOperationQueue mainQueue];
  [(NSOperationQueue *)v6 addOperation:v10[5]];
  v7 = [(THMainThreadQueue *)self queuedOperations];
  [(NSMutableSet *)v7 addObject:v10[5]];
  objc_sync_exit(self);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v15, 8);
}

- (void)p_dispatchTimedMainThreadBlock:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_6B724;
  v7[4] = sub_6B734;
  v7[5] = self;
  id v5 = [a3 userInfo];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6B8E4;
  v6[3] = &unk_457F98;
  v6[5] = v5;
  v6[6] = v7;
  v6[4] = a3;
  [(THMainThreadQueue *)self enqueueMainThreadBlock:v6];

  _Block_object_dispose(v7, 8);
}

- (void)enqueueMainThreadBlock:(id)a3 afterDelay:(double)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THMainThreadQueue enqueueMainThreadBlock:afterDelay:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMainThreadQueue.m") lineNumber:95 description:@"invalid nil value for '%s'", "block"];
  }
  objc_sync_enter(self);
  id v7 = [a3 copy];
  [(NSMutableSet *)[(THMainThreadQueue *)self waitingBlockTimers] addObject:+[NSTimer scheduledTimerWithTimeInterval:self target:"p_dispatchTimedMainThreadBlock:" selector:v7 userInfo:0 repeats:a4]];

  objc_sync_exit(self);
}

- (NSMutableSet)queuedOperations
{
  return self->mQueuedOperations;
}

- (void)setQueuedOperations:(id)a3
{
}

- (NSMutableSet)waitingBlockTimers
{
  return self->mWaitingBlockTimers;
}

- (void)setWaitingBlockTimers:(id)a3
{
}

@end