@interface IdsMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)getOptIn;
- (BOOL)hasOptInExtension;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutation)idsDeviceMutation;
- (IdsMutation)init;
- (NSData)uriVRFOutput;
- (NSMutableArray)extensions;
- (OptInOut)optInOut;
- (OptInOutMutation)optInOutMutation;
- (id)accountKeyHash;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (id)getOptInOutWithExt;
- (int)getSimpleMutationType;
- (unint64_t)mutationMs;
- (unsigned)mutationType;
- (unsigned)mutationVersion;
- (void)setExtensions:(id)a3;
- (void)setIdsDeviceMutation:(id)a3;
- (void)setMutationMs:(unint64_t)a3;
- (void)setMutationType:(unsigned __int8)a3;
- (void)setMutationVersion:(unsigned __int8)a3;
- (void)setOptInOut:(id)a3;
- (void)setOptInOutMutation:(id)a3;
- (void)setUriVRFOutput:(id)a3;
@end

@implementation IdsMutation

- (int)getSimpleMutationType
{
  unsigned int v2 = [(IdsMutation *)self mutationType];
  if (v2 > 6) {
    return 1;
  }
  else {
    return dword_10028B050[(char)v2];
  }
}

- (BOOL)getOptIn
{
  unsigned int v3 = [(IdsMutation *)self mutationType];
  switch(v3)
  {
    case 6u:
      v4 = [(IdsMutation *)self optInOutMutation];
      goto LABEL_6;
    case 4u:
      uint64_t v8 = [(IdsMutation *)self idsDeviceMutation];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [(IdsMutation *)self idsDeviceMutation];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v12 = [(IdsMutation *)self idsDeviceMutation];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v13 = [v12 extensions];
          id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v23;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                if ([v18 extensionType] == 3)
                {
                  v20 = [v18 extensionData];
                  v21 = +[OptInOutWithExt parseFromData:v20 error:0];

                  unsigned __int8 v19 = [v21 optIn];
                  return v19;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
      }
      break;
    case 3u:
      v4 = [(IdsMutation *)self optInOut];
LABEL_6:
      v5 = v4;
      unsigned __int8 v6 = [v4 optIn];

      return v6;
  }
  return 0;
}

- (id)getOptInOutWithExt
{
  if ([(IdsMutation *)self mutationType] != 4) {
    goto LABEL_13;
  }
  uint64_t v3 = [(IdsMutation *)self idsDeviceMutation];
  if (!v3) {
    goto LABEL_13;
  }
  v4 = (void *)v3;
  v5 = [(IdsMutation *)self idsDeviceMutation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(IdsMutation *)self idsDeviceMutation];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 extensions];
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 extensionType] == 3)
          {
            id v14 = [v12 extensionData];
            id v9 = +[OptInOutWithExt parseFromData:v14 error:0];

            goto LABEL_18;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {
LABEL_13:
    id v9 = 0;
  }

  return v9;
}

- (BOOL)hasOptInExtension
{
  if ([(IdsMutation *)self mutationType] != 4) {
    goto LABEL_13;
  }
  uint64_t v3 = [(IdsMutation *)self idsDeviceMutation];
  if (!v3) {
    goto LABEL_13;
  }
  v4 = (void *)v3;
  v5 = [(IdsMutation *)self idsDeviceMutation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(IdsMutation *)self idsDeviceMutation];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 extensions];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) extensionType] == 3)
          {
            LOBYTE(v9) = 1;
            goto LABEL_16;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
LABEL_13:
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (id)accountKeyHash
{
  unsigned int v3 = [(IdsMutation *)self mutationType];
  v4 = 0;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      v5 = [(IdsMutation *)self idsDeviceMutation];
    }
    else
    {
      if (v3 != 6) {
        goto LABEL_7;
      }
      v5 = [(IdsMutation *)self optInOutMutation];
    }
    unsigned __int8 v6 = v5;
    v4 = [v5 accountKeyHash];
  }
LABEL_7:

  return v4;
}

- (IdsMutation)init
{
  v6.receiver = self;
  v6.super_class = (Class)IdsMutation;
  unsigned int v2 = [(IdsMutation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)data
{
  uint64_t v3 = +[NSMutableData data];
  if (![(TLSMessageClass *)self encodeByte:[(IdsMutation *)self mutationVersion] buffer:v3]|| ![(TLSMessageClass *)self encodeByte:[(IdsMutation *)self mutationType] buffer:v3]|| ![(TLSMessageClass *)self encodeUint64:[(IdsMutation *)self mutationMs] buffer:v3]|| ([(IdsMutation *)self uriVRFOutput], v4 = objc_claimAutoreleasedReturnValue(), unsigned int v5 = [(TLSMessageClass *)self encodeVRFOutput:v4 buffer:v3], v4, !v5))
  {
    v7 = 0;
    goto LABEL_9;
  }
  unsigned int v6 = [(IdsMutation *)self mutationType];
  v7 = 0;
  if (v6 > 6)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (((1 << v6) & 0x36) != 0)
    {
      uint64_t v8 = [(IdsMutation *)self idsDeviceMutation];
LABEL_16:
      v11 = v8;
      uint64_t v10 = [v8 data];

      if (v10
        && ([v3 appendData:v10],
            [(IdsMutation *)self extensions],
            v12 = objc_claimAutoreleasedReturnValue(),
            unsigned int v13 = [(TLSMessageClass *)self encodeExtensions:v12 buffer:v3],
            v12,
            v13))
      {
        v7 = +[NSData dataWithData:v3];
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_20;
    }
    if (v6 == 3)
    {
      uint64_t v8 = [(IdsMutation *)self optInOut];
      goto LABEL_16;
    }
    uint64_t v10 = 0;
    if (v6 == 6)
    {
      uint64_t v8 = [(IdsMutation *)self optInOutMutation];
      goto LABEL_16;
    }
  }
LABEL_20:

LABEL_9:

  return v7;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  id v9 = (char *)[v7 length];

  uint64_t v10 = &v9[(void)v8];
  v11 = objc_alloc_init(IdsMutation);
  char v42 = 0;
  v12 = [(TLSMessageClass *)v11 parseByte:v6 end:v10 result:&v42];
  if (v12) {
    BOOL v13 = v42 == 2;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    if (a4)
    {
      uint64_t v14 = kTransparencyErrorDecode;
      CFStringRef v15 = @"failed to parse mutation version from Mutation";
      uint64_t v16 = -265;
LABEL_16:
      +[TransparencyError errorWithDomain:v14 code:v16 description:v15];
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    goto LABEL_17;
  }
  long long v17 = v12;
  [(IdsMutation *)v11 setMutationVersion:2];
  unsigned __int8 v41 = 0;
  long long v18 = [(TLSMessageClass *)v11 parseByte:v17 end:v10 result:&v41];
  if (!v18)
  {
    if (a4)
    {
      uint64_t v14 = kTransparencyErrorDecode;
      CFStringRef v15 = @"failed to parse mutation type from Mutation";
      uint64_t v16 = -239;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  unsigned __int8 v19 = v18;
  [(IdsMutation *)v11 setMutationType:v41];
  uint64_t v40 = 0;
  v20 = [(TLSMessageClass *)v11 parseUint64:v19 end:v10 result:&v40];
  if (!v20)
  {
    if (a4)
    {
      uint64_t v14 = kTransparencyErrorDecode;
      CFStringRef v15 = @"failed to parse mutation timestamp from Mutation";
      uint64_t v16 = -240;
      goto LABEL_16;
    }
LABEL_17:
    v27 = 0;
    goto LABEL_43;
  }
  v21 = v20;
  [(IdsMutation *)v11 setMutationMs:v40];
  id v39 = 0;
  long long v22 = [(TLSMessageClass *)v11 parseVRFOutput:v21 end:v10 result:&v39];
  id v23 = v39;
  if (v22)
  {
    [(IdsMutation *)v11 setUriVRFOutput:v23];
    long long v24 = +[NSData dataWithBytes:v22 length:v10 - v22];
    switch([(IdsMutation *)v11 mutationType])
    {
      case 1u:
      case 2u:
        v38 = 0;
        long long v25 = +[IdsDeviceMutation parseFromData:v24 error:&v38];
        v26 = v38;
        goto LABEL_21;
      case 3u:
        id v36 = 0;
        long long v25 = +[OptInOut parseFromData:v24 error:&v36];
        id v28 = v36;
        if (!v25) {
          goto LABEL_32;
        }
        [v25 setIdsMutation:v11];
        [(IdsMutation *)v11 setOptInOut:v25];
        goto LABEL_30;
      case 4u:
      case 5u:
        v37 = 0;
        long long v25 = +[IdsDeviceMutationWithExt parseFromData:v24 error:&v37];
        v26 = v37;
LABEL_21:
        id v28 = v26;
        if (!v25) {
          goto LABEL_32;
        }
        [v25 setIdsMutation:v11];
        [(IdsMutation *)v11 setIdsDeviceMutation:v25];
        goto LABEL_30;
      case 6u:
        id v35 = 0;
        long long v25 = +[OptInOutMutation parseFromData:v24 error:&v35];
        id v28 = v35;
        if (v25)
        {
          [v25 setIdsMutation:v11];
          [(IdsMutation *)v11 setOptInOutMutation:v25];
LABEL_30:
          v29 = (char *)[v25 parsedLength] + (void)v22;

          id v34 = 0;
          v30 = [(TLSMessageClass *)v11 parseExtensions:v29 end:v10 result:&v34];
          id v31 = v34;
          if (v30)
          {
            v32 = +[NSMutableArray arrayWithArray:v31];
            [(IdsMutation *)v11 setExtensions:v32];

            v27 = v11;
          }
          else if (a4)
          {
            +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-248 description:@"failed to parse extensions from Mutation"];
            v27 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = 0;
          }
        }
        else
        {
LABEL_32:
          if (a4 && v28) {
            *a4 = v28;
          }

LABEL_36:
          v27 = 0;
        }
        break;
      default:
        if (!a4) {
          goto LABEL_36;
        }
        +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-273 description:@"unknown mutation type in mutation"];
        v27 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-241 description:@"failed to parse uri VRF output from Mutation"];
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

LABEL_43:

  return v27;
}

- (id)debugDescription
{
  unsigned int v3 = [(IdsMutation *)self mutationType];
  v4 = @"unknown";
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      id v5 = [(IdsMutation *)self idsDeviceMutation];
    }
    else if (v3 == 3)
    {
      id v5 = [(IdsMutation *)self optInOut];
    }
    else
    {
      if (v3 != 6) {
        goto LABEL_9;
      }
      id v5 = [(IdsMutation *)self optInOutMutation];
    }
    id v6 = v5;
    v4 = [v5 debugDescription];
  }
LABEL_9:
  uint64_t mutationType = self->_mutationType;
  unint64_t mutationMs = self->_mutationMs;
  id v9 = [(NSData *)self->_uriVRFOutput kt_hexString];
  uint64_t v10 = +[NSString stringWithFormat:@"{\tmutationType:%hhu\n\tmutationMs:%llu\n\turiVRFOutput:%@\n\tsubMutation:\n%@\n}", mutationType, mutationMs, v9, v4];

  return v10;
}

- (id)description
{
  unsigned int v3 = [(IdsMutation *)self mutationType];
  v4 = @"unknown";
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      id v5 = [(IdsMutation *)self idsDeviceMutation];
    }
    else if (v3 == 3)
    {
      id v5 = [(IdsMutation *)self optInOut];
    }
    else
    {
      if (v3 != 6) {
        goto LABEL_9;
      }
      id v5 = [(IdsMutation *)self optInOutMutation];
    }
    id v6 = v5;
    v4 = [v5 description];
  }
LABEL_9:
  uint64_t mutationType = self->_mutationType;
  unint64_t mutationMs = self->_mutationMs;
  id v9 = [(NSData *)self->_uriVRFOutput kt_hexString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"mutationType:%hhu; mutationMs:%llu; uriVRFOutput:%@; subMutation:%@",
    mutationType,
    mutationMs,
    v9,
  uint64_t v10 = v4);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IdsMutation *)a3;
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
      id v6 = [(IdsMutation *)self data];
      id v7 = [(IdsMutation *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unsigned)mutationVersion
{
  return self->_mutationVersion;
}

- (void)setMutationVersion:(unsigned __int8)a3
{
  self->_mutationVersion = a3;
}

- (unsigned)mutationType
{
  return self->_mutationType;
}

- (void)setMutationType:(unsigned __int8)a3
{
  self->_uint64_t mutationType = a3;
}

- (unint64_t)mutationMs
{
  return self->_mutationMs;
}

- (void)setMutationMs:(unint64_t)a3
{
  self->_unint64_t mutationMs = a3;
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriVRFOutput:(id)a3
{
}

- (OptInOut)optInOut
{
  return (OptInOut *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptInOut:(id)a3
{
}

- (OptInOutMutation)optInOutMutation
{
  return (OptInOutMutation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptInOutMutation:(id)a3
{
}

- (IdsDeviceMutation)idsDeviceMutation
{
  return (IdsDeviceMutation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsDeviceMutation:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_idsDeviceMutation, 0);
  objc_storeStrong((id *)&self->_optInOutMutation, 0);
  objc_storeStrong((id *)&self->_optInOut, 0);

  objc_storeStrong((id *)&self->_uriVRFOutput, 0);
}

- (id)diagnosticsJsonDictionary
{
  unsigned int v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedChar:[(IdsMutation *)self mutationVersion]];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  id v5 = +[NSNumber numberWithUnsignedChar:[(IdsMutation *)self mutationType]];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = +[NSNumber numberWithUnsignedLongLong:[(IdsMutation *)self mutationMs]];
  [v3 setObject:v6 forKeyedSubscript:@"mutationMs"];

  id v7 = +[NSDate dateWithTimeIntervalSince1970:(double)([(IdsMutation *)self mutationMs] / 0x3E8)];
  unsigned __int8 v8 = [v7 kt_toISO_8601_UTCString];
  [v3 setObject:v8 forKeyedSubscript:@"mutationDateReadable"];

  id v9 = [(IdsMutation *)self uriVRFOutput];
  uint64_t v10 = [v9 kt_hexString];
  [v3 setObject:v10 forKeyedSubscript:@"uriVrfOutput"];

  v11 = [(IdsMutation *)self optInOut];

  if (v11)
  {
    v12 = [(IdsMutation *)self optInOut];
    BOOL v13 = [v12 diagnosticsJsonDictionary];
    [v3 setObject:v13 forKeyedSubscript:@"optInOut"];
  }
  uint64_t v14 = [(IdsMutation *)self idsDeviceMutation];

  if (v14)
  {
    CFStringRef v15 = [(IdsMutation *)self idsDeviceMutation];
    uint64_t v16 = [v15 diagnosticsJsonDictionary];
    [v3 setObject:v16 forKeyedSubscript:@"idsDeviceMutation"];
  }

  return v3;
}

@end