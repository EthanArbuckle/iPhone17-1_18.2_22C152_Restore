@interface NRDLDKeychainItemData
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NRDLDKeychainItemData

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NRDLDKeychainItemData;
  v4 = [(NRDLDKeychainItem *)&v9 copyWithZone:a3];
  if (self) {
    secretData = self->_secretData;
  }
  else {
    secretData = 0;
  }
  v6 = secretData;
  id v7 = [(NSData *)v6 copy];
  if (v4) {
    objc_storeStrong(v4 + 2, v7);
  }

  return v4;
}

@end