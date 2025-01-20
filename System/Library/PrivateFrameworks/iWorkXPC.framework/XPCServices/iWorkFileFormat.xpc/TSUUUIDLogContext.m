@interface TSUUUIDLogContext
- (NSString)privateString;
- (NSString)publicString;
- (TSUUUIDLogContext)init;
@end

@implementation TSUUUIDLogContext

- (TSUUUIDLogContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)TSUUUIDLogContext;
  v2 = [(TSUUUIDLogContext *)&v8 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    publicString = v2->_publicString;
    v2->_publicString = (NSString *)v4;

    privateString = v2->_privateString;
    v2->_privateString = (NSString *)&stru_1001D3790;
  }
  return v2;
}

- (NSString)publicString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)privateString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateString, 0);
  objc_storeStrong((id *)&self->_publicString, 0);
}

@end