@interface WLKTransactionScope
- (NSString)identifier;
- (OS_os_transaction)transaction;
- (WLKTransactionScope)init;
- (WLKTransactionScope)initWithIdentifier:(id)a3;
- (WLKTransactionScope)initWithIdentifier:(id)a3 delay:(double)a4;
- (double)delay;
- (void)dealloc;
@end

@implementation WLKTransactionScope

- (WLKTransactionScope)initWithIdentifier:(id)a3 delay:(double)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKTransactionScope;
  v7 = [(WLKTransactionScope *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_delay = a4;
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v7);
    v10 = v9;
    if (v6)
    {
      v11 = [v9 stringByAppendingFormat:@" \"%@\"", v6];
    }
    else
    {
      v11 = v9;
    }
    identifier = v8->_identifier;
    v8->_identifier = v11;

    [v6 UTF8String];
    uint64_t v13 = os_transaction_create();
    transaction = v8->_transaction;
    v8->_transaction = (OS_os_transaction *)v13;
  }
  NSLog(&cfstr_Wlktransaction.isa, v8->_identifier);

  return v8;
}

- (WLKTransactionScope)initWithIdentifier:(id)a3
{
  return [(WLKTransactionScope *)self initWithIdentifier:a3 delay:5.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)dealloc
{
  v3 = [(WLKTransactionScope *)self transaction];
  v4 = [(WLKTransactionScope *)self identifier];
  [(WLKTransactionScope *)self delay];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__WLKTransactionScope_dealloc__block_invoke;
  block[3] = &unk_1E6209F68;
  id v11 = v4;
  id v12 = v3;
  id v7 = v3;
  id v8 = v4;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);

  v9.receiver = self;
  v9.super_class = (Class)WLKTransactionScope;
  [(WLKTransactionScope *)&v9 dealloc];
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)delay
{
  return self->_delay;
}

- (WLKTransactionScope)init
{
  return [(WLKTransactionScope *)self initWithIdentifier:0];
}

void __30__WLKTransactionScope_dealloc__block_invoke(uint64_t a1)
{
}

@end