@interface HAPCharacteristicValueLinearDerivedTransition
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueLinearDerivedTransition)init;
- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5;
- (HAPCharacteristicValueRange)sourceValueRange;
- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID;
- (NSMutableArray)transitionPoints;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setSourceHAPInstanceID:(id)a3;
- (void)setSourceValueRange:(id)a3;
- (void)setTransitionPoints:(id)a3;
@end

@implementation HAPCharacteristicValueLinearDerivedTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearDerivedTransition);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueLinearDerivedTransition *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueLinearDerivedTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  return [(HAPCharacteristicValueLinearDerivedTransition *)&v3 init];
}

- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  v11 = [(HAPCharacteristicValueLinearDerivedTransition *)&v15 init];
  if (v11)
  {
    v12 = (NSMutableArray *)[v8 mutableCopy];
    transitionPoints = v11->_transitionPoints;
    v11->_transitionPoints = v12;

    objc_storeStrong((id *)&v11->_sourceHAPInstanceID, a4);
    objc_storeStrong((id *)&v11->_sourceValueRange, a5);
  }

  return v11;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  uint64_t v7 = (uint64_t)[v5 length];
  id v8 = +[NSMutableArray array];
  if (v7 < 1)
  {
    id v10 = 0;
    v11 = 0;
LABEL_20:
    -[HAPCharacteristicValueLinearDerivedTransition setTransitionPoints:](self, "setTransitionPoints:", v8, a4);
    [(HAPCharacteristicValueLinearDerivedTransition *)self setSourceHAPInstanceID:v11];
    [(HAPCharacteristicValueLinearDerivedTransition *)self setSourceValueRange:v10];
    id v9 = 0;
    BOOL v19 = 1;
    goto LABEL_28;
  }
  id v9 = 0;
  id v10 = 0;
  v11 = 0;
  unint64_t v12 = (unint64_t)v6 + v7;
  while (1)
  {
    char v32 = 0;
    v30[1] = 0;
    uint64_t v31 = 0;
    v30[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v31)
    {
      uint64_t v22 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      id v9 = (void *)v22;
      if (!v22) {
        goto LABEL_20;
      }
LABEL_24:
      v20 = a4;
      if (a4)
      {
        id v21 = v9;
        id v9 = v21;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v32)
    {
      case 3:
        id v26 = v9;
        v14 = sub_100025088(3, (unint64_t)v6, v12, v30, &v26);
        id v15 = v26;

        if (!v15)
        {
          id v25 = 0;
          uint64_t v17 = +[HAPCharacteristicValueRange parsedFromData:v14 error:&v25];
          id v15 = v25;
          v16 = v10;
          id v10 = (void *)v17;
          goto LABEL_14;
        }
LABEL_15:

        id v9 = v15;
        break;
      case 2:
        v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v27 = v9;
        uint64_t v18 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v27];
        id v15 = v27;

        v16 = v11;
        v11 = (void *)v18;
        goto LABEL_14;
      case 1:
        id v29 = v9;
        v14 = sub_100025088(1, (unint64_t)v6, v12, v30, &v29);
        id v15 = v29;

        if (v15) {
          goto LABEL_15;
        }
        id v28 = 0;
        v16 = +[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:v14 error:&v28];
        id v15 = v28;
        if (!v15) {
          [v8 addObject:v16];
        }
LABEL_14:

        goto LABEL_15;
    }
    id v6 = (id)v30[0];
    if (v30[0] >= v12)
    {
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }
  }
  v20 = a4;
  if (a4)
  {
    sub_100044EEC(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_28;
  }
LABEL_27:
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  TLV8BufferInit();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v38 = self;
  id v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    char v9 = 1;
    v37 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v41 = 0;
      v13 = [v11 serializeWithError:&v41];
      id v14 = v41;
      if (v14)
      {
        id v22 = v14;

        uint64_t v24 = 0;
        goto LABEL_44;
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
          uint64_t v24 = v19;

          a3 = v37;
          goto LABEL_22;
        }
        v16 += v18;
      }
      while (v16 < v17);

      char v9 = 0;
      if ((id)++v10 != v7) {
        goto LABEL_4;
      }
      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
      char v9 = 0;
      a3 = v37;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v24 = v12;
    id v22 = 0;
LABEL_44:
    a3 = v37;
    goto LABEL_45;
  }
LABEL_17:

  v20 = [(HAPCharacteristicValueLinearDerivedTransition *)v38 sourceHAPInstanceID];

  if (!v20)
  {
LABEL_27:
    id v26 = [(HAPCharacteristicValueLinearDerivedTransition *)v38 sourceValueRange];

    if (!v26) {
      goto LABEL_51;
    }
    id v27 = [(HAPCharacteristicValueLinearDerivedTransition *)v38 sourceValueRange];
    id v39 = 0;
    id v5 = [v27 serializeWithError:&v39];
    id v22 = v39;

    if (!v22)
    {
      id v28 = a3;
      id v5 = v5;
      id v29 = (char *)[v5 bytes];
      v30 = (char *)[v5 length] + (void)v29;
      do
      {
        if (v30 - v29 >= 255) {
          uint64_t v31 = 255;
        }
        else {
          uint64_t v31 = v30 - v29;
        }
        uint64_t v32 = TLV8BufferAppend();
        if (v32) {
          uint64_t v33 = 0;
        }
        else {
          uint64_t v33 = v31;
        }
        v29 += v33;
        if (v32) {
          BOOL v34 = 1;
        }
        else {
          BOOL v34 = v29 >= v30;
        }
      }
      while (!v34);
      uint64_t v24 = v32;
      a3 = v28;
      goto LABEL_45;
    }
    goto LABEL_29;
  }
  id v21 = [(HAPCharacteristicValueLinearDerivedTransition *)v38 sourceHAPInstanceID];
  id v40 = 0;
  id v5 = [v21 serializeWithError:&v40];
  id v22 = v40;

  if (v22)
  {
LABEL_29:
    uint64_t v24 = 0;
    goto LABEL_45;
  }
  id v5 = v5;
  [v5 bytes];
  [v5 length];
  uint64_t v23 = TLV8BufferAppend();
  if (!v23)
  {

    goto LABEL_27;
  }
  uint64_t v24 = v23;
LABEL_45:

  if (v22)
  {
    if (a3)
    {
      id v25 = v22;
      id v22 = v25;
      goto LABEL_48;
    }
LABEL_49:
    v35 = 0;
    goto LABEL_52;
  }
  if (v24)
  {
LABEL_22:
    if (a3)
    {
      sub_100044EEC(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = 0;
LABEL_48:
      v35 = 0;
      *a3 = v25;
      goto LABEL_52;
    }
    id v22 = 0;
    goto LABEL_49;
  }
LABEL_51:
  v35 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v47);
  id v22 = 0;
LABEL_52:
  TLV8BufferFree();

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueLinearDerivedTransition allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  id v6 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
  id v7 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
  uint64_t v8 = [(HAPCharacteristicValueLinearDerivedTransition *)v4 initWithTransitionPoints:v5 sourceHAPInstanceID:v6 sourceValueRange:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPCharacteristicValueLinearDerivedTransition *)a3;
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
      uint64_t v8 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
      char v9 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 transitionPoints];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
        v4 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 transitionPoints];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
      uint64_t v12 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceHAPInstanceID];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        v13 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
        id v26 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceHAPInstanceID];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        uint64_t v24 = v13;
        id v25 = v11;
      }
      id v14 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
      uint64_t v15 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceValueRange];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
        uint64_t v17 = v23 = v3;
        [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceValueRange];
        id v22 = v4;
        uint64_t v18 = v9;
        v20 = uint64_t v19 = v8;
        unsigned __int8 v10 = [v17 isEqual:v20];

        uint64_t v8 = v19;
        char v9 = v18;
        v4 = v22;

        objc_super v3 = v23;
      }
      v13 = v24;
      v11 = v25;
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
  objc_super v3 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  v4 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
  id v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
  id v6 = +[NSString stringWithFormat:@"<HAPCharacteristicValueLinearDerivedTransition transitionPoints=%@, sourceHAPInstanceID=%@, sourceValueRange=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID
{
  return self->_sourceHAPInstanceID;
}

- (void)setSourceHAPInstanceID:(id)a3
{
}

- (HAPCharacteristicValueRange)sourceValueRange
{
  return self->_sourceValueRange;
}

- (void)setSourceValueRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceValueRange, 0);
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, 0);

  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

@end