@interface PushNotificationRegisterBlock
- (NSNumber)accountIdentifier;
- (NSString)environmentName;
- (id)block;
- (void)setAccountIdentifier:(id)a3;
- (void)setBlock:(id)a3;
- (void)setEnvironmentName:(id)a3;
@end

@implementation PushNotificationRegisterBlock

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end