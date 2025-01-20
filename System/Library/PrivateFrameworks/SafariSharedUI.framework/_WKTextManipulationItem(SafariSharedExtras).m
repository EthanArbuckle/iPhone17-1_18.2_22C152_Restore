@interface _WKTextManipulationItem(SafariSharedExtras)
+ (id)safari_textManipulationItemWithTranslationResult:()SafariSharedExtras;
- (__CFString)safari_jsonRepresentation;
- (id)_safari_descriptionPreservingPrivacy:()SafariSharedExtras;
- (id)safari_debugDescription;
- (id)safari_dictionaryRepresentation;
- (id)safari_privacyPreservingDescription;
- (uint64_t)safari_isEqualToManipulationItem:()SafariSharedExtras includingContentEquality:;
- (void)safari_jsonRepresentation;
- (void)safari_updateTranslationRequest:()SafariSharedExtras;
@end

@implementation _WKTextManipulationItem(SafariSharedExtras)

+ (id)safari_textManipulationItemWithTranslationResult:()SafariSharedExtras
{
  id v3 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v4 = [v3 alignments];
    v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_68);

    id v6 = objc_alloc(MEMORY[0x1E4F467B0]);
    v7 = [v3 identifier];
    v8 = (void *)[v6 initWithIdentifier:v7 tokens:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)safari_updateTranslationRequest:()SafariSharedExtras
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [a1 identifier];
    [v4 setUniqueID:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [a1 tokens];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79___WKTextManipulationItem_SafariSharedExtras__safari_updateTranslationRequest___block_invoke;
    v8[3] = &unk_1E5E46EE0;
    v8[4] = a1;
    v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v8);

    [v4 setRanges:v7];
  }
}

- (uint64_t)safari_isEqualToManipulationItem:()SafariSharedExtras includingContentEquality:
{
  id v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v6)
    {
      v8 = [a1 identifier];
      v9 = [v6 identifier];
      if ([v8 isEqualToString:v9])
      {
        v10 = [a1 tokens];
        uint64_t v11 = [v10 count];
        v12 = [v6 tokens];
        uint64_t v13 = [v12 count];

        if (v11 == v13)
        {
          uint64_t v19 = 0;
          v20 = &v19;
          uint64_t v21 = 0x2020000000;
          char v22 = 1;
          v14 = [a1 tokens];
          v15 = [v6 tokens];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __105___WKTextManipulationItem_SafariSharedExtras__safari_isEqualToManipulationItem_includingContentEquality___block_invoke;
          v17[3] = &unk_1E5E46F08;
          char v18 = a4;
          v17[4] = &v19;
          objc_msgSend(v14, "safari_enumerateZippedValuesWithArray:withBlock:", v15, v17);

          uint64_t v7 = *((unsigned char *)v20 + 24) != 0;
          _Block_object_dispose(&v19, 8);
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [a1 isEqualToTextManipulationItem:v6 includingContentEquality:a4];
LABEL_9:

  return v7;
}

- (id)safari_debugDescription
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v2 = [a1 debugDescription];
  }
  else
  {
    v2 = objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 0);
  }
  return v2;
}

- (id)safari_privacyPreservingDescription
{
  if (objc_opt_respondsToSelector()) {
    [a1 description];
  }
  else {
  v2 = objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 1);
  }
  return v2;
}

- (id)_safari_descriptionPreservingPrivacy:()SafariSharedExtras
{
  v5 = [a1 tokens];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84___WKTextManipulationItem_SafariSharedExtras___safari_descriptionPreservingPrivacy___block_invoke;
  v16[3] = &__block_descriptor_33_e44___NSString_16__0___WKTextManipulationToken_8l;
  char v17 = a3;
  id v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v16);

  uint64_t v7 = NSString;
  v8 = [v6 componentsJoinedByString:@",\n\t"];
  v9 = [v7 stringWithFormat:@"[\n\t%@\n]", v8];

  v10 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v11 = objc_opt_class();
  v12 = [a1 identifier];
  uint64_t v13 = [v10 stringWithFormat:@"<%@: %p identifier = %@ tokens = %@>", v11, a1, v12, v9];;

  v14 = (void *)[v13 copy];
  return v14;
}

- (id)safari_dictionaryRepresentation
{
  v2 = [a1 tokens];
  id v3 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_40_0);

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [a1 identifier];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_1F031A860;
  }
  [v4 setObject:v7 forKeyedSubscript:@"paragraphIdentifier"];

  if (v3) {
    v8 = v3;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v4 setObject:v8 forKeyedSubscript:@"tokens"];
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v10 = [v9 BOOLForKey:*MEMORY[0x1E4F988E0]];

  if (v10)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isSubframe"));
    [v4 setObject:v11 forKeyedSubscript:@"isInSubframe"];

    v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isCrossSiteSubframe"));
    [v4 setObject:v12 forKeyedSubscript:@"isInCrossSiteSubframe"];
  }
  return v4;
}

- (__CFString)safari_jsonRepresentation
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = objc_msgSend(a1, "safari_dictionaryRepresentation");
  id v9 = 0;
  id v4 = [v2 dataWithJSONObject:v3 options:3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(_WKTextManipulationItem(SafariSharedExtras) *)v7 safari_jsonRepresentation];
    }
    id v6 = &stru_1F031A860;
  }

  return v6;
}

- (void)safari_jsonRepresentation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to generate JSON version of %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end