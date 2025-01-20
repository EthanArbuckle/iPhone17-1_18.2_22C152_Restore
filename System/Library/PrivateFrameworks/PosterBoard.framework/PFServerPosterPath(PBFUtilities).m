@interface PFServerPosterPath(PBFUtilities)
- (id)pbf_sha256Hash;
- (uint64_t)pbf_ambientConfiguration;
@end

@implementation PFServerPosterPath(PBFUtilities)

- (id)pbf_sha256Hash
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9433EF0]();
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [a1 instanceURL];
  v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:8 errorHandler:&__block_literal_global_111];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v11 hasDirectoryPath] & 1) == 0 && (objc_msgSend(v11, "pbf_isPosterSnapshot") & 1) == 0)
        {
          v12 = [v11 path];
          char v13 = [v12 containsString:@".com.apple.posterkit.provider.contents.configurableOptions.plist"];

          if ((v13 & 1) == 0) {
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  if ([v3 count])
  {
    v14 = [v3 allObjects];
    v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_117];

    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(*((void *)&v28 + 1) + 8 * j) options:8 error:0];
          v22 = objc_msgSend(v21, "pbf_sha256Hash");

          id v23 = v22;
          CC_SHA256_Update(&c, (const void *)[v23 UTF8String], objc_msgSend(v23, "length"));
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v18);
    }

    CC_SHA256_Final(md, &c);
    v24 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
    for (uint64_t k = 0; k != 32; ++k)
      objc_msgSend(v24, "appendFormat:", @"%02x", md[k]);
    v26 = [NSString stringWithString:v24];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (uint64_t)pbf_ambientConfiguration
{
  return [MEMORY[0x1E4F926B0] loadAmbientConfigurationForPath:a1 error:0];
}

@end