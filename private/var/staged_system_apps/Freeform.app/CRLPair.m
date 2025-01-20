@interface CRLPair
+ (CRLPair)pairWithFirst:(id)a3 second:(id)a4;
+ (CRLPair)pairWithPair:(id)a3;
+ (id)pair;
- (BOOL)isEqual:(id)a3;
- (CRLPair)init;
- (CRLPair)initWithCoder:(id)a3;
- (CRLPair)initWithFirst:(id)a3 second:(id)a4;
- (CRLPair)initWithPair:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)second;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)p_SetFirst:(id)a3;
- (void)p_SetSecond:(id)a3;
@end

@implementation CRLPair

+ (CRLPair)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFirst:v7 second:v6];

  return (CRLPair *)v8;
}

+ (CRLPair)pairWithPair:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPair:v4];

  return (CRLPair *)v5;
}

+ (id)pair
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (CRLPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLPair;
  id v8 = [(CRLPair *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CRLPair *)v8 p_SetFirst:v6];
    [(CRLPair *)v9 p_SetSecond:v7];
  }

  return v9;
}

- (CRLPair)initWithPair:(id)a3
{
  id v4 = a3;
  id v5 = [v4 first];
  id v6 = [v4 second];

  id v7 = [(CRLPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (CRLPair)init
{
  return [(CRLPair *)self initWithFirst:0 second:0];
}

- (CRLPair)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObject];
  id v6 = [v4 decodeObject];

  id v7 = [(CRLPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLPair *)self first];
  [v4 encodeObject:v5];

  id v6 = [(CRLPair *)self second];
  [v4 encodeObject:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLPair *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CRLPair *)self first];
      uint64_t v6 = [(CRLPair *)v4 first];
      if (v5 | v6 && ![(id)v5 isEqual:v6])
      {
        unsigned __int8 v9 = 0;
      }
      else
      {
        uint64_t v7 = [(CRLPair *)self second];
        uint64_t v8 = [(CRLPair *)v4 second];
        if (v7 | v8) {
          unsigned __int8 v9 = [(id)v7 isEqual:v8];
        }
        else {
          unsigned __int8 v9 = 1;
        }
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = sub_10024715C(v5, v4);

  if (!v6) {
    goto LABEL_33;
  }
  uint64_t v7 = [(CRLPair *)self first];
  uint64_t v8 = [v6 first];

  if (v7 == v8) {
    goto LABEL_7;
  }
  unsigned __int8 v9 = [(CRLPair *)self first];

  if (!v9) {
    goto LABEL_33;
  }
  v10 = [v6 first];

  if (!v10) {
    goto LABEL_12;
  }
  objc_super v11 = [(CRLPair *)self first];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4830);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107692C(v24, self);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4850);
    }
    v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v25);
    }
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPair compare:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPair.m"];
    v28 = [(CRLPair *)self first];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 97, 0, "unable to perform comparison on %{public}@", objc_opt_class());
LABEL_32:

    goto LABEL_33;
  }
  v13 = [(CRLPair *)self first];
  v14 = [v6 first];
  int64_t v15 = (int64_t)[v13 compare:v14];

  if (!v15)
  {
LABEL_7:
    v16 = [(CRLPair *)self second];
    v17 = [v6 second];

    if (v16 == v17)
    {
      int64_t v15 = 0;
      goto LABEL_34;
    }
    v18 = [(CRLPair *)self second];

    if (v18)
    {
      v19 = [v6 second];

      if (v19)
      {
        v20 = [(CRLPair *)self second];
        char v21 = objc_opt_respondsToSelector();

        if (v21)
        {
          v22 = [(CRLPair *)self second];
          v23 = [v6 second];
          int64_t v15 = (int64_t)[v22 compare:v23];

          goto LABEL_34;
        }
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4870);
        }
        v29 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101076854(v29, self);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D4890);
        }
        v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v30);
        }
        v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPair compare:]");
        v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPair.m"];
        v28 = [(CRLPair *)self second];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 114, 0, "unable to perform comparison on %{public}@", objc_opt_class());
        goto LABEL_32;
      }
LABEL_12:
      int64_t v15 = 1;
      goto LABEL_34;
    }
LABEL_33:
    int64_t v15 = -1;
  }
LABEL_34:

  return v15;
}

- (unint64_t)hash
{
  v3 = [(CRLPair *)self first];
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = [(CRLPair *)self second];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = [(CRLPair *)self first];
  unint64_t v4 = [v3 description];
  uint64_t v5 = [(CRLPair *)self second];
  unint64_t v6 = [v5 description];
  uint64_t v7 = +[NSString stringWithFormat:@"%@, %@", v4, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(CRLPair *)self first];
  id v6 = [v5 copyWithZone:a3];

  uint64_t v7 = [(CRLPair *)self second];
  id v8 = [v7 copyWithZone:a3];

  id v9 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(CRLPair *)self first];
  id v6 = [v5 copyWithZone:a3];

  uint64_t v7 = [(CRLPair *)self second];
  id v8 = [v7 copyWithZone:a3];

  id v9 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

- (void)p_SetFirst:(id)a3
{
  id v5 = a3;
  id mFirst = self->mFirst;
  p_id mFirst = &self->mFirst;
  if (mFirst != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_mFirst, a3);
    id v5 = v8;
  }
}

- (void)p_SetSecond:(id)a3
{
  id v5 = a3;
  id mSecond = self->mSecond;
  p_id mSecond = &self->mSecond;
  if (mSecond != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_mSecond, a3);
    id v5 = v8;
  }
}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mSecond, 0);

  objc_storeStrong(&self->mFirst, 0);
}

@end