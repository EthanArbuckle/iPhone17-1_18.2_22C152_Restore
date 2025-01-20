@interface GEOLogFormatter
+ (id)sharedFormatter;
- (GEOLogFormatter)init;
- (NSMutableDictionary)requestResponseCollector;
- (geo_isolater)isolation;
- (id)descriptionForPropertyListData:(id)a3 capturedStateType:(id)a4;
- (id)formattedAttributedStringForType:(id)a3 value:(id)a4;
- (id)formattedStringForEnumType:(id)a3 number:(id)a4;
- (id)formattedStringForEnumType:(id)a3 value:(id)a4;
- (id)formattedStringForMultiPartRequestResponse:(id)a3 compressed:(unsigned __int8)a4;
- (id)formattedStringForNumberType:(id)a3 unsignedLongLong:(unint64_t)a4;
- (id)formattedStringForPBCodableData:(id)a3;
- (id)formattedStringForProtobufType:(id)a3 data:(id)a4;
- (id)formattedStringForProtobufType:(id)a3 value:(id)a4;
- (id)formattedStringForRequestResponse:(id)a3;
- (id)formattedStringForRequestResponseMultipart:(id)a3 partData:(id)a4 className:(id)a5 compressed:(unsigned __int8)a6;
- (id)formattedStringForRequestResponseType:(id)a3 value:(id)a4;
- (id)formattedStringForSinglePartRequestResponse:(id)a3 compressed:(unsigned __int8)a4;
- (id)formattedStringForStateType:(id)a3 data:(id)a4;
- (id)formattedStringForStructType:(id)a3 data:(id)a4;
- (id)formattedStringForStructType:(id)a3 value:(id)a4;
@end

@implementation GEOLogFormatter

- (id)descriptionForPropertyListData:(id)a3 capturedStateType:(id)a4
{
  uint64_t v8 = 0;
  v4 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v8];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 description];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)formattedStringForStructType:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(GEOLogFormatter *)self formattedStringForStructType:v6 data:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)formattedStringForStructType:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!StringsCaseInsensitiveEqual(v5, @"coordinate"))
  {
    uint64_t v7 = 0;
    while (1)
    {
      if (v7 == 24 || (uint64_t v8 = *(uint64_t *)((char *)&formatters + v7 + 8), v8 == [v6 length]))
      {
        if (StringsCaseInsensitiveEqual(v5, *(__CFString **)((char *)&formatters + v7))) {
          break;
        }
      }
      v7 += 24;
      if (v7 == 72) {
        goto LABEL_16;
      }
    }
    uint64_t v10 = (*(void (**)(id))((char *)&formatters + v7 + 16))(v6);
    goto LABEL_20;
  }
  if ([v6 length] != 16)
  {
    if ([v6 length] != 24)
    {
LABEL_16:
      v9 = 0;
      goto LABEL_21;
    }
    double v13 = 0.0;
    double v14 = 0.0;
    uint64_t v15 = 0;
    [v6 getBytes:&v13 length:24];
    if (v13 != -180.0 || v14 != -180.0)
    {
      [NSString stringWithFormat:@"%f,%f,%f", v13, v14, *(void *)&v13, *(void *)&v14, v15];
      goto LABEL_19;
    }
LABEL_15:
    v9 = @"Invalid";
    goto LABEL_21;
  }
  double v13 = 0.0;
  double v14 = 0.0;
  [v6 getBytes:&v13 length:16];
  if (v13 == -180.0 && v14 == -180.0) {
    goto LABEL_15;
  }
  [NSString stringWithFormat:@"%f,%f", v13, v14, *(void *)&v13, *(void *)&v14, v12];
  uint64_t v10 = LABEL_19:;
LABEL_20:
  v9 = (__CFString *)v10;
LABEL_21:

  return v9;
}

+ (id)sharedFormatter
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__GEOLogFormatter_sharedFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, block);
  }
  v2 = (void *)sharedFormatter_formatter;

  return v2;
}

uint64_t __34__GEOLogFormatter_sharedFormatter__block_invoke(uint64_t a1)
{
  sharedFormatter_formatter = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (GEOLogFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOLogFormatter;
  v2 = [(GEOLogFormatter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    requestResponseCollector = v2->_requestResponseCollector;
    v2->_requestResponseCollector = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)formattedAttributedStringForType:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)MEMORY[0x237E04330]();
  v9 = [(GEOLogFormatter *)self formattedStringForStructType:v6 value:v7];
  if (!v9)
  {
    v9 = [(GEOLogFormatter *)self formattedStringForEnumType:v6 value:v7];
    if (!v9)
    {
      v9 = [(GEOLogFormatter *)self formattedStringForProtobufType:v6 value:v7];
      if (!v9)
      {
        v9 = [(GEOLogFormatter *)self formattedStringForRequestResponseType:v6 value:v7];
        if (!v9)
        {
          v9 = [v7 description];
        }
      }
    }
  }
  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  if (v9) {
    v11 = v9;
  }
  else {
    v11 = &stru_26E9B6B88;
  }
  uint64_t v12 = (void *)[v10 initWithString:v11];

  return v12;
}

- (id)formattedStringForStateType:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 hasSuffix:@"/plist"]
    || ([v6 substringToIndex:objc_msgSend(v6, "length") - objc_msgSend(@"/plist", "length")],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        [(GEOLogFormatter *)self descriptionForPropertyListData:v7 capturedStateType:v8], v9 = objc_claimAutoreleasedReturnValue(), v8, !v9))
  {
    v9 = [v7 description];
  }

  return v9;
}

- (geo_isolater)isolation
{
  return self->_isolation;
}

- (NSMutableDictionary)requestResponseCollector
{
  return self->_requestResponseCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestResponseCollector, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

- (id)formattedStringForProtobufType:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [(GEOLogFormatter *)self formattedStringForProtobufType:v6 data:v7];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)formattedStringForProtobufType:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"PBCodable"])
  {
    objc_super v8 = [(GEOLogFormatter *)self formattedStringForPBCodableData:v7];
  }
  else if ([v6 hasPrefix:@"pb/"])
  {
    v9 = [v6 substringFromIndex:3];

    id v6 = v9;
    if (protobufClassForType_onceToken != -1) {
      dispatch_once(&protobufClassForType_onceToken, &__block_literal_global);
    }
    id v10 = [(id)protobufClassForType_typeToClassName objectForKeyedSubscript:v6];
    v11 = v10;
    if (v10)
    {
      NSClassFromString(v10);
      objc_super v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = 0;
    }

    if (v8)
    {
      id v12 = [v8 alloc];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v13 = (void *)[v12 initWithData:v7];
        objc_super v8 = [v13 formattedText];
      }
      else
      {
        objc_super v8 = 0;
      }
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)formattedStringForRequestResponseType:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"requestresponse/pbcodable"] & 1) != 0
    || ([v6 isEqualToString:@"requestresponseV2/pbcodable"] & 1) != 0
    || [v6 isEqualToString:@"requestresponseV3/pbcodable"])
  {
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (getenv("GEO_RR_Log_Formatter_Disabled"))
      {
        id v9 = [v8 debugDescription];
      }
      else
      {
        uint64_t v13 = 0;
        double v14 = &v13;
        uint64_t v15 = 0x3032000000;
        v16 = __Block_byref_object_copy_;
        v17 = __Block_byref_object_dispose_;
        id v18 = 0;
        id v10 = [(GEOLogFormatter *)self isolation];
        id v12 = v8;
        geo_isolate_sync();

        id v9 = (id)v14[5];
        _Block_object_dispose(&v13, 8);
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __80__GEOLogFormatter_RequestResponse__formattedStringForRequestResponseType_value___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) formattedStringForRequestResponse:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)formattedStringForRequestResponse:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    char v10 = 0;
    [v4 getBytes:&v10 range:0, 1];
    uint64_t v5 = v10 & 0x3C;
    int v6 = v10 & 3;
    if (v6 == 2)
    {
      uint64_t v8 = [(GEOLogFormatter *)self formattedStringForMultiPartRequestResponse:v4 compressed:v5];
    }
    else
    {
      id v7 = 0;
      if (v6 != 1) {
        goto LABEL_8;
      }
      uint64_t v8 = [(GEOLogFormatter *)self formattedStringForSinglePartRequestResponse:v4 compressed:v5];
    }
    id v7 = (void *)v8;
  }
  else
  {
    id v7 = 0;
  }
LABEL_8:

  return v7;
}

- (id)formattedStringForPBCodableData:(id)a3
{
  return [(GEOLogFormatter *)self formattedStringForSinglePartRequestResponse:a3 compressed:0];
}

- (id)formattedStringForSinglePartRequestResponse:(id)a3 compressed:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  id v15 = 0;
  id v16 = 0;
  BOOL NameAndRemainderAtOffset = getNameAndRemainderAtOffset(v5, 1uLL, &v16, &v15);
  id v7 = v16;
  id v8 = v15;
  if (NameAndRemainderAtOffset)
  {
    if (v4)
    {
      id v9 = (void *)MEMORY[0x237E04330]();
      char v10 = decompress(v8, v4);
      v11 = v10;
      if (v10)
      {
        id v12 = v10;

        id v8 = v12;
      }
    }
    uint64_t v13 = formattedStringFromProtobuf(v7, v8);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)formattedStringForMultiPartRequestResponse:(id)a3 compressed:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 0xC)
  {
    id v8 = objc_alloc_init(Multipart);
    [v6 getBytes:&v8->identifier range:1, 8];
    [v6 getBytes:&v8->partIndex range:9];
    [v6 getBytes:&v8->partCount range:10];
    id v13 = 0;
    id v14 = 0;
    BOOL NameAndRemainderAtOffset = getNameAndRemainderAtOffset(v6, 0xBuLL, &v14, &v13);
    id v10 = v14;
    id v11 = v13;
    id v7 = 0;
    if (NameAndRemainderAtOffset)
    {
      id v7 = [(GEOLogFormatter *)self formattedStringForRequestResponseMultipart:v8 partData:v11 className:v10 compressed:v4];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)formattedStringForRequestResponseMultipart:(id)a3 partData:(id)a4 className:(id)a5 compressed:(unsigned __int8)a6
{
  int v6 = a6;
  id v10 = (unsigned __int8 *)a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = v10[17];
  if (v13 > 0x64 || v13 <= v10[16])
  {
    v22 = 0;
  }
  else
  {
    id v14 = [(GEOLogFormatter *)self requestResponseCollector];
    [v14 setObject:v11 forKeyedSubscript:v10];

    id v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v10[17]];
    if (v10[17])
    {
      unsigned __int8 v16 = 0;
      while (1)
      {
        v17 = (void *)[v10 copyWithIndex:v16];
        id v18 = [(GEOLogFormatter *)self requestResponseCollector];
        v19 = [v18 objectForKeyedSubscript:v17];

        if (!v19) {
          break;
        }
        [v15 setObject:v19 forKeyedSubscript:v17];

        ++v16;
        uint64_t v20 = v10[17];
        if (v20 <= v16)
        {
          uint64_t v21 = v20 << 15;
          goto LABEL_10;
        }
      }
      v22 = [NSString stringWithFormat:@"[%016llx/%u/%u] (waiting for %u)", *((void *)v10 + 1), v10[16], v10[17], v16];
    }
    else
    {
      uint64_t v21 = 0;
LABEL_10:
      v17 = [MEMORY[0x263EFF990] dataWithCapacity:v21];
      unsigned int v23 = v10[17];
      if (v10[17])
      {
        int v35 = v6;
        int v24 = 0;
        do
        {
          v25 = (void *)[v10 copyWithIndex:v24];
          v26 = [v15 objectForKeyedSubscript:v25];
          v27 = [(GEOLogFormatter *)self requestResponseCollector];
          [v27 setObject:0 forKeyedSubscript:v25];

          [v17 appendData:v26];
          ++v24;
          unsigned int v23 = v10[17];
        }
        while (v23 > v24);
        int v6 = v35;
      }
      if (v6)
      {
        v28 = (void *)MEMORY[0x237E04330]();
        v29 = decompress(v17, v6);
        v30 = v29;
        if (v29)
        {
          id v31 = v29;

          v17 = v31;
        }

        unsigned int v23 = v10[17];
      }
      v32 = [NSString stringWithFormat:@"[%016llx/%u/%u] ", *((void *)v10 + 1), v10[16], v23];
      v33 = formattedStringFromProtobuf(v12, v17);
      v22 = [v32 stringByAppendingString:v33];
    }
  }

  return v22;
}

- (id)formattedStringForEnumType:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(GEOLogFormatter *)self formattedStringForEnumType:v6 number:v7];
    if (!v8)
    {
      id v8 = -[GEOLogFormatter formattedStringForNumberType:unsignedLongLong:](self, "formattedStringForNumberType:unsignedLongLong:", v6, [v7 unsignedLongLongValue]);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)formattedStringForEnumType:(id)a3 number:(id)a4
{
  id v5 = a4;
  uint64_t v6 = 0;
  char v7 = 1;
  while (1)
  {
    char v8 = v7;
    if (StringsCaseInsensitiveEqual(a3, *((void **)&formatters_0 + 2 * v6))) {
      break;
    }
    char v7 = 0;
    uint64_t v6 = 1;
    if ((v8 & 1) == 0)
    {
      id v9 = 0;
      goto LABEL_6;
    }
  }
  id v9 = (*((void (**)(void *))&formatters_0 + 2 * v6 + 1))(v5);
LABEL_6:

  return v9;
}

- (id)formattedStringForNumberType:(id)a3 unsignedLongLong:(unint64_t)a4
{
  return 0;
}

@end