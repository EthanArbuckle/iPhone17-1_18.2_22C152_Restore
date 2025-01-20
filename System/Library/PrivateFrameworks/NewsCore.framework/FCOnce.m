@interface FCOnce
- (BOOL)hasBeenTriggered;
- (BOOL)trigger;
- (FCOnce)init;
- (FCOnce)initWithOptions:(unint64_t)a3;
- (void)executeOnce:(id)a3;
@end

@implementation FCOnce

- (void).cxx_destruct
{
}

- (BOOL)trigger
{
  [(NFUnfairLock *)self->_lock lock];
  BOOL v3 = !self->_finished;
  self->_finished = 1;
  [(NFUnfairLock *)self->_lock unlock];
  return v3;
}

- (FCOnce)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCOnce;
  v4 = [(FCOnce *)&v9 init];
  v5 = v4;
  if ((v3 & 1) != 0 && v4)
  {
    v6 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    lock = v5->_lock;
    v5->_lock = v6;
  }
  return v5;
}

- (void)executeOnce:(id)a3
{
  v4 = (void (**)(void))a3;
  [(NFUnfairLock *)self->_lock lock];
  if (!self->_finished)
  {
    if (v4) {
      v4[2]();
    }
    self->_finished = 1;
  }
  [(NFUnfairLock *)self->_lock unlock];
}

- (FCOnce)init
{
  return [(FCOnce *)self initWithOptions:0];
}

- (BOOL)hasBeenTriggered
{
  [(NFUnfairLock *)self->_lock lock];
  BOOL finished = self->_finished;
  [(NFUnfairLock *)self->_lock unlock];
  return finished;
}

@end