@interface OITSUPair
+ (id)pair;
+ (id)pairWithFirst:(id)a3 second:(id)a4;
+ (id)pairWithPair:(id)a3;
- (BOOL)isEqual:(id)a3;
- (OITSUPair)init;
- (OITSUPair)initWithCoder:(id)a3;
- (OITSUPair)initWithFirst:(id)a3 second:(id)a4;
- (OITSUPair)initWithPair:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)second;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)p_SetFirst:(id)a3;
- (void)p_SetSecond:(id)a3;
@end

@implementation OITSUPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithFirst:a3 second:a4];
  return v4;
}

+ (id)pairWithPair:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPair:a3];
  return v3;
}

+ (id)pair
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (OITSUPair)initWithFirst:(id)a3 second:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)OITSUPair;
  v6 = [(OITSUPair *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(OITSUPair *)v6 p_SetFirst:a3];
    [(OITSUPair *)v7 p_SetSecond:a4];
  }
  return v7;
}

- (OITSUPair)initWithPair:(id)a3
{
  uint64_t v5 = [a3 first];
  uint64_t v6 = [a3 second];
  return [(OITSUPair *)self initWithFirst:v5 second:v6];
}

- (OITSUPair)init
{
  return [(OITSUPair *)self initWithFirst:0 second:0];
}

- (void)dealloc
{
  [(OITSUPair *)self p_SetFirst:0];
  [(OITSUPair *)self p_SetSecond:0];
  v3.receiver = self;
  v3.super_class = (Class)OITSUPair;
  [(OITSUPair *)&v3 dealloc];
}

- (OITSUPair)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObject];
  uint64_t v6 = [a3 decodeObject];
  return [(OITSUPair *)self initWithFirst:v5 second:v6];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", -[OITSUPair first](self, "first"));
  id v5 = [(OITSUPair *)self second];
  [a3 encodeObject:v5];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  unint64_t v5 = [(OITSUPair *)self first];
  uint64_t v6 = [a3 first];
  if (!(v5 | v6) || (int v7 = [(id)v5 isEqual:v6]) != 0)
  {
    unint64_t v8 = [(OITSUPair *)self second];
    uint64_t v9 = [a3 second];
    if (!(v8 | v9))
    {
LABEL_6:
      LOBYTE(v7) = 1;
      return v7;
    }
    LOBYTE(v7) = [(id)v8 isEqual:v9];
  }
  return v7;
}

- (int64_t)compare:(id)a3
{
  unint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = TSUCheckedDynamicCast(v5, (uint64_t)a3);
  if (!v6) {
    return -1;
  }
  int v7 = (void *)v6;
  id v8 = [(OITSUPair *)self first];
  if (v8 != (id)[v7 first])
  {
    if (![(OITSUPair *)self first]) {
      return -1;
    }
    if (![v7 first]) {
      return 1;
    }
    [(OITSUPair *)self first];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v13 = [NSString stringWithUTF8String:"-[OITSUPair compare:]"];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPair.m"];
      [(OITSUPair *)self first];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 109, 0, "unable to perform comparison on %{public}@", objc_opt_class());
LABEL_18:
      +[OITSUAssertionHandler logBacktraceThrottled];
      return -1;
    }
    int64_t result = objc_msgSend(-[OITSUPair first](self, "first"), "compare:", objc_msgSend(v7, "first"));
    if (result) {
      return result;
    }
  }
  id v10 = [(OITSUPair *)self second];
  if (v10 == (id)[v7 second]) {
    return 0;
  }
  if (![(OITSUPair *)self second]) {
    return -1;
  }
  if (![v7 second]) {
    return 1;
  }
  [(OITSUPair *)self second];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v15 = [NSString stringWithUTF8String:"-[OITSUPair compare:]"];
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPair.m"];
    [(OITSUPair *)self second];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 126, 0, "unable to perform comparison on %{public}@", objc_opt_class());
    goto LABEL_18;
  }
  id v11 = [(OITSUPair *)self second];
  uint64_t v12 = [v7 second];
  return [v11 compare:v12];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[OITSUPair first](self, "first"), "hash");
  return objc_msgSend(-[OITSUPair second](self, "second"), "hash") ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@, %@", objc_msgSend(-[OITSUPair first](self, "first"), "description"), objc_msgSend(-[OITSUPair second](self, "second"), "description")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(-[OITSUPair first](self, "first"), "copyWithZone:", a3);
  uint64_t v6 = objc_msgSend(-[OITSUPair second](self, "second"), "copyWithZone:", a3);
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(-[OITSUPair first](self, "first"), "copyWithZone:", a3);
  uint64_t v6 = objc_msgSend(-[OITSUPair second](self, "second"), "copyWithZone:", a3);
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (void)p_SetFirst:(id)a3
{
  id mFirst = self->mFirst;
  if (mFirst != a3)
  {

    self->id mFirst = a3;
  }
}

- (void)p_SetSecond:(id)a3
{
  id mSecond = self->mSecond;
  if (mSecond != a3)
  {

    self->id mSecond = a3;
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

@end