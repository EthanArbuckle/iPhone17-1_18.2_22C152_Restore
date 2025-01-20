@interface RMSDAAPParser
+ (id)objectWithData:(id)a3;
+ (id)objectWithData:(id)a3 error:(id *)a4;
+ (id)sharedInstance;
+ (id)typeForDRCPValueType:(int)a3;
- (id)parseBrowseResults:(const char *)a3 length:(unsigned int)a4;
- (id)parseContentCodes:(const char *)a3 length:(unsigned int)a4;
- (id)parseContentCollectionDict:(const char *)a3 length:(unsigned int)a4;
- (id)parseControlPromptCollection:(const char *)a3 length:(unsigned int)a4;
- (id)parseControlPromptResponse:(const char *)a3 length:(unsigned int)a4;
- (id)parseDACPPropertyResponse:(const char *)a3 length:(unsigned int)a4;
- (id)parseGetSpeakersResponse:(const char *)a3 length:(unsigned int)a4;
- (id)parseListingCollection:(const char *)a3 length:(unsigned int)a4 capacity:(int)a5 sectionHeaders:(id *)a6;
- (id)parseListingHeader:(const char *)a3 length:(unsigned int)a4;
- (id)parseListingItem:(const char *)a3 length:(unsigned int)a4;
- (id)parseLogin:(const char *)a3 length:(unsigned int)a4;
- (id)parseMACAddressListing:(const char *)a3 length:(unsigned int)a4;
- (id)parseQueueSectionItems:(const char *)a3 length:(unsigned int)a4;
- (id)parseServerInfo:(const char *)a3 length:(unsigned int)a4;
- (id)parseUTF8String:(const char *)a3 length:(unsigned int)a4;
- (id)parseUnicodeCharacter:(const char *)a3 length:(unsigned int)a4;
- (id)parseXMLContent:(const char *)a3 length:(unsigned int)a4;
- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5;
- (void)enumerateDAAPChunksInBytes:(const char *)a3 length:(unsigned int)a4 usingBlock:(id)a5;
- (void)setBool:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setDate:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setFloat32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setSInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setSInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setString:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt64:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
- (void)setUInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6;
@end

@implementation RMSDAAPParser

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__RMSDAAPParser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __31__RMSDAAPParser_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)objectWithData:(id)a3
{
  id v7 = 0;
  v3 = [a1 objectWithData:a3 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    v5 = RMSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[RMSDAAPParser objectWithData:](v4, v5);
    }
  }
  return v3;
}

+ (id)objectWithData:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[RMSDAAPParser sharedInstance];
  unint64_t v7 = [v5 length];
  if (v7 <= 7)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Response did not include a body (only %zd bytes returned).", v7);
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24[0] = v8;
    v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v11 = v9;
    uint64_t v12 = 1;
LABEL_7:
    *a4 = [v11 errorWithDomain:@"RSDAAPParserErrorDomain" code:v12 userInfo:v10];

    a4 = 0;
    goto LABEL_9;
  }
  v13 = (unsigned int *)[v5 bytes];
  unint64_t v14 = bswap64(v13[1] | ((unint64_t)*v13 << 32));
  unint64_t v15 = HIDWORD(v14);
  unint64_t v16 = v7 - 8;
  if (HIDWORD(v14) > v7 - 8)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v17 = NSString;
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", ((int)v14 >> 24), ((int)(v14 << 8) >> 24), ((__int16)v14 >> 8), (char)v14);
    objc_msgSend(v17, "stringWithFormat:", @"Expected body length (%d bytes) exceeds received body length (%zd bytes); response code '%@'.",
      v15,
      v16,
    v8 = v18);

    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08608];
    v22 = v8;
    v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v11 = v19;
    uint64_t v12 = 2;
    goto LABEL_7;
  }
  objc_msgSend(v6, "processResponseCode:bytes:length:");
  a4 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return a4;
}

- (id)parseUTF8String:(const char *)a3 length:(unsigned int)a4
{
  if (a4)
  {
    unsigned int v5 = a4 - 1;
    if (a4 == 1 && !*a3)
    {
      unint64_t v7 = &stru_26F083878;
    }
    else
    {
      if (a3[v5]) {
        uint64_t v6 = a4;
      }
      else {
        uint64_t v6 = v5;
      }
      unint64_t v7 = (__CFString *)[[NSString alloc] initWithBytes:a3 length:v6 encoding:4];
    }
  }
  else
  {
    unint64_t v7 = &stru_26F083878;
  }
  return v7;
}

- (id)parseUnicodeCharacter:(const char *)a3 length:(unsigned int)a4
{
  if (a4 == 2)
  {
    unsigned int v5 = (void *)[[NSString alloc] initWithBytes:a3 length:2 encoding:2415919360];
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5;
}

- (id)parseXMLContent:(const char *)a3 length:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
    id v9 = 0;
    unsigned int v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v9];
    id v6 = v9;
    if (v6)
    {
      unint64_t v7 = RMSLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RMSDAAPParser parseXMLContent:length:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5;
}

- (void)setBool:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  switch(a4)
  {
    case 1u:
      int v11 = *(unsigned __int8 *)a3;
      goto LABEL_8;
    case 2u:
      int v11 = *(unsigned __int16 *)a3;
      goto LABEL_8;
    case 4u:
      int v11 = *(_DWORD *)a3;
LABEL_8:
      BOOL v13 = v11 == 0;
      goto LABEL_10;
    case 8u:
      BOOL v13 = *(void *)a3 == 0;
LABEL_10:
      uint64_t v14 = !v13;
      unint64_t v15 = [NSNumber numberWithBool:v14];
      [v9 setObject:v15 forKeyedSubscript:v10];

      break;
    default:
      uint64_t v12 = RMSLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RMSDAAPParser setBool:size:inDict:forKey:]();
      }

      break;
  }
}

- (void)setSInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 1)
  {
    int v11 = [NSNumber numberWithChar:*a3];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setSInt8:size:inDict:forKey:]();
    }
  }
}

- (void)setUInt8:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 1)
  {
    int v11 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a3];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setUInt8:size:inDict:forKey:]();
    }
  }
}

- (void)setSInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 2)
  {
    int v11 = [NSNumber numberWithShort:((int)bswap32(*(unsigned __int16 *)a3) >> 16)];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setSInt16:size:inDict:forKey:]();
    }
  }
}

- (void)setUInt16:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 2)
  {
    int v11 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)a3) >> 16];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setUInt16:size:inDict:forKey:]();
    }
  }
}

- (void)setDate:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 4)
  {
    int v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a3)];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setDate:size:inDict:forKey:]();
    }
  }
}

- (void)setUInt32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 4)
  {
    int v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a3)];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setUInt32:size:inDict:forKey:]();
    }
  }
}

- (void)setFloat32:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 4)
  {
    LODWORD(v11) = *(_DWORD *)a3;
    uint64_t v12 = [NSNumber numberWithFloat:v11];
    [v9 setObject:v12 forKeyedSubscript:v10];
  }
  else
  {
    BOOL v13 = RMSLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setFloat32:size:inDict:forKey:]();
    }
  }
}

- (void)setUInt64:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4 == 8)
  {
    double v11 = [NSNumber numberWithUnsignedLongLong:bswap64(*(void *)a3)];
    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMSDAAPParser setUInt64:size:inDict:forKey:]();
    }
  }
}

- (void)setString:(const char *)a3 size:(unsigned int)a4 inDict:(id)a5 forKey:(id)a6
{
  if (a4)
  {
    uint64_t v7 = *(void *)&a4;
    id v10 = a6;
    id v11 = a5;
    id v12 = [(RMSDAAPParser *)self parseUTF8String:a3 length:v7];
    [v11 setValue:v12 forKey:v10];
  }
}

- (void)enumerateDAAPChunksInBytes:(const char *)a3 length:(unsigned int)a4 usingBlock:(id)a5
{
  if (a4)
  {
    unsigned int v6 = a4;
    do
    {
      uint64_t v7 = a3 + 8;
      unint64_t v8 = bswap64(*((unsigned int *)a3 + 1) | ((unint64_t)*(unsigned int *)a3 << 32));
      (*((void (**)(id, unint64_t, const char *))a5 + 2))(a5, v8, a3 + 8);
      a3 = &v7[HIDWORD(v8)];
      unsigned int v9 = v6 - HIDWORD(v8);
      unsigned int v6 = v6 - HIDWORD(v8) - 8;
    }
    while (v9 != 8);
  }
}

- (id)parseMACAddressListing:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__RMSDAAPParser_parseMACAddressListing_length___block_invoke;
  v9[3] = &unk_264E74608;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__RMSDAAPParser_parseMACAddressListing_length___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (a2 == 1836281185)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v5 = [NSNumber numberWithUnsignedLongLong:bswap64(*a3)];
    [v3 addObject:v5];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "unknownChunk:", a2, a3);
  }
}

- (id)parseServerInfo:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__RMSDAAPParser_parseServerInfo_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __40__RMSDAAPParser_parseServerInfo_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = HIDWORD(a2);
  if ((int)a2 <= 1836278123)
  {
    if ((int)a2 <= 1634956132)
    {
      if ((int)a2 <= 1634030421)
      {
        if ((int)a2 > 1634028880)
        {
          if (a2 != 1634028881)
          {
            if (a2 == 1634030412 || a2 == 1634030418) {
              return;
            }
            goto LABEL_115;
          }
          v20 = *(void **)(a1 + 32);
          uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
          v22 = @"com.apple.itunes.playlist-contains-media-type";
          goto LABEL_99;
        }
        if (a2 != 1634027088)
        {
          if (a2 == 1634027090)
          {
            v20 = *(void **)(a1 + 32);
            uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
            v22 = @"com.apple.itunes.supports-fprap";
LABEL_99:
            uint64_t v26 = *(void *)(v21 + 40);
            [v20 setBool:a3 size:v4 inDict:v26 forKey:v22];
            return;
          }
          goto LABEL_115;
        }
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        v19 = @"com.apple.itunes.req-fplay";
        goto LABEL_108;
      }
      if ((int)a2 > 1634030705)
      {
        if (a2 == 1634030706) {
          return;
        }
        if (a2 != 1634759279)
        {
          if (a2 != 1634953074) {
            goto LABEL_115;
          }
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          unint64_t v16 = @"daap.supportsgroups";
          goto LABEL_80;
        }
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"daap.protocolversion";
        goto LABEL_112;
      }
      if (a2 != 1634030422)
      {
        if (a2 != 1634030424) {
          goto LABEL_115;
        }
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
        id v7 = @"com.apple.itunes.supportedextensions";
LABEL_64:
        uint64_t v23 = *(void *)(v6 + 40);
        [v5 setUInt64:a3 size:v4 inDict:v23 forKey:v7];
        return;
      }
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v13 = @"com.apple.itunes.music-sharing-version";
LABEL_112:
      uint64_t v28 = *(void *)(v12 + 40);
      [v11 setUInt32:a3 size:v4 inDict:v28 forKey:v13];
      return;
    }
    if ((int)a2 <= 1685484664)
    {
      if ((int)a2 <= 1635018083)
      {
        if (a2 == 1634956133)
        {
          v20 = *(void **)(a1 + 32);
          uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
          v22 = @"daap.supportssetproperty";
          goto LABEL_99;
        }
        if (a2 != 1635013462) {
          goto LABEL_115;
        }
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"Client-ATV-Sharing-Version";
        goto LABEL_112;
      }
      if (a2 == 1635018084)
      {
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        unint64_t v16 = @"daap.supportsextradata";
LABEL_80:
        uint64_t v24 = *(void *)(v15 + 40);
        [v14 setUInt16:a3 size:v4 inDict:v24 forKey:v16];
        return;
      }
      if (a2 == 1667585615)
      {
        v20 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
        v22 = @"com.apple.itunes.jukebox-voting-enabled";
        goto LABEL_99;
      }
      if (a2 != 1667585869) {
        goto LABEL_115;
      }
      unint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = @"com.apple.itunes.jukebox-welcome-message";
      goto LABEL_91;
    }
    if ((int)a2 > 1835885675)
    {
      switch(a2)
      {
        case 0x6D6D646C:
          unint64_t v8 = *(void **)(a1 + 32);
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v10 = @"arcp.model";
          break;
        case 0x6D6D6E66:
          unint64_t v8 = *(void **)(a1 + 32);
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v10 = @"arcp.manufacturer";
          break;
        case 0x6D70726F:
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
          BOOL v13 = @"dmap.protocolversion";
          goto LABEL_112;
        default:
          goto LABEL_115;
      }
      goto LABEL_91;
    }
    if (a2 != 1685484665)
    {
      if (a2 != 1835626093) {
        goto LABEL_115;
      }
      unint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = @"dmap.itemname";
LABEL_91:
      uint64_t v25 = *(void *)(v9 + 40);
      [v8 setString:a3 size:v4 inDict:v25 forKey:v10];
      return;
    }
    v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = @"arcp.devicetype";
LABEL_108:
    uint64_t v27 = *(void *)(v18 + 40);
    [v17 setUInt8:a3 size:v4 inDict:v27 forKey:v19];
    return;
  }
  if ((int)a2 <= 1836281195)
  {
    if ((int)a2 > 1836278882)
    {
      if ((int)a2 <= 1836279159)
      {
        if (a2 != 1836278883)
        {
          if (a2 == 1836279140)
          {
            v20 = *(void **)(a1 + 32);
            uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
            v22 = @"dmap.supportsedit";
            goto LABEL_99;
          }
LABEL_115:
          v29 = *(void **)(a1 + 32);
          objc_msgSend(v29, "unknownChunk:", a2, a3);
          return;
        }
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"dmap.databasescount";
        goto LABEL_112;
      }
      switch(a2)
      {
        case 0x6D736578:
          v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          v19 = @"dmap.supportsextensions";
          break;
        case 0x6D736978:
          v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          v19 = @"dmap.supportsindex";
          break;
        case 0x6D736C72:
          v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          v19 = @"dmap.loginrequired";
          break;
        default:
          goto LABEL_115;
      }
    }
    else if ((int)a2 <= 1836278132)
    {
      if (a2 == 1836278124)
      {
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        v19 = @"dmap.supportsautologout";
      }
      else
      {
        if (a2 != 1836278131) {
          goto LABEL_115;
        }
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        v19 = @"dmap.authenticationschemes";
      }
    }
    else
    {
      switch(a2)
      {
        case 0x6D736175:
          v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          v19 = @"dmap.authenticationmethod";
          break;
        case 0x6D736272:
          v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          v19 = @"dmap.supportsbrowse";
          break;
        case 0x6D736375:
          id v5 = *(void **)(a1 + 32);
          uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
          id v7 = @"dmap.supportscombinedupdate";
          goto LABEL_64;
        default:
          goto LABEL_115;
      }
    }
    goto LABEL_108;
  }
  if ((int)a2 > 1836282988)
  {
    if ((int)a2 <= 1836282995)
    {
      if (a2 == 1836282989)
      {
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"dmap.timeoutinterval";
      }
      else
      {
        if (a2 != 1836282991) {
          goto LABEL_115;
        }
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"dmap.utcoffset";
      }
      goto LABEL_112;
    }
    if (a2 == 1886417519)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v13 = @"dpap.protocolversion";
      goto LABEL_112;
    }
    if (a2 != 1836283248)
    {
      if (a2 != 1836282996) {
        goto LABEL_115;
      }
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v13 = @"dmap.status";
      goto LABEL_112;
    }
    v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = @"dmap.supportsupdate";
    goto LABEL_108;
  }
  if ((int)a2 > 1836282232)
  {
    switch(a2)
    {
      case 0x6D737179:
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        v19 = @"dmap.supportsquery";
        break;
      case 0x6D737273:
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        v19 = @"dmap.supportsresolve";
        break;
      case 0x6D737463:
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        BOOL v13 = @"dmap.utctime";
        goto LABEL_112;
      default:
        goto LABEL_115;
    }
    goto LABEL_108;
  }
  if (a2 != 1836281196)
  {
    if (a2 != 1836281961) {
      goto LABEL_115;
    }
    v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = @"dmap.supportspersistentids";
    goto LABEL_108;
  }
  id v30 = [*(id *)(a1 + 32) parseMACAddressListing:a3 length:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v30 forKey:@"dmap.macaddresslisting"];
}

- (id)parseContentCollectionDict:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__RMSDAAPParser_parseContentCollectionDict_length___block_invoke;
  v9[3] = &unk_264E74658;
  v9[4] = self;
  v9[5] = &v10;
  void v9[6] = a3;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __51__RMSDAAPParser_parseContentCollectionDict_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = HIDWORD(a2);
  switch(a2)
  {
    case 0x6D636E61:
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v7 = *(void **)(a1 + 32);
      [v7 setString:a3 size:v3 inDict:v6 forKey:@"name"];
      break;
    case 0x6D637479:
      unint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      objc_msgSend(NSNumber, "numberWithUnsignedInt:", bswap32(**(unsigned __int16 **)(a1 + 48)) >> 16, v3);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v8 setValue:v10 forKey:@"type"];

      break;
    case 0x6D636E6D:
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v5 = *(void **)(a1 + 32);
      [v5 setUInt32:a3 size:v3 inDict:v4 forKey:@"number"];
      break;
    default:
      uint64_t v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "unknownChunk:", a2, a3);
      break;
  }
}

- (id)parseContentCodes:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__RMSDAAPParser_parseContentCodes_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __42__RMSDAAPParser_parseContentCodes_length___block_invoke(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (a2 == 1835295596)
  {
    id v6 = [*(id *)(a1 + 32) parseContentCollectionDict:a3 length:HIDWORD(a2)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
  else if (a2 == 1836282996)
  {
    if (*a3 != -939524096)
    {
      uint64_t v4 = RMSLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __42__RMSDAAPParser_parseContentCodes_length___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "unknownChunk:", a2, a3);
  }
}

- (id)parseLogin:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__RMSDAAPParser_parseLogin_length___block_invoke;
  v6[3] = &unk_264E74608;
  v6[4] = self;
  v6[5] = &v7;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:*(void *)&a4 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__RMSDAAPParser_parseLogin_length___block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  if (a2 == 1835821412)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSNumber numberWithUnsignedInt:bswap32(*a3)];
    MEMORY[0x270F9A758]();
  }
  else if (a2 == 1836282996)
  {
    if (*a3 != -939524096)
    {
      id v4 = RMSLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __42__RMSDAAPParser_parseContentCodes_length___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "unknownChunk:", a2, a3);
  }
}

- (id)parseQueueSectionItems:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__RMSDAAPParser_parseQueueSectionItems_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__RMSDAAPParser_parseQueueSectionItems_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 == 1835821428)
  {
    id v5 = [*(id *)(a1 + 32) parseListingItem:a3 length:HIDWORD(a2)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "unknownChunk:", a2, a3);
  }
}

- (id)parseListingItem:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  unint64_t v16 = __Block_byref_object_dispose_;
  id v17 = (id)objc_opt_new();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__RMSDAAPParser_parseListingItem_length___block_invoke;
  v9[3] = &unk_264E74680;
  v9[4] = self;
  v9[5] = &v12;
  void v9[6] = v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v13[5];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__RMSDAAPParser_parseListingItem_length___block_invoke(uint64_t a1, unint64_t a2, unsigned __int8 *a3, double a4)
{
  unint64_t v6 = HIDWORD(a2);
  if ((int)a2 <= 1667329909)
  {
    if ((int)a2 <= 1634168160)
    {
      if ((int)a2 <= 1634028887)
      {
        if ((int)a2 > 1634026829)
        {
          if ((int)a2 <= 1634027587)
          {
            if ((int)a2 > 1634027089)
            {
              if (a2 == 1634027090)
              {
                BOOL v13 = *(void **)(a1 + 32);
                uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
                id v15 = @"com.apple.itunes.supports-fprap";
                goto LABEL_351;
              }
              if (a2 != 1634027379)
              {
                if (a2 == 1634027587)
                {
                  if (!*a3) {
                    return;
                  }
                  id v7 = *(void **)(a1 + 32);
                  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
                  uint64_t v9 = @"com.apple.itunes.has-chapter-data";
                  goto LABEL_377;
                }
                goto LABEL_355;
              }
LABEL_239:
              BOOL v13 = *(void **)(a1 + 32);
              uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
              id v15 = @"com.apple.itunes.can-be-genius-seed";
              goto LABEL_351;
            }
            if (a2 != 1634026830)
            {
              if (a2 == 1634026835)
              {
                v19 = *(void **)(a1 + 32);
                uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                uint64_t v21 = @"com.apple.itunes.episode-sort";
                goto LABEL_372;
              }
LABEL_355:
              v55 = *(void **)(a1 + 32);
              objc_msgSend(v55, "unknownChunk:", a2, a3);
              return;
            }
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"com.apple.itunes.episode-num-str";
            goto LABEL_362;
          }
          if ((int)a2 > 1634027605)
          {
            if (a2 == 1634027606)
            {
              if (!*a3) {
                return;
              }
              id v7 = *(void **)(a1 + 32);
              uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v9 = @"hasVideo";
              goto LABEL_377;
            }
            if (a2 != 1634027853)
            {
              if (a2 != 1634028875) {
                goto LABEL_355;
              }
              id v7 = *(void **)(a1 + 32);
              uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v9 = @"mediaKind";
              goto LABEL_377;
            }
            unint64_t v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v18 = @"com.apple.itunes.itunes-machine-id";
            goto LABEL_324;
          }
          if (a2 == 1634027588)
          {
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"com.apple.itunes.is-hd-video";
            goto LABEL_377;
          }
          if (a2 != 1634027603) {
            goto LABEL_355;
          }
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"com.apple.itunes.is-homeshare";
LABEL_351:
          uint64_t v54 = *(void *)(v14 + 40);
          [v13 setBool:a3 size:HIDWORD(a2) inDict:v54 forKey:v15];
          return;
        }
        if ((int)a2 > 1634026322)
        {
          if ((int)a2 > 1634026336)
          {
            if (a2 != 1634026337)
            {
              if (a2 != 1634026340)
              {
                if (a2 != 1634026355) {
                  goto LABEL_355;
                }
                v19 = *(void **)(a1 + 32);
                uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                uint64_t v21 = @"com.apple.itunes.cloud-connect-status";
                goto LABEL_372;
              }
              unint64_t v16 = *(void **)(a1 + 32);
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v18 = @"com.apple.itunes.cloud-id";
LABEL_324:
              uint64_t v50 = *(void *)(v17 + 40);
              uint64_t v51 = HIDWORD(a2);
LABEL_325:
              [v16 setUInt64:a3 size:v51 inDict:v50 forKey:v18];
              return;
            }
            uint64_t v36 = [*(id *)(a1 + 32) parseUTF8String:a3 length:v6];
            id v65 = (id)v36;
            v37 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            v38 = @"com.apple.itunes.cloud-artwork-url";
            goto LABEL_382;
          }
          if (a2 != 1634026323)
          {
            if (a2 != 1634026325) {
              goto LABEL_355;
            }
            unint64_t v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v18 = @"com.apple.itunes.cloud-user-id";
            goto LABEL_324;
          }
          if (v6 != 4)
          {
            uint64_t v36 = [*(id *)(a1 + 32) parseUTF8String:a3 length:HIDWORD(a2)];
            id v65 = (id)v36;
            v37 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            v38 = @"com.apple.itunes.artworkchecksum";
LABEL_382:
            [v37 setValue:v36 forKey:v38];
            goto LABEL_388;
          }
          v52 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v65 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a3)];
          v53 = [v65 stringValue];
          [v52 setValue:v53 forKey:@"com.apple.itunes.artworkchecksum"];

LABEL_388:

          return;
        }
        if ((int)a2 <= 1634025800)
        {
          if (a2 == 1633841260)
          {
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"basePlaylist";
            goto LABEL_351;
          }
          if (a2 != 1634025796) {
            goto LABEL_355;
          }
          unint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v18 = @"com.apple.itunes.adam-ids-array";
          goto LABEL_324;
        }
        if (a2 == 1634025801)
        {
          unint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v18 = @"com.apple.itunes.adam-id";
          goto LABEL_324;
        }
        if (a2 != 1634026322) {
          goto LABEL_355;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"com.apple.itunes.content-rating";
LABEL_362:
        uint64_t v58 = *(void *)(v11 + 40);
        [v10 setString:a3 size:HIDWORD(a2) inDict:v58 forKey:v12];
        return;
      }
      if ((int)a2 <= 1634030191)
      {
        if ((int)a2 > 1634029650)
        {
          switch((int)a2)
          {
            case 1634030157:
              unint64_t v16 = *(void **)(a1 + 32);
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v18 = @"com.apple.itunes.remote-itunes-machine-id";
              goto LABEL_324;
            case 1634030158:
            case 1634030159:
            case 1634030161:
            case 1634030162:
            case 1634030164:
              goto LABEL_355;
            case 1634030160:
              v19 = *(void **)(a1 + 32);
              uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v21 = @"com.apple.itunes.rental-pb-start";
              goto LABEL_372;
            case 1634030163:
              v19 = *(void **)(a1 + 32);
              uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v21 = @"com.apple.itunes.rental-start";
              goto LABEL_372;
            case 1634030165:
              v19 = *(void **)(a1 + 32);
              uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v21 = @"com.apple.itunes.rental-pb-duration";
              goto LABEL_372;
            default:
              if (a2 == 1634029651)
              {
                id v7 = *(void **)(a1 + 32);
                uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
                uint64_t v9 = @"com.apple.itunes.special-playlist";
                goto LABEL_377;
              }
              if (a2 != 1634030148) {
                goto LABEL_355;
              }
              v19 = *(void **)(a1 + 32);
              uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v21 = @"com.apple.itunes.rental-duration";
              break;
          }
          goto LABEL_372;
        }
        if (a2 != 1634028888)
        {
          if (a2 != 1634028907)
          {
            if (a2 != 1634029635) {
              goto LABEL_355;
            }
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"com.apple.itunes.is-podcast";
            goto LABEL_377;
          }
          goto LABEL_167;
        }
        id v65 = [*(id *)(a1 + 32) parseXMLContent:a3 length:v6];
        if (!v65) {
          goto LABEL_388;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_388;
        }
        v33 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v34 = @"com.apple.itunes.movie-info-xml";
        uint64_t v35 = (uint64_t)v65;
LABEL_334:
        [v33 setObject:v35 forKey:v34];
        goto LABEL_388;
      }
      if ((int)a2 <= 1634030420)
      {
        switch((int)a2)
        {
          case 1634030405:
            unint64_t v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v18 = @"com.apple.itunes.store-pers-id";
            goto LABEL_324;
          case 1634030406:
          case 1634030408:
          case 1634030410:
          case 1634030411:
          case 1634030412:
          case 1634030413:
          case 1634030415:
            goto LABEL_355;
          case 1634030407:
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"com.apple.itunes.saved-genius";
            goto LABEL_351;
          case 1634030409:
            if (HIDWORD(a2) == 8)
            {
              unint64_t v16 = *(void **)(a1 + 32);
              uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v18 = @"com.apple.itunes.itms-songid";
              goto LABEL_394;
            }
            if (HIDWORD(a2) != 4) {
              return;
            }
            v19 = *(void **)(a1 + 32);
            uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"com.apple.itunes.itms-songid";
            break;
          case 1634030414:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"com.apple.itunes.series-name";
            goto LABEL_362;
          case 1634030416:
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"smartPlaylist";
            goto LABEL_351;
          default:
            if (a2 != 1634030192) {
              goto LABEL_355;
            }
            uint64_t v36 = [*(id *)(a1 + 32) parseUTF8String:a3 length:v6];
            id v65 = (id)v36;
            v37 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            v38 = @"com.apple.itunes.item-redownload-param-2";
            goto LABEL_382;
        }
LABEL_359:
        uint64_t v56 = *(void *)(v22 + 40);
        uint64_t v57 = 4;
LABEL_373:
        [v19 setUInt32:a3 size:v57 inDict:v56 forKey:v21];
        return;
      }
      if (a2 == 1634030421)
      {
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"com.apple.itunes.season-num";
        goto LABEL_372;
      }
      if (a2 == 1634030706) {
        return;
      }
      if (a2 != 1634165091) {
        goto LABEL_355;
      }
      v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v21 = @"daap.groupalbumcount";
LABEL_372:
      uint64_t v56 = *(void *)(v20 + 40);
      uint64_t v57 = HIDWORD(a2);
      goto LABEL_373;
    }
    if ((int)a2 <= 1634952812)
    {
      if ((int)a2 > 1634951790)
      {
        if ((int)a2 > 1634952288)
        {
          switch((int)a2)
          {
            case 1634952299:
              return;
            case 1634952300:
            case 1634952301:
            case 1634952302:
            case 1634952303:
            case 1634952305:
            case 1634952307:
              goto LABEL_355;
            case 1634952304:
              uint64_t v26 = *(void **)(a1 + 32);
              uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v28 = @"daap.songdatepurchased";
              goto LABEL_366;
            case 1634952306:
              uint64_t v26 = *(void **)(a1 + 32);
              uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v28 = @"daap.songdatereleased";
              goto LABEL_366;
            case 1634952308:
              uint64_t v10 = *(void **)(a1 + 32);
              uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v12 = @"daap.songdescription";
              goto LABEL_362;
            default:
              if (a2 == 1634952289)
              {
                uint64_t v26 = *(void **)(a1 + 32);
                uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
                uint64_t v28 = @"daap.songdateadded";
LABEL_366:
                uint64_t v59 = *(void *)(v27 + 40);
                [v26 setDate:a3 size:HIDWORD(a2) inDict:v59 forKey:v28];
                return;
              }
              if (a2 != 1634952290) {
                goto LABEL_355;
              }
              BOOL v13 = *(void **)(a1 + 32);
              uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
              id v15 = @"disabled";
              break;
          }
          goto LABEL_351;
        }
        if ((int)a2 > 1634952049)
        {
          if (a2 == 1634952050)
          {
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.songcontentrating";
            goto LABEL_377;
          }
          if (a2 != 1634952052) {
            goto LABEL_355;
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = @"daap.songcategory";
        }
        else
        {
          if (a2 == 1634951791)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"daap.songbookmark";
            goto LABEL_372;
          }
          if (a2 != 1634952046) {
            goto LABEL_355;
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = @"daap.songcontentdescription";
        }
        goto LABEL_362;
      }
      if ((int)a2 <= 1634951520)
      {
        if ((int)a2 <= 1634169455)
        {
          if (a2 == 1634168161)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"daap.groupmatchedqueryalbumcount";
            goto LABEL_372;
          }
          if (a2 == 1634168169)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"daap.groupmatchedqueryitemcount";
            goto LABEL_372;
          }
          goto LABEL_355;
        }
        switch(a2)
        {
          case 0x61677270:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"daap.songgrouping";
            goto LABEL_362;
          case 0x6170726D:
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.playlistrepeatmode";
            break;
          case 0x6170736D:
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.playlistshufflemode";
            break;
          default:
            goto LABEL_355;
        }
LABEL_377:
        uint64_t v31 = *(void *)(v8 + 40);
        uint64_t v32 = HIDWORD(a2);
LABEL_378:
        [v7 setUInt8:a3 size:v32 inDict:v31 forKey:v9];
        return;
      }
      if ((int)a2 <= 1634951531)
      {
        if (a2 == 1634951521)
        {
LABEL_245:
          if (!HIDWORD(a2)) {
            return;
          }
          uint64_t v23 = [*(id *)(a1 + 32) parseUTF8String:a3 length:HIDWORD(a2)];
          id v65 = (id)v23;
          uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v25 = @"daap.songalbumartist";
        }
        else
        {
          if (a2 != 1634951529) {
            goto LABEL_355;
          }
          uint64_t v23 = [NSNumber numberWithUnsignedLongLong:bswap64(*(void *)a3)];
          id v65 = (id)v23;
          uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v25 = @"daap.songalbumid";
        }
      }
      else
      {
        switch(a2)
        {
          case 0x6173616C:
            if (!HIDWORD(a2)) {
              return;
            }
            uint64_t v23 = [*(id *)(a1 + 32) parseUTF8String:a3 length:HIDWORD(a2)];
            id v65 = (id)v23;
            uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            uint64_t v25 = @"daap.songalbum";
            break;
          case 0x61736172:
            if (!HIDWORD(a2)) {
              return;
            }
            uint64_t v23 = [*(id *)(a1 + 32) parseUTF8String:a3 length:HIDWORD(a2)];
            id v65 = (id)v23;
            uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            uint64_t v25 = @"daap.songartist";
            break;
          case 0x6173626B:
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.bookmarkable";
            goto LABEL_377;
          default:
            goto LABEL_355;
        }
      }
LABEL_387:
      [v24 setObject:v23 forKeyedSubscript:v25];
      goto LABEL_388;
    }
    if ((int)a2 > 1634956141)
    {
      if ((int)a2 > 1634956657)
      {
        if ((int)a2 <= 1667328352)
        {
          if (a2 == 1634956658)
          {
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.songuserrating";
          }
          else
          {
            if (a2 != 1667328112) {
              goto LABEL_355;
            }
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"hasPassword";
          }
          goto LABEL_377;
        }
        if (a2 == 1667328353)
        {
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"dacp.selectedForAudio";
          goto LABEL_351;
        }
        if (a2 == 1667328368)
        {
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"isPlaying";
          goto LABEL_351;
        }
        if (a2 != 1667328374) {
          goto LABEL_355;
        }
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"dacp.supportsVideo";
        goto LABEL_351;
      }
      if ((int)a2 > 1634956396)
      {
        if (a2 == 1634956397)
        {
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"daap.songtime";
          goto LABEL_372;
        }
        if (a2 != 1634956652) {
          goto LABEL_355;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.songdataurl";
      }
      else if (a2 == 1634956142)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.sortname";
      }
      else
      {
        if (a2 != 1634956149) {
          goto LABEL_355;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.sortalbum";
      }
      goto LABEL_362;
    }
    if ((int)a2 <= 1634955362)
    {
      if ((int)a2 > 1634953327)
      {
        if (a2 == 1634953328)
        {
          id v7 = *(void **)(a1 + 32);
          uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v9 = @"daap.songhasbeenplayed";
          goto LABEL_377;
        }
        if (a2 != 1634954339) {
          goto LABEL_355;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.songlongcontentdescription";
      }
      else if (a2 == 1634952813)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.songformat";
      }
      else
      {
        if (a2 != 1634953070) {
          goto LABEL_355;
        }
LABEL_103:
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"daap.songgenre";
      }
      goto LABEL_362;
    }
    if ((int)a2 <= 1634955880)
    {
      if (a2 == 1634955363)
      {
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"daap.songuserplaycount";
        goto LABEL_372;
      }
      if (a2 != 1634955381) {
        goto LABEL_355;
      }
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = @"daap.songpodcasturl";
      goto LABEL_362;
    }
    if (a2 != 1634955881)
    {
      if (a2 != 1634956129) {
        goto LABEL_355;
      }
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = @"daap.sortartist";
      goto LABEL_362;
    }
    if (HIDWORD(a2) != 8)
    {
      if (HIDWORD(a2) != 4) {
        return;
      }
      v19 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v21 = @"daap.songartistid";
      goto LABEL_359;
    }
    unint64_t v16 = *(void **)(a1 + 32);
    uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v18 = @"daap.songartistid";
LABEL_394:
    uint64_t v50 = *(void *)(v60 + 40);
    uint64_t v51 = 8;
    goto LABEL_325;
  }
  if ((int)a2 > 1668116076)
  {
    if ((int)a2 > 1835492466)
    {
      if ((int)a2 > 1836278130)
      {
        if ((int)a2 <= 1836279917)
        {
          if ((int)a2 <= 1836279906)
          {
            if (a2 == 1836278131)
            {
              id v7 = *(void **)(a1 + 32);
              uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v9 = @"dmap.authenticationschemes";
            }
            else
            {
              if (a2 != 1836278133) {
                goto LABEL_355;
              }
              id v7 = *(void **)(a1 + 32);
              uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v9 = @"dmap.authenticationmethod";
            }
            goto LABEL_377;
          }
          if (a2 != 1836279907)
          {
            if (a2 == 1836279913)
            {
              v19 = *(void **)(a1 + 32);
              uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v21 = @"headerItemIndex";
              goto LABEL_372;
            }
            goto LABEL_355;
          }
          v45 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v35 = [*(id *)(a1 + 32) parseUnicodeCharacter:a3 length:v6];
          id v65 = (id)v35;
          v34 = @"headerItemCharacter";
          v33 = v45;
          goto LABEL_334;
        }
        if ((int)a2 <= 1836282995)
        {
          if (a2 == 1836279918)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"headerItemCount";
            goto LABEL_372;
          }
          if (a2 != 1836281185) {
            goto LABEL_355;
          }
          unint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v18 = @"dacp.macAddress";
          goto LABEL_324;
        }
        if (a2 == 1836282996)
        {
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"dmap.status";
          goto LABEL_372;
        }
        if (a2 == 1885434736)
        {
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = @"aspectRatio";
          goto LABEL_362;
        }
        if (a2 != 1885758580) {
          goto LABEL_355;
        }
        uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:v6];
        id v65 = (id)v23;
        uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v25 = @"fileData";
        goto LABEL_387;
      }
      if ((int)a2 > 1835626092)
      {
        if ((int)a2 <= 1836082030)
        {
          if (a2 != 1835626093)
          {
            if (a2 == 1835821428) {
              return;
            }
            goto LABEL_355;
          }
LABEL_243:
          if (!HIDWORD(a2)) {
            return;
          }
          uint64_t v23 = [*(id *)(a1 + 32) parseUTF8String:a3 length:HIDWORD(a2)];
          id v65 = (id)v23;
          uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v25 = @"dmap.itemname";
          goto LABEL_387;
        }
        if (a2 != 1836082031)
        {
          if (a2 == 1836082546)
          {
            unint64_t v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v18 = @"dmap.persistentid";
          }
          else
          {
            if (a2 != 1836216434) {
              goto LABEL_355;
            }
            unint64_t v16 = *(void **)(a1 + 32);
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v18 = @"dmap.remotepersistentid";
          }
          goto LABEL_324;
        }
        if (HIDWORD(a2) != 8)
        {
          if (HIDWORD(a2) != 4) {
            return;
          }
          v19 = *(void **)(a1 + 32);
          uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"dmap.parentcontainerid";
          goto LABEL_359;
        }
        unint64_t v16 = *(void **)(a1 + 32);
        uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v18 = @"dmap.parentcontainerid";
        goto LABEL_394;
      }
      if ((int)a2 > 1835625315)
      {
        if (a2 == 1835625316) {
          return;
        }
        if (a2 == 1835625827)
        {
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"dmap.itemcount";
          goto LABEL_372;
        }
        goto LABEL_355;
      }
      if (a2 == 1835492467)
      {
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = @"dmap.groupdownloadstatus";
        goto LABEL_377;
      }
      if (a2 != 1835624804) {
        goto LABEL_355;
      }
      if (HIDWORD(a2) != 8)
      {
        if (HIDWORD(a2) != 4) {
          return;
        }
        v29 = NSNumber;
        unsigned int v30 = *(_DWORD *)a3;
LABEL_267:
        uint64_t v40 = [v29 numberWithUnsignedInt:bswap32(v30)];
        goto LABEL_386;
      }
      v47 = NSNumber;
      unint64_t v48 = *(void *)a3;
LABEL_385:
      uint64_t v40 = [v47 numberWithUnsignedLongLong:bswap64(v48)];
LABEL_386:
      uint64_t v23 = v40;
      id v65 = (id)v40;
      uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v25 = @"dmap.itemid";
      goto LABEL_387;
    }
    if ((int)a2 <= 1668444011)
    {
      if ((int)a2 <= 1668117359)
      {
        if ((int)a2 > 1668117099)
        {
          if (a2 == 1668117100)
          {
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"supportsRemoteLibrarySelection";
            goto LABEL_351;
          }
          if (a2 == 1668117346)
          {
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"supportsBonjourSourcesUpdates";
            goto LABEL_351;
          }
          if (a2 != 1668117347) {
            goto LABEL_355;
          }
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"supportsControlPromptRequests";
          goto LABEL_351;
        }
        if (a2 != 1668116077)
        {
          if (a2 == 1668116594)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"dmcp.protocolversion";
            goto LABEL_372;
          }
          goto LABEL_355;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"name";
        goto LABEL_362;
      }
      if ((int)a2 <= 1668118123)
      {
        if (a2 == 1668117360)
        {
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"supportsPlayStatusUpdate";
          goto LABEL_351;
        }
        if (a2 != 1668117366) {
          goto LABEL_355;
        }
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"dacp.supportsVolume";
        goto LABEL_351;
      }
      switch(a2)
      {
        case 0x636D766C:
          uint64_t v35 = [*(id *)(a1 + 32) parseListingCollection:a3 length:v6 capacity:0 sectionHeaders:0];
          id v65 = (id)v35;
          v33 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v34 = @"context";
          goto LABEL_334;
        case 0x636D766F:
          *(float *)&a4 = (float)bswap32(*(_DWORD *)a3) / 100.0;
          uint64_t v23 = [NSNumber numberWithFloat:a4];
          id v65 = (id)v23;
          uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v25 = @"dacp.volume";
          break;
        case 0x636D7674:
          if (v6 != 2) {
            return;
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = bswap32(*(unsigned __int16 *)a3) >> 16;
          uint64_t v23 = [(id)objc_opt_class() typeForDRCPValueType:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
          id v65 = (id)v23;
          uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v25 = @"type";
          break;
        default:
          goto LABEL_355;
      }
      goto LABEL_387;
    }
    if ((int)a2 > 1835299699)
    {
      if ((a2 - 1835364978) < 2)
      {
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"dmap.errorresponse";
        goto LABEL_372;
      }
      if (a2 != 1835299700)
      {
        if (a2 != 1835361395) {
          goto LABEL_355;
        }
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"dmap.editcommandssupported";
        goto LABEL_372;
      }
      uint64_t v23 = [NSNumber numberWithUnsignedChar:*a3];
      id v65 = (id)v23;
      uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v25 = @"dmap.downloadstatus";
      goto LABEL_387;
    }
    if ((int)a2 > 1835234402)
    {
      if (a2 == 1835234403)
      {
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"dmap.container";
        goto LABEL_372;
      }
      if (a2 == 1835234409)
      {
        uint64_t v23 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a3)];
        id v65 = (id)v23;
        uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v25 = @"dmap.containeritemid";
        goto LABEL_387;
      }
      if (a2 != 1835295339) {
        goto LABEL_355;
      }
      if (HIDWORD(a2) != 8)
      {
        if (HIDWORD(a2) != 4) {
          return;
        }
        v19 = *(void **)(a1 + 32);
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"dmap.databasekind";
        goto LABEL_359;
      }
      unint64_t v16 = *(void **)(a1 + 32);
      uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v18 = @"dmap.databasekind";
      goto LABEL_394;
    }
    if (a2 == 1668444012)
    {
      BOOL v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = @"readOnly";
      goto LABEL_351;
    }
    if (a2 != 1668702572) {
      goto LABEL_355;
    }
    switch(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      case 1:
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"value";
        goto LABEL_351;
      case 2:
        v61 = *(void **)(a1 + 32);
        uint64_t v62 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        [v61 setUInt16:a3 size:HIDWORD(a2) inDict:v62 forKey:@"value"];
        break;
      case 3:
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"value";
        goto LABEL_372;
      case 4:
        v63 = *(void **)(a1 + 32);
        uint64_t v64 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        [v63 setFloat32:a3 size:HIDWORD(a2) inDict:v64 forKey:@"value"];
        break;
      case 5:
      case 6:
      case 7:
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"value";
        goto LABEL_362;
      default:
        return;
    }
  }
  else
  {
    if ((int)a2 > 1667584352)
    {
      if ((int)a2 <= 1667584838)
      {
        switch((int)a2)
        {
          case 1667584353:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"album";
            goto LABEL_362;
          case 1667584359:
            goto LABEL_103;
          case 1667584360:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"com.apple.itunes.playqueue-section-headervalue";
            goto LABEL_362;
          case 1667584361:
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"com.apple.itunes.playqueue-section-startindex";
            goto LABEL_372;
          case 1667584363:
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"com.apple.itunes.playqueue-section-kind";
            goto LABEL_372;
          case 1667584364:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"com.apple.itunes.playqueue-section-headerlabel";
            goto LABEL_362;
          case 1667584365:
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"com.apple.itunes.playqueue-section-numitems";
            goto LABEL_372;
          case 1667584366:
            goto LABEL_243;
          case 1667584370:
            goto LABEL_245;
          case 1667584371:
            [*(id *)(a1 + 32) setUInt32:a3 size:4 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.databaseid"];
            [*(id *)(a1 + 32) setUInt32:a3 + 4 size:4 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.playlistid"];
            v39 = [NSNumber numberWithUnsignedInt:bswap32(*((_DWORD *)a3 + 2))];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v39 forKeyedSubscript:@"dmap.containeritemid"];

            v29 = NSNumber;
            unsigned int v30 = *((_DWORD *)a3 + 3);
            goto LABEL_267;
          default:
            goto LABEL_355;
        }
      }
      if ((int)a2 <= 1668113011)
      {
        if ((int)a2 <= 1668112995)
        {
          if (a2 == 1667584839)
          {
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"com.apple.itunes.supports-genius-control";
            goto LABEL_351;
          }
          if (a2 != 1667584856) {
            goto LABEL_355;
          }
          unint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v18 = @"kExtDACPSupportediTunesExtensionsCode";
          goto LABEL_324;
        }
        switch(a2)
        {
          case 0x636D6264:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"libraryDisplayName";
            break;
          case 0x636D626D:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"libraryServiceDomain";
            break;
          case 0x636D6273:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"libraryServiceName";
            break;
          default:
            goto LABEL_355;
        }
        goto LABEL_362;
      }
      if ((int)a2 <= 1668115818)
      {
        if (a2 == 1668113012)
        {
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = @"libraryServiceType";
        }
        else
        {
          if (a2 != 1668114788) {
            goto LABEL_355;
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = @"identifier";
        }
        goto LABEL_362;
      }
      if (a2 == 1668115819)
      {
LABEL_167:
        if (HIDWORD(a2) != 4)
        {
          if (HIDWORD(a2) != 1) {
            return;
          }
          id v7 = *(void **)(a1 + 32);
          uint64_t v9 = @"mediaKind";
          uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v32 = 1;
          goto LABEL_378;
        }
        v19 = *(void **)(a1 + 32);
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"mediaKind";
        goto LABEL_359;
      }
      if (a2 == 1668115822)
      {
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"minimum";
        goto LABEL_372;
      }
      if (a2 != 1668115832) {
        goto LABEL_355;
      }
      v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v21 = @"maximum";
      goto LABEL_372;
    }
    if ((int)a2 <= 1667582530)
    {
      if ((int)a2 > 1667330932)
      {
        if ((int)a2 > 1667581009)
        {
          if (a2 == 1667581010)
          {
            BOOL v13 = *(void **)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            id v15 = @"supportsDirectionalControl";
            goto LABEL_351;
          }
          if (a2 == 1667581779) {
            goto LABEL_239;
          }
          goto LABEL_355;
        }
        if (a2 == 1667330933)
        {
          BOOL v13 = *(void **)(a1 + 32);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = @"supportsSetUserRating";
          goto LABEL_351;
        }
        if (a2 != 1667331684) {
          goto LABEL_355;
        }
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"dacp.selectedForVideo";
        goto LABEL_351;
      }
      if ((int)a2 > 1667330912)
      {
        if (a2 == 1667330913)
        {
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"nowPlayingSpeakersEnabled";
          goto LABEL_372;
        }
        if (a2 != 1667330931) {
          goto LABEL_355;
        }
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"dacp.supportsSpeakerSelection";
        goto LABEL_351;
      }
      if (a2 == 1667329910)
      {
        BOOL v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = @"supportsMultiSpeakerVolume";
        goto LABEL_351;
      }
      if (a2 != 1667330162) {
        goto LABEL_355;
      }
      v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v21 = @"dacp.protocolversion";
      goto LABEL_372;
    }
    if ((int)a2 > 1667583312)
    {
      if ((int)a2 <= 1667584331)
      {
        if (a2 != 1667583313)
        {
          if (a2 == 1667584329)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v21 = @"com.apple.itunes.queue-index";
            goto LABEL_372;
          }
          goto LABEL_355;
        }
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = @"com.apple.itunes.manually-queued";
        goto LABEL_377;
      }
      if (a2 != 1667584332)
      {
        if (a2 == 1667584336)
        {
          if (!HIDWORD(a2)) {
            return;
          }
          id v65 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) valueForKey:@"com.apple.itunes.playqueue-item-preform-meta"];
          if (!v65)
          {
            id v65 = [MEMORY[0x263EFF980] array];
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setValue:forKey:");
          }
          v49 = [*(id *)(a1 + 32) parseUTF8String:a3 length:v6];
          [v65 addObject:v49];

          goto LABEL_388;
        }
        if (a2 != 1667584343) {
          goto LABEL_355;
        }
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"com.apple.itunes.playqueue-warning-threshold";
        goto LABEL_372;
      }
      [*(id *)(a1 + 32) setUInt64:a3 size:8 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.databaseid"];
      [*(id *)(a1 + 32) setUInt64:a3 + 8 size:8 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.playlistid"];
      v46 = [NSNumber numberWithUnsignedLongLong:bswap64(*((void *)a3 + 2))];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v46 forKeyedSubscript:@"dmap.containeritemid"];

      v47 = NSNumber;
      unint64_t v48 = *((void *)a3 + 3);
      goto LABEL_385;
    }
    if ((int)a2 > 1667582546)
    {
      if (a2 != 1667582547)
      {
        if (a2 == 1667582550)
        {
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v21 = @"com.apple.itunes.jukebox-vote";
          goto LABEL_372;
        }
        goto LABEL_355;
      }
      v43 = *(void **)(a1 + 32);
      uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      [v43 setSInt16:a3 size:v6 inDict:v44 forKey:@"com.apple.itunes.jukebox-score"];
    }
    else
    {
      if (a2 != 1667582531)
      {
        if (a2 != 1667582537) {
          goto LABEL_355;
        }
        v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = @"jukeboxCurrent";
        goto LABEL_372;
      }
      v41 = *(void **)(a1 + 32);
      uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      [v41 setSInt8:a3 size:v6 inDict:v42 forKey:@"com.apple.itunes.jukebox-client-vote"];
    }
  }
}

- (id)parseListingCollection:(const char *)a3 length:(unsigned int)a4 capacity:(int)a5 sectionHeaders:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = [MEMORY[0x263EFF980] arrayWithCapacity:a5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__RMSDAAPParser_parseListingCollection_length_capacity_sectionHeaders___block_invoke;
  v12[3] = &unk_264E74658;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a6;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v7 usingBlock:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __71__RMSDAAPParser_parseListingCollection_length_capacity_sectionHeaders___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = HIDWORD(a2);
  if (a2 == 1667584339)
  {
    if (*(void *)(a1 + 48))
    {
      **(void **)(a1 + 48) = [*(id *)(a1 + 32) parseQueueSectionItems:a3 length:v4];
    }
  }
  else if (a2 != 1836282996)
  {
    if (a2 == 1835821428)
    {
      id v6 = [*(id *)(a1 + 32) parseListingItem:a3 length:v4];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    }
    else
    {
      id v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "unknownChunk:", a2, a3);
    }
  }
}

- (id)parseBrowseResults:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__RMSDAAPParser_parseBrowseResults_length___block_invoke;
  v9[3] = &unk_264E74608;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __43__RMSDAAPParser_parseBrowseResults_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 == 1835821428)
  {
    unint64_t v5 = HIDWORD(a2);
    id v8 = (id)objc_opt_new();
    id v6 = (void *)[[NSString alloc] initWithBytes:a3 length:v5 encoding:4];
    [v8 setObject:v6 forKeyedSubscript:@"dmap.listingitem"];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "unknownChunk:", a2, a3);
  }
}

- (id)parseListingHeader:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  unint64_t v16 = __Block_byref_object_dispose_;
  id v17 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__RMSDAAPParser_parseListingHeader_length___block_invoke;
  v9[3] = &unk_264E746A8;
  v9[4] = self;
  v9[5] = &v12;
  void v9[6] = v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v13[5];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__RMSDAAPParser_parseListingHeader_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3)
{
  uint64_t v4 = (id *)a1;
  uint64_t v46 = *MEMORY[0x263EF8340];
  unint64_t v5 = HIDWORD(a2);
  if ((int)a2 <= 1668113009)
  {
    if ((int)a2 > 1633973615)
    {
      if ((int)a2 <= 1634759532)
      {
        if (a2 == 1633973616)
        {
          if (HIDWORD(a2) == 4)
          {
            id v38 = [MEMORY[0x263EFF9A0] dictionary];
            objc_msgSend(v4[4], "setUInt32:size:inDict:forKey:", a3, 4);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "parseDACPPropertyResponse:length:", a3);
            id v38 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v15 = *(void **)(*((void *)v4[5] + 1) + 40);
          unint64_t v16 = @"daap.updateinfo";
          uint64_t v14 = (uint64_t)v38;
          goto LABEL_71;
        }
        if (a2 != 1634759277)
        {
LABEL_66:
          uint64_t v35 = *(void **)(a1 + 32);
          objc_msgSend(v35, "unknownChunk:", a2, a3);
          return;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*((void *)v4[5] + 1) + 40);
        uint64_t v12 = @"daap.playlistrepeatmode";
      }
      else
      {
        if (a2 != 1634759533)
        {
          if (a2 != 1667583569)
          {
            if (a2 == 1667584373)
            {
              id v8 = *(void **)(a1 + 32);
              uint64_t v9 = *(void *)(*((void *)v4[5] + 1) + 40);
              [v8 setBool:a3 size:v5 inDict:v9 forKey:@"playQueueMode"];
              return;
            }
            goto LABEL_66;
          }
          id v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*((void *)v4[5] + 1) + 40);
          v19 = @"com.apple.itunes.num-manually-queued";
          goto LABEL_63;
        }
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*((void *)v4[5] + 1) + 40);
        uint64_t v12 = @"daap.playlistshufflemode";
      }
LABEL_54:
      [v10 setUInt8:a3 size:v5 inDict:v11 forKey:v12];
      return;
    }
    if ((int)a2 > 1633837935)
    {
      if (a2 == 1633837936) {
        goto LABEL_36;
      }
      unsigned __int16 v13 = 26478;
    }
    else
    {
      if (a2 == 1633837420) {
        goto LABEL_36;
      }
      unsigned __int16 v13 = 24946;
    }
    if (a2 != (v13 | 0x61620000)) {
      goto LABEL_66;
    }
LABEL_36:
    uint64_t v6 = [*(id *)(a1 + 32) parseBrowseResults:a3 length:v5];
    id v7 = *(void **)(*((void *)v4[5] + 1) + 40);
    goto LABEL_37;
  }
  if ((int)a2 > 1836282995)
  {
    if ((int)a2 <= 1836409963)
    {
      if (a2 == 1836282996)
      {
        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*((void *)v4[5] + 1) + 40);
        v19 = @"statusCode";
      }
      else
      {
        if (a2 != 1836344175) {
          goto LABEL_66;
        }
        id v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(*((void *)v4[5] + 1) + 40);
        v19 = @"totalCount";
      }
      goto LABEL_63;
    }
    if (a2 == 1836409964) {
      return;
    }
    if (a2 == 1836413810)
    {
      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(*((void *)v4[5] + 1) + 40);
      v19 = @"revision";
      goto LABEL_63;
    }
    if (a2 != 1836414073) {
      goto LABEL_66;
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*((void *)v4[5] + 1) + 40);
    uint64_t v12 = @"updateType";
    goto LABEL_54;
  }
  if ((int)a2 <= 1835819883)
  {
    if (a2 != 1668113010)
    {
      if (a2 == 1668117353)
      {
        uint64_t v14 = [*(id *)(a1 + 32) parseDACPPropertyResponse:a3 length:v5];
        id v15 = *(void **)(*((void *)v4[5] + 1) + 40);
        unint64_t v16 = @"playStatusUpdateInfo";
        id v38 = (id)v14;
LABEL_71:
        [v15 setObject:v14 forKey:v16];
        goto LABEL_72;
      }
      goto LABEL_66;
    }
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(*((void *)v4[5] + 1) + 40);
    v19 = @"dmcp.bonjoursourcesrevision";
LABEL_63:
    [v17 setUInt32:a3 size:v5 inDict:v18 forKey:v19];
    return;
  }
  if (a2 != 1835819884)
  {
    if (a2 == 1836213103)
    {
      [*(id *)(a1 + 32) setUInt32:a3 size:v5 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"returnedCount"];
      *(_DWORD *)(*((void *)v4[6] + 1) + 24) = bswap32(*a3);
      return;
    }
    if (a2 == 1836279916)
    {
      uint64_t v6 = [*(id *)(a1 + 32) parseListingCollection:a3 length:v5 capacity:30 sectionHeaders:0];
      id v7 = *(void **)(*((void *)v4[5] + 1) + 40);
LABEL_37:
      id v38 = (id)v6;
      objc_msgSend(v7, "setObject:forKeyedSubscript:");
LABEL_72:

      return;
    }
    goto LABEL_66;
  }
  uint64_t v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(unsigned int *)(*((void *)v4[6] + 1) + 24);
  id v44 = 0;
  uint64_t v22 = [v20 parseListingCollection:a3 length:v5 capacity:v21 sectionHeaders:&v44];
  id v23 = v44;
  [*(id *)(*((void *)v4[5] + 1) + 40) setObject:v22 forKeyedSubscript:@"items"];
  if (v23)
  {
    uint64_t v24 = [MEMORY[0x263EFF980] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v36 = v23;
      v37 = v22;
      v39 = v4;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v32 = [v31 valueForKey:@"com.apple.itunes.playqueue-section-startindex"];
          uint64_t v33 = [v32 integerValue];

          if (v33 < 0)
          {
            id v34 = v31;

            uint64_t v28 = v34;
          }
          else if (v33)
          {
            [v24 addObject:v31];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v27);

      uint64_t v4 = v39;
      if (v28) {
        [*(id *)(*((void *)v39[5] + 1) + 40) setObject:v28 forKeyedSubscript:@"historySection"];
      }
      id v23 = v36;
      uint64_t v22 = v37;
    }
    else
    {

      uint64_t v28 = 0;
    }
    if (v24) {
      [*(id *)(*((void *)v4[5] + 1) + 40) setObject:v24 forKeyedSubscript:@"upNextSections"];
    }
  }
}

- (id)parseControlPromptCollection:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned __int16 v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__RMSDAAPParser_parseControlPromptCollection_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __53__RMSDAAPParser_parseControlPromptCollection_length___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  switch(a2)
  {
    case 0x636D6361:
      unint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v5 = @"attributes";
      return [v3 setString:a3 size:HIDWORD(a2) inDict:*(void *)(v4 + 40) forKey:v5];
    case 0x636D6376:
      unint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v5 = @"value";
      return [v3 setString:a3 size:HIDWORD(a2) inDict:*(void *)(v4 + 40) forKey:v5];
    case 0x636D6365:
      unint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v5 = @"name";
      return [v3 setString:a3 size:HIDWORD(a2) inDict:*(void *)(v4 + 40) forKey:v5];
  }
  return objc_msgSend(*(id *)(a1 + 32), "unknownChunk:", a2, a3);
}

- (id)parseControlPromptResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned __int16 v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__RMSDAAPParser_parseControlPromptResponse_length___block_invoke;
  v9[3] = &unk_264E746A8;
  v9[4] = self;
  v9[5] = &v16;
  void v9[6] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  if ([(id)v11[5] count]) {
    [(id)v17[5] setObject:v11[5] forKeyedSubscript:@"items"];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __51__RMSDAAPParser_parseControlPromptResponse_length___block_invoke(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v4 = HIDWORD(a2);
  switch(a2)
  {
    case 0x6D64636C:
      id v8 = [*(id *)(a1 + 32) parseControlPromptCollection:a3 length:v4];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v8];

      break;
    case 0x6D696964:
      uint64_t v6 = *(void **)(a1 + 32);
      if (v4 == 4)
      {
        objc_msgSend(v6, "setUInt32:size:inDict:forKey:");
      }
      else
      {
        objc_msgSend(v6, "setUInt64:size:inDict:forKey:");
      }
      break;
    case 0x6D737474:
      if (*a3 != -939524096)
      {
        unint64_t v5 = RMSLogger();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __42__RMSDAAPParser_parseContentCodes_length___block_invoke_cold_1();
        }
      }
      break;
    default:
      id v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "unknownChunk:", a2, a3);
      break;
  }
}

- (id)parseGetSpeakersResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned __int16 v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__RMSDAAPParser_parseGetSpeakersResponse_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__RMSDAAPParser_parseGetSpeakersResponse_length___block_invoke(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (a2 == 1835295596)
  {
    id v6 = [*(id *)(a1 + 32) parseListingItem:a3 length:HIDWORD(a2)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
  else if (a2 == 1836282996)
  {
    if (*a3 != -939524096)
    {
      uint64_t v4 = RMSLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __42__RMSDAAPParser_parseContentCodes_length___block_invoke_cold_1();
      }
    }
  }
  else
  {
    unint64_t v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "unknownChunk:", a2, a3);
  }
}

- (id)parseDACPPropertyResponse:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned __int16 v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__RMSDAAPParser_parseDACPPropertyResponse_length___block_invoke;
  v9[3] = &unk_264E74630;
  v9[4] = self;
  v9[5] = &v10;
  [(RMSDAAPParser *)self enumerateDAAPChunksInBytes:a3 length:v4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __50__RMSDAAPParser_parseDACPPropertyResponse_length___block_invoke(uint64_t a1, unint64_t a2, unsigned int *a3, double a4)
{
  uint64_t v4 = a3;
  uint64_t v6 = HIDWORD(a2);
  if ((int)a2 <= 1667330914)
  {
    if ((int)a2 <= 1667327602)
    {
      if ((int)a2 > 1634036850)
      {
        if ((int)a2 > 1634956396)
        {
          if ((int)a2 <= 1667326322)
          {
            if (a2 != 1634956397)
            {
              if (a2 == 1667326322)
              {
                id v7 = *(void **)(a1 + 32);
                uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
                uint64_t v9 = @"availableRepeatStates";
LABEL_134:
                uint64_t v14 = *(void *)(v8 + 40);
LABEL_135:
                [v7 setUInt32:a3 size:v6 inDict:v14 forKey:v9];
                return;
              }
              goto LABEL_142;
            }
LABEL_15:
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.songtime";
            goto LABEL_134;
          }
          if (a2 == 1667326323)
          {
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"availableShuffleStates";
            goto LABEL_134;
          }
          if (a2 == 1667327589)
          {
            id v15 = *(void **)(a1 + 32);
            uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
            id v17 = @"fullscreenEnabled";
            goto LABEL_114;
          }
          goto LABEL_142;
        }
        if (a2 != 1634036851)
        {
          if (a2 != 1634951529)
          {
            if (a2 != 1634955881) {
              goto LABEL_142;
            }
            if (HIDWORD(a2) != 8)
            {
              if (HIDWORD(a2) != 4) {
                return;
              }
              id v7 = *(void **)(a1 + 32);
              uint64_t v9 = @"daap.songartistid";
              uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              goto LABEL_135;
            }
            id v23 = *(void **)(a1 + 32);
            uint64_t v24 = @"daap.songartistid";
            uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            goto LABEL_125;
          }
          id v23 = *(void **)(a1 + 32);
          uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v24 = @"daap.songalbumid";
          goto LABEL_124;
        }
        unsigned __int16 v13 = *(void **)(a1 + 32);
        goto LABEL_139;
      }
      if ((int)a2 <= 1634030408)
      {
        if (a2 != 1634026323)
        {
          if (a2 != 1634027379)
          {
            if (a2 != 1634027587) {
              goto LABEL_142;
            }
            if (!*(unsigned char *)a3) {
              return;
            }
            unsigned __int16 v13 = *(void **)(a1 + 32);
            goto LABEL_139;
          }
LABEL_85:
          id v15 = *(void **)(a1 + 32);
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
          id v17 = @"com.apple.itunes.can-be-genius-seed";
          goto LABEL_114;
        }
        if (v6 == 4)
        {
          id v31 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:bswap32(*a3)];
          id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v22 = [v31 stringValue];
          [v21 setValue:v22 forKey:@"com.apple.itunes.artworkchecksum"];
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "parseUTF8String:length:", a3);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          unsigned int v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v31, "longLongValue"));
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v30 forKey:@"com.apple.itunes.artworkchecksum"];
        }
        goto LABEL_146;
      }
      switch(a2)
      {
        case 0x61655349:
          id v7 = *(void **)(a1 + 32);
          uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v9 = @"com.apple.itunes.itms-songid";
          goto LABEL_134;
        case 0x61656177:
          unsigned __int16 v13 = *(void **)(a1 + 32);
          break;
        case 0x61656C62:
          unsigned __int16 v13 = *(void **)(a1 + 32);
          break;
        default:
          goto LABEL_142;
      }
LABEL_139:
      objc_msgSend(v13, "setUInt8:size:inDict:forKey:");
      return;
    }
    if ((int)a2 > 1667329643)
    {
      if ((int)a2 <= 1667330155)
      {
        switch((int)a2)
        {
          case 1667329644:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"daap.songalbum";
            goto LABEL_130;
          case 1667329646:
            uint64_t v10 = *(void **)(a1 + 32);
            uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v12 = @"dmap.itemname";
            goto LABEL_130;
          case 1667329648:
            [*(id *)(a1 + 32) setUInt32:a3 size:4 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.databaseid"];
            [*(id *)(a1 + 32) setUInt32:v4 + 1 size:4 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.playlistid"];
            [*(id *)(a1 + 32) setUInt32:v4 + 2 size:4 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.containeritemid"];
            a3 = v4 + 3;
            id v7 = *(void **)(a1 + 32);
            uint64_t v9 = @"dmap.itemid";
            uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            uint64_t v6 = 4;
            goto LABEL_135;
          case 1667329652:
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"daap.songtimeremaining";
            goto LABEL_134;
          default:
            goto LABEL_142;
        }
      }
      if ((int)a2 > 1667330671)
      {
        if (a2 != 1667330672)
        {
          if (a2 == 1667330913)
          {
            id v7 = *(void **)(a1 + 32);
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = @"nowPlayingSpeakersEnabled";
            goto LABEL_134;
          }
          goto LABEL_142;
        }
        unsigned __int16 v13 = *(void **)(a1 + 32);
      }
      else
      {
        if (a2 == 1667330156)
        {
          [*(id *)(a1 + 32) setUInt64:a3 size:8 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.databaseid"];
          [*(id *)(a1 + 32) setUInt64:v4 + 2 size:8 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.playlistid"];
          [*(id *)(a1 + 32) setUInt64:v4 + 4 size:8 inDict:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"dmap.containeritemid"];
          a3 = v4 + 6;
          id v23 = *(void **)(a1 + 32);
          uint64_t v24 = @"dmap.itemid";
          uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v6 = 8;
LABEL_125:
          [v23 setUInt64:a3 size:v6 inDict:v25 forKey:v24];
          return;
        }
        if (a2 != 1667330163) {
          goto LABEL_142;
        }
        unsigned __int16 v13 = *(void **)(a1 + 32);
      }
      goto LABEL_139;
    }
    if ((int)a2 <= 1667329632)
    {
      if (a2 == 1667327603)
      {
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = @"fullscreen";
        goto LABEL_114;
      }
      if (a2 != 1667328883) {
        goto LABEL_142;
      }
      unsigned __int16 v13 = *(void **)(a1 + 32);
      goto LABEL_139;
    }
    if (a2 == 1667329633)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = @"daap.songartist";
    }
    else
    {
      if (a2 != 1667329639) {
        goto LABEL_142;
      }
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = @"NPGenre";
    }
    goto LABEL_130;
  }
  if ((int)a2 <= 1667584372)
  {
    if ((int)a2 <= 1667331698)
    {
      if ((int)a2 > 1667330932)
      {
        switch(a2)
        {
          case 0x63617375:
            return;
          case 0x63617663:
            id v15 = *(void **)(a1 + 32);
            uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
            id v17 = @"dacp.volumecontrollable";
            goto LABEL_114;
          case 0x63617665:
            id v15 = *(void **)(a1 + 32);
            uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
            id v17 = @"visualizerEnabled";
LABEL_114:
            uint64_t v27 = *(void *)(v16 + 40);
            [v15 setBool:a3 size:v6 inDict:v27 forKey:v17];
            return;
        }
LABEL_142:
        uint64_t v29 = *(void **)(a1 + 32);
        objc_msgSend(v29, "unknownChunk:", a2, a3);
        return;
      }
      switch(a2)
      {
        case 0x63617363:
          unsigned __int16 v13 = *(void **)(a1 + 32);
          break;
        case 0x63617368:
          unsigned __int16 v13 = *(void **)(a1 + 32);
          break;
        case 0x63617374:
          goto LABEL_15;
        default:
          goto LABEL_142;
      }
      goto LABEL_139;
    }
    if ((int)a2 <= 1667583568)
    {
      if (a2 == 1667331699)
      {
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = @"visualizer";
        goto LABEL_114;
      }
      if (a2 == 1667581779) {
        goto LABEL_85;
      }
      if (a2 != 1667583313) {
        goto LABEL_142;
      }
      unsigned __int16 v13 = *(void **)(a1 + 32);
      goto LABEL_139;
    }
    if (a2 == 1667583569)
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = @"com.apple.itunes.num-manually-queued";
      goto LABEL_134;
    }
    if (a2 != 1667584326)
    {
      if (a2 == 1667584343)
      {
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = @"com.apple.itunes.playqueue-warning-threshold";
        goto LABEL_134;
      }
      goto LABEL_142;
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = @"com.apple.itunes.active-queue-feed-name";
    goto LABEL_130;
  }
  if ((int)a2 > 1668115818)
  {
    if ((int)a2 > 1836082545)
    {
      if (a2 != 1836082546)
      {
        if (a2 == 1836282996)
        {
          id v7 = *(void **)(a1 + 32);
          uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v9 = @"statusCode";
          goto LABEL_134;
        }
        if (a2 == 1836413810)
        {
          id v7 = *(void **)(a1 + 32);
          uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v9 = @"dmap.serverrevision";
          goto LABEL_134;
        }
        goto LABEL_142;
      }
      id v23 = *(void **)(a1 + 32);
      uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v24 = @"dmap.persistentid";
LABEL_124:
      uint64_t v25 = *(void *)(v26 + 40);
      goto LABEL_125;
    }
    if (a2 == 1668115819)
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = @"mediaKind";
      goto LABEL_134;
    }
    if (a2 == 1668117362)
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = @"dmcp.playstatusrevision";
      goto LABEL_134;
    }
    if (a2 != 1668118127) {
      goto LABEL_142;
    }
    *(float *)&a4 = (float)bswap32(*a3) / 100.0;
    objc_msgSend(NSNumber, "numberWithFloat:", a3, v6, a4);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v31 forKeyedSubscript:@"dacp.volume"];
LABEL_146:

    return;
  }
  if ((int)a2 > 1668113004)
  {
    switch(a2)
    {
      case 0x636D626D:
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"libraryServiceDomain";
        break;
      case 0x636D6273:
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"libraryServiceName";
        break;
      case 0x636D6274:
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = @"libraryServiceType";
        break;
      default:
        goto LABEL_142;
    }
LABEL_130:
    uint64_t v28 = *(void *)(v11 + 40);
    [v10 setString:a3 size:v6 inDict:v28 forKey:v12];
    return;
  }
  if (a2 == 1667584373)
  {
    unsigned __int16 v13 = *(void **)(a1 + 32);
    goto LABEL_139;
  }
  if (a2 != 1667584836)
  {
    if (a2 != 1668112996) {
      goto LABEL_142;
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = @"libraryDisplayName";
    goto LABEL_130;
  }
  uint64_t v18 = [*(id *)(a1 + 32) parseXMLContent:a3 length:v6];
  if (v18)
  {
    id v32 = (id)v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [v32 objectForKey:@"id"];
      if ([v19 length] && (objc_msgSend(v19, "isEqualToString:", @"(null)") & 1) == 0) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKey:@"dmap.itemstoreid"];
      }
      uint64_t v20 = [v32 objectForKey:@"url"];
      if ([v20 length]) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKey:@"secondScreenURL"];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5
{
  if ((int)a3 > 1668113263)
  {
    if ((int)a3 > 1835364977)
    {
      if ((int)a3 > 1836282485)
      {
        if (a3 == 1836413028 || a3 == 1836409717) {
          goto LABEL_46;
        }
        if (a3 == 1836282486)
        {
          uint64_t v6 = [(RMSDAAPParser *)self parseServerInfo:a4 length:*(void *)&a5];
          goto LABEL_47;
        }
        goto LABEL_53;
      }
      if (a3 - 1835364978 >= 2)
      {
        if (a3 == 1835822951)
        {
          uint64_t v6 = [(RMSDAAPParser *)self parseLogin:a4 length:*(void *)&a5];
          goto LABEL_47;
        }
        int v5 = 1836278642;
        goto LABEL_45;
      }
      goto LABEL_42;
    }
    if ((int)a3 <= 1668313711)
    {
      if (a3 == 1668113264)
      {
        uint64_t v6 = [(RMSDAAPParser *)self parseControlPromptResponse:a4 length:*(void *)&a5];
        goto LABEL_47;
      }
      if (a3 == 1668114292 || a3 == 1668117364)
      {
        uint64_t v6 = [(RMSDAAPParser *)self parseDACPPropertyResponse:a4 length:*(void *)&a5];
        goto LABEL_47;
      }
      goto LABEL_53;
    }
    if ((int)a3 <= 1835234411)
    {
      if (a3 == 1668313712) {
        goto LABEL_46;
      }
      if (a3 == 1835230066)
      {
        uint64_t v6 = [(RMSDAAPParser *)self parseContentCodes:a4 length:*(void *)&a5];
        goto LABEL_47;
      }
      goto LABEL_53;
    }
    if (a3 == 1835234412) {
      goto LABEL_46;
    }
    int v7 = 1835361379;
LABEL_41:
    if (a3 != v7) {
      goto LABEL_53;
    }
LABEL_42:
    uint64_t v6 = [(RMSDAAPParser *)self parseListingItem:a4 length:*(void *)&a5];
    goto LABEL_47;
  }
  if ((int)a3 > 1635148897)
  {
    if ((int)a3 > 1667330927)
    {
      if ((int)a3 <= 1667584337)
      {
        if (a3 == 1667330928)
        {
          uint64_t v6 = [(RMSDAAPParser *)self parseGetSpeakersResponse:a4 length:*(void *)&a5];
          goto LABEL_47;
        }
        if (a3 == 1667581769)
        {
          uint64_t v6 = [(RMSDAAPParser *)self parseListingCollection:a4 length:*(void *)&a5 capacity:0 sectionHeaders:0];
          goto LABEL_47;
        }
        goto LABEL_53;
      }
      if (a3 == 1667584338) {
        goto LABEL_46;
      }
      int v5 = 1668113013;
LABEL_45:
      if (a3 == v5) {
        goto LABEL_46;
      }
      goto LABEL_53;
    }
    if (a3 == 1635148898 || a3 == 1667326825) {
      goto LABEL_46;
    }
    int v7 = 1667326834;
    goto LABEL_41;
  }
  if ((int)a3 <= 1634165105)
  {
    if (a3 == 1633841775 || a3 == 1633968755) {
      goto LABEL_46;
    }
    int v5 = 1634165100;
    goto LABEL_45;
  }
  if ((int)a3 <= 1634759534)
  {
    if (a3 != 1634165106)
    {
      int v5 = 1634757753;
      goto LABEL_45;
    }
LABEL_46:
    uint64_t v6 = [(RMSDAAPParser *)self parseListingHeader:a4 length:*(void *)&a5];
    goto LABEL_47;
  }
  if (a3 == 1634759535) {
    goto LABEL_46;
  }
  if (a3 != 1634890614) {
LABEL_53:
  }
    -[RMSDAAPParser unknownChunk:](self, "unknownChunk:", bswap64(*((unsigned int *)a4 + 1) | ((unint64_t)*(unsigned int *)a4 << 32)), a4 + 8, *(void *)&a5);
  uint64_t v6 = 0;
LABEL_47:
  return v6;
}

+ (id)typeForDRCPValueType:(int)a3
{
  if ((a3 - 1) > 0x13) {
    return @"undefined";
  }
  else {
    return off_264E746C8[a3 - 1];
  }
}

+ (void)objectWithData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Failed to parse DAAP response data. %@", (uint8_t *)&v4, 0xCu);
}

- (void)parseXMLContent:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Attempting to process XML response: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setBool:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setBool being passed a %u byte value for: <%@>!");
}

- (void)setSInt8:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setSInt8 being passed a %u byte value for: <%@>!");
}

- (void)setUInt8:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setUInt8 being passed a %u byte value for: <%@>!");
}

- (void)setSInt16:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setSInt16 being passed a %u byte value for: <%@>!");
}

- (void)setUInt16:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setUInt16 being passed a %u byte value for: <%@>!");
}

- (void)setDate:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setDate being passed a %u byte value for: <%@>!");
}

- (void)setUInt32:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setUInt32 being passed a %u byte value for: <%@>!");
}

- (void)setFloat32:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setFloat32 being passed a %u byte value for: <%@>!");
}

- (void)setUInt64:size:inDict:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23C83A000, v0, v1, "setUInt64 being passed a %u byte value for: <%@>!");
}

void __42__RMSDAAPParser_parseContentCodes_length___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23C83A000, v0, v1, "DMAP returned status code %u", v2, v3, v4, v5, v6);
}

@end