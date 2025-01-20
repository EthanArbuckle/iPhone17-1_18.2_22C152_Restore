@interface NSURL
+ (id)jsa_queryStringForParameters:(id)a3 escapedValues:(BOOL)a4;
- (BOOL)jsa_isSafeExternalURL;
- (id)jsa_parametrize:(id)a3;
@end

@implementation NSURL

- (BOOL)jsa_isSafeExternalURL
{
  v2 = self;
  char v3 = NSURL.isSafeExternalURL.getter();

  return v3 & 1;
}

- (id)jsa_parametrize:(id)a3
{
  uint64_t v4 = sub_86800();
  v5 = self;
  NSURL.parametrize(_:)(v6, (Swift::OpaquePointer)v4);
  v8 = v7;

  swift_bridgeObjectRelease();

  return v8;
}

+ (id)jsa_queryStringForParameters:(id)a3 escapedValues:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = sub_86800();
  _sSo5NSURLC5JSAppE11queryString3for13escapedValuesSSSDys11AnyHashableVypG_SbtFZ_0(v5, v4);
  swift_bridgeObjectRelease();
  NSString v6 = sub_86830();
  swift_bridgeObjectRelease();

  return v6;
}

@end