@interface HAPCharacteristicValueTransitionControllerContext
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueTransitionControllerContext)init;
- (HAPCharacteristicValueTransitionControllerContext)initWithIdentifier:(id)a3 startTime:(id)a4 transitionChecksum:(id)a5;
- (HAPTLVUnsignedNumberValue)startTime;
- (HAPTLVUnsignedNumberValue)transitionChecksum;
- (NSData)identifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTransitionChecksum:(id)a3;
@end

@implementation HAPCharacteristicValueTransitionControllerContext

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionControllerContext);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransitionControllerContext *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueTransitionControllerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionControllerContext;
  return [(HAPCharacteristicValueTransitionControllerContext *)&v3 init];
}

- (HAPCharacteristicValueTransitionControllerContext)initWithIdentifier:(id)a3 startTime:(id)a4 transitionChecksum:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueTransitionControllerContext;
  v12 = [(HAPCharacteristicValueTransitionControllerContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_startTime, a4);
    objc_storeStrong((id *)&v13->_transitionChecksum, a5);
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
    if (v34 == 3)
    {
      objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v28 = v9;
      uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v28];
      id v16 = v28;

      v18 = v10;
      id v10 = (void *)v19;
      goto LABEL_12;
    }
    if (v34 == 2)
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
  -[HAPCharacteristicValueTransitionControllerContext setIdentifier:](self, "setIdentifier:", v12, v26);
  [(HAPCharacteristicValueTransitionControllerContext *)self setStartTime:v11];
  [(HAPCharacteristicValueTransitionControllerContext *)self setTransitionChecksum:v10];
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
  id v5 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];

  if (v5)
  {
    id v6 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];
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
  v14 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];

  if (!v14) {
    goto LABEL_15;
  }
  objc_super v15 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];
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
    v18 = [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];

    if (!v18) {
      goto LABEL_28;
    }
    uint64_t v19 = [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];
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
  v4 = +[HAPCharacteristicValueTransitionControllerContext allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];
  id v6 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];
  id v7 = [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];
  id v8 = [(HAPCharacteristicValueTransitionControllerContext *)v4 initWithIdentifier:v5 startTime:v6 transitionChecksum:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPCharacteristicValueTransitionControllerContext *)a3;
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
      id v8 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];
      id v9 = [(HAPCharacteristicValueTransitionControllerContext *)v7 identifier];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];
        v4 = [(HAPCharacteristicValueTransitionControllerContext *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];
      uint64_t v12 = [(HAPCharacteristicValueTransitionControllerContext *)v7 startTime];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        uint64_t v13 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];
        id v26 = [(HAPCharacteristicValueTransitionControllerContext *)v7 startTime];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        id v24 = v13;
        id v25 = v11;
      }
      v14 = [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];
      uint64_t v15 = [(HAPCharacteristicValueTransitionControllerContext *)v7 transitionChecksum];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        id v16 = (void *)v15;
        [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];
        uint64_t v17 = v23 = v3;
        [(HAPCharacteristicValueTransitionControllerContext *)v7 transitionChecksum];
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
  objc_super v3 = [(HAPCharacteristicValueTransitionControllerContext *)self identifier];
  v4 = [(HAPCharacteristicValueTransitionControllerContext *)self startTime];
  id v5 = [(HAPCharacteristicValueTransitionControllerContext *)self transitionChecksum];
  id v6 = +[NSString stringWithFormat:@"<HAPCharacteristicValueTransitionControllerContext identifier=%@, startTime=%@, transitionChecksum=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)transitionChecksum
{
  return self->_transitionChecksum;
}

- (void)setTransitionChecksum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionChecksum, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end