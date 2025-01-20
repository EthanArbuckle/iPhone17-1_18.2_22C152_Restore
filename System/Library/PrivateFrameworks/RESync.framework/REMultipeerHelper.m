@interface REMultipeerHelper
+ (Address)makeAddressFromPeerID:(SEL)a3;
@end

@implementation REMultipeerHelper

+ (Address)makeAddressFromPeerID:(SEL)a3
{
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a4 requiringSecureCoding:0 error:0];
  id v6 = [v5 base64EncodedStringWithOptions:0];
  v7 = (_anonymous_namespace_ *)[v6 UTF8String];
  re::DynamicString::DynamicString((re::DynamicString *)retstr, (const re::DynamicString *)&v9);
  if (v9 && (v10 & 1) != 0) {
    (*(void (**)(void))(*(void *)v9 + 40))();
  }

  return result;
}

@end