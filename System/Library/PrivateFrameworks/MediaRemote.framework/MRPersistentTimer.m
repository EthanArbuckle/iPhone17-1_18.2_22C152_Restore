@interface MRPersistentTimer
+ (BOOL)usePersistentTimer;
- (BOOL)isValid;
- (MRPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6;
- (void)invalidate;
- (void)invalidateWithReason:(id)a3;
@end

@implementation MRPersistentTimer

- (MRPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MRPersistentTimer;
  v13 = [(MRPersistentTimer *)&v18 init];
  if (v13)
  {
    if ([(id)objc_opt_class() usePersistentTimer])
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F779E0]) initWithInterval:v10 name:v11 queue:v12 block:a3];
      pTimer = v13->_pTimer;
      v13->_pTimer = (MSVPersistentTimer *)v14;
    }
    else
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F77A30]) initWithInterval:0 repeats:v11 queue:v12 block:a3];
      pTimer = v13->_timer;
      v13->_timer = (MSVTimer *)v16;
    }
  }
  return v13;
}

- (void)invalidate
{
  [(MSVPersistentTimer *)self->_pTimer invalidate];
  timer = self->_timer;

  [(MSVTimer *)timer invalidate];
}

- (void)invalidateWithReason:(id)a3
{
  [(MSVPersistentTimer *)self->_pTimer invalidateWithReason:a3];
  timer = self->_timer;

  [(MSVTimer *)timer invalidate];
}

- (BOOL)isValid
{
  return ([(MSVPersistentTimer *)self->_pTimer isValid] & 1) != 0 || self->_timer != 0;
}

+ (BOOL)usePersistentTimer
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_pTimer, 0);
}

@end