@interface MKAPIServerDaemon
- (MKAPIServerDaemon)init;
- (OS_os_transaction)transaction;
- (void)cancel;
- (void)dealloc;
- (void)setTransaction:(id)a3;
@end

@implementation MKAPIServerDaemon

- (MKAPIServerDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKAPIServerDaemon;
  v2 = [(MKAPIServer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKPowerAssertion);
    power = v2->_power;
    v2->_power = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MKAPIServerDaemon *)self setTransaction:0];
  v3.receiver = self;
  v3.super_class = (Class)MKAPIServerDaemon;
  [(MKAPIServer *)&v3 dealloc];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)MKAPIServerDaemon;
  [(MKAPIServer *)&v4 cancel];
  [(MKAPIServerDaemon *)self setTransaction:0];
  power = self->_power;
  self->_power = 0;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_power, 0);
}

@end