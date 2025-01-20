@interface FMDBluetoothDiscoveryToken
- (BOOL)isDiscoveryActive;
- (BOOL)isEqual:(id)a3;
- (FMDBluetoothDiscoveryToken)init;
- (FMDBluetoothDiscoveryTokenDelegate)delegate;
- (NSDate)endDate;
- (NSString)description;
- (NSUUID)uuid;
- (id)tokenDiscoveryEnded;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setTokenDiscoveryEnded:(id)a3;
- (void)setUuid:(id)a3;
- (void)startDiscoveryForDuration:(double)a3;
- (void)stopDiscovery;
@end

@implementation FMDBluetoothDiscoveryToken

- (FMDBluetoothDiscoveryToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDBluetoothDiscoveryToken;
  v2 = [(FMDBluetoothDiscoveryToken *)&v5 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    [(FMDBluetoothDiscoveryToken *)v2 setUuid:v3];
  }
  return v2;
}

- (void)startDiscoveryForDuration:(double)a3
{
  v4 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  [(FMDBluetoothDiscoveryToken *)self setEndDate:v4];

  uint64_t v5 = [(FMDBluetoothDiscoveryToken *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 discoveryRequestedStart:self];
    }
  }

  _objc_release_x2();
}

- (void)stopDiscovery
{
  uint64_t v3 = [(FMDBluetoothDiscoveryToken *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 discoveryRequestedStop:self];
    }
  }

  _objc_release_x2();
}

- (BOOL)isDiscoveryActive
{
  uint64_t v3 = [(FMDBluetoothDiscoveryToken *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 isDiscoveryActive:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = [(FMDBluetoothDiscoveryToken *)v2 endDate];
  unsigned __int8 v4 = +[NSString stringWithFormat:@"%p-%@", v2, v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v4 = (FMDBluetoothDiscoveryToken *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(FMDBluetoothDiscoveryToken *)self hash];
      unint64_t v7 = [(FMDBluetoothDiscoveryToken *)v5 hash];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(FMDBluetoothDiscoveryToken *)self uuid];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)tokenDiscoveryEnded
{
  return self->_tokenDiscoveryEnded;
}

- (void)setTokenDiscoveryEnded:(id)a3
{
}

- (FMDBluetoothDiscoveryTokenDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMDBluetoothDiscoveryTokenDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_tokenDiscoveryEnded, 0);
}

@end