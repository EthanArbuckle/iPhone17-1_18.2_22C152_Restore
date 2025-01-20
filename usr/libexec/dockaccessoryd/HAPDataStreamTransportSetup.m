@interface HAPDataStreamTransportSetup
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportCommandWrapper)command;
- (HAPDataStreamTransportProtocolWrapper)transportType;
- (HAPDataStreamTransportSetup)init;
- (HAPDataStreamTransportSetup)initWithCommand:(id)a3 transportType:(id)a4 controllerKeySalt:(id)a5;
- (NSData)controllerKeySalt;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCommand:(id)a3;
- (void)setControllerKeySalt:(id)a3;
- (void)setTransportType:(id)a3;
@end

@implementation HAPDataStreamTransportSetup

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportSetup);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportSetup *)v6 parseFromData:v5 error:&v10];
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

- (HAPDataStreamTransportSetup)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportSetup;
  return [(HAPDataStreamTransportSetup *)&v3 init];
}

- (HAPDataStreamTransportSetup)initWithCommand:(id)a3 transportType:(id)a4 controllerKeySalt:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamTransportSetup;
  v12 = [(HAPDataStreamTransportSetup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_command, a3);
    objc_storeStrong((id *)&v13->_transportType, a4);
    objc_storeStrong((id *)&v13->_controllerKeySalt, a5);
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
    if (v34 != 3)
    {
      if (v34 == 2)
      {
        objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v30 = v9;
        uint64_t v20 = +[HAPDataStreamTransportProtocolWrapper parsedFromData:v15 error:&v30];
        id v17 = v30;

        v18 = v11;
        id v11 = (void *)v20;
      }
      else
      {
        if (v34 != 1) {
          goto LABEL_14;
        }
        objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v31 = v9;
        uint64_t v16 = +[HAPDataStreamTransportCommandWrapper parsedFromData:v15 error:&v31];
        id v17 = v31;

        v18 = v12;
        v12 = (void *)v16;
      }
      goto LABEL_12;
    }
    id v29 = v9;
    objc_super v15 = sub_100025088(3, (unint64_t)v7, v13, v32, &v29);
    id v17 = v29;

    if (!v17)
    {
      id v28 = 0;
      uint64_t v19 = +[NSData parsedFromData:v15 error:&v28];
      id v17 = v28;
      v18 = v10;
      id v10 = (void *)v19;
LABEL_12:
    }
    id v9 = v17;
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
  -[HAPDataStreamTransportSetup setCommand:](self, "setCommand:", v12, v26);
  [(HAPDataStreamTransportSetup *)self setTransportType:v11];
  [(HAPDataStreamTransportSetup *)self setControllerKeySalt:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (id)serializeWithError:(id *)a3
{
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
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPDataStreamTransportSetup *)self command];

  if (v5)
  {
    id v6 = [(HAPDataStreamTransportSetup *)self command];
    id v25 = 0;
    id v7 = [v6 serializeWithError:&v25];
    id v8 = v25;

    if (v8) {
      goto LABEL_11;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      goto LABEL_24;
    }
  }
  id v10 = [(HAPDataStreamTransportSetup *)self transportType];

  if (v10)
  {
    id v11 = [(HAPDataStreamTransportSetup *)self transportType];
    id v24 = 0;
    id v7 = [v11 serializeWithError:&v24];
    id v8 = v24;

    if (!v8)
    {
      id v7 = v7;
      [v7 bytes];
      [v7 length];
      uint64_t v9 = TLV8BufferAppend();
      if (v9) {
        goto LABEL_24;
      }

      goto LABEL_9;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_25;
  }
LABEL_9:
  v12 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];

  if (!v12) {
    goto LABEL_32;
  }
  unint64_t v13 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
  id v23 = 0;
  id v7 = [v13 serializeWithError:&v23];
  id v8 = v23;

  if (v8) {
    goto LABEL_11;
  }
  id v7 = v7;
  objc_super v15 = (char *)[v7 bytes];
  uint64_t v16 = (char *)[v7 length] + (void)v15;
  do
  {
    if (v16 - v15 >= 255) {
      uint64_t v17 = 255;
    }
    else {
      uint64_t v17 = v16 - v15;
    }
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v17;
    }
    v15 += v18;
    if (v9) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v15 >= v16;
    }
  }
  while (!v19);
LABEL_24:
  uint64_t v14 = v9;
LABEL_25:

  if (!v8)
  {
    if (v14)
    {
      if (a3)
      {
        sub_100044EEC(v14);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_31;
      }
      id v8 = 0;
      goto LABEL_34;
    }
LABEL_32:
    v21 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26);
    id v8 = 0;
    goto LABEL_35;
  }
  if (a3)
  {
    id v20 = v8;
    id v8 = v20;
LABEL_31:
    v21 = 0;
    *a3 = v20;
    goto LABEL_35;
  }
LABEL_34:
  v21 = 0;
LABEL_35:
  TLV8BufferFree();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportSetup allocWithZone:a3];
  id v5 = [(HAPDataStreamTransportSetup *)self command];
  id v6 = [(HAPDataStreamTransportSetup *)self transportType];
  id v7 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
  id v8 = [(HAPDataStreamTransportSetup *)v4 initWithCommand:v5 transportType:v6 controllerKeySalt:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPDataStreamTransportSetup *)a3;
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
      id v8 = [(HAPDataStreamTransportSetup *)self command];
      uint64_t v9 = [(HAPDataStreamTransportSetup *)v7 command];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPDataStreamTransportSetup *)self command];
        v4 = [(HAPDataStreamTransportSetup *)v7 command];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPDataStreamTransportSetup *)self transportType];
      v12 = [(HAPDataStreamTransportSetup *)v7 transportType];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        unint64_t v13 = [(HAPDataStreamTransportSetup *)self transportType];
        long long v26 = [(HAPDataStreamTransportSetup *)v7 transportType];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        id v24 = v13;
        id v25 = v11;
      }
      uint64_t v14 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
      uint64_t v15 = [(HAPDataStreamTransportSetup *)v7 controllerKeySalt];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(HAPDataStreamTransportSetup *)self controllerKeySalt];
        uint64_t v17 = v23 = v3;
        [(HAPDataStreamTransportSetup *)v7 controllerKeySalt];
        id v22 = v4;
        uint64_t v18 = v9;
        v20 = BOOL v19 = v8;
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
  objc_super v3 = [(HAPDataStreamTransportSetup *)self command];
  v4 = [(HAPDataStreamTransportSetup *)self transportType];
  id v5 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
  id v6 = +[NSString stringWithFormat:@"<HAPDataStreamTransportSetup command=%@, transportType=%@, controllerKeySalt=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (HAPDataStreamTransportCommandWrapper)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (HAPDataStreamTransportProtocolWrapper)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSData)controllerKeySalt
{
  return self->_controllerKeySalt;
}

- (void)setControllerKeySalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerKeySalt, 0);
  objc_storeStrong((id *)&self->_transportType, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

@end