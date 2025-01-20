@interface IdsAccount
+ (id)encodeOptInOutExtensionData:(id)a3;
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)parseOptInOutExtension:(id)a3 error:(id *)a4;
- (BOOL)hasOptInAfter:(unint64_t)a3;
- (BOOL)isActive:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IdsAccount)init;
- (NSData)accountKeyHash;
- (NSMutableArray)devicesArray;
- (NSMutableArray)extensions;
- (id)data;
- (id)debugDescription;
- (id)diagnosticsJsonDictionary;
- (id)sortedOptInOutHistory:(id *)a3;
- (unint64_t)parsedLength;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevicesArray:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsAccount

- (IdsAccount)init
{
  v8.receiver = self;
  v8.super_class = (Class)IdsAccount;
  v2 = [(IdsAccount *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    devicesArray = v2->_devicesArray;
    v2->_devicesArray = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)data
{
  uint64_t v3 = +[NSMutableData data];
  v4 = [(IdsAccount *)self accountKeyHash];
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (v5
    && ([(IdsAccount *)self devicesArray],
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
    v9 = [(IdsAccount *)self devicesArray];
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

    if ([(TLSMessageClass *)self encodeByteArray:v8 minLength:1 maxLength:0xFFFFLL buffer:v3]&& ([(IdsAccount *)self extensions], v16 = objc_claimAutoreleasedReturnValue(), unsigned int v17 = [(TLSMessageClass *)self encodeExtensions:v16 buffer:v3], v16, v17))
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
  id v10 = objc_alloc_init(IdsAccount);
  id v30 = 0;
  id v11 = [(TLSMessageClass *)v10 parseHashValue:v6 end:v9 result:&v30];
  id v12 = v30;
  if (v11)
  {
    [(IdsAccount *)v10 setAccountKeyHash:v12];
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
          [(IdsAccount *)v10 setExtensions:v23];

          -[IdsAccount setParsedLength:](v10, "setParsedLength:", v21 - (unsigned char *)[objc_retainAutorelease(v7) bytes]);
          v24 = v10;
        }
        else if (a4)
        {
          +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-262 description:@"failed to parse extensions from IdsAccount"];
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
        v16 = +[IdsDevice parseFromData:v15 error:&v28];
        id v17 = v28;
        v18 = v17;
        if (!v16) {
          break;
        }
        v19 = [(IdsAccount *)v10 devicesArray];
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
      +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-261 description:@"failed to parse devices from IdsAccount"];
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
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-260 description:@"failed to parse account key from IdsAccount"];
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
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v21 = self;
  obj = self->_devicesArray;
  id v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    v24 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v4;
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        id v6 = [v5 deviceIdHash];
        id v7 = [v6 kt_hexString];
        [v3 appendFormat:@"    deviceIdHash: %@\n", v7];

        id v8 = +[NSMutableString stringWithFormat:@"[\n"];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v9 = [v5 clientDataArray];
        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              [v8 appendFormat:@"     {\n"];
              v15 = [v14 clientDataHash];
              v16 = [v15 kt_hexString];
              [v8 appendFormat:@"      clientDataHash:%@\n", v16];

              [v8 appendFormat:@"      appVersion:%lu\n", [v14 appVersion]];
              [v8 appendFormat:@"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"];
                [v14 addedMs],
                [v14 markedForDeletionMs],
                [v14 expiryMs],
                [v14 escrowExpiryMs]);
              [v8 appendFormat:@"     },\n"];
            }
            id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v11);
        }

        [v8 appendFormat:@"    ]"];
        uint64_t v3 = v24;
        [v24 appendFormat:@"    clientDatas: %@\n", v8];
        [v24 appendFormat:@"   },\n"];

        uint64_t v4 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  [v3 appendFormat:@"  ]"];
  id v17 = [(IdsAccount *)v21 accountKeyHash];
  v18 = [v17 kt_hexString];
  v19 = +[NSString stringWithFormat:@"{\n  accountKeyHash:%@\n  devices: %@\n}", v18, v3];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (IdsAccount *)a3;
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
      id v6 = [(IdsAccount *)self data];
      id v7 = [(IdsAccount *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

+ (id)parseOptInOutExtension:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  id v7 = v5;
  unsigned __int8 v8 = v7;
  if ([v7 length])
  {
    unsigned __int8 v8 = v7;
    while (1)
    {
      id v15 = 0;
      v9 = +[OptInOutWithExt parseFromData:v8 error:&v15];
      id v10 = v15;
      id v11 = v10;
      if (!v9) {
        break;
      }
      [v6 addObject:v9];
      id v12 = v8;
      unsigned __int8 v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)[v9 parsedLength] + (void)objc_msgSend(v12, "bytes"), (unsigned char *)objc_msgSend(v12, "length") - (unsigned char *)objc_msgSend(v9, "parsedLength"));

      if (![v8 length]) {
        goto LABEL_5;
      }
    }
    if (a4 && v10) {
      *a4 = v10;
    }

    v13 = 0;
  }
  else
  {
LABEL_5:
    v13 = +[NSArray arrayWithArray:v6];
  }

  return v13;
}

+ (id)encodeOptInOutExtensionData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableData data];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) data:v13];
        [v4 appendData:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = +[NSData dataWithData:v4];

  return v11;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevicesArray:(id)a3
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
  objc_storeStrong((id *)&self->_devicesArray, 0);

  objc_storeStrong((id *)&self->_accountKeyHash, 0);
}

- (id)diagnosticsJsonDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(IdsAccount *)self accountKeyHash];
  id v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"accountKeyHash"];

  id v6 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = [(IdsAccount *)self devicesArray];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"devices"];
  }
  long long v13 = [(IdsAccount *)self sortedOptInOutHistory:0];
  if (v13)
  {
    long long v14 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) diagnosticsJsonDictionary:v22];
          [v14 addObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"optInOutHistory"];
  }

  return v3;
}

- (id)sortedOptInOutHistory:(id *)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(IdsAccount *)self extensions];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 extensionType] == 2)
        {
          id v11 = [v9 extensionData];
          uint64_t v10 = +[IdsAccount parseOptInOutExtension:v11 error:a3];

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  if ([v10 count]) {
    [v10 sortedArrayUsingComparator:&stru_1002C5710];
  }
  else {
  id v12 = +[NSArray array];
  }

  return v12;
}

- (BOOL)isActive:(unint64_t)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [(IdsAccount *)self devicesArray];
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v10 = [v9 clientDataArray];
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
              if (![v15 markedForDeletionMs]
                && (![v15 expiryMs] || (unint64_t)objc_msgSend(v15, "expiryMs") > a3)
                || (unint64_t)[v15 markedForDeletionMs] > a3
                && (![v15 expiryMs] || (unint64_t)objc_msgSend(v15, "expiryMs") > a3))
              {

                BOOL v16 = 1;
                goto LABEL_24;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
    }
    while (v6);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)hasOptInAfter:(unint64_t)a3
{
  uint64_t v4 = [(IdsAccount *)self sortedOptInOutHistory:0];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [v5 reverseObjectEnumerator];
    uint64_t v7 = [v6 allObjects];

    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 optIn] && (unint64_t)objc_msgSend(v12, "timestampMs") > a3)
          {
            BOOL v13 = 1;
            goto LABEL_15;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_15:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end