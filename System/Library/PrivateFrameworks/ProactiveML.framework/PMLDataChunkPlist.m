@interface PMLDataChunkPlist
+ (id)chunkWithPlist:(id)a3;
+ (unsigned)dataChunkType;
- (id)plist;
@end

@implementation PMLDataChunkPlist

- (void).cxx_destruct
{
}

- (id)plist
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_parsed)
  {
    backingData = v2->super._backingData;
    id v10 = 0;
    uint64_t v4 = [MEMORY[0x263F08AC0] propertyListWithData:backingData options:0 format:0 error:&v10];
    id v5 = v10;
    id plist = v2->_plist;
    v2->_id plist = (id)v4;

    if (!v2->_plist)
    {
      v7 = PML_LogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_error_impl(&dword_2212A0000, v7, OS_LOG_TYPE_ERROR, "Error loading plist chunk: %@", buf, 0xCu);
      }
    }
  }
  id v8 = v2->_plist;
  objc_sync_exit(v2);

  return v8;
}

+ (id)chunkWithPlist:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v8 = 0;
  v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];
  }
  else
  {
    v6 = PML_LogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_2212A0000, v6, OS_LOG_TYPE_ERROR, "Error writing plist chunk: %@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (unsigned)dataChunkType
{
  return 1;
}

@end