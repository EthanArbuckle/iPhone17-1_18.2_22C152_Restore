@interface HAPCharacteristicValueTransitionStart
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueTransitionStart)init;
- (HAPCharacteristicValueTransitionStart)initWithTransitions:(id)a3;
- (NSMutableArray)transitions;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setTransitions:(id)a3;
@end

@implementation HAPCharacteristicValueTransitionStart

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionStart);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransitionStart *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueTransitionStart)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionStart;
  return [(HAPCharacteristicValueTransitionStart *)&v3 init];
}

- (HAPCharacteristicValueTransitionStart)initWithTransitions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPCharacteristicValueTransitionStart;
  id v5 = [(HAPCharacteristicValueTransitionStart *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableArray *)[v4 mutableCopy];
    transitions = v5->_transitions;
    v5->_transitions = v6;
  }
  return v5;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  objc_super v9 = +[NSMutableArray array];
  if (v8 >= 1)
  {
    id v10 = 0;
    unint64_t v11 = (unint64_t)v7 + v8;
    while (1)
    {
      char v24 = 0;
      v22[1] = 0;
      uint64_t v23 = 0;
      v22[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (a4)
        {
          sub_100044EEC(Next);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        goto LABEL_20;
      }
      if (!v23) {
        break;
      }
      if (v24 == 1)
      {
        id v21 = v10;
        v13 = sub_100025088(1, (unint64_t)v7, v11, v22, &v21);
        id v14 = v21;

        if (!v14)
        {
          id v20 = 0;
          v15 = +[HAPCharacteristicValueTransition parsedFromData:v13 error:&v20];
          id v14 = v20;
          if (!v14) {
            [v9 addObject:v15];
          }
        }
        id v10 = v14;
      }
      id v7 = (id)v22[0];
      if (v22[0] >= v11)
      {
        if (!v10) {
          goto LABEL_19;
        }
LABEL_13:
        if (a4)
        {
          id v16 = v10;
          id v10 = v16;
LABEL_17:
          BOOL v17 = 0;
          *a4 = v16;
          goto LABEL_21;
        }
LABEL_20:
        BOOL v17 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v18 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

    id v10 = (void *)v18;
    if (v18) {
      goto LABEL_13;
    }
  }
LABEL_19:
  [(HAPCharacteristicValueTransitionStart *)self setTransitions:v9];
  id v10 = 0;
  BOOL v17 = 1;
LABEL_21:

  return v17;
}

- (id)serializeWithError:(id *)a3
{
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
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
  long long v33 = 0u;
  TLV8BufferInit();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [(HAPCharacteristicValueTransitionStart *)self transitions];
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    char v9 = 1;
    v26 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v27 = 0;
      v13 = [v11 serializeWithError:&v27, v26];
      id v14 = v27;
      if (v14)
      {
        id v21 = v14;

        uint64_t v23 = v26;
        if (v26)
        {
          id v24 = v21;
          id v21 = v24;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      id v15 = v13;
      id v16 = (char *)[v15 bytes];
      BOOL v17 = (char *)[v15 length] + (void)v16;
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
          uint64_t v22 = v19;

          goto LABEL_19;
        }
        v16 += v18;
      }
      while (v16 < v17);

      char v9 = 0;
      if ((id)++v10 != v7) {
        goto LABEL_4;
      }
      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      char v9 = 0;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v22 = v12;
LABEL_19:

    uint64_t v23 = v26;
    if (v26)
    {
      sub_100044EEC(v22);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = 0;
LABEL_21:
      id v20 = 0;
      *uint64_t v23 = v24;
      goto LABEL_24;
    }
    id v21 = 0;
LABEL_23:
    id v20 = 0;
  }
  else
  {
LABEL_17:

    id v20 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v33);
    id v21 = 0;
  }
LABEL_24:
  TLV8BufferFree();

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HAPCharacteristicValueTransitionStart allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueTransitionStart *)self transitions];
  id v6 = [(HAPCharacteristicValueTransitionStart *)v4 initWithTransitions:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPCharacteristicValueTransitionStart *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HAPCharacteristicValueTransitionStart *)self transitions];
      id v7 = [(HAPCharacteristicValueTransitionStart *)v5 transitions];
      if (v6 == v7)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v8 = [(HAPCharacteristicValueTransitionStart *)self transitions];
        char v9 = [(HAPCharacteristicValueTransitionStart *)v5 transitions];
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  v2 = [(HAPCharacteristicValueTransitionStart *)self transitions];
  objc_super v3 = +[NSString stringWithFormat:@"<HAPCharacteristicValueTransitionStart transitions=%@>", v2];

  return (NSString *)v3;
}

- (NSMutableArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end