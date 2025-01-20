@interface ACAccountStore(SMUPrivate)
+ (id)SMUACDAccountStoreDidChangeNotification;
@end

@implementation ACAccountStore(SMUPrivate)

+ (id)SMUACDAccountStoreDidChangeNotification
{
  return (id)*MEMORY[0x263EFB060];
}

@end