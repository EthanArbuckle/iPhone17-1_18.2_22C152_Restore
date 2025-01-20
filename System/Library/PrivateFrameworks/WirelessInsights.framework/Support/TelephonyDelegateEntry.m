@interface TelephonyDelegateEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDelegate:(id)a3;
- (TelephonyStateDelegateProtocol)delegate;
- (dispatch_queue_s)queue;
- (void)setDelegate:(id)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
@end

@implementation TelephonyDelegateEntry

- (TelephonyStateDelegateProtocol)delegate
{
  return (TelephonyStateDelegateProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TelephonyDelegateEntry *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      BOOL v7 = 1;
    }
    else
    {
      v5 = [(TelephonyDelegateEntry *)self delegate];
      v6 = [(TelephonyDelegateEntry *)v4 delegate];
      BOOL v7 = v5 == v6;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)matchesDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TelephonyDelegateEntry *)self delegate];

  BOOL v6 = 0;
  if (v4 && v5)
  {
    id v7 = [(TelephonyDelegateEntry *)self delegate];
    BOOL v6 = v7 == v4;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (void).cxx_destruct
{
}

@end