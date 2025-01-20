@interface _WKTextManipulationToken(SafariSharedExtras)
+ (id)safari_tokenWithTranslationAlignmentRepresentation:()SafariSharedExtras;
- (__CFString)safari_jsonRepresentation;
- (id)_safari_descriptionPreservingPrivacy:()SafariSharedExtras;
- (id)safari_debugDescription;
- (id)safari_dictionaryRepresentation;
- (id)safari_privacyPreservingDescription;
- (id)safari_privacyPreservingMetadata;
- (id)safari_translationRangeRepresentation;
- (uint64_t)safari_isEqualToManipulationToken:()SafariSharedExtras includingContentEquality:;
@end

@implementation _WKTextManipulationToken(SafariSharedExtras)

+ (id)safari_tokenWithTranslationAlignmentRepresentation:()SafariSharedExtras
{
  id v3 = a3;
  if (get_LTAlignmentClass())
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F467B8]);
    v5 = [v3 identifier];
    [v4 setIdentifier:v5];

    v6 = [v3 text];
    [v4 setContent:v6];

    objc_msgSend(v4, "setExcluded:", objc_msgSend(v3, "shouldTranslate") ^ 1);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)safari_translationRangeRepresentation
{
  id v2 = objc_alloc((Class)get_LTTranslationRangeClass());
  uint64_t v3 = [a1 identifier];
  id v4 = (void *)v3;
  v5 = &stru_1F031A860;
  if (v3) {
    v6 = (__CFString *)v3;
  }
  else {
    v6 = &stru_1F031A860;
  }
  uint64_t v7 = [a1 content];
  v8 = (void *)v7;
  if (v7) {
    v5 = (__CFString *)v7;
  }
  v9 = objc_msgSend(v2, "initWithIdentifier:text:shouldTranslate:", v6, v5, objc_msgSend(a1, "isExcluded") ^ 1);

  if (objc_opt_respondsToSelector())
  {
    v10 = objc_msgSend(a1, "safari_privacyPreservingMetadata");
    [v9 setMetaInfo:v10];
  }
  return v9;
}

- (uint64_t)safari_isEqualToManipulationToken:()SafariSharedExtras includingContentEquality:
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [a1 isEqualToTextManipulationToken:v6 includingContentEquality:a4];
  }
  else if (v6)
  {
    uint64_t v8 = [a1 identifier];
    v9 = [v6 identifier];
    int v10 = WBSIsEqual();

    LODWORD(v8) = [a1 isExcluded];
    int v11 = v8 ^ [v6 isExcluded];
    if (a4)
    {
      v12 = [a1 content];
      v13 = [v6 content];
      int v14 = WBSIsEqual();
    }
    else
    {
      int v14 = 1;
    }
    uint64_t v7 = v10 & ~v11 & v14;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)safari_debugDescription
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v2 = [a1 debugDescription];
  }
  else
  {
    id v2 = objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 0);
  }
  return v2;
}

- (id)safari_privacyPreservingDescription
{
  if (objc_opt_respondsToSelector()) {
    [a1 description];
  }
  else {
  id v2 = objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 1);
  }
  return v2;
}

- (id)_safari_descriptionPreservingPrivacy:()SafariSharedExtras
{
  v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [a1 identifier];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; identifier = %@; isExcluded = %i",
    v6,
    a1,
    v7,
  uint64_t v8 = [a1 isExcluded]);

  v9 = [a1 content];
  int v10 = v9;
  if (a3) {
    objc_msgSend(v8, "appendFormat:", @"; content length = %lu", objc_msgSend(v9, "length"));
  }
  else {
    [v8 appendFormat:@"; content = %@", v9];
  }

  [v8 appendString:@">"];
  int v11 = (void *)[v8 copy];

  return v11;
}

- (id)safari_privacyPreservingMetadata
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 userInfo];
    v12[0] = @"_WKTextManipulationTokenUserInfoTagNameKey";
    v12[1] = @"_WKTextManipulationTokenUserInfoRoleAttributeKey";
    v13[0] = @"tagName";
    v13[1] = @"roleAttribute";
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80___WKTextManipulationToken_SafariSharedExtras__safari_privacyPreservingMetadata__block_invoke;
    v9[3] = &unk_1E5E46FB0;
    id v10 = v2;
    id v11 = v4;
    id v5 = v4;
    id v6 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v7 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

- (id)safari_dictionaryRepresentation
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  v16[0] = @"identifier";
  uint64_t v3 = [a1 identifier];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F031A860;
  }
  v17[0] = v5;
  v16[1] = @"shouldTranslate";
  int v6 = [a1 isExcluded];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  if (v6) {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  v17[1] = v7;
  v16[2] = @"text";
  uint64_t v8 = [a1 content];
  v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1F031A860;
  }
  v17[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v12 = [v2 dictionaryWithDictionary:v11];

  v13 = objc_msgSend(a1, "safari_privacyPreservingMetadata");
  if ([v13 count]) {
    [v12 setObject:v13 forKeyedSubscript:@"metadata"];
  }
  int v14 = (void *)[v12 copy];

  return v14;
}

- (__CFString)safari_jsonRepresentation
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = objc_msgSend(a1, "safari_dictionaryRepresentation");
  id v9 = 0;
  id v4 = [v2 dataWithJSONObject:v3 options:3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    int v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(_WKTextManipulationItem(SafariSharedExtras) *)v7 safari_jsonRepresentation];
    }
    int v6 = &stru_1F031A860;
  }

  return v6;
}

@end