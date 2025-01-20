@interface CryptexPathMap
- (CryptexPathMap)init;
- (NSMutableDictionary)dict;
@end

@implementation CryptexPathMap

- (CryptexPathMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)CryptexPathMap;
  v2 = [(CryptexPathMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dict = v2->_dict;
    v2->_dict = v3;
  }
  return v2;
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void).cxx_destruct
{
}

@end