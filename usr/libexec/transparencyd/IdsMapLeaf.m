@interface IdsMapLeaf
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsMapLeaf)init;
- (NSMutableArray)accountsArray;
- (NSMutableArray)extensions;
- (id)accountForAccountKeyHash:(id)a3;
- (id)data;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (id)recordForAccountKeyHash:(id)a3 deviceIdHash:(id)a4 appVersion:(unint64_t)a5 clientDataHash:(id)a6;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setAccountsArray:(id)a3;
- (void)setExtensions:(id)a3;
@end

@implementation IdsMapLeaf

- (IdsMapLeaf)init
{
  v8.receiver = self;
  v8.super_class = (Class)IdsMapLeaf;
  v2 = [(IdsMapLeaf *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    accountsArray = v2->_accountsArray;
    v2->_accountsArray = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)data
{
  uint64_t v3 = +[NSMutableData data];
  v4 = +[NSMutableData data];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(IdsMapLeaf *)self accountsArray];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) data];
        if (!v10)
        {

          goto LABEL_13;
        }
        v11 = (void *)v10;
        [v4 appendData:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v12 = 0;
  if ([(TLSMessageClass *)self encodeByteArray:v4 minLength:0 maxLength:0xFFFFFFLL buffer:v3])
  {
    v13 = [(IdsMapLeaf *)self extensions];
    unsigned int v14 = [(TLSMessageClass *)self encodeExtensions:v13 buffer:v3];

    if (v14)
    {
      v12 = +[NSData dataWithData:v3];
    }
    else
    {
LABEL_13:
      v12 = 0;
    }
  }

  return v12;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  uint64_t v10 = objc_alloc_init(IdsMapLeaf);
  id v26 = 0;
  v11 = [(TLSMessageClass *)v10 parseByteArray:v6 end:v9 minLength:0 maxLength:0xFFFFFFLL result:&v26];
  id v12 = v26;
  v13 = v12;
  if (v11)
  {
    if ([v12 length])
    {
      while (1)
      {
        id v25 = 0;
        unsigned int v14 = +[IdsAccount parseFromData:v13 error:&v25];
        id v15 = v25;
        long long v16 = v15;
        if (!v14) {
          break;
        }
        long long v17 = [(IdsMapLeaf *)v10 accountsArray];
        [v17 addObject:v14];

        id v18 = v13;
        v13 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)[v14 parsedLength] + (void)objc_msgSend(v18, "bytes"), (unsigned char *)objc_msgSend(v18, "length") - (unsigned char *)objc_msgSend(v14, "parsedLength"));

        if (![v13 length]) {
          goto LABEL_5;
        }
      }
      if (a4 && v15) {
        *a4 = v15;
      }

      v22 = 0;
    }
    else
    {
LABEL_5:
      id v24 = 0;
      long long v19 = [(TLSMessageClass *)v10 parseExtensions:v11 end:v9 result:&v24];
      id v20 = v24;
      if (v19)
      {
        v21 = +[NSMutableArray arrayWithArray:v20];
        [(IdsMapLeaf *)v10 setExtensions:v21];

        v22 = v10;
      }
      else if (a4)
      {
        +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-264 description:@"failed to parse extensions from IdsMapLeaf"];
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
  }
  else if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-263 description:@"failed to parse accounts from IdsMapLeaf"];
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)description
{
  uint64_t v3 = +[NSMutableString stringWithFormat:@"[\n"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = self->_accountsArray;
  id v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v43;
    id v26 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v4;
        id v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        id v6 = [v5 accountKeyHash];
        id v7 = [v6 kt_hexString];
        [v3 appendFormat:@"    accountKeyHash:%@\n", v7];

        id v8 = +[NSMutableString stringWithFormat:@"[\n"];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = [v5 devicesArray];
        id v32 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v32)
        {
          uint64_t v30 = *(void *)v39;
          v31 = v8;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = v9;
              uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
              [v8 appendFormat:@"     {\n"];
              v11 = [v10 deviceIdHash];
              id v12 = [v11 kt_hexString];
              [v8 appendFormat:@"      deviceIdHash: %@\n", v12];

              v13 = +[NSMutableString stringWithFormat:@"[\n"];
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              unsigned int v14 = [v10 clientDataArray];
              id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v35;
                do
                {
                  for (i = 0; i != v16; i = (char *)i + 1)
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    long long v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                    [v13 appendFormat:@"       {\n"];
                    id v20 = [v19 clientDataHash];
                    v21 = [v20 kt_hexString];
                    [v13 appendFormat:@"        clientDataHash:%@\n", v21];

                    [v13 appendFormat:@"        appVersion:%lu\n", [v19 appVersion]];
                    [v13 appendFormat:@"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"];
                      [v19 addedMs],
                      [v19 markedForDeletionMs],
                      [v19 expiryMs],
                      [v19 escrowExpiryMs]);
                    [v13 appendFormat:@"       },\n"];
                  }
                  id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v16);
              }

              [v13 appendFormat:@"      ]"];
              id v8 = v31;
              [v31 appendFormat:@"      clientDatas: %@\n", v13];
              [v31 appendFormat:@"     },\n"];

              uint64_t v9 = v33 + 1;
            }
            while ((id)(v33 + 1) != v32);
            id v32 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v32);
        }

        [v8 appendFormat:@"    ]"];
        uint64_t v3 = v26;
        [v26 appendFormat:@"    devices: %@\n", v8];
        [v26 appendFormat:@"   },\n"];

        uint64_t v4 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      id v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v27);
  }

  [v3 appendFormat:@"  ]"];
  v22 = +[NSString stringWithFormat:@"{\n  accounts: %@\n}", v3];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (IdsMapLeaf *)a3;
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
      id v6 = [(IdsMapLeaf *)self data];
      id v7 = [(IdsMapLeaf *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSMutableArray)accountsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountsArray:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_accountsArray, 0);
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(IdsMapLeaf *)self accountsArray];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"accounts"];
  }

  return v3;
}

- (id)recordForAccountKeyHash:(id)a3 deviceIdHash:(id)a4 appVersion:(unint64_t)a5 clientDataHash:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v13 = [(IdsMapLeaf *)self accountsArray];
  id v14 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v55;
    long long v39 = v13;
    id v40 = v10;
    id v43 = v11;
    uint64_t v37 = *(void *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        long long v19 = [v18 accountKeyHash];
        unsigned int v20 = [v19 isEqualToData:v10];

        if (v20)
        {
          long long v41 = i;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v21 = [v18 devicesArray];
          id v44 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v51;
            id v38 = v15;
            long long v42 = v21;
            do
            {
              v22 = 0;
              id v23 = v43;
              do
              {
                if (*(void *)v51 != v45) {
                  objc_enumerationMutation(v21);
                }
                id v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v22);
                uint64_t v25 = [v24 deviceIdHash];
                unsigned int v26 = [v25 isEqualToData:v23];

                if (v26)
                {
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  id v27 = [v24 clientDataArray];
                  id v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
                  if (v28)
                  {
                    id v29 = v28;
                    uint64_t v30 = *(void *)v47;
                    while (2)
                    {
                      for (j = 0; j != v29; j = (char *)j + 1)
                      {
                        if (*(void *)v47 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        id v32 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
                        if ([v32 appVersion] == (id)a5)
                        {
                          uint64_t v33 = [v32 clientDataHash];
                          unsigned __int8 v34 = [v33 isEqualToData:v12];

                          if (v34)
                          {
                            id v35 = v32;

                            long long v13 = v39;
                            id v10 = v40;
                            id v11 = v43;
                            goto LABEL_31;
                          }
                        }
                      }
                      id v29 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
                      if (v29) {
                        continue;
                      }
                      break;
                    }
                  }

                  v21 = v42;
                  id v23 = v43;
                }
                v22 = (char *)v22 + 1;
              }
              while (v22 != v44);
              long long v13 = v39;
              id v10 = v40;
              uint64_t v16 = v37;
              id v15 = v38;
              id v44 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }
            while (v44);
          }

          i = v41;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
      id v35 = 0;
      id v11 = v43;
    }
    while (v15);
  }
  else
  {
    id v35 = 0;
  }
LABEL_31:

  return v35;
}

- (id)accountForAccountKeyHash:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(IdsMapLeaf *)self accountsArray];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 accountKeyHash];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)verifyWithError:(id *)a3
{
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v4 = [(IdsMapLeaf *)self accountsArray];
  id v5 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v5)
  {
LABEL_35:

    return 1;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v55;
LABEL_3:
  uint64_t v8 = 0;
LABEL_4:
  if (*(void *)v55 != v7) {
    objc_enumerationMutation(v4);
  }
  uint64_t v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
  uint64_t v10 = [v9 accountKeyHash];
  if (!v10
    || (unsigned __int8 v11 = (void *)v10,
        [v9 accountKeyHash],
        id v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 length],
        v12,
        v11,
        !v13))
  {
    uint64_t v37 = -81;
    goto LABEL_41;
  }
  long long v14 = [v9 devicesArray];
  id v15 = [v14 count];

  if (!v15)
  {
    uint64_t v37 = -82;
    goto LABEL_41;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v16 = [v9 devicesArray];
  id v17 = [v16 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (!v17) {
    goto LABEL_33;
  }
  uint64_t v18 = *(void *)v51;
  id v43 = v4;
  id v44 = a3;
  uint64_t v40 = *(void *)v51;
  id v41 = v6;
LABEL_11:
  long long v19 = 0;
  id v42 = v17;
LABEL_12:
  if (*(void *)v51 != v18) {
    objc_enumerationMutation(v16);
  }
  unsigned int v20 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v19);
  v21 = [v20 clientDataArray];
  id v22 = [v21 count];

  if (v22)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v23 = [v20 clientDataArray];
    id v24 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (!v24) {
      goto LABEL_31;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v47;
    uint64_t v39 = v7;
    uint64_t v45 = v16;
LABEL_17:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v23);
      }
      id v28 = *(void **)(*((void *)&v46 + 1) + 8 * v27);
      uint64_t v29 = [v28 clientDataHash];
      if (!v29) {
        break;
      }
      uint64_t v30 = (void *)v29;
      v31 = [v28 clientDataHash];
      id v32 = [v31 length];

      if (!v32) {
        break;
      }
      if ([v28 markedForDeletionMs])
      {
        id v33 = [v28 escrowExpiryMs];
        if (v33 <= [v28 markedForDeletionMs])
        {
          uint64_t v37 = -85;
          goto LABEL_39;
        }
      }
      if (![v28 markedForDeletionMs]
        && (BOOL v34 = [v28 expiryMs] != 0, ((v34 ^ (objc_msgSend(v28, "escrowExpiryMs") != 0)) & 1) != 0)
        || ![v28 markedForDeletionMs]
        && [v28 expiryMs]
        && (id v35 = [v28 escrowExpiryMs], v35 <= objc_msgSend(v28, "expiryMs")))
      {
        uint64_t v37 = -237;
        goto LABEL_39;
      }
      if (v25 == (id)++v27)
      {
        id v25 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
        uint64_t v7 = v39;
        long long v16 = v45;
        if (v25) {
          goto LABEL_17;
        }
LABEL_31:

        long long v19 = (char *)v19 + 1;
        id v6 = v41;
        uint64_t v18 = v40;
        if (v19 == v42)
        {
          id v17 = [v16 countByEnumeratingWithState:&v50 objects:v61 count:16];
          id v4 = v43;
          a3 = v44;
          if (!v17)
          {
LABEL_33:

            if ((id)++v8 == v6)
            {
              id v6 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (!v6) {
                goto LABEL_35;
              }
              goto LABEL_3;
            }
            goto LABEL_4;
          }
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
    uint64_t v37 = -84;
LABEL_39:

    id v4 = v43;
    a3 = v44;
    long long v16 = v45;
    goto LABEL_40;
  }
  uint64_t v37 = -83;
  id v4 = v43;
  a3 = v44;
LABEL_40:

LABEL_41:
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v37 description:@"MapLeaf missing required fields or inconsistent"];
  }
  if (qword_10032EF80 != -1) {
    dispatch_once(&qword_10032EF80, &stru_1002C5730);
  }
  id v38 = qword_10032EF88;
  if (os_log_type_enabled((os_log_t)qword_10032EF88, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = v37;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "MapLeaf missing required fields or inconsistent: %ld", buf, 0xCu);
  }
  return 0;
}

@end