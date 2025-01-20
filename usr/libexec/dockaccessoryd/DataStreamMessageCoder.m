@interface DataStreamMessageCoder
+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7;
+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7;
+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6;
+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5;
+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6;
+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6;
+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4;
+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5;
+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4;
@end

@implementation DataStreamMessageCoder

+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] > 0x13)
  {
    id v14 = v11;
    v15 = (char *)[v14 bytes];
    v16 = (char *)[v14 length];
    id v21 = 0;
    v17 = [v12 decrypt:v15 + 4 length:v16 - 28 additionalAuthData:v15 additionalAuthDataLength:4 authTagData:&v16[(void)v15 - 24] authTagDataLength:16 counterData:&v16[(void)v15 - 8] counterDataLength:8 error:&v21];
    id v18 = v21;
    v19 = v18;
    if (v18)
    {
      BOOL v13 = 0;
      if (a7) {
        *a7 = v18;
      }
    }
    else
    {
      BOOL v13 = +[DataStreamMessageCoder _decodeOPACKFrame:v17 receivedHeader:a5 receivedPayload:a6 error:a7];
    }
  }
  else if (a7)
  {
    +[NSError errorWithDomain:@"DKErrorDomain" code:26 userInfo:0];
    BOOL v13 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = (unsigned __int8 *)[v9 bytes];
  id v11 = (char *)[v9 length];

  if (v11 && (unint64_t)(v11 - 1) >= *v10)
  {
    BOOL v13 = (void *)OPACKDecodeBytes();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = (void *)OPACKDecodeBytes();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a4) {
          *a4 = v13;
        }
        if (a5) {
          *a5 = v14;
        }
        BOOL v12 = 1;
      }
      else if (a6)
      {
        +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
        BOOL v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else if (a6)
    {
      +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else if (a6)
  {
    +[NSError errorWithDomain:@"DKErrorDomain" code:26 userInfo:0];
    BOOL v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  if ((unint64_t)[v9 length] > 3)
  {
    id v11 = [v9 subdataWithRange:4, (char *)[v9 length] - 4];
    BOOL v10 = +[DataStreamMessageCoder _decodeOPACKFrame:v11 receivedHeader:a4 receivedPayload:a5 error:a6];
  }
  else if (a6)
  {
    +[NSError errorWithDomain:@"DKErrorDomain" code:26 userInfo:0];
    BOOL v10 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v6 = a4;
  unsigned int v16 = 0;
  Data = (void *)OPACKEncoderCreateData();
  if (Data)
  {
    uint64_t v9 = OPACKEncoderCreateData();
    BOOL v10 = (void *)v9;
    if (v9)
    {
      unint64_t v11 = (unint64_t)[Data length];
      BOOL v12 = (char *)[v10 length];
      if (v11 < 0x100)
      {
        char v15 = v11;
        v8 = +[NSMutableData dataWithCapacity:&v12[v11 + 1]];
        [v8 appendBytes:&v15 length:1];
        [v8 appendData:Data];
        [v8 appendData:v10];
        goto LABEL_15;
      }
      if (a5)
      {
        BOOL v13 = +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
LABEL_11:
        v8 = 0;
        *a5 = v13;
LABEL_15:

        goto LABEL_16;
      }
    }
    else if (a5)
    {
      BOOL v13 = sub_100044EEC(v16);
      goto LABEL_11;
    }
    v8 = 0;
    goto LABEL_15;
  }
  if (a5)
  {
    sub_100044EEC(0);
    v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  return v8;
}

+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  id v9 = a5;
  BOOL v10 = +[DataStreamMessageCoder _encodeOPACKHeader:a3 payload:a4 error:a6];
  unint64_t v11 = v10;
  if (!v10)
  {
LABEL_5:
    id v14 = 0;
    goto LABEL_7;
  }
  BOOL v12 = (char *)[v10 length];
  BOOL v13 = v12 + 20;
  if ((unint64_t)(v12 + 20) >= 0x100000)
  {
    if (a6)
    {
      +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
      id v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v18[0] = 1;
  v18[1] = BYTE2(v12);
  v18[2] = BYTE1(v12);
  v18[3] = (_BYTE)v12;
  char v15 = +[NSData dataWithBytes:v18 length:4];
  unsigned int v16 = [v9 encrypt:v11 additionalAuthenticatedData:v15];

  id v14 = +[NSMutableData dataWithCapacity:v13];
  [v14 appendBytes:v18 length:4];
  [v14 appendData:v16];

LABEL_7:

  return v14;
}

+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v6 = +[DataStreamMessageCoder _encodeOPACKHeader:payload:error:](DataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4);
  v7 = v6;
  if (!v6)
  {
LABEL_5:
    id v9 = 0;
    goto LABEL_7;
  }
  id v8 = [v6 length];
  if ((unint64_t)v8 + 4 >= 0x100000)
  {
    if (a5)
    {
      +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v11[0] = 3;
  v11[1] = BYTE2(v8);
  v11[2] = BYTE1(v8);
  v11[3] = (_BYTE)v8;
  id v9 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:");
  [v9 appendBytes:v11 length:4];
  [v9 appendData:v7];
LABEL_7:

  return v9;
}

+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  return +[DataStreamMessageCoder _decryptEncryptedOPACKFrame:a3 sessionEncryption:a4 receivedHeader:a5 receivedPayload:a6 error:a7];
}

+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  return +[DataStreamMessageCoder _encryptEncryptedOPACKHeader:a3 payload:a4 sessionEncryption:a5 error:a6];
}

+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  return +[DataStreamMessageCoder _unpackUnencryptedOPACKFrame:a3 receivedHeader:a4 receivedPayload:a5 error:a6];
}

+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  return +[DataStreamMessageCoder _buildUnencryptedOPACKHeader:a3 payload:a4 error:a5];
}

+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5
{
  if (dispatch_data_get_size((dispatch_data_t)a3) < 4) {
    return 0;
  }
  subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 4uLL);
  size_t v12 = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v12);

  BOOL v8 = v10 != 0;
  if (v10)
  {
    if (a4) {
      *a4 = *(unsigned char *)buffer_ptr;
    }
    if (a5) {
      *a5 = ((unint64_t)*((unsigned __int8 *)buffer_ptr + 1) << 16) | ((unint64_t)*((unsigned __int8 *)buffer_ptr
    }
                                                                                                + 2) << 8) | *((unsigned __int8 *)buffer_ptr + 3);
  }

  return v8;
}

+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6
{
  if (a4 >= 4)
  {
    if (a5) {
      *a5 = *a3;
    }
    if (a6) {
      *a6 = ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
    }
  }
  return a4 > 3;
}

+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4
{
  v9[0] = @"protocol";
  v9[1] = @"event";
  v10[0] = a3;
  v10[1] = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5
{
  v12[0] = @"protocol";
  v12[1] = @"request";
  v13[0] = a3;
  v13[1] = a4;
  v12[2] = @"id";
  v13[2] = a5;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  dispatch_data_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v12[0] = @"protocol";
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"protocol"];
  v13[0] = v6;
  v12[1] = @"response";
  id v7 = [v5 objectForKeyedSubscript:@"request"];
  v13[1] = v7;
  v12[2] = @"id";
  id v8 = [v5 objectForKeyedSubscript:];

  v13[2] = v8;
  void v12[3] = @"status";
  id v9 = +[NSNumber numberWithUnsignedShort:v4];
  void v13[3] = v9;
  dispatch_data_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

@end