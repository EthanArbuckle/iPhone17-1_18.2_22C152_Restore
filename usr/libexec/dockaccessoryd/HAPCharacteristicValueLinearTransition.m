@interface HAPCharacteristicValueLinearTransition
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueLinearTransition)init;
- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4;
- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior;
- (NSMutableArray)transitionPoints;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setStartBehavior:(id)a3;
- (void)setTransitionPoints:(id)a3;
@end

@implementation HAPCharacteristicValueLinearTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearTransition);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueLinearTransition *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueLinearTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearTransition;
  return [(HAPCharacteristicValueLinearTransition *)&v3 init];
}

- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueLinearTransition;
  id v8 = [(HAPCharacteristicValueLinearTransition *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableArray *)[v6 mutableCopy];
    transitionPoints = v8->_transitionPoints;
    v8->_transitionPoints = v9;

    objc_storeStrong((id *)&v8->_startBehavior, a4);
  }

  return v8;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  v9 = +[NSMutableArray array];
  if (v8 < 1)
  {
    v11 = 0;
LABEL_17:
    -[HAPCharacteristicValueLinearTransition setTransitionPoints:](self, "setTransitionPoints:", v9, v23);
    [(HAPCharacteristicValueLinearTransition *)self setStartBehavior:v11];
    id v10 = 0;
    BOOL v18 = 1;
    goto LABEL_25;
  }
  v23 = a4;
  id v10 = 0;
  v11 = 0;
  unint64_t v12 = (unint64_t)v7 + v8;
  while (1)
  {
    char v29 = 0;
    v27[1] = 0;
    uint64_t v28 = 0;
    v27[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v28)
    {
      uint64_t v21 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      id v10 = (void *)v21;
      if (!v21) {
        goto LABEL_17;
      }
LABEL_21:
      v19 = v23;
      if (v23)
      {
        id v20 = v10;
        id v10 = v20;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v29 == 2)
    {
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      id v24 = v10;
      uint64_t v17 = +[HAPCharacteristicValueTransitionLinearStartConditionWrapper parsedFromData:v14 error:&v24];
      id v15 = v24;

      v16 = v11;
      v11 = (void *)v17;
      goto LABEL_11;
    }
    if (v29 == 1)
    {
      id v26 = v10;
      v14 = sub_100025088(1, (unint64_t)v7, v12, v27, &v26);
      id v15 = v26;

      if (!v15)
      {
        id v25 = 0;
        v16 = +[HAPCharacteristicValueTransitionPoint parsedFromData:v14 error:&v25];
        id v15 = v25;
        if (!v15) {
          [v9 addObject:v16];
        }
LABEL_11:
      }
      id v10 = v15;
    }
    id v7 = (id)v27[0];
    if (v27[0] >= v12)
    {
      if (!v10) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  v19 = v23;
  if (v23)
  {
    sub_100044EEC(Next);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    BOOL v18 = 0;
    id *v19 = v20;
    goto LABEL_25;
  }
LABEL_24:
  BOOL v18 = 0;
LABEL_25:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
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
  long long v36 = 0u;
  TLV8BufferInit();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v28 = self;
  id v5 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    char v9 = 1;
    v27 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v30 = 0;
      v13 = [v11 serializeWithError:&v30, v27];
      id v14 = v30;
      if (v14)
      {
        id v22 = v14;

        uint64_t v23 = 0;
        goto LABEL_27;
      }
      id v15 = v13;
      v16 = (char *)[v15 bytes];
      uint64_t v17 = (char *)[v15 length] + (void)v16;
      do
      {
        if (v17 - v16 >= 255) {
          uint64_t v18 = 255;
        }
        else {
          uint64_t v18 = v17 - v16;
        }
        uint64_t v19 = TLV8BufferAppend();
        if (v19)
        {
          uint64_t v23 = v19;

          a3 = v27;
          goto LABEL_21;
        }
        v16 += v18;
      }
      while (v16 < v17);

      char v9 = 0;
      if ((id)++v10 != v7) {
        goto LABEL_4;
      }
      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      char v9 = 0;
      a3 = v27;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v23 = v12;
    id v22 = 0;
LABEL_27:
    a3 = v27;
  }
  else
  {
LABEL_17:

    id v20 = [(HAPCharacteristicValueLinearTransition *)v28 startBehavior];

    if (!v20) {
      goto LABEL_34;
    }
    uint64_t v21 = [(HAPCharacteristicValueLinearTransition *)v28 startBehavior];
    id v29 = 0;
    id v5 = [v21 serializeWithError:&v29];
    id v22 = v29;

    if (v22)
    {
      uint64_t v23 = 0;
    }
    else
    {
      id v5 = v5;
      [v5 bytes];
      [v5 length];
      uint64_t v23 = TLV8BufferAppend();
    }
  }

  if (v22)
  {
    if (a3)
    {
      id v24 = v22;
      id v22 = v24;
      goto LABEL_31;
    }
LABEL_32:
    id v25 = 0;
    goto LABEL_35;
  }
  if (v23)
  {
LABEL_21:
    if (a3)
    {
      sub_100044EEC(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = 0;
LABEL_31:
      id v25 = 0;
      *a3 = v24;
      goto LABEL_35;
    }
    id v22 = 0;
    goto LABEL_32;
  }
LABEL_34:
  id v25 = +[NSData dataWithBytes:v36 length:v27];
  id v22 = 0;
LABEL_35:
  TLV8BufferFree();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueLinearTransition allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  id v6 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
  id v7 = [(HAPCharacteristicValueLinearTransition *)v4 initWithTransitionPoints:v5 startBehavior:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPCharacteristicValueLinearTransition *)a3;
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
      id v7 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
      uint64_t v8 = [(HAPCharacteristicValueLinearTransition *)v6 transitionPoints];
      if (v7 != v8)
      {
        char v9 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
        objc_super v3 = [(HAPCharacteristicValueLinearTransition *)v6 transitionPoints];
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
      uint64_t v12 = [(HAPCharacteristicValueLinearTransition *)v6 startBehavior];
      if (v11 == v12)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        v13 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
        id v14 = [(HAPCharacteristicValueLinearTransition *)v6 startBehavior];
        unsigned __int8 v10 = [v13 isEqual:v14];
      }
      char v9 = v16;
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
  objc_super v3 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  v4 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
  id v5 = +[NSString stringWithFormat:@"<HAPCharacteristicValueLinearTransition transitionPoints=%@, startBehavior=%@>", v3, v4];

  return (NSString *)v5;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior
{
  return self->_startBehavior;
}

- (void)setStartBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startBehavior, 0);

  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

@end