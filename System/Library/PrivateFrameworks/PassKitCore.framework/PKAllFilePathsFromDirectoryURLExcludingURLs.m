@interface PKAllFilePathsFromDirectoryURLExcludingURLs
@end

@implementation PKAllFilePathsFromDirectoryURLExcludingURLs

uint64_t ___PKAllFilePathsFromDirectoryURLExcludingURLs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = [v5 description];
      v9 = [v4 absoluteString];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_190E10000, v6, OS_LOG_TYPE_ERROR, "Error: Failed to read directory contents: %@ at url: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return 1;
}

@end