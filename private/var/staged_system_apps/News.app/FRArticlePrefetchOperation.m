@interface FRArticlePrefetchOperation
- (BOOL)isEqual:(id)a3;
- (FCHeadlineProviding)headline;
- (FRArticlePrefetchOperation)initWithHeadline:(id)a3 component:(unint64_t)a4 priority:(unint64_t)a5;
- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4;
- (int64_t)compareExecutionOrder:(id)a3;
- (unint64_t)component;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)_doWorkIfNotCancelled:(id)a3;
- (void)cancel;
@end

@implementation FRArticlePrefetchOperation

- (FRArticlePrefetchOperation)initWithHeadline:(id)a3 component:(unint64_t)a4 priority:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FRArticlePrefetchOperation;
  v10 = [(FRArticlePrefetchOperation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_headline, a3);
    v11->_component = a4;
    v11->_priority = a5;
    v11->_cancellationLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    v6 = [(FRArticlePrefetchOperation *)self headline];
    v7 = [v5 headline];
    if ([v6 isEqual:v7])
    {
      id v8 = [(FRArticlePrefetchOperation *)self component];
      BOOL v9 = v8 == [v5 component];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(FRArticlePrefetchOperation *)self headline];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(FRArticlePrefetchOperation *)self component] ^ v4;

  return v5;
}

- (int64_t)compareExecutionOrder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(FRArticlePrefetchOperation *)self component]];
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 component]);
  id v7 = [v5 compare:v6];

  if (!v7)
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:[(FRArticlePrefetchOperation *)self priority]];
    BOOL v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 priority]);
    id v7 = [v8 compare:v9];
  }
  return (int64_t)v7;
}

- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v11 = "-[FRArticlePrefetchOperation executeWithArticleContentPool:completionHandler:]";
    __int16 v12 = 2080;
    objc_super v13 = "FRArticlePrefetchManager.m";
    __int16 v14 = 1024;
    int v15 = 308;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[FRArticlePrefetchOperation executeWithArticleContentPool:completionHandler:]");
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)_doWorkIfNotCancelled:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  BOOL cancelled = self->_cancelled;
  os_unfair_lock_unlock(&self->_cancellationLock);
  id v5 = v7;
  if (!cancelled)
  {
    id v6 = (*((void (**)(void))v7 + 2))();
    os_unfair_lock_lock_with_options();
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_cancellationLock);
      [v6 cancel];
    }
    else
    {
      objc_storeStrong((id *)&self->_childCancelHandler, v6);
      os_unfair_lock_unlock(&self->_cancellationLock);
    }

    id v5 = v7;
  }
}

- (void)cancel
{
  p_cancellationLock = &self->_cancellationLock;
  os_unfair_lock_lock_with_options();
  self->_BOOL cancelled = 1;
  id v4 = self->_childCancelHandler;
  os_unfair_lock_unlock(p_cancellationLock);
  [(FCOperationCanceling *)v4 cancel];
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (unint64_t)component
{
  return self->_component;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);

  objc_storeStrong((id *)&self->_childCancelHandler, 0);
}

@end