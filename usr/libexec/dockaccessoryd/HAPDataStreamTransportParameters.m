@interface HAPDataStreamTransportParameters
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportParameters)init;
- (HAPDataStreamTransportParameters)initWithTcpListeningPort:(id)a3 sessionIdentifier:(id)a4;
- (HAPTLVUnsignedNumberValue)sessionIdentifier;
- (HAPTLVUnsignedNumberValue)tcpListeningPort;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTcpListeningPort:(id)a3;
@end

@implementation HAPDataStreamTransportParameters

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportParameters);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportParameters *)v6 parseFromData:v5 error:&v10];
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

- (HAPDataStreamTransportParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportParameters;
  return [(HAPDataStreamTransportParameters *)&v3 init];
}

- (HAPDataStreamTransportParameters)initWithTcpListeningPort:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportParameters;
  v9 = [(HAPDataStreamTransportParameters *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tcpListeningPort, a3);
    objc_storeStrong((id *)&v10->_sessionIdentifier, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (char *)[v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 >= 1)
  {
    v21 = a4;
    id v22 = v6;
    v9 = 0;
    id v10 = 0;
    id v11 = 0;
    objc_super v12 = &v7[v8];
    while (1)
    {
      char v28 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      unint64_t v25 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (v21)
        {
          sub_100044EEC(Next);
          BOOL v18 = 0;
          id *v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v18 = 0;
        }
        id v6 = v22;
        goto LABEL_23;
      }
      if (!v27)
      {
        uint64_t v19 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

        id v11 = (id)v19;
        if (v19) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
      if (v28 == 2) {
        break;
      }
      if (v28 == 1)
      {
        v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v24 = v11;
        v15 = &v24;
        +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v24];
        id v10 = v16 = v10;
LABEL_9:
        id v17 = *v15;

        id v11 = v17;
      }
      if (v25 >= (unint64_t)v12)
      {
        if (v11)
        {
LABEL_12:
          id v6 = v22;
          if (v21)
          {
            id v11 = v11;
            BOOL v18 = 0;
            id *v21 = v11;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_23;
        }
LABEL_18:
        id v6 = v22;
        goto LABEL_19;
      }
    }
    v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
    id v23 = v11;
    v15 = &v23;
    +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v23];
    v9 = v16 = v9;
    goto LABEL_9;
  }
  v9 = 0;
  id v10 = 0;
LABEL_19:
  -[HAPDataStreamTransportParameters setTcpListeningPort:](self, "setTcpListeningPort:", v10, v21);
  [(HAPDataStreamTransportParameters *)self setSessionIdentifier:v9];
  id v11 = 0;
  BOOL v18 = 1;
LABEL_23:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
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
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
  id v17 = 0;
  id v7 = [v6 serializeWithError:&v17];
  id v8 = v17;

  if (v8)
  {
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  id v7 = v7;
  [v7 bytes];
  [v7 length];
  uint64_t v9 = TLV8BufferAppend();
  if (!v9)
  {

LABEL_5:
    id v10 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];

    if (!v10) {
      goto LABEL_17;
    }
    id v11 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
    id v16 = 0;
    id v7 = [v11 serializeWithError:&v16];
    id v8 = v16;

    if (v8) {
      goto LABEL_7;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
  }
  uint64_t v12 = v9;
LABEL_10:

  if (!v8)
  {
    if (v12)
    {
      if (a3)
      {
        sub_100044EEC(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_16;
      }
      id v8 = 0;
      goto LABEL_19;
    }
LABEL_17:
    v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18);
    id v8 = 0;
    goto LABEL_20;
  }
  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_16:
    v14 = 0;
    *a3 = v13;
    goto LABEL_20;
  }
LABEL_19:
  v14 = 0;
LABEL_20:
  TLV8BufferFree();

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportParameters allocWithZone:a3];
  id v5 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
  id v6 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
  id v7 = [(HAPDataStreamTransportParameters *)v4 initWithTcpListeningPort:v5 sessionIdentifier:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPDataStreamTransportParameters *)a3;
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
      id v7 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
      id v8 = [(HAPDataStreamTransportParameters *)v6 tcpListeningPort];
      if (v7 != v8)
      {
        uint64_t v9 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
        objc_super v3 = [(HAPDataStreamTransportParameters *)v6 tcpListeningPort];
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        id v16 = v9;
      }
      id v11 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
      uint64_t v12 = [(HAPDataStreamTransportParameters *)v6 sessionIdentifier];
      if (v11 == v12)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        id v13 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
        v14 = [(HAPDataStreamTransportParameters *)v6 sessionIdentifier];
        unsigned __int8 v10 = [v13 isEqual:v14];
      }
      uint64_t v9 = v16;
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
  objc_super v3 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
  v4 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
  id v5 = +[NSString stringWithFormat:@"<HAPDataStreamTransportParameters tcpListeningPort=%@, sessionIdentifier=%@>", v3, v4];

  return (NSString *)v5;
}

- (HAPTLVUnsignedNumberValue)tcpListeningPort
{
  return self->_tcpListeningPort;
}

- (void)setTcpListeningPort:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_tcpListeningPort, 0);
}

@end