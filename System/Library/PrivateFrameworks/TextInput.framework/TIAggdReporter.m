@interface TIAggdReporter
+ (id)getDefaultSoftwareLayout;
+ (id)sharedAggdReporter;
+ (id)singletonInstance;
+ (void)setSharedAggdReporter:(id)a3;
- (int)commit;
@end

@implementation TIAggdReporter

- (int)commit
{
  return 0;
}

+ (id)getDefaultSoftwareLayout
{
  v2 = (void *)__testingInstance;
  if (__testingInstance)
  {
    if (objc_opt_respondsToSelector())
    {
      v2 = [(id)__testingInstance performSelector:sel_getDefaultSoftwareLayout];
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken != -1) {
    dispatch_once(&singletonInstance_onceToken, &__block_literal_global_659);
  }
  v2 = (void *)singletonInstance_singletonInstance;

  return v2;
}

uint64_t __35__TIAggdReporter_singletonInstance__block_invoke()
{
  singletonInstance_singletonInstance = objc_alloc_init(TIAggdReporter);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAggdReporter
{
  if (__testingInstance)
  {
    id v2 = (id)__testingInstance;
  }
  else
  {
    id v2 = +[TIAggdReporter singletonInstance];
  }

  return v2;
}

+ (void)setSharedAggdReporter:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    id v4 = v5;
  }
}

@end