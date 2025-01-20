@interface HAPDataStreamHAPAccessoryPayload
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamHAPAccessoryPayload)init;
- (HAPDataStreamHAPAccessoryPayload)initWithPayload:(id)a3 forceClose:(id)a4 accessoryRequestToSend:(id)a5;
- (HAPTLVUnsignedNumberValue)accessoryRequestToSend;
- (HAPTLVUnsignedNumberValue)forceClose;
- (NSData)payload;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAccessoryRequestToSend:(id)a3;
- (void)setForceClose:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation HAPDataStreamHAPAccessoryPayload

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamHAPAccessoryPayload);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamHAPAccessoryPayload *)v6 parseFromData:v5 error:&v10];
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

- (HAPDataStreamHAPAccessoryPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamHAPAccessoryPayload;
  return [(HAPDataStreamHAPAccessoryPayload *)&v3 init];
}

- (HAPDataStreamHAPAccessoryPayload)initWithPayload:(id)a3 forceClose:(id)a4 accessoryRequestToSend:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamHAPAccessoryPayload;
  v12 = [(HAPDataStreamHAPAccessoryPayload *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payload, a3);
    objc_storeStrong((id *)&v13->_forceClose, a4);
    objc_storeStrong((id *)&v13->_accessoryRequestToSend, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 < 1)
  {
    id v10 = 0;
    id v11 = 0;
    v12 = 0;
    goto LABEL_24;
  }
  v26 = self;
  v27 = a4;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  v12 = 0;
  unint64_t v13 = (unint64_t)v7 + v8;
  do
  {
    char v34 = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    v32[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      v21 = v27;
      if (v27)
      {
        sub_100044EEC(Next);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_25:
      BOOL v23 = 0;
      goto LABEL_26;
    }
    if (!v33)
    {
      uint64_t v24 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_23;
      }
LABEL_16:
      v21 = v27;
      if (v27)
      {
        id v22 = v9;
        id v9 = v22;
LABEL_21:
        BOOL v23 = 0;
        id *v21 = v22;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v34 == 4)
    {
      objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v28 = v9;
      uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v28];
      id v16 = v28;

      v18 = v10;
      id v10 = (void *)v19;
      goto LABEL_12;
    }
    if (v34 == 3)
    {
      objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v29 = v9;
      uint64_t v20 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v29];
      id v16 = v29;

      v18 = v11;
      id v11 = (void *)v20;
      goto LABEL_12;
    }
    if (v34 != 1) {
      goto LABEL_14;
    }
    id v31 = v9;
    objc_super v15 = sub_100025088(1, (unint64_t)v7, v13, v32, &v31);
    id v16 = v31;

    if (!v16)
    {
      id v30 = 0;
      uint64_t v17 = +[NSData parsedFromData:v15 error:&v30];
      id v16 = v30;
      v18 = v12;
      v12 = (void *)v17;
LABEL_12:
    }
    id v9 = v16;
LABEL_14:
    id v7 = (id)v32[0];
  }
  while (v32[0] < v13);
  if (v9) {
    goto LABEL_16;
  }
LABEL_23:
  self = v26;
LABEL_24:
  -[HAPDataStreamHAPAccessoryPayload setPayload:](self, "setPayload:", v12, v26);
  [(HAPDataStreamHAPAccessoryPayload *)self setForceClose:v11];
  [(HAPDataStreamHAPAccessoryPayload *)self setAccessoryRequestToSend:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (id)serializeWithError:(id *)a3
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
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
  long long v27 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPDataStreamHAPAccessoryPayload *)self payload];

  if (v5)
  {
    id v6 = [(HAPDataStreamHAPAccessoryPayload *)self payload];
    id v26 = 0;
    id v7 = [v6 serializeWithError:&v26];
    id v8 = v26;

    if (v8)
    {

      goto LABEL_22;
    }
    id v9 = v7;
    id v10 = (char *)[v9 bytes];
    id v11 = (char *)[v9 length] + (void)v10;
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

        goto LABEL_11;
      }
    }
    uint64_t v20 = v13;

LABEL_25:
    if (a3)
    {
      sub_100044EEC(v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
      goto LABEL_27;
    }
    id v8 = 0;
    goto LABEL_30;
  }
LABEL_11:
  v14 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];

  if (!v14) {
    goto LABEL_15;
  }
  objc_super v15 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];
  id v25 = 0;
  id v16 = [v15 serializeWithError:&v25];
  id v8 = v25;

  if (v8)
  {
LABEL_17:
    uint64_t v20 = 0;
    goto LABEL_21;
  }
  id v16 = v16;
  [v16 bytes];
  [v16 length];
  uint64_t v17 = TLV8BufferAppend();
  if (!v17)
  {

LABEL_15:
    v18 = [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];

    if (!v18) {
      goto LABEL_28;
    }
    uint64_t v19 = [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];
    id v24 = 0;
    id v16 = [v19 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_17;
    }
    id v16 = v16;
    [v16 bytes];
    [v16 length];
    uint64_t v17 = TLV8BufferAppend();
  }
  uint64_t v20 = v17;
LABEL_21:

  if (!v8)
  {
    if (v20) {
      goto LABEL_25;
    }
LABEL_28:
    id v22 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v27);
    id v8 = 0;
    goto LABEL_31;
  }
LABEL_22:
  if (a3)
  {
    id v21 = v8;
    id v8 = v21;
LABEL_27:
    id v22 = 0;
    *a3 = v21;
    goto LABEL_31;
  }
LABEL_30:
  id v22 = 0;
LABEL_31:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamHAPAccessoryPayload allocWithZone:a3];
  id v5 = [(HAPDataStreamHAPAccessoryPayload *)self payload];
  id v6 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];
  id v7 = [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];
  id v8 = [(HAPDataStreamHAPAccessoryPayload *)v4 initWithPayload:v5 forceClose:v6 accessoryRequestToSend:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPDataStreamHAPAccessoryPayload *)a3;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [(HAPDataStreamHAPAccessoryPayload *)self payload];
      id v9 = [(HAPDataStreamHAPAccessoryPayload *)v7 payload];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPDataStreamHAPAccessoryPayload *)self payload];
        v4 = [(HAPDataStreamHAPAccessoryPayload *)v7 payload];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];
      uint64_t v12 = [(HAPDataStreamHAPAccessoryPayload *)v7 forceClose];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        uint64_t v13 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];
        id v26 = [(HAPDataStreamHAPAccessoryPayload *)v7 forceClose];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        id v24 = v13;
        id v25 = v11;
      }
      v14 = [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];
      uint64_t v15 = [(HAPDataStreamHAPAccessoryPayload *)v7 accessoryRequestToSend];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        id v16 = (void *)v15;
        [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];
        uint64_t v17 = v23 = v3;
        [(HAPDataStreamHAPAccessoryPayload *)v7 accessoryRequestToSend];
        id v22 = v4;
        v18 = v9;
        v20 = uint64_t v19 = v8;
        unsigned __int8 v10 = [v17 isEqual:v20];

        id v8 = v19;
        id v9 = v18;
        v4 = v22;

        objc_super v3 = v23;
      }
      uint64_t v13 = v24;
      id v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPDataStreamHAPAccessoryPayload *)self payload];
  v4 = [(HAPDataStreamHAPAccessoryPayload *)self forceClose];
  id v5 = [(HAPDataStreamHAPAccessoryPayload *)self accessoryRequestToSend];
  id v6 = +[NSString stringWithFormat:@"<HAPDataStreamHAPAccessoryPayload payload=%@, forceClose=%@, accessoryRequestToSend=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)forceClose
{
  return self->_forceClose;
}

- (void)setForceClose:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)accessoryRequestToSend
{
  return self->_accessoryRequestToSend;
}

- (void)setAccessoryRequestToSend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRequestToSend, 0);
  objc_storeStrong((id *)&self->_forceClose, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end