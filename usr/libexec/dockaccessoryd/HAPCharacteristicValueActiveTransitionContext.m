@interface HAPCharacteristicValueActiveTransitionContext
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueActiveTransitionContext)init;
- (HAPCharacteristicValueActiveTransitionContext)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 timeElapsedSinceStart:(id)a5;
- (HAPTLVUnsignedNumberValue)HAPInstanceID;
- (HAPTLVUnsignedNumberValue)timeElapsedSinceStart;
- (NSData)controllerContext;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setControllerContext:(id)a3;
- (void)setHAPInstanceID:(id)a3;
- (void)setTimeElapsedSinceStart:(id)a3;
@end

@implementation HAPCharacteristicValueActiveTransitionContext

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueActiveTransitionContext);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueActiveTransitionContext *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueActiveTransitionContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  return [(HAPCharacteristicValueActiveTransitionContext *)&v3 init];
}

- (HAPCharacteristicValueActiveTransitionContext)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 timeElapsedSinceStart:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  v12 = [(HAPCharacteristicValueActiveTransitionContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v13->_controllerContext, a4);
    objc_storeStrong((id *)&v13->_timeElapsedSinceStart, a5);
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
      id v17 = v28;

      v18 = v10;
      id v10 = (void *)v19;
LABEL_12:

      goto LABEL_13;
    }
    if (v34 != 2)
    {
      if (v34 != 1) {
        goto LABEL_14;
      }
      objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v31 = v9;
      uint64_t v16 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v31];
      id v17 = v31;

      v18 = v12;
      v12 = (void *)v16;
      goto LABEL_12;
    }
    id v30 = v9;
    objc_super v15 = sub_100025088(2, (unint64_t)v7, v13, v32, &v30);
    id v17 = v30;

    if (!v17)
    {
      id v29 = 0;
      uint64_t v20 = +[NSData parsedFromData:v15 error:&v29];
      id v17 = v29;
      v18 = v11;
      id v11 = (void *)v20;
      goto LABEL_12;
    }
LABEL_13:

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
  -[HAPCharacteristicValueActiveTransitionContext setHAPInstanceID:](self, "setHAPInstanceID:", v12, v26);
  [(HAPCharacteristicValueActiveTransitionContext *)self setControllerContext:v11];
  [(HAPCharacteristicValueActiveTransitionContext *)self setTimeElapsedSinceStart:v10];
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
  id v5 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];

  if (v5)
  {
    id v6 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
    id v26 = 0;
    id v7 = [v6 serializeWithError:&v26];
    id v8 = v26;

    if (v8)
    {
LABEL_3:
      uint64_t v9 = 0;
      goto LABEL_20;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_19:
      uint64_t v9 = v10;
LABEL_20:

      if (v8)
      {
LABEL_21:
        if (a3)
        {
          id v21 = v8;
          id v8 = v21;
LABEL_26:
          id v22 = 0;
          *a3 = v21;
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      if (v9)
      {
        if (a3) {
          goto LABEL_25;
        }
        goto LABEL_29;
      }
LABEL_27:
      id v22 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v27);
      id v8 = 0;
      goto LABEL_31;
    }
  }
  id v11 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];

  if (!v11)
  {
LABEL_16:
    uint64_t v19 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];

    if (!v19) {
      goto LABEL_27;
    }
    uint64_t v20 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
    id v24 = 0;
    id v7 = [v20 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_3;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v10 = TLV8BufferAppend();
    goto LABEL_19;
  }
  v12 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
  id v25 = 0;
  unint64_t v13 = [v12 serializeWithError:&v25];
  id v8 = v25;

  if (v8)
  {

    goto LABEL_21;
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
LABEL_25:
    sub_100044EEC(v9);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_26;
  }
LABEL_29:
  id v8 = 0;
LABEL_30:
  id v22 = 0;
LABEL_31:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueActiveTransitionContext allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
  id v6 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
  id v7 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
  id v8 = [(HAPCharacteristicValueActiveTransitionContext *)v4 initWithHAPInstanceID:v5 controllerContext:v6 timeElapsedSinceStart:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPCharacteristicValueActiveTransitionContext *)a3;
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
      id v8 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
      uint64_t v9 = [(HAPCharacteristicValueActiveTransitionContext *)v7 HAPInstanceID];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
        v4 = [(HAPCharacteristicValueActiveTransitionContext *)v7 HAPInstanceID];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
      v12 = [(HAPCharacteristicValueActiveTransitionContext *)v7 controllerContext];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        unint64_t v13 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
        id v26 = [(HAPCharacteristicValueActiveTransitionContext *)v7 controllerContext];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        id v24 = v13;
        id v25 = v11;
      }
      id v14 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
      uint64_t v15 = [(HAPCharacteristicValueActiveTransitionContext *)v7 timeElapsedSinceStart];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
        uint64_t v17 = v23 = v3;
        [(HAPCharacteristicValueActiveTransitionContext *)v7 timeElapsedSinceStart];
        id v22 = v4;
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
  objc_super v3 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
  v4 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
  id v5 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
  id v6 = +[NSString stringWithFormat:@"<HAPCharacteristicValueActiveTransitionContext HAPInstanceID=%@, controllerContext=%@, timeElapsedSinceStart=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (HAPTLVUnsignedNumberValue)HAPInstanceID
{
  return self->_HAPInstanceID;
}

- (void)setHAPInstanceID:(id)a3
{
}

- (NSData)controllerContext
{
  return self->_controllerContext;
}

- (void)setControllerContext:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)timeElapsedSinceStart
{
  return self->_timeElapsedSinceStart;
}

- (void)setTimeElapsedSinceStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeElapsedSinceStart, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);

  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

@end