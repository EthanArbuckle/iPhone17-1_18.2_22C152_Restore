@interface _MFBlockIterationHandler
- (BOOL)handleMessage:(id)a3;
- (BOOL)shouldCancel;
- (_MFBlockIterationHandler)initWithBlock:(id)a3;
@end

@implementation _MFBlockIterationHandler

- (_MFBlockIterationHandler)initWithBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFBlockIterationHandler;
  v5 = [(_MFBlockIterationHandler *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v5->_cancelled = 0;
    uint64_t v8 = +[MFActivityMonitor currentMonitor];
    monitor = v5->_monitor;
    v5->_monitor = (MFActivityMonitor *)v8;
  }
  return v5;
}

- (BOOL)handleMessage:(id)a3
{
  id v4 = a3;
  if (![(_MFBlockIterationHandler *)self shouldCancel])
  {
    v5 = (void *)MEMORY[0x1AD0E3E00]();
    (*((void (**)(void))self->_block + 2))();
  }
  BOOL v6 = !self->_cancelled;

  return v6;
}

- (BOOL)shouldCancel
{
  return self->_cancelled || [(MFActivityMonitor *)self->_monitor shouldCancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong(&self->_block, 0);
}

@end