@interface NFMutexLock
- (NFMutexLock)init;
- (NFMutexLock)initWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)lock;
- (void)performWithLockSync:(id)a3;
- (void)unlock;
@end

@implementation NFMutexLock

- (NFMutexLock)init
{
  return [(NFMutexLock *)self initWithOptions:0];
}

- (NFMutexLock)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)NFMutexLock;
  v4 = [(NFMutexLock *)&v6 init];
  if (v4)
  {
    v7.__sig = 0;
    *(void *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2 * (v3 & 1));
    pthread_mutex_init(&v4->_lock, &v7);
  }
  return v4;
}

- (void)performWithLockSync:(id)a3
{
  v4 = (void (**)(void))a3;
  [(NFMutexLock *)self lock];
  if (v4) {
    v4[2]();
  }
  [(NFMutexLock *)self unlock];
}

- (void)unlock
{
}

- (void)lock
{
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)NFMutexLock;
  [(NFMutexLock *)&v3 dealloc];
}

@end