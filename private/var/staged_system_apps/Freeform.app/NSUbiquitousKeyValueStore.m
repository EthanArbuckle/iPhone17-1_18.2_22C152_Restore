@interface NSUbiquitousKeyValueStore
+ (id)crl_encryptedKVS;
@end

@implementation NSUbiquitousKeyValueStore

+ (id)crl_encryptedKVS
{
  id v2 = [objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.freeform" type:2];

  return v2;
}

@end