@interface HAPDataStreamTransportSetupResponse
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportCommandStatusWrapper)status;
- (HAPDataStreamTransportParameters)parameters;
- (HAPDataStreamTransportSetupResponse)init;
- (HAPDataStreamTransportSetupResponse)initWithStatus:(id)a3 parameters:(id)a4 accessoryKeySalt:(id)a5;
- (NSData)accessoryKeySalt;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAccessoryKeySalt:(id)a3;
- (void)setParameters:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation HAPDataStreamTransportSetupResponse

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportSetupResponse);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportSetupResponse *)v6 parseFromData:v5 error:&v10];
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

- (HAPDataStreamTransportSetupResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportSetupResponse;
  return [(HAPDataStreamTransportSetupResponse *)&v3 init];
}

- (HAPDataStreamTransportSetupResponse)initWithStatus:(id)a3 parameters:(id)a4 accessoryKeySalt:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamTransportSetupResponse;
  v12 = [(HAPDataStreamTransportSetupResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_status, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_accessoryKeySalt, a5);
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
LABEL_19:
    -[HAPDataStreamTransportSetupResponse setStatus:](self, "setStatus:", v12, v26);
    [(HAPDataStreamTransportSetupResponse *)self setParameters:v11];
    [(HAPDataStreamTransportSetupResponse *)self setAccessoryKeySalt:v10];
    id v9 = 0;
    BOOL v21 = 1;
    goto LABEL_27;
  }
  v26 = a4;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  v12 = 0;
  unint64_t v13 = (unint64_t)v7 + v8;
  while (1)
  {
    char v34 = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    v32[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v33)
    {
      uint64_t v24 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_19;
      }
LABEL_23:
      v22 = v26;
      if (v26)
      {
        id v23 = v9;
        id v9 = v23;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    switch(v34)
    {
      case 3:
        id v28 = v9;
        objc_super v15 = sub_100025088(3, (unint64_t)v7, v13, v32, &v28);
        id v17 = v28;

        if (!v17)
        {
          id v27 = 0;
          uint64_t v19 = +[NSData parsedFromData:v15 error:&v27];
          id v17 = v27;
          v18 = v10;
          id v10 = (void *)v19;
          goto LABEL_13;
        }
LABEL_14:

        id v9 = v17;
        break;
      case 2:
        id v30 = v9;
        objc_super v15 = sub_100025088(2, (unint64_t)v7, v13, v32, &v30);
        id v17 = v30;

        if (!v17)
        {
          id v29 = 0;
          uint64_t v20 = +[HAPDataStreamTransportParameters parsedFromData:v15 error:&v29];
          id v17 = v29;
          v18 = v11;
          id v11 = (void *)v20;
LABEL_13:
        }
        goto LABEL_14;
      case 1:
        objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v31 = v9;
        uint64_t v16 = +[HAPDataStreamTransportCommandStatusWrapper parsedFromData:v15 error:&v31];
        id v17 = v31;

        v18 = v12;
        v12 = (void *)v16;
        goto LABEL_13;
    }
    id v7 = (id)v32[0];
    if (v32[0] >= v13)
    {
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_23;
    }
  }
  v22 = v26;
  if (v26)
  {
    sub_100044EEC(Next);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    BOOL v21 = 0;
    id *v22 = v23;
    goto LABEL_27;
  }
LABEL_26:
  BOOL v21 = 0;
LABEL_27:

  return v21;
}

- (id)serializeWithError:(id *)a3
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
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
  long long v32 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPDataStreamTransportSetupResponse *)self status];

  if (v5)
  {
    id v6 = [(HAPDataStreamTransportSetupResponse *)self status];
    id v31 = 0;
    id v7 = [v6 serializeWithError:&v31];
    id v8 = v31;

    if (v8)
    {
LABEL_3:
      uint64_t v9 = 0;
      goto LABEL_31;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_30:
      uint64_t v9 = v10;
LABEL_31:

      if (v8)
      {
LABEL_32:
        if (a3)
        {
          id v26 = v8;
          id v8 = v26;
LABEL_37:
          id v27 = 0;
          *a3 = v26;
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      if (v9)
      {
        if (a3) {
          goto LABEL_36;
        }
        goto LABEL_40;
      }
LABEL_38:
      id v27 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32);
      id v8 = 0;
      goto LABEL_42;
    }
  }
  id v11 = [(HAPDataStreamTransportSetupResponse *)self parameters];

  if (!v11)
  {
LABEL_16:
    uint64_t v19 = [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];

    if (!v19) {
      goto LABEL_38;
    }
    uint64_t v20 = [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];
    id v29 = 0;
    id v7 = [v20 serializeWithError:&v29];
    id v8 = v29;

    if (v8) {
      goto LABEL_3;
    }
    id v7 = v7;
    BOOL v21 = (char *)[v7 bytes];
    v22 = (char *)[v7 length] + (void)v21;
    do
    {
      if (v22 - v21 >= 255) {
        uint64_t v23 = 255;
      }
      else {
        uint64_t v23 = v22 - v21;
      }
      uint64_t v10 = TLV8BufferAppend();
      if (v10) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v23;
      }
      v21 += v24;
      if (v10) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = v21 >= v22;
      }
    }
    while (!v25);
    goto LABEL_30;
  }
  v12 = [(HAPDataStreamTransportSetupResponse *)self parameters];
  id v30 = 0;
  unint64_t v13 = [v12 serializeWithError:&v30];
  id v8 = v30;

  if (v8)
  {

    goto LABEL_32;
  }
  id v14 = v13;
  objc_super v15 = (char *)[v14 bytes];
  uint64_t v16 = (char *)[v14 length] + (void)v15;
  while (1)
  {
    uint64_t v17 = v16 - v15 >= 255 ? 255 : v16 - v15;
    uint64_t v18 = TLV8BufferAppend();
    if (v18) {
      break;
    }
    v15 += v17;
    if (v15 >= v16)
    {

      goto LABEL_16;
    }
  }
  uint64_t v9 = v18;

  if (a3)
  {
LABEL_36:
    sub_100044EEC(v9);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_37;
  }
LABEL_40:
  id v8 = 0;
LABEL_41:
  id v27 = 0;
LABEL_42:
  TLV8BufferFree();

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportSetupResponse allocWithZone:a3];
  id v5 = [(HAPDataStreamTransportSetupResponse *)self status];
  id v6 = [(HAPDataStreamTransportSetupResponse *)self parameters];
  id v7 = [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];
  id v8 = [(HAPDataStreamTransportSetupResponse *)v4 initWithStatus:v5 parameters:v6 accessoryKeySalt:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPDataStreamTransportSetupResponse *)a3;
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
      id v8 = [(HAPDataStreamTransportSetupResponse *)self status];
      uint64_t v9 = [(HAPDataStreamTransportSetupResponse *)v7 status];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPDataStreamTransportSetupResponse *)self status];
        v4 = [(HAPDataStreamTransportSetupResponse *)v7 status];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPDataStreamTransportSetupResponse *)self parameters];
      v12 = [(HAPDataStreamTransportSetupResponse *)v7 parameters];
      if (v11 == v12)
      {
        BOOL v25 = v11;
      }
      else
      {
        unint64_t v13 = [(HAPDataStreamTransportSetupResponse *)self parameters];
        id v26 = [(HAPDataStreamTransportSetupResponse *)v7 parameters];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        uint64_t v24 = v13;
        BOOL v25 = v11;
      }
      id v14 = [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];
      uint64_t v15 = [(HAPDataStreamTransportSetupResponse *)v7 accessoryKeySalt];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];
        uint64_t v17 = v23 = v3;
        [(HAPDataStreamTransportSetupResponse *)v7 accessoryKeySalt];
        v22 = v4;
        uint64_t v18 = v9;
        v20 = uint64_t v19 = v8;
        unsigned __int8 v10 = [v17 isEqual:v20];

        id v8 = v19;
        uint64_t v9 = v18;
        v4 = v22;

        objc_super v3 = v23;
      }
      unint64_t v13 = v24;
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
  objc_super v3 = [(HAPDataStreamTransportSetupResponse *)self status];
  v4 = [(HAPDataStreamTransportSetupResponse *)self parameters];
  id v5 = [(HAPDataStreamTransportSetupResponse *)self accessoryKeySalt];
  id v6 = +[NSString stringWithFormat:@"<HAPDataStreamTransportSetupResponse status=%@, parameters=%@, accessoryKeySalt=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (HAPDataStreamTransportCommandStatusWrapper)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (HAPDataStreamTransportParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSData)accessoryKeySalt
{
  return self->_accessoryKeySalt;
}

- (void)setAccessoryKeySalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryKeySalt, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end