@interface CRLMPSImageConversionStorage
- (CRLMPSImageConversionStorage)init;
- (NSMapTable)storage;
- (void)removeAllObjects;
@end

@implementation CRLMPSImageConversionStorage

- (CRLMPSImageConversionStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLMPSImageConversionStorage;
  v2 = [(CRLMPSImageConversionStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v3;
  }
  return v2;
}

- (void)removeAllObjects
{
  id v2 = [(CRLMPSImageConversionStorage *)self storage];
  [v2 removeAllObjects];
}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

@end