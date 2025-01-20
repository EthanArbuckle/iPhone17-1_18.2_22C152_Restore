@interface IdsDevice
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDevice)init;
- (NSData)deviceIdHash;
- (NSMutableArray)clientDataArray;
- (NSMutableArray)extensions;
- (id)data;
- (id)debugDescription;
- (id)diagnosticsJsonDictionary;
- (unint64_t)parsedLength;
- (void)setClientDataArray:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDevice

- (IdsDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)IdsDevice;
  v2 = [(IdsDevice *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    clientDataArray = v2->_clientDataArray;
    v2->_clientDataArray = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)data
{
  uint64_t v3 = +[NSMutableData data];
  v4 = [(IdsDevice *)self deviceIdHash];
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (v5
    && ([(IdsDevice *)self clientDataArray],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v7))
  {
    objc_super v8 = +[NSMutableData data];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [(IdsDevice *)self clientDataArray];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) data];
          if (!v14)
          {

            goto LABEL_16;
          }
          v15 = (void *)v14;
          [v8 appendData:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ([(TLSMessageClass *)self encodeByteArray:v8 minLength:1 maxLength:0xFFFFLL buffer:v3]&& ([(IdsDevice *)self extensions], v16 = objc_claimAutoreleasedReturnValue(), unsigned int v17 = [(TLSMessageClass *)self encodeExtensions:v16 buffer:v3], v16, v17))
    {
      v18 = +[NSData dataWithData:v3];
    }
    else
    {
LABEL_16:
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init(IdsDevice);
  id v30 = 0;
  id v11 = [(TLSMessageClass *)v10 parseHashValue:v6 end:v9 result:&v30];
  id v12 = v30;
  if (v11)
  {
    [(IdsDevice *)v10 setDeviceIdHash:v12];
    id v29 = 0;
    v13 = [(TLSMessageClass *)v10 parseByteArray:v11 end:v9 minLength:1 maxLength:0xFFFFLL result:&v29];
    id v14 = v29;
    v15 = v14;
    if (v13)
    {
      id v26 = v12;
      if (![v14 length])
      {
LABEL_6:
        id v27 = 0;
        long long v21 = [(TLSMessageClass *)v10 parseExtensions:v13 end:v9 result:&v27];
        id v22 = v27;
        if (v21)
        {
          long long v23 = +[NSMutableArray arrayWithArray:v22];
          [(IdsDevice *)v10 setExtensions:v23];

          -[IdsDevice setParsedLength:](v10, "setParsedLength:", v21 - (unsigned char *)[objc_retainAutorelease(v7) bytes]);
          v24 = v10;
        }
        else if (a4)
        {
          +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-259 description:@"failed to parse extensions from IdsDevice"];
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        id v12 = v26;

        goto LABEL_22;
      }
      while (1)
      {
        id v28 = 0;
        v16 = +[SingleDataRecord parseFromData:v15 error:&v28];
        id v17 = v28;
        v18 = v17;
        if (!v16) {
          break;
        }
        v19 = [(IdsDevice *)v10 clientDataArray];
        [v19 addObject:v16];

        id v20 = v15;
        v15 = [NSData dataWithBytes:((char *)[v16 parsedLength] + (void)objc_msgSend(v20, "bytes")) length:((unsigned char *)objc_msgSend(v20, "length") - (unsigned char *)objc_msgSend(v16, "parsedLength"))];

        if (![v15 length]) {
          goto LABEL_6;
        }
      }
      if (a4 && v17) {
        *a4 = v17;
      }
    }
    else if (a4)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-258 description:@"failed to parse client datas from IdsDevice"];
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
    v24 = 0;
    goto LABEL_22;
  }
  if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-257 description:@"failed to parse device ID from IdsDevice"];
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
LABEL_23:

  return v24;
}

- (id)debugDescription
{
  uint64_t v3 = +[NSMutableString stringWithFormat:@"[\n"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = self;
  obj = self->_clientDataArray;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v3 appendFormat:@"   {\n"];
        v9 = [v8 clientDataHash];
        id v10 = [v9 kt_hexString];
        [v3 appendFormat:@"    clientDataHash:%@\n", v10];

        [v3 appendFormat:@"    appVersion:%lu\n", [v8 appVersion]];
        [v3 appendFormat:@"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"];
          [v8 addedMs],
          [v8 markedForDeletionMs],
          [v8 expiryMs],
          [v8 escrowExpiryMs]);
        [v3 appendFormat:@"   },\n"];
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  [v3 appendFormat:@"  ]"];
  id v11 = [(NSData *)v14->_deviceIdHash kt_hexString];
  id v12 = +[NSString stringWithFormat:@"{\n  deviceIdHash:%@\n  clientDatas: %@\n}", v11, v3];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IdsDevice *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(IdsDevice *)self data];
      id v7 = [(IdsDevice *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSMutableArray)clientDataArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientDataArray:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
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
  objc_storeStrong((id *)&self->_clientDataArray, 0);

  objc_storeStrong((id *)&self->_deviceIdHash, 0);
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = [(IdsDevice *)self deviceIdHash];
  id v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"deviceIdHash"];

  uint64_t v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(IdsDevice *)self clientDataArray];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"clientDatas"];
  }

  return v3;
}

@end