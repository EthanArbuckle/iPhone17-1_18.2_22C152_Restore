@interface RCOnce
- (BOOL)finished;
- (BOOL)hasBeenTriggered;
- (BOOL)trigger;
- (RCMutexLock)lock;
- (RCOnce)init;
- (RCOnce)initWithOptions:(unint64_t)a3;
- (void)executeOnce:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setLock:(id)a3;
@end

@implementation RCOnce

- (RCOnce)init
{
  return [(RCOnce *)self initWithOptions:0];
}

- (RCOnce)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCOnce;
  v4 = [(RCOnce *)&v9 init];
  v5 = v4;
  if ((v3 & 1) != 0 && v4)
  {
    v6 = objc_alloc_init(RCMutexLock);
    lock = v5->_lock;
    v5->_lock = v6;
  }
  return v5;
}

- (void)executeOnce:(id)a3
{
  v4 = (void (**)(void))a3;
  [(RCMutexLock *)self->_lock lock];
  if (![(RCOnce *)self finished])
  {
    if (v4) {
      v4[2]();
    }
    [(RCOnce *)self setFinished:1];
  }
  [(RCMutexLock *)self->_lock unlock];
}

- (BOOL)trigger
{
  [(RCMutexLock *)self->_lock lock];
  BOOL v3 = ![(RCOnce *)self finished];
  [(RCOnce *)self setFinished:1];
  [(RCMutexLock *)self->_lock unlock];
  return v3;
}

- (BOOL)hasBeenTriggered
{
  [(RCMutexLock *)self->_lock lock];
  BOOL v3 = [(RCOnce *)self finished];
  [(RCMutexLock *)self->_lock unlock];
  return v3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (RCMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end