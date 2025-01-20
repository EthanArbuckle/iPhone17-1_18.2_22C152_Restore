@interface MOEventBundleSourceTypes
+ (id)all;
@end

@implementation MOEventBundleSourceTypes

+ (id)all
{
  if (all_onceToken != -1) {
    dispatch_once(&all_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)all_allowableSourceTypes;
  return v2;
}

void __31__MOEventBundleSourceTypes_all__block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = MOEventBundleSourceTypeContact;
  v4[1] = MOEventBundleSourceTypeMedia;
  v4[2] = MOEventBundleSourceTypePeopleContext;
  v4[3] = MOEventBundleSourceTypePhoto;
  v4[4] = MOEventBundleSourceTypeStateOfMind;
  v4[5] = MOEventBundleSourceTypeReflectionPrompt;
  v4[6] = MOEventBundleSourceTypeThirdPartyMedia;
  v4[7] = MOEventBundleSourceTypeVisitLocation;
  v4[8] = MOEventBundleSourceTypeActivity;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)all_allowableSourceTypes;
  all_allowableSourceTypes = v2;
}

@end