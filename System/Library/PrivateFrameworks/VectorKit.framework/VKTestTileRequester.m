@interface VKTestTileRequester
+ (unsigned)tileProviderIdentifier;
- (void)start;
@end

@implementation VKTestTileRequester

+ (unsigned)tileProviderIdentifier
{
  return *MEMORY[0x1E4F63EC8] + 1;
}

- (void)start
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v2 = [(GEOTileRequester *)self tileRequest];
  v3 = [v2 keyList];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = v4;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v22 = GEOResourceDevResourcesPath();
        v25 = [v22 stringByAppendingPathComponent:@"Tiles"];
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(_DWORD *)((unsigned char *)v6 + 6) & 0x3F);
        v8 = [v25 stringByAppendingPathComponent:v7];
        v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", ((*(void *)((char *)v6 + 1) >> 46) | (*(_DWORD *)((char *)v6 + 9) << 18)) & 0x3FFFFFF);
        v10 = [v8 stringByAppendingPathComponent:v9];
        v11 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(_DWORD *)((unsigned char *)v6 + 10) & 0x3FFFFFF);
        v12 = [v10 stringByAppendingPathComponent:v11];
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(unsigned __int16 *)((char *)v6 + 13) >> 2);
        v14 = [v12 stringByAppendingPathComponent:v13];
        v24 = [v14 stringByAppendingPathExtension:@"vmp4"];

        v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v24];
        v16 = [(GEOTileRequester *)self delegate];
        if (v15)
        {
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F64AB8]) initWithData:v15];
          objc_msgSend(v16, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", self, v17, 1, 1, 0, 0, *v6, v6[1], 0);
        }
        else
        {
          v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VKTestTileRequesterDomain" code:42 userInfo:0];
          objc_msgSend(v16, "tileRequester:receivedError:forKey:", self, v17, *v6, v6[1]);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }

  v18 = [(GEOTileRequester *)self delegate];
  [v18 tileRequesterFinished:self];
}

@end