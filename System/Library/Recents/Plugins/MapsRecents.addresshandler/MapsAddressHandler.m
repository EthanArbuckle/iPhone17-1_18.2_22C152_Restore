@interface MapsAddressHandler
- (id)addressFromExternalAddress:(id)a3 kind:(id)a4;
- (id)externalAddressFromAddress:(id)a3 kind:(id)a4;
- (id)supportedAddressKinds;
- (id)syncKeyForAddress:(id)a3 kind:(id)a4;
@end

@implementation MapsAddressHandler

- (id)supportedAddressKinds
{
  return +[NSSet setWithObject:CRAddressKindMapLocation];
}

- (id)syncKeyForAddress:(id)a3 kind:(id)a4
{
  v4 = (const char *)[a3 UTF8String];
  CC_LONG v5 = strlen(v4);
  CC_SHA1(v4, v5, md);
  v6 = +[NSMutableString string];
  for (uint64_t i = 0; i != 20; ++i)
    [v6 appendString:*(&off_4060 + md[i])];

  return v6;
}

- (id)addressFromExternalAddress:(id)a3 kind:(id)a4
{
  return a3;
}

- (id)externalAddressFromAddress:(id)a3 kind:(id)a4
{
  return a3;
}

@end