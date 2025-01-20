@interface MOEventBundleSourceTypes
+ (id)all;
@end

@implementation MOEventBundleSourceTypes

+ (id)all
{
  if (all_onceToken != -1) {
    dispatch_once(&all_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)all_allowableSourceTypes;

  return v2;
}

void __31__MOEventBundleSourceTypes_all__block_invoke(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  v5[0] = MOEventBundleSourceTypeContact[0];
  v5[1] = MOEventBundleSourceTypeMedia[0];
  v5[2] = MOEventBundleSourceTypePeopleContext[0];
  v5[3] = MOEventBundleSourceTypePhoto[0];
  v5[4] = MOEventBundleSourceTypeStateOfMind[0];
  v5[5] = MOEventBundleSourceTypeReflectionPrompt[0];
  v5[6] = MOEventBundleSourceTypeThirdPartyMedia[0];
  v5[7] = MOEventBundleSourceTypeVisitLocation[0];
  v5[8] = MOEventBundleSourceTypeActivity;
  v2 = +[NSArray arrayWithObjects:v5 count:9];
  id v3 = [v1 initWithArray:v2];
  v4 = (void *)all_allowableSourceTypes;
  all_allowableSourceTypes = (uint64_t)v3;
}

@end