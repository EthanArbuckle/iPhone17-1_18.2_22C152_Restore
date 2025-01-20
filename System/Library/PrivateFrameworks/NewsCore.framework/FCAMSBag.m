@interface FCAMSBag
+ (id)bag;
@end

@implementation FCAMSBag

uint64_t __15__FCAMSBag_bag__block_invoke()
{
  self;
  v0 = (void *)MEMORY[0x1E4F4DBE0];
  v1 = [MEMORY[0x1E4F4DD18] bagKeySet];
  [v0 registerBagKeySet:v1 forProfile:@"AppleNews" profileVersion:@"1"];

  v2 = (void *)MEMORY[0x1E4F4DBE0];
  v3 = [MEMORY[0x1E4F4DDF0] bagKeySet];
  [v2 registerBagKeySet:v3 forProfile:@"AppleNews" profileVersion:@"1"];

  v4 = (void *)MEMORY[0x1E4F4DBE0];
  v5 = [MEMORY[0x1E4F4DDE0] bagKeySet];
  [v4 registerBagKeySet:v5 forProfile:@"AppleNews" profileVersion:@"1"];

  v6 = (void *)MEMORY[0x1E4F4DBE0];
  v7 = [MEMORY[0x1E4F4DE50] bagKeySet];
  [v6 registerBagKeySet:v7 forProfile:@"AppleNews" profileVersion:@"1"];

  v8 = (void *)MEMORY[0x1E4F4DBE0];
  v9 = [MEMORY[0x1E4F4DD58] bagKeySet];
  [v8 registerBagKeySet:v9 forProfile:@"AppleNews" profileVersion:@"1"];

  v10 = (void *)MEMORY[0x1E4F4DBE0];
  v11 = [MEMORY[0x1E4F4DD50] bagKeySet];
  [v10 registerBagKeySet:v11 forProfile:@"AppleNews" profileVersion:@"1"];

  v12 = (void *)MEMORY[0x1E4F4DBE0];
  v13 = [MEMORY[0x1E4F4DC48] bagKeySet];
  [v12 registerBagKeySet:v13 forProfile:@"AppleNews" profileVersion:@"1"];

  v14 = (void *)MEMORY[0x1E4F4DBE0];
  v15 = [MEMORY[0x1E4F4DE68] bagKeySet];
  [v14 registerBagKeySet:v15 forProfile:@"AppleNews" profileVersion:@"1"];

  v16 = (void *)MEMORY[0x1E4F4DBE0];
  v17 = [MEMORY[0x1E4F4DD48] bagKeySet];
  [v16 registerBagKeySet:v17 forProfile:@"AppleNews" profileVersion:@"1"];

  v18 = (void *)MEMORY[0x1E4F4DBE0];
  v19 = [MEMORY[0x1E4F4DCF0] bagKeySet];
  [v18 registerBagKeySet:v19 forProfile:@"AppleNews" profileVersion:@"1"];

  uint64_t v20 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"AppleNews" profileVersion:@"1"];
  uint64_t v21 = _MergedGlobals_212;
  _MergedGlobals_212 = v20;
  return MEMORY[0x1F41817F8](v20, v21);
}

+ (id)bag
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __15__FCAMSBag_bag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D1AA0 != -1) {
    dispatch_once(&qword_1EB5D1AA0, block);
  }
  v2 = (void *)_MergedGlobals_212;
  return v2;
}

@end