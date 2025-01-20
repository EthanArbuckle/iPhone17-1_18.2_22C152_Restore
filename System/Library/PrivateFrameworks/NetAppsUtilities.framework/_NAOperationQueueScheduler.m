@interface _NAOperationQueueScheduler
- (_NAOperationQueueScheduler)initWithMaxConcurrentOperationCount:(unint64_t)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _NAOperationQueueScheduler

- (_NAOperationQueueScheduler)initWithMaxConcurrentOperationCount:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NAOperationQueueScheduler;
  v4 = [(_NAOperationQueueScheduler *)&v9 init];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v4->_queue;
    v4->_queue = v5;

    [(NSOperationQueue *)v4->_queue setMaxConcurrentOperationCount:a3];
    v7 = v4;
  }

  return v4;
}

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NACancelationToken);
  v6 = (void *)MEMORY[0x1E4F28B48];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke;
  v18[3] = &unk_1E6109D58;
  id v7 = v4;
  id v20 = v7;
  v8 = v5;
  v19 = v8;
  objc_super v9 = [v6 blockOperationWithBlock:v18];
  objc_initWeak(&location, v9);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke_2;
  v15 = &unk_1E6109B08;
  objc_copyWeak(&v16, &location);
  [(NACancelationToken *)v8 addCancelationBlock:&v12];
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v9, v12, v13, v14, v15);
  v10 = v8;
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(NACancelationToken);
  v8 = +[NAScheduler globalAsyncScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54___NAOperationQueueScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E610A2B0;
  objc_super v9 = v7;
  id v16 = v9;
  v17 = self;
  id v18 = v6;
  id v10 = v6;
  id v11 = (id)[v8 afterDelay:v15 performBlock:a3];

  uint64_t v12 = v18;
  uint64_t v13 = v9;

  return v13;
}

- (void).cxx_destruct
{
}

@end