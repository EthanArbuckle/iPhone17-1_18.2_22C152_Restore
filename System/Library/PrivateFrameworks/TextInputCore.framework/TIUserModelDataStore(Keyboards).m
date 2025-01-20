@interface TIUserModelDataStore(Keyboards)
+ (id)sharedUserModelDataStore;
+ (id)singletonInstance;
+ (void)setSharedTIUserModelDataStore:()Keyboards;
@end

@implementation TIUserModelDataStore(Keyboards)

+ (id)singletonInstance
{
  if (singletonInstance_onceToken != -1) {
    dispatch_once(&singletonInstance_onceToken, &__block_literal_global_3685);
  }
  v0 = (void *)singletonInstance_singletonInstance;

  return v0;
}

+ (void)setSharedTIUserModelDataStore:()Keyboards
{
  id v4 = a3;
  if ((id)__testingInstance_3690 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_3690, a3);
    id v4 = v5;
  }
}

+ (id)sharedUserModelDataStore
{
  if (__testingInstance_3690)
  {
    id v0 = (id)__testingInstance_3690;
  }
  else
  {
    id v0 = [MEMORY[0x1E4FAE4F0] singletonInstance];
  }

  return v0;
}

@end