@interface NSURL(NSItemProviderUIKitAdditions)
+ (uint64_t)_allowsCreationOfFileURLFromItemProvider;
+ (void)_setAllowsCreationOfFileURLFromItemProvider:()NSItemProviderUIKitAdditions;
- (id)_NSItemProviderArchive_customArchiveDictionary;
- (id)_title;
- (void)_NSItemProviderArchive_didUnarchiveCustomDictionary:()NSItemProviderUIKitAdditions;
- (void)_setTitle:()NSItemProviderUIKitAdditions;
@end

@implementation NSURL(NSItemProviderUIKitAdditions)

+ (uint64_t)_allowsCreationOfFileURLFromItemProvider
{
  if (qword_1EB2620E0 != -1) {
    dispatch_once(&qword_1EB2620E0, &__block_literal_global_139_1);
  }
  return _MergedGlobals_1174;
}

+ (void)_setAllowsCreationOfFileURLFromItemProvider:()NSItemProviderUIKitAdditions
{
  if (qword_1EB2620E0 != -1) {
    dispatch_once(&qword_1EB2620E0, &__block_literal_global_139_1);
  }
  _MergedGlobals_1174 = a3;
}

- (id)_title
{
  v1 = objc_getAssociatedObject(a1, &kTitleObjKey);
  v2 = (void *)[v1 copy];

  return v2;
}

- (void)_setTitle:()NSItemProviderUIKitAdditions
{
}

- (id)_NSItemProviderArchive_customArchiveDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [a1 _title];

  if (v3)
  {
    v4 = [a1 _title];
    [v2 setObject:v4 forKeyedSubscript:@"title"];
  }
  return v2;
}

- (void)_NSItemProviderArchive_didUnarchiveCustomDictionary:()NSItemProviderUIKitAdditions
{
  id v4 = [a3 objectForKeyedSubscript:@"title"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 _setTitle:v4];
    }
  }
}

@end