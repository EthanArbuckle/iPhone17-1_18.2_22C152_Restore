@interface STTransportServiceMessageLedgerItemDeliveryStatus
+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStatus:(id)a3;
- (STTransportServiceMessageLedgerItemDeliveryStatus)init;
- (STTransportServiceMessageLedgerItemDeliveryStatus)initWithCoder:(id)a3;
- (STTransportServiceMessageLedgerItemDeliveryStatus)statusWithIncrementedAttempts;
- (STTransportServiceMessageLedgerItemDeliveryStatus)statusWithUpdatedState:(int64_t)a3;
- (id)_initWithState:(int64_t)a3 numberOfAttempts:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfAttempts;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTransportServiceMessageLedgerItemDeliveryStatus

- (STTransportServiceMessageLedgerItemDeliveryStatus)init
{
  return (STTransportServiceMessageLedgerItemDeliveryStatus *)[(STTransportServiceMessageLedgerItemDeliveryStatus *)self _initWithState:0 numberOfAttempts:0];
}

- (id)_initWithState:(int64_t)a3 numberOfAttempts:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STTransportServiceMessageLedgerItemDeliveryStatus;
  id result = [(STTransportServiceMessageLedgerItemDeliveryStatus *)&v7 init];
  *((void *)result + 1) = a3;
  *((void *)result + 2) = a4;
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = (char *)[(STTransportServiceMessageLedgerItemDeliveryStatus *)self state] - 1;
  if ((unint64_t)v4 > 4) {
    CFStringRef v5 = @"Pending";
  }
  else {
    CFStringRef v5 = *(&off_1002FE7A8 + (void)v4);
  }
  return +[NSString stringWithFormat:@"<%@ { State: %@, Attempts: %ld }>", v3, v5, [(STTransportServiceMessageLedgerItemDeliveryStatus *)self numberOfAttempts]];
}

- (STTransportServiceMessageLedgerItemDeliveryStatus)statusWithUpdatedState:(int64_t)a3
{
  if (+[STTransportServiceMessageLedgerItemDeliveryStatus _canTransitionFromState:[(STTransportServiceMessageLedgerItemDeliveryStatus *)self state] toState:a3])
  {
    id v5 = [[STTransportServiceMessageLedgerItemDeliveryStatus alloc] _initWithState:a3 numberOfAttempts:[(STTransportServiceMessageLedgerItemDeliveryStatus *)self numberOfAttempts]];
  }
  else
  {
    id v5 = 0;
  }
  return (STTransportServiceMessageLedgerItemDeliveryStatus *)v5;
}

- (STTransportServiceMessageLedgerItemDeliveryStatus)statusWithIncrementedAttempts
{
  id v2 = [[STTransportServiceMessageLedgerItemDeliveryStatus alloc] _initWithState:self->_state numberOfAttempts:(char *)[(STTransportServiceMessageLedgerItemDeliveryStatus *)self numberOfAttempts] + 1];
  return (STTransportServiceMessageLedgerItemDeliveryStatus *)v2;
}

+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      BOOL v4 = (unint64_t)a4 >= 6;
      unsigned int v5 = 11;
      goto LABEL_6;
    case 1:
      BOOL v4 = (unint64_t)a4 >= 6;
      unsigned int v5 = 28;
      goto LABEL_6;
    case 2:
      BOOL v4 = (unint64_t)a4 >= 6;
      unsigned int v5 = 24;
LABEL_6:
      BOOL v7 = (v5 >> a4) & 1;
      goto LABEL_8;
    case 3:
      LOBYTE(v7) = (a4 & 0x3F) == 0;
      BOOL v4 = (unint64_t)a4 >= 6;
LABEL_8:
      BOOL result = !v4 && v7;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t state = self->_state;
  int64_t numberOfAttempts = self->_numberOfAttempts;
  return [v4 _initWithState:state numberOfAttempts:numberOfAttempts];
}

- (STTransportServiceMessageLedgerItemDeliveryStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"state"];
  id v6 = [v4 decodeIntegerForKey:@"numberOfAttempts"];

  return (STTransportServiceMessageLedgerItemDeliveryStatus *)[(STTransportServiceMessageLedgerItemDeliveryStatus *)self _initWithState:v5 numberOfAttempts:v6];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"state"];
  [v5 encodeInteger:self->_numberOfAttempts forKey:@"numberOfAttempts"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STTransportServiceMessageLedgerItemDeliveryStatus *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STTransportServiceMessageLedgerItemDeliveryStatus *)self isEqualToStatus:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4 = (STTransportServiceMessageLedgerItemDeliveryStatus *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v5 = [(STTransportServiceMessageLedgerItemDeliveryStatus *)self state];
    if (v5 == (void *)[(STTransportServiceMessageLedgerItemDeliveryStatus *)v4 state])
    {
      id v6 = [(STTransportServiceMessageLedgerItemDeliveryStatus *)self numberOfAttempts];
      BOOL v7 = v6 == (id)[(STTransportServiceMessageLedgerItemDeliveryStatus *)v4 numberOfAttempts];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3 = [(STTransportServiceMessageLedgerItemDeliveryStatus *)self state];
  return [(STTransportServiceMessageLedgerItemDeliveryStatus *)self numberOfAttempts] ^ v3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)numberOfAttempts
{
  return self->_numberOfAttempts;
}

@end