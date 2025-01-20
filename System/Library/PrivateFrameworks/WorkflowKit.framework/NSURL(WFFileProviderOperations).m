@interface NSURL(WFFileProviderOperations)
- (id)wf_fileProviderItem;
@end

@implementation NSURL(WFFileProviderOperations)

- (id)wf_fileProviderItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F25D38] defaultManager];
  id v9 = 0;
  v3 = [v2 itemForURL:a1 error:&v9];
  id v4 = v9;

  if (v3 && ([v3 fileURL], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = v3;
  }
  else
  {
    v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[NSURL(WFFileProviderOperations) wf_fileProviderItem]";
      __int16 v12 = 2112;
      uint64_t v13 = a1;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s URL: %@ does not require file provider options due no item", buf, 0x16u);
    }

    id v6 = 0;
  }

  return v6;
}

@end