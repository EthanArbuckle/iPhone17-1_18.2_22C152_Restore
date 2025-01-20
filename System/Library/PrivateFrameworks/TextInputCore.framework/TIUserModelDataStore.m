@interface TIUserModelDataStore
@end

@implementation TIUserModelDataStore

uint64_t __52__TIUserModelDataStore_Keyboards__singletonInstance__block_invoke()
{
  uint64_t v0 = [(id)TI_KB_USER_DIRECTORY() stringByAppendingPathComponent:@"user_model_database.sqlite"];
  v1 = (void *)singletonInstance_path;
  singletonInstance_path = v0;

  singletonInstance_singletonInstance = [MEMORY[0x1E4FAE4F0] initializeDataStoreAtPath:singletonInstance_path];

  return MEMORY[0x1F41817F8]();
}

@end