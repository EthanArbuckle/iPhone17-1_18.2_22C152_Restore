@interface SVXQueuePerformer
+ (id)sharedMainQueuePerformer;
- (BOOL)_isExecutingInContext;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (SVXQueuePerformer)initWithIdentifier:(id)a3 qosClass:(unsigned int)a4 relativePriority:(int)a5 options:(unint64_t)a6;
- (id)_initWithIdentifier:(id)a3 queue:(id)a4 options:(unint64_t)a5;
- (void)_performBlock:(id)a3 withOptions:(unint64_t)a4;
- (void)_performBlockSync:(id)a3 withOptions:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 afterGroup:(id)a4;
- (void)performBlock:(id)a3 withOptions:(unint64_t)a4;
- (void)performBlockSync:(id)a3;
@end

@implementation SVXQueuePerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_isExecutingInContext
{
  return dispatch_get_specific((const void *)SVXQueuePerformerIdentityKey) == self;
}

- (void)_performBlockSync:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  v6 = (void (**)(void))a3;
  v9 = v6;
  if ((v4 & 2) != 0 && (BOOL v7 = [(SVXQueuePerformer *)self _isExecutingInContext], v6 = v9, v7))
  {
    v8 = (void *)MEMORY[0x223C65A20](v7, v9);
    v9[2]();
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_queue, v6);
  }
}

- (void)_performBlock:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  v6 = (void (**)(void))a3;
  v10 = v6;
  if ((v4 & 2) != 0 && (BOOL v7 = [(SVXQueuePerformer *)self _isExecutingInContext], v6 = v10, v7))
  {
    v8 = (void *)MEMORY[0x223C65A20](v7, v10);
    v10[2]();
  }
  else
  {
    queue = self->_queue;
    if (v4) {
      dispatch_sync(queue, v6);
    }
    else {
      dispatch_async(queue, v6);
    }
  }
}

- (id)_initWithIdentifier:(id)a3 queue:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXQueuePerformer;
  v10 = [(SVXQueuePerformer *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_options = a5;
  }

  return v10;
}

- (void)performBlockSync:(id)a3
{
  if (a3) {
    [(SVXQueuePerformer *)self _performBlockSync:a3 withOptions:self->_options];
  }
}

- (void)performBlock:(id)a3 afterGroup:(id)a4
{
  dispatch_block_t block = a3;
  v6 = a4;
  if (block)
  {
    if ((self->_options & 2) != 0 && !dispatch_group_wait(v6, 0)) {
      [(SVXQueuePerformer *)self _performBlock:block withOptions:self->_options];
    }
    else {
      dispatch_group_notify(v6, (dispatch_queue_t)self->_queue, block);
    }
  }
}

- (void)performBlock:(id)a3 withOptions:(unint64_t)a4
{
  if (a3) {
    [(SVXQueuePerformer *)self _performBlock:a3 withOptions:a4];
  }
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    dispatch_block_t block = v6;
    if (a4 == 0.0)
    {
      [(SVXQueuePerformer *)self _performBlock:v6 withOptions:self->_options];
    }
    else
    {
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      dispatch_after(v7, (dispatch_queue_t)self->_queue, block);
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)performBlock:(id)a3
{
  if (a3) {
    [(SVXQueuePerformer *)self _performBlock:a3 withOptions:self->_options];
  }
}

- (SVXQueuePerformer)initWithIdentifier:(id)a3 qosClass:(unsigned int)a4 relativePriority:(int)a5 options:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = (const char *)[v10 UTF8String];
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)a4, a5);

  objc_super v14 = dispatch_queue_create(v11, v13);
  dispatch_queue_set_specific(v14, (const void *)SVXQueuePerformerIdentityKey, self, 0);
  v15 = [(SVXQueuePerformer *)self _initWithIdentifier:v10 queue:v14 options:a6];

  return v15;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)SVXQueuePerformer;
  char v4 = [(SVXQueuePerformer *)&v10 description];
  queue = self->_queue;
  identifier = self->_identifier;
  dispatch_time_t v7 = SVXPerformingOptionsGetNames(self->_options);
  id v8 = (void *)[v3 initWithFormat:@"%@ {identifier = %@, queue = %@, options = (%@)}", v4, identifier, queue, v7];

  return (NSString *)v8;
}

+ (id)sharedMainQueuePerformer
{
  if (sharedMainQueuePerformer_onceToken != -1) {
    dispatch_once(&sharedMainQueuePerformer_onceToken, &__block_literal_global_6939);
  }
  v2 = (void *)sharedMainQueuePerformer_sharedMainQueuePerformer;

  return v2;
}

uint64_t __45__SVXQueuePerformer_sharedMainQueuePerformer__block_invoke()
{
  v0 = [_SVXMainQueuePerformer alloc];
  sharedMainQueuePerformer_sharedMainQueuePerformer = [(SVXQueuePerformer *)v0 _initWithIdentifier:@"Main Queue Performer" queue:MEMORY[0x263EF83A0] options:0];

  return MEMORY[0x270F9A758]();
}

@end