@interface MODatabaseUpgradeCompletionDelegate
- (MODatabaseUpgradeCompletionDelegate)initWithHandler:(id)a3;
- (id)handler;
- (void)didUpdateWithStatus:(unint64_t)a3 andError:(id)a4;
@end

@implementation MODatabaseUpgradeCompletionDelegate

- (MODatabaseUpgradeCompletionDelegate)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODatabaseUpgradeCompletionDelegate;
  v5 = [(MODatabaseUpgradeCompletionDelegate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D26067D0](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)didUpdateWithStatus:(unint64_t)a3 andError:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [(MODatabaseUpgradeCompletionDelegate *)self handler];

  if (v6)
  {
    v7 = [(MODatabaseUpgradeCompletionDelegate *)self handler];
    ((void (**)(void, unint64_t, id))v7)[2](v7, a3, v8);
  }
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
}

@end