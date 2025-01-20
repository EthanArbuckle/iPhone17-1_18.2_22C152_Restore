@interface RKLinguisticDataProvider
- (NSMutableDictionary)polarityMapsByLanguageID;
- (RKLinguisticDataProvider)init;
- (void)setPolarityMapsByLanguageID:(id)a3;
@end

@implementation RKLinguisticDataProvider

- (RKLinguisticDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)RKLinguisticDataProvider;
  v2 = [(RKLinguisticDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    polarityMapsByLanguageID = v2->_polarityMapsByLanguageID;
    v2->_polarityMapsByLanguageID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSMutableDictionary)polarityMapsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolarityMapsByLanguageID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end