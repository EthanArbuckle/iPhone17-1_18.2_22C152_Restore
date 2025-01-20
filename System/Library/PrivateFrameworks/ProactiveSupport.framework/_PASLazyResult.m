@interface _PASLazyResult
- (_PASLazyResult)initWithBlock:(id)a3;
- (_PASLazyResult)initWithResult:(id)a3;
- (id)_init;
- (id)_initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation _PASLazyResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong(&self->_data, 0);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASLazyResult;
  [(_PASLazyResult *)&v3 dealloc];
}

- (_PASLazyResult)initWithResult:(id)a3
{
  id v4 = a3;
  v5 = [[_PASLazyImmortalResult alloc] initWithResult:v4];

  return &v5->super;
}

- (_PASLazyResult)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [[_PASLazyImmortalResult alloc] _initWithBlock:v4];

  return v5;
}

- (id)_initWithBlock:(id)a3
{
  id v5 = a3;
  v6 = [(_PASLazyResult *)self _init];
  if (v6)
  {
    if (!v5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v6, @"_PASCachedResult.m", 39, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    v8 = (void *)v6[10];
    v6[10] = v7;
  }
  return v6;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)_PASLazyResult;
  v2 = [(_PASLazyResult *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

@end