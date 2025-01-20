@interface HAPSupportedDiagnosticsSnapshot
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDiagnosticsSnapshotAudioWrapper)audioDiagnostics;
- (HAPDiagnosticsSnapshotFormatWrapper)format;
- (HAPDiagnosticsSnapshotOptionsWrapper)options;
- (HAPDiagnosticsSnapshotTypeWrapper)type;
- (HAPSupportedDiagnosticsSnapshot)init;
- (HAPSupportedDiagnosticsSnapshot)initWithFormat:(id)a3 type:(id)a4 audioDiagnostics:(id)a5 options:(id)a6;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAudioDiagnostics:(id)a3;
- (void)setFormat:(id)a3;
- (void)setOptions:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HAPSupportedDiagnosticsSnapshot

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPSupportedDiagnosticsSnapshot);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPSupportedDiagnosticsSnapshot *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

- (HAPSupportedDiagnosticsSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPSupportedDiagnosticsSnapshot;
  return [(HAPSupportedDiagnosticsSnapshot *)&v3 init];
}

- (HAPSupportedDiagnosticsSnapshot)initWithFormat:(id)a3 type:(id)a4 audioDiagnostics:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPSupportedDiagnosticsSnapshot;
  v15 = [(HAPSupportedDiagnosticsSnapshot *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_format, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_audioDiagnostics, a5);
    objc_storeStrong((id *)&v16->_options, a6);
  }

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 < 1)
  {
    id v10 = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
LABEL_20:
    [(HAPSupportedDiagnosticsSnapshot *)self setFormat:v13];
    [(HAPSupportedDiagnosticsSnapshot *)self setType:v12];
    [(HAPSupportedDiagnosticsSnapshot *)self setAudioDiagnostics:v11];
    [(HAPSupportedDiagnosticsSnapshot *)self setOptions:v10];
    id v9 = 0;
    BOOL v20 = 1;
  }
  else
  {
    v23 = self;
    v24 = a4;
    id v25 = v6;
    id v9 = 0;
    id v10 = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
    id v14 = &v7[v8];
    while (1)
    {
      char v33 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      unint64_t v30 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v32)
      {
        uint64_t v21 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

        id v9 = (id)v21;
        if (v21) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
      switch(v33)
      {
        case 1:
          v16 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v29 = v9;
          v17 = &v29;
          +[HAPDiagnosticsSnapshotFormatWrapper parsedFromData:v16 error:&v29];
          id v13 = v18 = v13;
          goto LABEL_10;
        case 2:
          v16 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v28 = v9;
          v17 = &v28;
          +[HAPDiagnosticsSnapshotTypeWrapper parsedFromData:v16 error:&v28];
          id v12 = v18 = v12;
          goto LABEL_10;
        case 3:
          v16 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v27 = v9;
          v17 = &v27;
          +[HAPDiagnosticsSnapshotAudioWrapper parsedFromData:v16 error:&v27];
          id v11 = v18 = v11;
          goto LABEL_10;
        case 4:
          v16 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v26 = v9;
          v17 = &v26;
          +[HAPDiagnosticsSnapshotOptionsWrapper parsedFromData:v16 error:&v26];
          id v10 = v18 = v10;
LABEL_10:
          id v19 = *v17;

          id v9 = v19;
          break;
        default:
          break;
      }
      if (v30 >= (unint64_t)v14)
      {
        if (v9)
        {
LABEL_13:
          id v6 = v25;
          if (v24)
          {
            id v9 = v9;
            BOOL v20 = 0;
            id *v24 = v9;
          }
          else
          {
            BOOL v20 = 0;
          }
          goto LABEL_24;
        }
LABEL_19:
        id v6 = v25;
        self = v23;
        goto LABEL_20;
      }
    }
    if (v24)
    {
      sub_100044EEC(Next);
      BOOL v20 = 0;
      id *v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
    id v6 = v25;
  }
LABEL_24:

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPSupportedDiagnosticsSnapshot *)self format];

  if (v5)
  {
    id v6 = [(HAPSupportedDiagnosticsSnapshot *)self format];
    id v23 = 0;
    id v7 = [v6 serializeWithError:&v23];
    id v8 = v23;

    if (v8) {
      goto LABEL_15;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      goto LABEL_17;
    }
  }
  id v10 = [(HAPSupportedDiagnosticsSnapshot *)self type];

  if (v10)
  {
    id v11 = [(HAPSupportedDiagnosticsSnapshot *)self type];
    id v22 = 0;
    id v7 = [v11 serializeWithError:&v22];
    id v8 = v22;

    if (v8) {
      goto LABEL_15;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      goto LABEL_17;
    }
  }
  id v12 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];

  if (v12)
  {
    id v13 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];
    id v21 = 0;
    id v7 = [v13 serializeWithError:&v21];
    id v8 = v21;

    if (!v8)
    {
      id v7 = v7;
      [v7 bytes];
      [v7 length];
      uint64_t v9 = TLV8BufferAppend();
      if (v9) {
        goto LABEL_17;
      }

      goto LABEL_13;
    }
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_18;
  }
LABEL_13:
  id v14 = [(HAPSupportedDiagnosticsSnapshot *)self options];

  if (!v14) {
    goto LABEL_25;
  }
  v15 = [(HAPSupportedDiagnosticsSnapshot *)self options];
  id v20 = 0;
  id v7 = [v15 serializeWithError:&v20];
  id v8 = v20;

  if (v8) {
    goto LABEL_15;
  }
  id v7 = v7;
  [v7 bytes];
  [v7 length];
  uint64_t v9 = TLV8BufferAppend();
LABEL_17:
  uint64_t v16 = v9;
LABEL_18:

  if (!v8)
  {
    if (v16)
    {
      if (a3)
      {
        sub_100044EEC(v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_24;
      }
      id v8 = 0;
      goto LABEL_27;
    }
LABEL_25:
    objc_super v18 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v24);
    id v8 = 0;
    goto LABEL_28;
  }
  if (a3)
  {
    id v17 = v8;
    id v8 = v17;
LABEL_24:
    objc_super v18 = 0;
    *a3 = v17;
    goto LABEL_28;
  }
LABEL_27:
  objc_super v18 = 0;
LABEL_28:
  TLV8BufferFree();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPSupportedDiagnosticsSnapshot allocWithZone:a3];
  id v5 = [(HAPSupportedDiagnosticsSnapshot *)self format];
  id v6 = [(HAPSupportedDiagnosticsSnapshot *)self type];
  id v7 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];
  id v8 = [(HAPSupportedDiagnosticsSnapshot *)self options];
  uint64_t v9 = [(HAPSupportedDiagnosticsSnapshot *)v4 initWithFormat:v5 type:v6 audioDiagnostics:v7 options:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPSupportedDiagnosticsSnapshot *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(HAPSupportedDiagnosticsSnapshot *)self format];
      id v8 = [(HAPSupportedDiagnosticsSnapshot *)v6 format];
      if (v7 != v8)
      {
        uint64_t v9 = [(HAPSupportedDiagnosticsSnapshot *)self format];
        objc_super v3 = [(HAPSupportedDiagnosticsSnapshot *)v6 format];
        long long v32 = v9;
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_25;
        }
      }
      id v11 = [(HAPSupportedDiagnosticsSnapshot *)self type];
      id v12 = [(HAPSupportedDiagnosticsSnapshot *)v6 type];
      if (v11 != v12)
      {
        id v13 = [(HAPSupportedDiagnosticsSnapshot *)self type];
        long long v31 = [(HAPSupportedDiagnosticsSnapshot *)v6 type];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        long long v29 = v13;
      }
      uint64_t v14 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];
      v15 = [(HAPSupportedDiagnosticsSnapshot *)v6 audioDiagnostics];
      long long v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        long long v25 = v12;
        long long v26 = v11;
      }
      else
      {
        uint64_t v16 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];
        long long v27 = [(HAPSupportedDiagnosticsSnapshot *)v6 audioDiagnostics];
        long long v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          id v22 = v30;
          goto LABEL_21;
        }
        long long v25 = v12;
        long long v26 = v11;
      }
      id v17 = [(HAPSupportedDiagnosticsSnapshot *)self options];
      uint64_t v18 = [(HAPSupportedDiagnosticsSnapshot *)v6 options];
      if (v17 == (void *)v18)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        id v19 = (void *)v18;
        [(HAPSupportedDiagnosticsSnapshot *)self options];
        id v20 = v24 = v3;
        id v21 = [(HAPSupportedDiagnosticsSnapshot *)v6 options];
        unsigned __int8 v10 = [v20 isEqual:v21];

        objc_super v3 = v24;
      }
      id v22 = v30;
      id v12 = v25;
      id v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        id v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_27:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPSupportedDiagnosticsSnapshot *)self format];
  v4 = [(HAPSupportedDiagnosticsSnapshot *)self type];
  id v5 = [(HAPSupportedDiagnosticsSnapshot *)self audioDiagnostics];
  id v6 = [(HAPSupportedDiagnosticsSnapshot *)self options];
  id v7 = +[NSString stringWithFormat:@"<HAPSupportedDiagnosticsSnapshot format=%@, type=%@, audioDiagnostics=%@, options=%@>", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (HAPDiagnosticsSnapshotFormatWrapper)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (HAPDiagnosticsSnapshotTypeWrapper)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (HAPDiagnosticsSnapshotAudioWrapper)audioDiagnostics
{
  return self->_audioDiagnostics;
}

- (void)setAudioDiagnostics:(id)a3
{
}

- (HAPDiagnosticsSnapshotOptionsWrapper)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_audioDiagnostics, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

@end