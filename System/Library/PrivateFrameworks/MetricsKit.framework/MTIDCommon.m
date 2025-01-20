@interface MTIDCommon
+ (id)idOptions;
@end

@implementation MTIDCommon

+ (id)idOptions
{
  if (idOptions_onceToken != -1) {
    dispatch_once(&idOptions_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)idOptions_options;

  return v2;
}

void __23__MTIDCommon_idOptions__block_invoke()
{
  v2[9] = *MEMORY[0x263EF8340];
  v2[0] = @"date";
  v2[1] = @"syncWaitTime";
  v2[2] = @"idType";
  v2[3] = @"cachePolicy";
  v2[4] = @"reset";
  v2[5] = @"dsId";
  v2[6] = @"iTunesUserRequired";
  v2[7] = @"appBundleID";
  v2[8] = @"existingOnly";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:9];
  v1 = (void *)idOptions_options;
  idOptions_options = v0;
}

@end