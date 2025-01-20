@interface TSDMPSImageConversionStorage
- (NSMapTable)storage;
- (TSDMPSImageConversionStorage)init;
- (void)removeAllObjects;
@end

@implementation TSDMPSImageConversionStorage

- (TSDMPSImageConversionStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSDMPSImageConversionStorage;
  v2 = [(TSDMPSImageConversionStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v3;
  }
  return v2;
}

- (void)removeAllObjects
{
  id v2 = [(TSDMPSImageConversionStorage *)self storage];
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