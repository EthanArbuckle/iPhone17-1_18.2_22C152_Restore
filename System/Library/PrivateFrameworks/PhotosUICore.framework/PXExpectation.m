@interface PXExpectation
- (NSDate)creationDate;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (PXExpectation)init;
- (PXExpectation)initWithLabelFormat:(id)a3;
- (PXExpectation)initWithQueue:(id)a3;
- (PXExpectation)initWithQueue:(id)a3 label:(id)a4;
- (PXExpectation)initWithQueue:(id)a3 labelFormat:(id)a4;
- (id)description;
- (id)handler;
- (void)_performHandlerWithSuccess:(BOOL)a3 error:(id)a4;
- (void)fulfill;
- (void)performWhenFulfilled:(id)a3 timeout:(double)a4;
- (void)setHandler:(id)a3;
@end

@implementation PXExpectation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXExpectation *)self label];
  v7 = (void *)[v3 initWithFormat:@"<%@: %p, label=%@>", v5, self, v6];

  return v7;
}

- (void)_performHandlerWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  v6 = [(PXExpectation *)self handler];
  if (v6)
  {
    [(PXExpectation *)self setHandler:0];
    ((void (**)(void, BOOL, id))v6)[2](v6, v4, v7);
  }
}

- (void)fulfill
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(PXExpectation *)self _performHandlerWithSuccess:1 error:0];
}

- (void)performWhenFulfilled:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = [(PXExpectation *)self handler];

  if (v8)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXExpectation.m" lineNumber:68 description:@"multiple handlers not supported yet"];
  }
  [(PXExpectation *)self setHandler:v7];
  objc_initWeak(&location, self);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PXExpectation_performWhenFulfilled_timeout___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v13, &location);
  block[4] = self;
  dispatch_after(v9, queue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __46__PXExpectation_performWhenFulfilled_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXExpectationErrorDomain", 1, @"%@ timed out", *(void *)(a1 + 32));
  [WeakRetained _performHandlerWithSuccess:0 error:v2];
}

- (PXExpectation)initWithQueue:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXExpectation;
  v8 = [(PXExpectation *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      dispatch_time_t v9 = (OS_dispatch_queue *)v6;
      queue = v8->_queue;
      v8->_queue = v9;
    }
    else
    {
      v11 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v12 = MEMORY[0x1E4F14428];
      queue = v8->_queue;
      v8->_queue = v11;
    }

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v8->_creationDate;
    v8->_creationDate = (NSDate *)v13;

    uint64_t v15 = [v7 copy];
    label = v8->_label;
    v8->_label = (NSString *)v15;
  }
  return v8;
}

- (PXExpectation)initWithQueue:(id)a3 labelFormat:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (objc_class *)NSString;
    id v8 = a4;
    a4 = (id)[[v7 alloc] initWithFormat:v8 arguments:&v11];
  }
  dispatch_time_t v9 = [(PXExpectation *)self initWithQueue:v6 label:a4];

  return v9;
}

- (PXExpectation)initWithQueue:(id)a3
{
  return [(PXExpectation *)self initWithQueue:a3 label:0];
}

- (PXExpectation)initWithLabelFormat:(id)a3
{
  if (a3)
  {
    BOOL v4 = (objc_class *)NSString;
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v9];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(PXExpectation *)self initWithQueue:0 label:v6];

  return v7;
}

- (PXExpectation)init
{
  return [(PXExpectation *)self initWithLabelFormat:0];
}

@end