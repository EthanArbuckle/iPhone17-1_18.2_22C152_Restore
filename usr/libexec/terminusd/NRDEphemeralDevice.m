@interface NRDEphemeralDevice
- (id)description;
@end

@implementation NRDEphemeralDevice

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    v4 = self->super._nrUUID;
    connection = self->super._connection;
  }
  else
  {
    v4 = 0;
    connection = 0;
  }
  id v6 = [v3 initWithFormat:@"[NRDEphemeralDevices:%@,%@]", v4, connection];

  return v6;
}

@end