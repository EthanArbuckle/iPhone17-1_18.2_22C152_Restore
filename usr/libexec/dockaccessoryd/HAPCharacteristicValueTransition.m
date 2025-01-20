@interface HAPCharacteristicValueTransition
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueLinearDerivedTransition)linearDerivedTransition;
- (HAPCharacteristicValueLinearTransition)linearTransition;
- (HAPCharacteristicValueTransition)init;
- (HAPCharacteristicValueTransition)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 endBehavior:(id)a5 linearTransition:(id)a6 linearDerivedTransition:(id)a7 valueUpdateTimeInterval:(id)a8 notifyValueChangeThreshold:(id)a9 notifyTimeIntervalThreshold:(id)a10;
- (HAPCharacteristicValueTransitionEndBehaviorWrapper)endBehavior;
- (HAPTLVUnsignedNumberValue)HAPInstanceID;
- (HAPTLVUnsignedNumberValue)notifyTimeIntervalThreshold;
- (HAPTLVUnsignedNumberValue)valueUpdateTimeInterval;
- (NSData)controllerContext;
- (NSData)notifyValueChangeThreshold;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setControllerContext:(id)a3;
- (void)setEndBehavior:(id)a3;
- (void)setHAPInstanceID:(id)a3;
- (void)setLinearDerivedTransition:(id)a3;
- (void)setLinearTransition:(id)a3;
- (void)setNotifyTimeIntervalThreshold:(id)a3;
- (void)setNotifyValueChangeThreshold:(id)a3;
- (void)setValueUpdateTimeInterval:(id)a3;
@end

@implementation HAPCharacteristicValueTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransition);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransition *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransition;
  return [(HAPCharacteristicValueTransition *)&v3 init];
}

- (HAPCharacteristicValueTransition)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 endBehavior:(id)a5 linearTransition:(id)a6 linearDerivedTransition:(id)a7 valueUpdateTimeInterval:(id)a8 notifyValueChangeThreshold:(id)a9 notifyTimeIntervalThreshold:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)HAPCharacteristicValueTransition;
  v18 = [(HAPCharacteristicValueTransition *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v19->_controllerContext, a4);
    objc_storeStrong((id *)&v19->_endBehavior, a5);
    objc_storeStrong((id *)&v19->_linearTransition, a6);
    objc_storeStrong((id *)&v19->_linearDerivedTransition, a7);
    objc_storeStrong((id *)&v19->_valueUpdateTimeInterval, a8);
    objc_storeStrong((id *)&v19->_notifyValueChangeThreshold, a9);
    objc_storeStrong((id *)&v19->_notifyTimeIntervalThreshold, a10);
  }

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v41 = v5;
  uint64_t v7 = (uint64_t)[v5 length];
  if (v7 < 1)
  {
    v9 = 0;
    id v26 = 0;
    id v10 = 0;
    v11 = 0;
    objc_super v28 = 0;
    v12 = 0;
    v29 = 0;
    v30 = 0;
LABEL_29:
    [(HAPCharacteristicValueTransition *)self setHAPInstanceID:v9];
    [(HAPCharacteristicValueTransition *)self setControllerContext:v26];
    [(HAPCharacteristicValueTransition *)self setEndBehavior:v10];
    [(HAPCharacteristicValueTransition *)self setLinearTransition:v30];
    [(HAPCharacteristicValueTransition *)self setLinearDerivedTransition:v29];
    [(HAPCharacteristicValueTransition *)self setValueUpdateTimeInterval:v12];
    [(HAPCharacteristicValueTransition *)self setNotifyValueChangeThreshold:v28];
    [(HAPCharacteristicValueTransition *)self setNotifyTimeIntervalThreshold:v11];
    id v8 = 0;
    v32 = v29;
    BOOL v27 = 1;
    v33 = v11;
    v34 = v41;
  }
  else
  {
    id v8 = 0;
    v9 = 0;
    v39 = 0;
    v40 = 0;
    id v10 = 0;
    v11 = 0;
    v37 = 0;
    v38 = 0;
    v12 = 0;
    unint64_t v13 = (unint64_t)v6 + v7;
    while (1)
    {
      char v56 = 0;
      v54[1] = 0;
      uint64_t v55 = 0;
      v54[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (a4)
        {
          sub_100044EEC(Next);
          BOOL v27 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v27 = 0;
        }
        v33 = v11;
        id v26 = v40;
        v34 = v41;
        goto LABEL_34;
      }
      if (!v55) {
        break;
      }
      switch(v56)
      {
        case 1:
          v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v53 = v8;
          uint64_t v16 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v53];
          id v17 = v53;

          v18 = v9;
          v9 = (void *)v16;
          break;
        case 2:
          id v52 = v8;
          v15 = sub_100025088(2, (unint64_t)v6, v13, v54, &v52);
          id v17 = v52;

          if (v17) {
            goto LABEL_19;
          }
          id v51 = 0;
          uint64_t v19 = +[NSData parsedFromData:v15 error:&v51];
          id v17 = v51;
          v18 = v40;
          v40 = (void *)v19;
          break;
        case 3:
          v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v50 = v8;
          uint64_t v20 = +[HAPCharacteristicValueTransitionEndBehaviorWrapper parsedFromData:v15 error:&v50];
          id v17 = v50;

          v18 = v10;
          id v10 = (void *)v20;
          break;
        case 4:
          id v49 = v8;
          v15 = sub_100025088(4, (unint64_t)v6, v13, v54, &v49);
          id v17 = v49;

          if (v17) {
            goto LABEL_19;
          }
          id v48 = 0;
          uint64_t v21 = +[HAPCharacteristicValueLinearTransition parsedFromData:v15 error:&v48];
          id v17 = v48;
          v18 = v39;
          v39 = (void *)v21;
          break;
        case 5:
          id v47 = v8;
          v15 = sub_100025088(5, (unint64_t)v6, v13, v54, &v47);
          id v17 = v47;

          if (v17) {
            goto LABEL_19;
          }
          id v46 = 0;
          uint64_t v22 = +[HAPCharacteristicValueLinearDerivedTransition parsedFromData:v15 error:&v46];
          id v17 = v46;
          v18 = v38;
          v38 = (void *)v22;
          break;
        case 6:
          v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v45 = v8;
          uint64_t v23 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v45];
          id v17 = v45;

          v18 = v12;
          v12 = (void *)v23;
          break;
        case 7:
          id v44 = v8;
          v15 = sub_100025088(7, (unint64_t)v6, v13, v54, &v44);
          id v17 = v44;

          if (v17) {
            goto LABEL_19;
          }
          id v43 = 0;
          uint64_t v24 = +[NSData parsedFromData:v15 error:&v43];
          id v17 = v43;
          v18 = v37;
          v37 = (void *)v24;
          break;
        case 8:
          v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
          id v42 = v8;
          uint64_t v25 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v42];
          id v17 = v42;

          v18 = v11;
          v11 = (void *)v25;
          break;
        default:
          goto LABEL_20;
      }

LABEL_19:
      id v8 = v17;
LABEL_20:
      id v6 = (id)v54[0];
      if (v54[0] >= v13)
      {
        if (v8) {
          goto LABEL_22;
        }
LABEL_28:
        v30 = v39;
        id v26 = v40;
        objc_super v28 = v37;
        v29 = v38;
        goto LABEL_29;
      }
    }
    uint64_t v31 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

    id v8 = (id)v31;
    if (!v31) {
      goto LABEL_28;
    }
LABEL_22:
    id v26 = v40;
    if (a4)
    {
      id v8 = v8;
      BOOL v27 = 0;
      *a4 = v8;
    }
    else
    {
      BOOL v27 = 0;
    }
    v33 = v11;
    v34 = v41;
LABEL_34:
    v32 = v38;
    v30 = v39;
    objc_super v28 = v37;
  }

  return v27;
}

- (id)serializeWithError:(id *)a3
{
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
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
  long long v51 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];

  if (v5)
  {
    id v6 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];
    id v50 = 0;
    id v7 = [v6 serializeWithError:&v50];
    id v8 = v50;

    if (v8)
    {
LABEL_3:
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_5:
      uint64_t v9 = v10;
LABEL_6:

      if (v8)
      {
        if (!a3) {
          goto LABEL_66;
        }
        goto LABEL_16;
      }
      if (v9)
      {
        if (a3)
        {
LABEL_11:
          sub_100044EEC(v9);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          id v8 = 0;
LABEL_17:
          v15 = 0;
          *a3 = v11;
          goto LABEL_67;
        }
        goto LABEL_65;
      }
LABEL_63:
      v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v51);
      id v8 = 0;
      goto LABEL_67;
    }
  }
  v12 = [(HAPCharacteristicValueTransition *)self controllerContext];

  if (v12)
  {
    unint64_t v13 = [(HAPCharacteristicValueTransition *)self controllerContext];
    id v49 = 0;
    v14 = [v13 serializeWithError:&v49];
    id v8 = v49;

    if (v8) {
      goto LABEL_15;
    }
    id v16 = v14;
    id v17 = (char *)[v16 bytes];
    v18 = (char *)[v16 length] + (void)v17;
    while (1)
    {
      uint64_t v19 = v18 - v17 >= 255 ? 255 : v18 - v17;
      uint64_t v20 = TLV8BufferAppend();
      if (v20) {
        break;
      }
      v17 += v19;
      if (v17 >= v18)
      {

        goto LABEL_25;
      }
    }
LABEL_64:
    uint64_t v9 = v20;

    if (a3) {
      goto LABEL_11;
    }
LABEL_65:
    id v8 = 0;
    goto LABEL_66;
  }
LABEL_25:
  uint64_t v21 = [(HAPCharacteristicValueTransition *)self endBehavior];

  if (v21)
  {
    uint64_t v22 = [(HAPCharacteristicValueTransition *)self endBehavior];
    id v48 = 0;
    id v7 = [v22 serializeWithError:&v48];
    id v8 = v48;

    if (v8) {
      goto LABEL_3;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v23 = [(HAPCharacteristicValueTransition *)self linearTransition];

  if (v23)
  {
    uint64_t v24 = [(HAPCharacteristicValueTransition *)self linearTransition];
    id v47 = 0;
    v14 = [v24 serializeWithError:&v47];
    id v8 = v47;

    if (!v8)
    {
      id v16 = v14;
      uint64_t v25 = (char *)[v16 bytes];
      id v26 = (char *)[v16 length] + (void)v25;
      while (1)
      {
        uint64_t v27 = v26 - v25 >= 255 ? 255 : v26 - v25;
        uint64_t v20 = TLV8BufferAppend();
        if (v20) {
          goto LABEL_64;
        }
        v25 += v27;
        if (v25 >= v26)
        {

          goto LABEL_38;
        }
      }
    }
  }
  else
  {
LABEL_38:
    objc_super v28 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];

    if (v28)
    {
      v29 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];
      id v46 = 0;
      v14 = [v29 serializeWithError:&v46];
      id v8 = v46;

      if (!v8)
      {
        id v16 = v14;
        v30 = (char *)[v16 bytes];
        uint64_t v31 = (char *)[v16 length] + (void)v30;
        while (1)
        {
          uint64_t v32 = v31 - v30 >= 255 ? 255 : v31 - v30;
          uint64_t v20 = TLV8BufferAppend();
          if (v20) {
            goto LABEL_64;
          }
          v30 += v32;
          if (v30 >= v31)
          {

            goto LABEL_47;
          }
        }
      }
    }
    else
    {
LABEL_47:
      v33 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];

      if (v33)
      {
        v34 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];
        id v45 = 0;
        id v7 = [v34 serializeWithError:&v45];
        id v8 = v45;

        if (v8) {
          goto LABEL_3;
        }
        id v7 = v7;
        [v7 bytes];
        [v7 length];
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_5;
        }
      }
      v35 = [(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold];

      if (!v35)
      {
LABEL_60:
        v40 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];

        if (!v40) {
          goto LABEL_63;
        }
        id v41 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];
        id v43 = 0;
        id v7 = [v41 serializeWithError:&v43];
        id v8 = v43;

        if (v8) {
          goto LABEL_3;
        }
        id v7 = v7;
        [v7 bytes];
        [v7 length];
        uint64_t v10 = TLV8BufferAppend();
        goto LABEL_5;
      }
      v36 = [(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold];
      id v44 = 0;
      v14 = [v36 serializeWithError:&v44];
      id v8 = v44;

      if (!v8)
      {
        id v16 = v14;
        v37 = (char *)[v16 bytes];
        v38 = (char *)[v16 length] + (void)v37;
        while (1)
        {
          uint64_t v39 = v38 - v37 >= 255 ? 255 : v38 - v37;
          uint64_t v20 = TLV8BufferAppend();
          if (v20) {
            goto LABEL_64;
          }
          v37 += v39;
          if (v37 >= v38)
          {

            goto LABEL_60;
          }
        }
      }
    }
  }
LABEL_15:

  if (a3)
  {
LABEL_16:
    id v11 = v8;
    id v8 = v11;
    goto LABEL_17;
  }
LABEL_66:
  v15 = 0;
LABEL_67:
  TLV8BufferFree();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueTransition allocWithZone:a3];
  id v5 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];
  id v6 = [(HAPCharacteristicValueTransition *)self controllerContext];
  id v7 = [(HAPCharacteristicValueTransition *)self endBehavior];
  id v8 = [(HAPCharacteristicValueTransition *)self linearTransition];
  uint64_t v9 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];
  uint64_t v10 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];
  id v11 = [(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold];
  v12 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];
  unint64_t v13 = [(HAPCharacteristicValueTransition *)v4 initWithHAPInstanceID:v5 controllerContext:v6 endBehavior:v7 linearTransition:v8 linearDerivedTransition:v9 valueUpdateTimeInterval:v10 notifyValueChangeThreshold:v11 notifyTimeIntervalThreshold:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPCharacteristicValueTransition *)a3;
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
      id v7 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];
      id v8 = [(HAPCharacteristicValueTransition *)v6 HAPInstanceID];
      if (v7 != v8)
      {
        uint64_t v9 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];
        objc_super v3 = [(HAPCharacteristicValueTransition *)v6 HAPInstanceID];
        long long v66 = v9;
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_43;
        }
      }
      id v11 = [(HAPCharacteristicValueTransition *)self controllerContext];
      v12 = [(HAPCharacteristicValueTransition *)v6 controllerContext];
      if (v11 != v12)
      {
        unint64_t v13 = [(HAPCharacteristicValueTransition *)self controllerContext];
        long long v65 = [(HAPCharacteristicValueTransition *)v6 controllerContext];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
LABEL_41:

LABEL_42:
          if (v7 == v8)
          {
LABEL_44:

            goto LABEL_45;
          }
LABEL_43:

          goto LABEL_44;
        }
        long long v63 = v13;
      }
      uint64_t v14 = [(HAPCharacteristicValueTransition *)self endBehavior];
      uint64_t v15 = [(HAPCharacteristicValueTransition *)v6 endBehavior];
      long long v64 = (void *)v14;
      BOOL v16 = v14 == v15;
      id v17 = (void *)v15;
      if (!v16)
      {
        v18 = [(HAPCharacteristicValueTransition *)self endBehavior];
        [(HAPCharacteristicValueTransition *)v6 endBehavior];
        long long v60 = v61 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          uint64_t v19 = v17;
          uint64_t v20 = v64;
LABEL_39:

LABEL_40:
          unint64_t v13 = v63;
          if (v11 == v12) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
      }
      uint64_t v21 = [(HAPCharacteristicValueTransition *)self linearTransition];
      [(HAPCharacteristicValueTransition *)v6 linearTransition];
      long long v59 = (void *)v21;
      uint64_t v58 = v62 = v3;
      if (v21 != v58)
      {
        uint64_t v22 = [(HAPCharacteristicValueTransition *)self linearTransition];
        long long v56 = [(HAPCharacteristicValueTransition *)v6 linearTransition];
        long long v57 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          uint64_t v19 = v17;
          unsigned __int8 v10 = 0;
          uint64_t v23 = (void *)v58;
          uint64_t v24 = v59;
LABEL_37:

LABEL_38:
          uint64_t v20 = v64;
          objc_super v3 = v62;
          if (v64 == v19) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
      }
      uint64_t v25 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];
      uint64_t v54 = [(HAPCharacteristicValueTransition *)v6 linearDerivedTransition];
      long long v55 = (void *)v25;
      if (v25 != v54)
      {
        id v26 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];
        id v50 = [(HAPCharacteristicValueTransition *)v6 linearDerivedTransition];
        long long v51 = v26;
        if (!objc_msgSend(v26, "isEqual:"))
        {
          uint64_t v19 = v17;
          unsigned __int8 v10 = 0;
          objc_super v28 = (void *)v54;
          uint64_t v27 = v55;
LABEL_35:

LABEL_36:
          uint64_t v23 = (void *)v58;
          uint64_t v24 = v59;
          if (v59 == (void *)v58) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
      }
      uint64_t v29 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];
      uint64_t v52 = [(HAPCharacteristicValueTransition *)v6 valueUpdateTimeInterval];
      long long v53 = (void *)v29;
      if (v29 != v52)
      {
        v30 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];
        id v47 = [(HAPCharacteristicValueTransition *)v6 valueUpdateTimeInterval];
        id v48 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
          uint64_t v19 = v17;
          unsigned __int8 v10 = 0;
          uint64_t v31 = (void *)v52;
LABEL_33:

LABEL_34:
          objc_super v28 = (void *)v54;
          uint64_t v27 = v55;
          if (v55 == (void *)v54) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
      uint64_t v32 = [(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold];
      uint64_t v45 = [(HAPCharacteristicValueTransition *)v6 notifyValueChangeThreshold];
      id v46 = (void *)v32;
      id v49 = v11;
      if (v32 == v45
        || ([(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold],
            v33 = objc_claimAutoreleasedReturnValue(),
            [(HAPCharacteristicValueTransition *)v6 notifyValueChangeThreshold],
            id v43 = objc_claimAutoreleasedReturnValue(),
            id v44 = v33,
            objc_msgSend(v33, "isEqual:")))
      {
        v34 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];
        uint64_t v35 = [(HAPCharacteristicValueTransition *)v6 notifyTimeIntervalThreshold];
        if (v34 == (void *)v35)
        {

          unsigned __int8 v10 = 1;
        }
        else
        {
          v36 = (void *)v35;
          v37 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];
          v38 = [(HAPCharacteristicValueTransition *)v6 notifyTimeIntervalThreshold];
          unsigned __int8 v10 = [v37 isEqual:v38];
        }
        uint64_t v39 = (void *)v45;
        v40 = v46;
        uint64_t v19 = v42;
        if (v46 == (void *)v45)
        {
LABEL_32:

          uint64_t v31 = (void *)v52;
          id v11 = v49;
          if (v53 == (void *)v52) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v19 = v17;
        unsigned __int8 v10 = 0;
        uint64_t v39 = (void *)v45;
        v40 = v46;
      }

      goto LABEL_32;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_45:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPCharacteristicValueTransition *)self HAPInstanceID];
  v4 = [(HAPCharacteristicValueTransition *)self controllerContext];
  id v5 = [(HAPCharacteristicValueTransition *)self endBehavior];
  id v6 = [(HAPCharacteristicValueTransition *)self linearTransition];
  id v7 = [(HAPCharacteristicValueTransition *)self linearDerivedTransition];
  id v8 = [(HAPCharacteristicValueTransition *)self valueUpdateTimeInterval];
  uint64_t v9 = [(HAPCharacteristicValueTransition *)self notifyValueChangeThreshold];
  unsigned __int8 v10 = [(HAPCharacteristicValueTransition *)self notifyTimeIntervalThreshold];
  id v11 = +[NSString stringWithFormat:@"<HAPCharacteristicValueTransition HAPInstanceID=%@, controllerContext=%@, endBehavior=%@, linearTransition=%@, linearDerivedTransition=%@, valueUpdateTimeInterval=%@, notifyValueChangeThreshold=%@, notifyTimeIntervalThreshold=%@>", v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
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

- (HAPCharacteristicValueTransitionEndBehaviorWrapper)endBehavior
{
  return self->_endBehavior;
}

- (void)setEndBehavior:(id)a3
{
}

- (HAPCharacteristicValueLinearTransition)linearTransition
{
  return self->_linearTransition;
}

- (void)setLinearTransition:(id)a3
{
}

- (HAPCharacteristicValueLinearDerivedTransition)linearDerivedTransition
{
  return self->_linearDerivedTransition;
}

- (void)setLinearDerivedTransition:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)valueUpdateTimeInterval
{
  return self->_valueUpdateTimeInterval;
}

- (void)setValueUpdateTimeInterval:(id)a3
{
}

- (NSData)notifyValueChangeThreshold
{
  return self->_notifyValueChangeThreshold;
}

- (void)setNotifyValueChangeThreshold:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)notifyTimeIntervalThreshold
{
  return self->_notifyTimeIntervalThreshold;
}

- (void)setNotifyTimeIntervalThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_notifyValueChangeThreshold, 0);
  objc_storeStrong((id *)&self->_valueUpdateTimeInterval, 0);
  objc_storeStrong((id *)&self->_linearDerivedTransition, 0);
  objc_storeStrong((id *)&self->_linearTransition, 0);
  objc_storeStrong((id *)&self->_endBehavior, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);

  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

@end