@interface MogulPoint
- (BOOL)isExpired;
- (NSDateComponents)expiration;
- (NSNumber)balance;
- (NSString)name;
- (void)setBalance:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setIsExpired:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation MogulPoint

- (NSNumber)balance
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBalance:(id)a3
{
}

- (NSDateComponents)expiration
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExpiration:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isExpired
{
  return self->_isExpired;
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_expiration, 0);

  objc_storeStrong((id *)&self->_balance, 0);
}

@end