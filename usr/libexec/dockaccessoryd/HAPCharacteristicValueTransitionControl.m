@interface HAPCharacteristicValueTransitionControl
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueTransitionControl)init;
- (HAPCharacteristicValueTransitionControl)initWithTransitionFetch:(id)a3 transitionStart:(id)a4;
- (HAPCharacteristicValueTransitionFetch)transitionFetch;
- (HAPCharacteristicValueTransitionStart)transitionStart;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setTransitionFetch:(id)a3;
- (void)setTransitionStart:(id)a3;
@end

@implementation HAPCharacteristicValueTransitionControl

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionControl);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransitionControl *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueTransitionControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionControl;
  return [(HAPCharacteristicValueTransitionControl *)&v3 init];
}

- (HAPCharacteristicValueTransitionControl)initWithTransitionFetch:(id)a3 transitionStart:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueTransitionControl;
  v9 = [(HAPCharacteristicValueTransitionControl *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transitionFetch, a3);
    objc_storeStrong((id *)&v10->_transitionStart, a4);
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
LABEL_17:
    [(HAPCharacteristicValueTransitionControl *)self setTransitionFetch:v10];
    [(HAPCharacteristicValueTransitionControl *)self setTransitionStart:v9];
    v11 = 0;
    BOOL v18 = 1;
    goto LABEL_25;
  }
  v9 = 0;
  id v10 = 0;
  v11 = 0;
  unint64_t v12 = (unint64_t)v7 + v8;
  while (1)
  {
    char v28 = 0;
    v26[1] = 0;
    uint64_t v27 = 0;
    v26[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v27)
    {
      uint64_t v20 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      v11 = (void *)v20;
      if (!v20) {
        goto LABEL_17;
      }
LABEL_21:
      if (a4)
      {
        id v19 = v11;
        v11 = v19;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v28 == 2)
    {
      id v23 = v11;
      v14 = sub_100025088(2, (unint64_t)v7, v12, v26, &v23);
      id v15 = v23;

      if (!v15)
      {
        uint64_t v22 = 0;
        v16 = (id *)&v22;
        +[HAPCharacteristicValueTransitionStart parsedFromData:v14 error:&v22];
        v9 = v17 = v9;
LABEL_11:
        id v15 = *v16;
      }
LABEL_12:

      v11 = v15;
      goto LABEL_13;
    }
    if (v28 == 1)
    {
      id v25 = v11;
      v14 = sub_100025088(1, (unint64_t)v7, v12, v26, &v25);
      id v15 = v25;

      if (!v15)
      {
        uint64_t v24 = 0;
        v16 = (id *)&v24;
        +[HAPCharacteristicValueTransitionFetch parsedFromData:v14 error:&v24];
        id v10 = v17 = v10;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    id v7 = (id)v26[0];
    if (v26[0] >= v12)
    {
      if (!v11) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  if (a4)
  {
    sub_100044EEC(Next);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    BOOL v18 = 0;
    *a4 = v19;
    goto LABEL_25;
  }
LABEL_24:
  BOOL v18 = 0;
LABEL_25:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  long long v48 = 0u;
  long long v49 = 0u;
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
  long long v29 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];

  if (v5)
  {
    id v6 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
    id v28 = 0;
    id v7 = [v6 serializeWithError:&v28];
    id v8 = v28;

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

      goto LABEL_28;
    }
LABEL_12:

    if (a3)
    {
      id v16 = v8;
      id v8 = v16;
LABEL_30:
      id v25 = 0;
      *a3 = v16;
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_10:
  v14 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];

  if (!v14) {
    goto LABEL_31;
  }
  id v15 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  id v27 = 0;
  id v7 = [v15 serializeWithError:&v27];
  id v8 = v27;

  if (v8) {
    goto LABEL_12;
  }
  id v18 = v7;
  id v19 = (char *)[v18 bytes];
  uint64_t v20 = (char *)[v18 length] + (void)v19;
  do
  {
    if (v20 - v19 >= 255) {
      uint64_t v21 = 255;
    }
    else {
      uint64_t v21 = v20 - v19;
    }
    uint64_t v22 = TLV8BufferAppend();
    if (v22) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v21;
    }
    v19 += v23;
    if (v22) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v19 >= v20;
    }
  }
  while (!v24);
  uint64_t v17 = v22;

  if (!v17)
  {
LABEL_31:
    id v25 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v29);
    id v8 = 0;
    goto LABEL_34;
  }
LABEL_28:
  if (a3)
  {
    sub_100044EEC(v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_30;
  }
  id v8 = 0;
LABEL_33:
  id v25 = 0;
LABEL_34:
  TLV8BufferFree();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueTransitionControl allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
  id v6 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  id v7 = [(HAPCharacteristicValueTransitionControl *)v4 initWithTransitionFetch:v5 transitionStart:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPCharacteristicValueTransitionControl *)a3;
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
      id v7 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
      id v8 = [(HAPCharacteristicValueTransitionControl *)v6 transitionFetch];
      if (v7 != v8)
      {
        id v9 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
        objc_super v3 = [(HAPCharacteristicValueTransitionControl *)v6 transitionFetch];
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        id v16 = v9;
      }
      v11 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
      uint64_t v12 = [(HAPCharacteristicValueTransitionControl *)v6 transitionStart];
      if (v11 == v12)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v13 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
        v14 = [(HAPCharacteristicValueTransitionControl *)v6 transitionStart];
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
  objc_super v3 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
  v4 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  id v5 = +[NSString stringWithFormat:@"<HAPCharacteristicValueTransitionControl transitionFetch=%@, transitionStart=%@>", v3, v4];

  return (NSString *)v5;
}

- (HAPCharacteristicValueTransitionFetch)transitionFetch
{
  return self->_transitionFetch;
}

- (void)setTransitionFetch:(id)a3
{
}

- (HAPCharacteristicValueTransitionStart)transitionStart
{
  return self->_transitionStart;
}

- (void)setTransitionStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionStart, 0);

  objc_storeStrong((id *)&self->_transitionFetch, 0);
}

@end