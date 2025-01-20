@interface ICStoreFileAssetInfo
- (ICStoreFileAssetInfo)initWithAssetURL:(id)a3;
- (ICStoreFileAssetInfo)initWithFileAssetResponseDictionary:(id)a3;
- (ICStoreFinanceItemMetadata)metadata;
- (NSArray)fairPlayInfoList;
- (NSData)md5;
- (NSDictionary)responseDictionary;
- (NSString)downloadKey;
- (NSString)fileExtension;
- (NSURL)assetURL;
- (id)_metadataDictionary;
- (int64_t)expectedProtectionType;
- (int64_t)flavorType;
- (int64_t)protectionType;
- (unint64_t)fileSize;
- (void)setAssetURL:(id)a3;
- (void)setDownloadKey:(id)a3;
- (void)setExpectedProtectionType:(int64_t)a3;
- (void)setFairPlayInfoList:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFlavorType:(int64_t)a3;
- (void)setMd5:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation ICStoreFileAssetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_fairPlayInfoList, 0);
  objc_storeStrong((id *)&self->_downloadKey, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (void)setExpectedProtectionType:(int64_t)a3
{
  self->_expectedProtectionType = a3;
}

- (int64_t)expectedProtectionType
{
  return self->_expectedProtectionType;
}

- (void)setMd5:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void)setFileExtension:(id)a3
{
}

- (void)setFlavorType:(int64_t)a3
{
  self->_flavorType = a3;
}

- (void)setFairPlayInfoList:(id)a3
{
}

- (void)setDownloadKey:(id)a3
{
}

- (void)setAssetURL:(id)a3
{
}

- (id)_metadataDictionary
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"metadata"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)protectionType
{
  id v3 = [(ICStoreFileAssetInfo *)self fairPlayInfoList];
  uint64_t v4 = [v3 count];

  if (v4) {
    return self->_expectedProtectionType;
  }
  else {
    return 1;
  }
}

- (NSData)md5
{
  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"md5"];
    if (_NSIsNSString())
    {
      id v5 = v4;
      size_t v6 = (unint64_t)[v5 length] >> 1;
      id v7 = [v5 lowercaseString];
      uint64_t v8 = [v7 UTF8String];

      size_t v17 = v6;
      v9 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
      if ([v5 length] >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          int v11 = *(unsigned __int8 *)(v8 + v10);
          char v12 = v11 - 48;
          if ((v11 - 48) >= 0xA)
          {
            if ((v11 - 97) > 5)
            {
              v13 = [MEMORY[0x1E4F28B00] currentHandler];
              v14 = [NSString stringWithUTF8String:"NSData * _Nonnull MSVDataFromHexString(NSString * _Nonnull __strong)"];
              [v13 handleFailureInFunction:v14, @"NSString+MSVAdditions.h", 83, @"Passed non-hex string into MSVDataFromHexString: %@", v5 file lineNumber description];

              char v12 = 0;
            }
            else
            {
              char v12 = v11 - 87;
            }
          }
          v9[(unint64_t)v10 >> 1] += v12 << (4 * ((v10 + 1) & 1));
          ++v10;
        }
        while (v10 < [v5 length]);
      }
      v15 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v9 length:v17 freeWhenDone:1];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = self->_md5;
  }

  return v15;
}

- (ICStoreFinanceItemMetadata)metadata
{
  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"metadata"];
    if (_NSIsNSDictionary()) {
      id v5 = [[ICStoreFinanceItemMetadata alloc] initWithMetadataDictionary:v4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = self->_metadata;
  }

  return v5;
}

- (unint64_t)fileSize
{
  responseDictionary = self->_responseDictionary;
  if (!responseDictionary) {
    return self->_fileSize;
  }
  uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"fileSize"];
  if (!v4)
  {
    uint64_t v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"file-size"];
    if (!v4)
    {
      id v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"asset-info"];
      if (_NSIsNSDictionary())
      {
        uint64_t v4 = [v5 objectForKey:@"file-size"];
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }
  if (_NSIsNSNumber()) {
    unint64_t v6 = [v4 unsignedLongLongValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)flavorType
{
  responseDictionary = self->_responseDictionary;
  if (!responseDictionary) {
    return self->_flavorType;
  }
  uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"flavor"];
  if (_NSIsNSString() && [v4 length])
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"LWHQ"])
    {
      int64_t v6 = 102;
    }
    else if ([v5 isEqualToString:@"HQ"])
    {
      int64_t v6 = 101;
    }
    else if ([v5 isEqualToString:@"LW"])
    {
      int64_t v6 = 103;
    }
    else if ([v5 isEqualToString:@"SLW"])
    {
      int64_t v6 = 104;
    }
    else if ([v5 isEqualToString:@"1080p"])
    {
      int64_t v6 = 203;
    }
    else if (([v5 isEqualToString:@"720p"] & 1) != 0 {
           || ([v5 isEqualToString:@"hdmv"] & 1) != 0)
    }
    {
      int64_t v6 = 202;
    }
    else if ([v5 isEqualToString:@"480p"])
    {
      int64_t v6 = 201;
    }
    else if ([v5 isEqualToString:@"SDMV"])
    {
      int64_t v6 = 201;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSString)fileExtension
{
  responseDictionary = self->_responseDictionary;
  uint64_t v4 = self->_fileExtension;
  id v5 = (__CFString *)v4;
  if (responseDictionary)
  {
    if (![(NSString *)v4 length])
    {
      int64_t v6 = [(ICStoreFileAssetInfo *)self _metadataDictionary];
      id v7 = [v6 objectForKey:@"fileExtension"];

      if (_NSIsNSString() && [v7 length])
      {
        uint64_t v8 = v7;

        id v5 = v8;
      }
    }
    if (![(__CFString *)v5 length])
    {

      id v5 = @"m4a";
    }
  }

  return (NSString *)v5;
}

- (NSArray)fairPlayInfoList
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"sinfs"];
    if (_NSIsNSArray())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              char v12 = [ICStoreFileAssetFairPlayInfo alloc];
              v13 = -[ICStoreFileAssetFairPlayInfo initWithResponseSinfDictionary:](v12, "initWithResponseSinfDictionary:", v11, (void)v15);
              if (v13)
              {
                if (!v8) {
                  uint64_t v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
                }
                [(NSArray *)v8 addObject:v13];
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = self->_fairPlayInfoList;
  }

  return v8;
}

- (NSString)downloadKey
{
  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"downloadKey"];
    if (_NSIsNSString()
      && [v4 length]
      && ([v4 isEqualToString:@"null"] & 1) == 0)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = self->_downloadKey;
  }

  return v5;
}

- (NSURL)assetURL
{
  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    uint64_t v4 = [(NSDictionary *)responseDictionary objectForKey:@"URL"];
    if (_NSIsNSString() && [v4 length])
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = self->_assetURL;
  }

  return v5;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (ICStoreFileAssetInfo)initWithFileAssetResponseDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(ICStoreFileAssetInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (ICStoreFileAssetInfo)initWithAssetURL:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 absoluteString];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v9 = @"URL";
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    self = [(ICStoreFileAssetInfo *)self initWithFileAssetResponseDictionary:v6];

    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end