@interface ContentItemMarkupGenerator
+ (BOOL)isDisplayableImageContentItem:(id)a3;
+ (BOOL)isPDFContentItem:(id)a3;
+ (OS_os_log)log;
+ (id)attachmentElementMarkupStringForContentItem:(id)a3;
+ (id)markupStringForDisplayForContentItem:(id)a3;
@end

@implementation ContentItemMarkupGenerator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ContentItemMarkupGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __33__ContentItemMarkupGenerator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

+ (id)markupStringForDisplayForContentItem:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 type];
  v6 = [v4 contentID];
  int v7 = [v4 isAvailableLocally];
  if (([a1 isDisplayableInlineContentItem:v4] & v7) == 1)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = *MEMORY[0x1E4F44450];
    if ([v5 conformsToType:*MEMORY[0x1E4F44450]])
    {
      [v8 setObject:@"rgb(254,254,254)" forKeyedSubscript:@"background-color"];
      [v8 setObject:@"none" forKeyedSubscript:@"-apple-color-filter"];
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
    {
      if ([v5 conformsToType:v9]) {
        [v8 setObject:@"100%" forKeyedSubscript:@"max-width"];
      }
      [v8 setObject:@"1px 0px 1px 0px" forKeyedSubscript:@"padding"];
    }
    v21[0] = v8;
    v20[0] = @"style";
    v20[1] = @"src";
    v10 = (void *)MFCreateURLForContentID();
    v20[2] = @"id";
    v21[1] = v10;
    v21[2] = v6;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

    v12 = [MEMORY[0x1E4F60D78] htmlSnippetWithTag:@"img" includeTrailingTag:0 attributes:v11];
  }
  else
  {
    v12 = [a1 attachmentElementMarkupStringForContentItem:v4];
  }
  v13 = +[ContentItemMarkupGenerator log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v4, "ef_publicDescription");
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1DDF5A000, v13, OS_LOG_TYPE_DEFAULT, "Content Item %{public}@ generated snippet: %@", (uint8_t *)&v16, 0x16u);
  }
  return v12;
}

+ (id)attachmentElementMarkupStringForContentItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[ContentItemMarkupGenerator log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 contentID];
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_1DDF5A000, v4, OS_LOG_TYPE_DEFAULT, "Start to set up markup string for content item: %@", buf, 0xCu);
  }
  v6 = [v3 displayName];
  int v7 = [v3 type];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [v3 contentID];
  [v8 setObject:v9 forKeyedSubscript:@"id"];

  v10 = [v3 contentID];
  [v8 setObject:v10 forKeyedSubscript:@"src"];

  if (v6) {
    v11 = v6;
  }
  else {
    v11 = @"---";
  }
  [v8 setObject:v11 forKeyedSubscript:@"title"];
  v12 = [v7 identifier];
  [v8 setObject:v12 forKeyedSubscript:@"type"];

  v13 = MFLookupLocalizedString();
  [v8 setObject:v13 forKeyedSubscript:@"_mf_downloadingStatus"];

  v14 = MFLookupLocalizedString();
  [v8 setObject:v14 forKeyedSubscript:@"_mf_downloadableStatus"];

  v15 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v8 setObject:v15 forKeyedSubscript:@"_mf_show_save"];

  if ([v3 isAvailableLocally])
  {
    [v8 setObject:&unk_1F39EEE68 forKeyedSubscript:@"_mf_state"];
    if (_os_feature_enabled_impl()) {
      [v8 setObject:@"save" forKeyedSubscript:@"save"];
    }
  }
  else
  {
    [v8 setObject:&unk_1F39EEE80 forKeyedSubscript:@"_mf_state"];
    int v16 = MFLookupLocalizedString();
    [v8 setObject:v16 forKeyedSubscript:@"action"];
  }
  if ([v7 conformsToType:*MEMORY[0x1E4F44578]]) {
    int v17 = 1;
  }
  else {
    int v17 = [v7 conformsToType:*MEMORY[0x1E4F44570]];
  }
  if ([v3 isAvailableLocally] & v17)
  {
    __int16 v18 = +[ContentItemMarkupGenerator log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(0, "ef_publicDescription");
      +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:](v19, v20, buf, v18);
    }
  }
  uint64_t v21 = [v3 storageByteCount];
  if ([v3 exchangeEventUID])
  {
    if ([v3 exchangeEventUID] != -1) {
      goto LABEL_27;
    }
    v22 = [MEMORY[0x1E4F28B50] mainBundle];
    v23 = [v22 localizedStringForKey:@"UNAVAILABLE" value:&stru_1F39E2A88 table:@"Main"];
    [v8 setObject:v23 forKeyedSubscript:@"subtitle"];
  }
  else if (v21)
  {
    v22 = [MEMORY[0x1E4F28B68] stringFromByteCount:v21 countStyle:0];
    [v8 setObject:v22 forKeyedSubscript:@"subtitle"];
  }
  else
  {
    uint64_t v24 = [v3 dataTransferByteCount];
    if (v24)
    {
      v22 = [MEMORY[0x1E4F28B68] stringFromByteCount:v24 countStyle:1];
      [v8 setObject:v22 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      v22 = +[ContentItemMarkupGenerator log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(v3, "ef_publicDescription");
        +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:v22];
      }
    }
  }

LABEL_27:
  v26 = [MEMORY[0x1E4F60D78] htmlSnippetWithTag:@"attachment" includeTrailingTag:1 attributes:v8];

  return v26;
}

+ (BOOL)isDisplayableImageContentItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 uniformTypeIdentifier];

  if (v4)
  {
    v5 = [v3 type];
    if (([v5 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
      || ([v5 conformsToType:*MEMORY[0x1E4F44460]] & 1) != 0
      || ([v5 conformsToType:*MEMORY[0x1E4F443D0]] & 1) != 0)
    {
      char v6 = 1;
    }
    else
    {
      char v6 = [v5 conformsToType:*MEMORY[0x1E4F44400]];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isPDFContentItem:(id)a3
{
  id v3 = [a3 type];
  char v4 = [v3 conformsToType:*MEMORY[0x1E4F44450]];

  return v4;
}

+ (void)attachmentElementMarkupStringForContentItem:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "content item %{public}@ had neither a storage or data transfer byte count", buf, 0xCu);
}

+ (void)attachmentElementMarkupStringForContentItem:(uint8_t *)buf .cold.2(__CFString *a1, void *a2, uint8_t *buf, os_log_t log)
{
  char v6 = @"non-extended-content-item";
  if (a1) {
    char v6 = a1;
  }
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = v6;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "error creating pass from content item %{public}@: %{public}@", buf, 0x16u);
}

@end