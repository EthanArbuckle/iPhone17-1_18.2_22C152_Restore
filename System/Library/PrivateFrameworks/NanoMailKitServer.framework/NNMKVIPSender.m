@interface NNMKVIPSender
- (NSSet)emailAddresses;
- (NSString)displayName;
- (NSString)name;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setName:(id)a3;
@end

@implementation NNMKVIPSender

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end