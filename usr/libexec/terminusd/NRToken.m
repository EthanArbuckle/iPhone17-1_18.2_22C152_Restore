@interface NRToken
- (id)description;
@end

@implementation NRToken

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t type = self->_type;
  if (type == 1)
  {
    v5 = @"ProxyUsage";
  }
  else if (self->_type)
  {
    v5 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%u)", type];
  }
  else
  {
    v5 = @"Invalid";
  }
  uint64_t action = self->_action;
  if ((action - 50) >= 3) {
    v7 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%u)", action];
  }
  else {
    v7 = off_1001C5DA8[(action - 50)];
  }
  LogString = (void *)_NRKeyCreateLogString();
  id v9 = [v3 initWithFormat:@"NRToken[%@, %@, %@]", v5, v7, LogString];

  return v9;
}

@end