@interface SiriCoreAceSerialization
+ (BOOL)tryParsingAceHeaderData:(id)a3 compressionType:(unsigned __int8 *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)tryParsingPacketWithBytes:(const void *)a3 length:(unint64_t)a4 rawPacket:(id *)a5 object:(id *)a6 bytesRead:(unint64_t *)a7 error:(id *)a8;
+ (id)_insufficientDataErrorForBytesNeeded:(unint64_t)a3 available:(unint64_t)a4;
+ (id)_tryParsingPlistPacketBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)_tryParsingSpeechPacketBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)dataForNop;
+ (id)dataForObject:(id)a3 error:(id *)a4;
+ (id)dataForPing:(unsigned int)a3;
+ (id)dataForPong:(unsigned int)a3;
+ (id)dataForSpeechPacket:(id)a3 error:(id *)a4;
+ (id)dataForStreamEnd;
+ (id)dataForStreamHeaderWithCompressionType:(unsigned __int8)a3;
@end

@implementation SiriCoreAceSerialization

+ (id)_insufficientDataErrorForBytesNeeded:(unint64_t)a3 available:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"SiriCoreAceSerializationErrorUserInfoBytesNeeded";
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"SiriCoreAceSerializationErrorUserInfoBytesAvailable";
  v11[0] = v5;
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  v11[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:0 userInfo:v7];

  return v8;
}

+ (BOOL)tryParsingPacketWithBytes:(const void *)a3 length:(unint64_t)a4 rawPacket:(id *)a5 object:(id *)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  v33[1] = *MEMORY[0x263EF8340];
  if (!a3 || (unint64_t v13 = a4 - 5, a4 < 5))
  {
    uint64_t v17 = 5;
    unint64_t v13 = a4;
LABEL_7:
    v18 = [a1 _insufficientDataErrorForBytesNeeded:v17 available:v13];
    unint64_t v19 = 0;
    v20 = 0;
    goto LABEL_8;
  }
  int v14 = *(unsigned __int8 *)a3;
  unsigned __int8 v15 = 0;
  switch(*(unsigned char *)a3)
  {
    case 0:
      unsigned __int8 v15 = 1;
      goto LABEL_26;
    case 1:
    case 2:
    case 7:
      unint64_t v16 = bswap32(*(_DWORD *)((char *)a3 + 1));
      if (v13 < v16)
      {
        uint64_t v17 = v16;
        goto LABEL_7;
      }
      v23 = (char *)a3 + 5;
      v24 = (char *)a3 + 5;
      if (v14 == 7)
      {
        v20 = +[SiriCoreAceSerialization _tryParsingSpeechPacketBytes:v24 length:v16];
        if (!v20)
        {
          v25 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v23 length:v16];
          v32 = @"SiriCoreAceSerializationErrorUserInfoPlist";
          v33[0] = v25;
          v26 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
          v27 = (void *)MEMORY[0x263F087E8];
          uint64_t v28 = 6;
          goto LABEL_31;
        }
LABEL_29:
        id v29 = v20;
        v18 = 0;
        unint64_t v19 = v16 + 5;
        goto LABEL_32;
      }
      v20 = +[SiriCoreAceSerialization _tryParsingPlistPacketBytes:v24 length:v16];
      if (v20) {
        goto LABEL_29;
      }
      v25 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v23 length:v16];
      v30 = @"SiriCoreAceSerializationErrorUserInfoPlist";
      v31 = v25;
      v26 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = 4;
LABEL_31:
      v18 = [v27 errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:v28 userInfo:v26];

      unint64_t v19 = 0;
LABEL_32:

LABEL_8:
      unsigned int v21 = 0;
      unsigned __int8 v15 = 0;
      if (a5)
      {
LABEL_9:
        a5->var0 = v15;
        *(_WORD *)(&a5->var0 + 1) = 0;
        *(&a5->var0 + 3) = 0;
        a5->var1 = v21;
      }
LABEL_10:
      if (a6) {
        *a6 = v20;
      }
      if (a7) {
        *a7 = v19;
      }
      if (a8) {
        *a8 = v18;
      }

      return v18 != 0;
    case 3:
      unsigned __int8 v15 = 2;
      goto LABEL_26;
    case 4:
      unsigned __int8 v15 = 3;
      goto LABEL_26;
    case 5:
    case 6:
      goto LABEL_26;
    default:
      if (v14 == 255) {
        unsigned __int8 v15 = 4;
      }
      else {
        unsigned __int8 v15 = 0;
      }
LABEL_26:
      v18 = 0;
      v20 = 0;
      unsigned int v21 = bswap32(*(_DWORD *)((char *)a3 + 1));
      unint64_t v19 = 5;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
  }
}

+ (id)_tryParsingSpeechPacketBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4 && (size_t v4 = *(unsigned __int8 *)a3, v5 = a4 - 1 - v4, a4 - 1 >= v4))
  {
    v7 = (char *)a3 + 1;
    id v8 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v4];
    memmove((void *)[v8 mutableBytes], v7, v4);
    uint64_t v9 = [[NSString alloc] initWithData:v8 encoding:4];
    v10 = (void *)v9;
    v6 = 0;
    if (v5 >= 2 && v9)
    {
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v6 = 0;
      }
      else
      {
        v11 = &v7[v4];
        unsigned int v23 = *(unsigned __int16 *)&v7[v4];
        int v12 = (int)bswap32(*(unsigned __int16 *)&v7[v4 + 2]) >> 16;
        id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (v12 < 1)
        {
LABEL_13:
          v6 = objc_alloc_init(SiriCoreSpeechPacket);
          [(SiriCoreSpeechPacket *)v6 setRefId:v10];
          [(SiriCoreSpeechPacket *)v6 setPacketNumber:(__int16)(bswap32(v23) >> 16)];
          [(SiriCoreSpeechPacket *)v6 setPackets:v13];
        }
        else
        {
          LOWORD(v14) = 0;
          unint64_t v15 = v5 - 4;
          unint64_t v16 = v11 + 4;
          while (1)
          {
            unint64_t v17 = v15 - 2;
            if (v15 < 2) {
              break;
            }
            unsigned int v18 = bswap32(*(unsigned __int16 *)v16) >> 16;
            if (v17 < (__int16)v18) {
              break;
            }
            size_t v19 = (__int16)v18;
            v20 = v16 + 2;
            id v21 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:(__int16)v18];
            memmove((void *)[v21 mutableBytes], v20, v19);
            unint64_t v16 = &v20[v19];
            unint64_t v15 = v17 - v19;
            [v13 addObject:v21];

            int v14 = (__int16)(v14 + 1);
            if (v14 >= v12) {
              goto LABEL_13;
            }
          }
          v6 = 0;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_tryParsingPlistPacketBytes:(const void *)a3 length:(unint64_t)a4
{
  size_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 length:a4];
  unint64_t v5 = [MEMORY[0x263F64700] aceObjectWithPlistData:v4];

  return v5;
}

+ (BOOL)tryParsingAceHeaderData:(id)a3 compressionType:(unsigned __int8 *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  int v20 = 0;
  if ((unint64_t)[v10 length] < 4)
  {
    int v14 = (void *)*MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      unint64_t v15 = v14;
      *(_DWORD *)buf = 136315650;
      v22 = "+[SiriCoreAceSerialization tryParsingAceHeaderData:compressionType:bytesRead:error:]";
      __int16 v23 = 2048;
      *(void *)v24 = 4;
      *(_WORD *)&v24[8] = 2048;
      uint64_t v25 = [v10 length];
      _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_INFO, "%s Ace Header needs %lu bytes, but have %lu", buf, 0x20u);
    }
    uint64_t v13 = objc_msgSend(a1, "_insufficientDataErrorForBytesNeeded:available:", 4, objc_msgSend(v10, "length"));
LABEL_12:
    unint64_t v16 = (void *)v13;
    unint64_t v17 = 0;
    unsigned __int8 v18 = 1;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  [v10 getBytes:&v20 length:4];
  if ((unsigned __int16)v20 != 52394 || BYTE2(v20) != 238)
  {
    int v12 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "+[SiriCoreAceSerialization tryParsingAceHeaderData:compressionType:bytesRead:error:]";
      __int16 v23 = 1024;
      *(_DWORD *)v24 = v20;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = BYTE1(v20);
      LOWORD(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 2) = BYTE2(v20);
      _os_log_error_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_ERROR, "%s Got invalid header for connection! %x %x %x", buf, 0x1Eu);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:2 userInfo:0];
    goto LABEL_12;
  }
  unint64_t v16 = 0;
  unsigned __int8 v18 = HIBYTE(v20);
  unint64_t v17 = 4;
  if (a4) {
LABEL_13:
  }
    *a4 = v18;
LABEL_14:
  if (a5) {
    *a5 = v17;
  }
  if (a6) {
    *a6 = v16;
  }

  return v16 != 0;
}

+ (id)dataForSpeechPacket:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [v7 refId];
  uint64_t v9 = (const char *)[v8 UTF8String];

  if (v9)
  {
    size_t v10 = strlen(v9);
    unsigned __int8 v11 = v10;
    if (v10 > 0x7F)
    {
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:6 userInfo:0];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        unsigned __int8 v11 = 0;
LABEL_9:
        unsigned int v15 = 0;
        goto LABEL_11;
      }
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
  uint64_t v14 = [v7 packetNumber];
  unsigned int v15 = v14;
  if (v14 != (__int16)v14)
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:6 userInfo:0];
    goto LABEL_9;
  }
  uint64_t v13 = 0;
LABEL_11:
  unint64_t v16 = [v7 packets];
  unint64_t v17 = v16;
  if (v13) {
    goto LABEL_12;
  }
  unint64_t v20 = [v16 count];
  v48 = v17;
  if (v20 >> 15)
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:6 userInfo:0];
    if (v13)
    {
LABEL_12:
      dispatch_data_t v18 = 0;
      if (!a4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    SEL v44 = a2;
    id v45 = a1;
    int v21 = 0;
  }
  else
  {
    LODWORD(v13) = v20;
    SEL v44 = a2;
    id v45 = a1;
    size = a4;
    int v21 = 2 * v20;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          v21 += objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "length", v44, v45);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v24);
    }

    a4 = size;
    unint64_t v17 = v48;
  }
  signed int v27 = v21 + v11 + 5;
  unsigned int v28 = bswap32(v27);
  uint64_t sizea = v27 + 5;
  id v29 = (char *)malloc_type_malloc(sizea, 0x7046D227uLL);
  v30 = v29;
  *id v29 = 7;
  *(_DWORD *)(v29 + 1) = v28;
  v29[5] = v11;
  v31 = v29 + 6;
  if ((char)v11 >= 1)
  {
    memmove(v29 + 6, v9, v11);
    v31 = (_WORD *)((char *)v31 + v11);
  }
  _WORD *v31 = bswap32(v15) >> 16;
  v31[1] = bswap32(v13) >> 16;
  v32 = (char *)(v31 + 2);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v33 = v17;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v34)
  {
    unint64_t v35 = v34;
    uint64_t v36 = 0;
    uint64_t v37 = *(void *)v50;
    for (uint64_t j = *(void *)v50; ; uint64_t j = *(void *)v50)
    {
      if (j != v37) {
        objc_enumerationMutation(v33);
      }
      v39 = *(void **)(*((void *)&v49 + 1) + 8 * v36);
      uint64_t v40 = objc_msgSend(v39, "length", v44, v45);
      *(_WORD *)v32 = bswap32(v40) >> 16;
      v41 = v32 + 2;
      memmove(v41, (const void *)[v39 bytes], v40);
      v32 = &v41[v40];
      if (++v36 >= v35)
      {
        uint64_t v42 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (!v42)
        {
          unint64_t v17 = v48;
          break;
        }
        unint64_t v35 = v42;
        uint64_t v36 = 0;
      }
    }
  }

  if (v32 - v30 != sizea)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:v44 object:v45 file:@"SiriCoreAceSerialization.m" lineNumber:229 description:@"Error serializing SiriCoreSpeechPacket"];
  }
  dispatch_data_t v18 = dispatch_data_create(v30, sizea, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  uint64_t v13 = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v13;
LABEL_14:

  return v18;
}

+ (id)dataForStreamEnd
{
  char v5 = 0;
  int buffer = 255;
  dispatch_data_t v2 = dispatch_data_create(&buffer, 5uLL, 0, 0);

  return v2;
}

+ (id)dataForNop
{
  char v5 = 0;
  int buffer = 0;
  dispatch_data_t v2 = dispatch_data_create(&buffer, 5uLL, 0, 0);

  return v2;
}

+ (id)dataForPong:(unsigned int)a3
{
  char buffer = 4;
  unsigned int v6 = bswap32(a3);
  dispatch_data_t v3 = dispatch_data_create(&buffer, 5uLL, 0, 0);

  return v3;
}

+ (id)dataForPing:(unsigned int)a3
{
  char buffer = 3;
  unsigned int v6 = bswap32(a3);
  dispatch_data_t v3 = dispatch_data_create(&buffer, 5uLL, 0, 0);

  return v3;
}

+ (id)dataForObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 _serializedData];
  if (v6
    || ([v5 dictionary], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v13 = (void *)v12,
        [MEMORY[0x263F08AC0] dataWithPropertyList:v12 format:200 options:0 error:a4],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        v13,
        v6))
  {
    uint64_t v7 = [v6 length];
    id v8 = (char *)malloc_type_malloc(v7 + 5, 0xBD97235BuLL);
    char *v8 = 2;
    *(_DWORD *)(v8 + 1) = bswap32(v7);
    id v9 = v6;
    memmove(v8 + 5, (const void *)[v9 bytes], v7);
    dispatch_data_t v10 = dispatch_data_create(v8, v7 + 5, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  }
  else if (a4 && !*a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreAceSerializationErrorDomain" code:5 userInfo:0];
    dispatch_data_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_data_t v10 = 0;
  }

  return v10;
}

+ (id)dataForStreamHeaderWithCompressionType:(unsigned __int8)a3
{
  char v6 = -18;
  __int16 buffer = -13142;
  unsigned __int8 v7 = a3;
  dispatch_data_t v3 = dispatch_data_create(&buffer, 4uLL, 0, 0);

  return v3;
}

@end