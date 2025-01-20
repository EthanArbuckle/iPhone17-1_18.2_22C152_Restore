@interface PPSFlatStorage
- (PPSFlatStorage)init;
- (void)setupStorageForEntryKey:(id)a3;
@end

@implementation PPSFlatStorage

- (PPSFlatStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPSFlatStorage;
  return [(PPSStorage *)&v3 init];
}

- (void)setupStorageForEntryKey:(id)a3
{
}

@end