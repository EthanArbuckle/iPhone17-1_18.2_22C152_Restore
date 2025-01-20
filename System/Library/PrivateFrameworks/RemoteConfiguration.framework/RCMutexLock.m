@interface RCMutexLock
- (RCMutexLock)init;
- (RCMutexLock)initWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)lock;
- (void)performWithLockSync:(id)a3;
- (void)unlock;
@end

@implementation RCMutexLock

- (RCMutexLock)init
{
  return [(RCMutexLock *)self initWithOptions:0];
}

- (RCMutexLock)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)RCMutexLock;
  v4 = [(RCMutexLock *)&v6 init];
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

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)RCMutexLock;
  [(RCMutexLock *)&v3 dealloc];
}

- (void)performWithLockSync:(id)a3
{
  v4 = (void (**)(void))a3;
  [(RCMutexLock *)self lock];
  if (v4) {
    v4[2]();
  }
  [(RCMutexLock *)self unlock];
}

- (void)lock
{
}

- (void)unlock
{
}

@end