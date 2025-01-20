@interface NRPowerAssertionActivityInfo
- (NSString)name;
- (NSUUID)uuid;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NRPowerAssertionActivityInfo

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end