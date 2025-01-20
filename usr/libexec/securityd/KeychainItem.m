@interface KeychainItem
- (KeychainItem)initWithAccessGroup:(id)a3;
- (NSString)accessGroup;
- (void)setAccessGroup:(id)a3;
@end

@implementation KeychainItem

- (void).cxx_destruct
{
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (KeychainItem)initWithAccessGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeychainItem;
  v6 = [(KeychainItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessGroup, a3);
  }

  return v7;
}

@end