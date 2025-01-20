@interface OptInOutMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optIn;
- (IdsMutation)idsMutation;
- (NSData)accountKeyHash;
- (NSMutableArray)devicesArray;
- (NSMutableArray)extensions;
- (OptInOutMutation)init;
- (id)data;
- (id)description;
- (unint64_t)parsedLength;
- (unint64_t)timestampMs;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevicesArray:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setIdsMutation:(id)a3;
- (void)setOptIn:(BOOL)a3;
- (void)setParsedLength:(unint64_t)a3;
- (void)setTimestampMs:(unint64_t)a3;
@end

@implementation OptInOutMutation

- (OptInOutMutation)init
{
  v6.receiver = self;
  v6.super_class = (Class)OptInOutMutation;
  v2 = [(OptInOutMutation *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(OptInOutMutation *)v2 setExtensions:v3];

    v4 = +[NSMutableArray array];
    [(OptInOutMutation *)v2 setDevicesArray:v4];
  }
  return v2;
}

- (id)data
{
  v3 = +[NSMutableData data];
  v4 = [(OptInOutMutation *)self accountKeyHash];
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (v5
    && [(TLSMessageClass *)self encodeBool:[(OptInOutMutation *)self optIn] buffer:v3]
    && [(TLSMessageClass *)self encodeUint64:[(OptInOutMutation *)self timestampMs] buffer:v3])
  {
    objc_super v6 = +[NSMutableData data];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = [(OptInOutMutation *)self devicesArray];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) data];
          if (!v12)
          {

            goto LABEL_20;
          }
          v13 = (void *)v12;
          [v6 appendData:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v14 = 0;
    if ([(TLSMessageClass *)self encodeByteArray:v6 minLength:0 maxLength:0xFFFFLL buffer:v3])
    {
      v15 = [(OptInOutMutation *)self extensions];
      unsigned int v16 = [(TLSMessageClass *)self encodeExtensions:v15 buffer:v3];

      if (v16) {
        id v14 = v3;
      }
      else {
LABEL_20:
      }
        id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  id v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  id v43 = 0;
  id v11 = [v10 parseHashValue:v6 end:v9 result:&v43];
  id v12 = v43;
  if (!v11)
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v29 = kTransparencyErrorDecode;
    CFStringRef v30 = @"failed to parse account key from OptInOut";
    uint64_t v31 = -242;
LABEL_17:
    +[TransparencyError errorWithDomain:v29 code:v31 description:v30];
    id v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  [v10 setAccountKeyHash:v12];
  unsigned __int8 v42 = 0;
  id v13 = [v10 parseBool:v11 end:v9 result:&v42];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v29 = kTransparencyErrorDecode;
    CFStringRef v30 = @"failed to parse optIn BOOLean from OptInOut";
    uint64_t v31 = -274;
    goto LABEL_17;
  }
  id v14 = v13;
  [v10 setOptIn:v42];
  uint64_t v41 = 0;
  id v15 = [v10 parseUint64:v14 end:v9 result:&v41];
  if (!v15)
  {
    if (a4)
    {
      uint64_t v29 = kTransparencyErrorDecode;
      CFStringRef v30 = @"failed to parse timestampMs from OptInOut";
      uint64_t v31 = -275;
      goto LABEL_17;
    }
LABEL_18:
    id v28 = 0;
    goto LABEL_31;
  }
  id v16 = v15;
  [v10 setTimestampMs:v41];
  id v40 = 0;
  id v17 = [v10 parseByteArray:v16 end:v9 minLength:0 maxLength:0xFFFFLL result:&v40];
  id v18 = v40;
  id v19 = v18;
  if (!v17)
  {
    if (a4)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-360 description:@"failed to parse devices from OptInOut"];
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
    }
    goto LABEL_30;
  }
  v34 = a4;
  id v35 = v17;
  if ([v18 length])
  {
    while (1)
    {
      id v39 = 0;
      long long v20 = +[IdsDeviceState parseFromData:v19 error:&v39];
      id v21 = v39;
      v22 = v21;
      if (!v20) {
        break;
      }
      v23 = [v10 devicesArray];
      [v23 addObject:v20];

      id v24 = v19;
      +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)[v20 parsedLength] + (void)objc_msgSend(v24, "bytes"), (unsigned char *)objc_msgSend(v24, "length") - (unsigned char *)objc_msgSend(v20, "parsedLength"));
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      if (![v19 length]) {
        goto LABEL_8;
      }
    }
    if (a4 && v21) {
      *a4 = v21;
    }

    id v28 = 0;
    goto LABEL_30;
  }
LABEL_8:
  id v38 = 0;
  v25 = [v10 parseExtensions:v35 end:v9 result:&v38];
  id v26 = v38;
  if (v25) {
    goto LABEL_9;
  }

  id v37 = 0;
  id v32 = [v10 parseByteArray:v16 end:v9 minLength:0 maxLength:0x10000 result:&v37];
  id v19 = v37;
  if (!v32)
  {
    if (v34)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-360 description:@"failed to parse devices from OptInOut"];
      id v28 = 0;
      id v26 = 0;
      id *v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
      id v26 = 0;
    }
    goto LABEL_10;
  }
  id v36 = 0;
  v25 = [v10 parseExtensions:v32 end:v9 result:&v36];
  id v26 = v36;
  if (v25)
  {
LABEL_9:
    v27 = +[NSMutableArray arrayWithArray:v26];
    [v10 setExtensions:v27];

    [v10 setParsedLength:v25 - (unsigned char *)[objc_retainAutorelease(v7) bytes]];
    id v28 = v10;
  }
  else if (v34)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-248 description:@"failed to parse extensions from OptInOut"];
    id v28 = 0;
    id *v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
LABEL_10:

LABEL_30:
LABEL_31:

  return v28;
}

- (id)description
{
  v3 = [(OptInOutMutation *)self accountKeyHash];
  v4 = [v3 kt_hexString];
  if ([(OptInOutMutation *)self optIn]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  unint64_t v6 = [(OptInOutMutation *)self timestampMs];
  id v7 = [(OptInOutMutation *)self devicesArray];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"accountKeyHash:%@, optIn:%@; timestampMs:%llu, devices: %@",
    v4,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OptInOutMutation *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v5 = v4;
      unint64_t v6 = [(OptInOutMutation *)self data];
      id v7 = [(OptInOutMutation *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (IdsMutation)idsMutation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsMutation);

  return (IdsMutation *)WeakRetained;
}

- (void)setIdsMutation:(id)a3
{
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevicesArray:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensions:(id)a3
{
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_devicesArray, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);

  objc_destroyWeak((id *)&self->_idsMutation);
}

@end