@interface PPConfigStore
+ (id)defaultStore;
- (id)readableTrialTreatmentsMappingWithError:(id *)a3;
- (id)variantNameWithError:(id *)a3;
- (unint64_t)assetVersionWithError:(id *)a3;
@end

@implementation PPConfigStore

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PPConfigStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken2 != -1) {
    dispatch_once(&defaultStore__pasOnceToken2, block);
  }
  v2 = (void *)defaultStore__pasExprOnceResult_9191;
  return v2;
}

void __29__PPConfigStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_9191;
  defaultStore__pasExprOnceResult_9191 = v1;
}

- (id)readableTrialTreatmentsMappingWithError:(id *)a3
{
  v4 = +[PPConfigClient sharedInstance];
  v5 = [v4 readableTrialTreatmentsMappingWithError:a3];

  return v5;
}

- (id)variantNameWithError:(id *)a3
{
  v4 = +[PPConfigClient sharedInstance];
  v5 = [v4 variantNameWithError:a3];

  return v5;
}

- (unint64_t)assetVersionWithError:(id *)a3
{
  v4 = +[PPConfigClient sharedInstance];
  unint64_t v5 = [v4 assetVersionWithError:a3];

  return v5;
}

@end