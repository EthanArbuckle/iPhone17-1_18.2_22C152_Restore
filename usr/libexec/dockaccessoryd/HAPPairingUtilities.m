@interface HAPPairingUtilities
+ (BOOL)parseAddPairingResponse:(id)a3 error:(id *)a4;
+ (BOOL)parseRemovePairingResponse:(id)a3 error:(id *)a4;
+ (id)createAddPairingRequestForPairingIdentity:(id)a3 error:(id *)a4;
+ (id)createListPairingsRequest:(id *)a3;
+ (id)createRemovePairingRequestForPairingIdentity:(id)a3 error:(id *)a4;
+ (id)parseListPairingsResponse:(id)a3 error:(id *)a4;
@end

@implementation HAPPairingUtilities

+ (id)createAddPairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  TLV8BufferInit();
  uint64_t appended = sub_10002546C();
  if (appended) {
    goto LABEL_6;
  }
  v7 = [v5 identifier];
  v8 = [v7 dataUsingEncoding:4];

  if (!v8)
  {
    uint64_t appended = 4294960568;
LABEL_16:

    goto LABEL_6;
  }
  id v9 = v8;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = TLV8BufferAppend();
  if (v10)
  {
    uint64_t appended = v10;
    goto LABEL_16;
  }

  v11 = [v5 publicKey];
  id v12 = [v11 data];
  [v12 bytes];
  v13 = [v11 data];
  [v13 length];
  uint64_t appended = TLV8BufferAppend();

  if (!appended)
  {
    [v5 permissions];
    uint64_t appended = TLV8BufferAppendUInt64();
    if (!appended)
    {
      uint64_t v16 = +[NSData dataWithBytes:0 length:0];
      if (v16)
      {
        v14 = (void *)v16;
        TLV8BufferFree();
        goto LABEL_9;
      }
      uint64_t appended = 4294960568;
    }
  }
LABEL_6:
  TLV8BufferFree();
  if (a4)
  {
    +[NSError errorWithOSStatus:appended];
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_9:

  return v14;
}

+ (BOOL)parseAddPairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_10002551C(a3);
  int v6 = v5;
  if (a4 && v5)
  {
    *a4 = +[NSError errorWithOSStatus:v5];
  }
  return v6 == 0;
}

+ (id)createRemovePairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  TLV8BufferInit();
  uint64_t v6 = sub_10002546C();
  if (v6) {
    goto LABEL_2;
  }
  v8 = [v5 identifier];
  id v9 = [v8 dataUsingEncoding:4];

  if (!v9)
  {
    uint64_t v6 = 4294960568;
LABEL_14:

    goto LABEL_2;
  }
  id v10 = v9;
  [v10 bytes];
  [v10 length];
  uint64_t v11 = TLV8BufferAppend();
  if (v11)
  {
    uint64_t v6 = v11;
    goto LABEL_14;
  }

  uint64_t v12 = +[NSData dataWithBytes:0 length:0];
  if (v12)
  {
    v7 = (void *)v12;
    TLV8BufferFree();
    goto LABEL_9;
  }
  uint64_t v6 = 4294960568;
LABEL_2:
  TLV8BufferFree();
  if (a4)
  {
    +[NSError errorWithOSStatus:v6];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (BOOL)parseRemovePairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_10002551C(a3);
  int v6 = v5;
  if (a4 && v5)
  {
    *a4 = +[NSError errorWithOSStatus:v5];
  }
  return v6 == 0;
}

+ (id)createListPairingsRequest:(id *)a3
{
  TLV8BufferInit();
  uint64_t v4 = sub_10002546C();
  if (!v4)
  {
    uint64_t v6 = +[NSData dataWithBytes:0 length:0];
    if (v6)
    {
      uint64_t v5 = (void *)v6;
      TLV8BufferFree();
      goto LABEL_7;
    }
    uint64_t v4 = 4294960568;
  }
  TLV8BufferFree();
  if (a3)
  {
    +[NSError errorWithOSStatus:v4];
    uint64_t v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_7:

  return v5;
}

+ (id)parseListPairingsResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];
  uint64_t v6 = +[NSMutableArray arrayWithCapacity:16];
  uint64_t v7 = sub_10002551C(v5);
  if (v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v8 = TLV8GetOrCopyCoalesced();
    if (v8)
    {
      uint64_t v7 = v8;
      id v15 = 0;
      id v11 = 0;
    }
    else
    {
      id v9 = objc_alloc((Class)NSString);
      id v10 = +[NSData dataWithBytes:0 length:0];
      id v11 = [v9 initWithData:v10 encoding:4];

      if (v11)
      {
        uint64_t v12 = TLV8GetOrCopyCoalesced();
        if (v12)
        {
          uint64_t v7 = v12;
          id v15 = 0;
        }
        else
        {
          id v13 = objc_alloc((Class)HMFPairingKey);
          v14 = +[NSData dataWithBytes:0 length:0];
          id v15 = [v13 initWithPairingKeyData:v14];

          if (v15)
          {
            uint64_t v16 = TLV8Get();
            if (v16) {
              uint64_t v7 = v16;
            }
            else {
              uint64_t v7 = 4294960553;
            }
          }
          else
          {
            uint64_t v7 = 4294960596;
          }
        }
      }
      else
      {
        id v15 = 0;
        uint64_t v7 = 4294960568;
      }
    }

    if (!a4) {
      goto LABEL_14;
    }
  }
  *a4 = +[NSError errorWithOSStatus:v7];
LABEL_14:

  return 0;
}

@end