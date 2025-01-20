@interface HAPDataStreamTransportInterruptPayload
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportInterruptPayload)init;
- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4;
- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber;
- (NSData)requestToSendIdentifiers;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3;
- (void)setRequestToSendIdentifiers:(id)a3;
@end

@implementation HAPDataStreamTransportInterruptPayload

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportInterruptPayload);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportInterruptPayload *)v6 parseFromData:v5 error:&v10];
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

- (HAPDataStreamTransportInterruptPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  return [(HAPDataStreamTransportInterruptPayload *)&v3 init];
}

- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  v9 = [(HAPDataStreamTransportInterruptPayload *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestToSendIdentifiers, a3);
    objc_storeStrong((id *)&v10->_dataStreamTransportInterruptSequenceNumber, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 < 1)
  {
    v9 = 0;
    id v10 = 0;
LABEL_16:
    -[HAPDataStreamTransportInterruptPayload setRequestToSendIdentifiers:](self, "setRequestToSendIdentifiers:", v10, v24);
    [(HAPDataStreamTransportInterruptPayload *)self setDataStreamTransportInterruptSequenceNumber:v9];
    v11 = 0;
    BOOL v19 = 1;
    goto LABEL_24;
  }
  v24 = a4;
  v9 = 0;
  id v10 = 0;
  v11 = 0;
  unint64_t v12 = (unint64_t)v7 + v8;
  while (1)
  {
    char v30 = 0;
    v28[1] = 0;
    uint64_t v29 = 0;
    v28[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v29)
    {
      uint64_t v22 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      v11 = (void *)v22;
      if (!v22) {
        goto LABEL_16;
      }
LABEL_20:
      v20 = v24;
      if (v24)
      {
        id v21 = v11;
        v11 = v21;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v25 = v11;
      uint64_t v18 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v25];
      id v15 = v25;

      v17 = v9;
      v9 = (void *)v18;
LABEL_10:

LABEL_11:
      v11 = v15;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      id v27 = v11;
      v14 = sub_100025088(1, (unint64_t)v7, v12, v28, &v27);
      id v15 = v27;

      if (!v15)
      {
        id v26 = 0;
        uint64_t v16 = +[NSData parsedFromData:v14 error:&v26];
        id v15 = v26;
        v17 = v10;
        id v10 = (void *)v16;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_12:
    id v7 = (id)v28[0];
    if (v28[0] >= v12)
    {
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  v20 = v24;
  if (v24)
  {
    sub_100044EEC(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_24;
  }
LABEL_23:
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];

  if (v5)
  {
    id v6 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
    id v22 = 0;
    id v7 = [v6 serializeWithError:&v22];
    id v8 = v22;

    if (!v8)
    {
      id v9 = v7;
      id v10 = (char *)[v9 bytes];
      v11 = (char *)[v9 length] + (void)v10;
      while (1)
      {
        uint64_t v12 = v11 - v10 >= 255 ? 255 : v11 - v10;
        uint64_t v13 = TLV8BufferAppend();
        if (v13) {
          break;
        }
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
      uint64_t v17 = v13;

      goto LABEL_16;
    }
LABEL_12:

    if (a3)
    {
      id v16 = v8;
      id v8 = v16;
LABEL_18:
      BOOL v19 = 0;
      *a3 = v16;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_10:
  v14 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];

  if (!v14) {
    goto LABEL_19;
  }
  id v15 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  id v21 = 0;
  id v7 = [v15 serializeWithError:&v21];
  id v8 = v21;

  if (v8) {
    goto LABEL_12;
  }
  id v18 = v7;
  [v18 bytes];
  [v18 length];
  uint64_t v17 = TLV8BufferAppend();

  if (!v17)
  {
LABEL_19:
    BOOL v19 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v23);
    id v8 = 0;
    goto LABEL_22;
  }
LABEL_16:
  if (a3)
  {
    sub_100044EEC(v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_18;
  }
  id v8 = 0;
LABEL_21:
  BOOL v19 = 0;
LABEL_22:
  TLV8BufferFree();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportInterruptPayload allocWithZone:a3];
  id v5 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
  id v6 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  id v7 = [(HAPDataStreamTransportInterruptPayload *)v4 initWithRequestToSendIdentifiers:v5 dataStreamTransportInterruptSequenceNumber:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPDataStreamTransportInterruptPayload *)a3;
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
      id v7 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
      id v8 = [(HAPDataStreamTransportInterruptPayload *)v6 requestToSendIdentifiers];
      if (v7 != v8)
      {
        id v9 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
        objc_super v3 = [(HAPDataStreamTransportInterruptPayload *)v6 requestToSendIdentifiers];
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        id v16 = v9;
      }
      v11 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
      uint64_t v12 = [(HAPDataStreamTransportInterruptPayload *)v6 dataStreamTransportInterruptSequenceNumber];
      if (v11 == v12)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v13 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
        v14 = [(HAPDataStreamTransportInterruptPayload *)v6 dataStreamTransportInterruptSequenceNumber];
        unsigned __int8 v10 = [v13 isEqual:v14];
      }
      id v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
  v4 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  id v5 = +[NSString stringWithFormat:@"<HAPDataStreamTransportInterruptPayload requestToSendIdentifiers=%@, dataStreamTransportInterruptSequenceNumber=%@>", v3, v4];

  return (NSString *)v5;
}

- (NSData)requestToSendIdentifiers
{
  return self->_requestToSendIdentifiers;
}

- (void)setRequestToSendIdentifiers:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber
{
  return self->_dataStreamTransportInterruptSequenceNumber;
}

- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, 0);

  objc_storeStrong((id *)&self->_requestToSendIdentifiers, 0);
}

@end