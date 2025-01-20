@interface TSUPair
+ (id)pair;
+ (id)pairWithFirst:(id)a3 second:(id)a4;
+ (id)pairWithPair:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TSUPair)init;
- (TSUPair)initWithCoder:(id)a3;
- (TSUPair)initWithFirst:(id)a3 second:(id)a4;
- (TSUPair)initWithPair:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)second;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)p_SetFirst:(id)a3;
- (void)p_SetSecond:(id)a3;
@end

@implementation TSUPair

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

- (TSUPair)initWithFirst:(id)a3 second:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSUPair;
  v6 = [(TSUPair *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(TSUPair *)v6 p_SetFirst:a3];
    [(TSUPair *)v7 p_SetSecond:a4];
  }
  return v7;
}

- (TSUPair)initWithPair:(id)a3
{
  uint64_t v5 = [a3 first];
  uint64_t v6 = [a3 second];
  return [(TSUPair *)self initWithFirst:v5 second:v6];
}

- (TSUPair)init
{
  return [(TSUPair *)self initWithFirst:0 second:0];
}

- (void)dealloc
{
  [(TSUPair *)self p_SetFirst:0];
  [(TSUPair *)self p_SetSecond:0];
  v3.receiver = self;
  v3.super_class = (Class)TSUPair;
  [(TSUPair *)&v3 dealloc];
}

- (TSUPair)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObject];
  uint64_t v6 = [a3 decodeObject];
  return [(TSUPair *)self initWithFirst:v5 second:v6];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", -[TSUPair first](self, "first"));
  id v5 = [(TSUPair *)self second];
  [a3 encodeObject:v5];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = objc_msgSend(-[TSUPair first](self, "first"), "isEqual:", objc_msgSend(a3, "first"));
      if (v5)
      {
        id v6 = [(TSUPair *)self second];
        uint64_t v7 = [a3 second];
        LOBYTE(v5) = [v6 isEqual:v7];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[TSUPair first](self, "first"), "hash");
  return objc_msgSend(-[TSUPair second](self, "second"), "hash") ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@, %@", objc_msgSend(-[TSUPair first](self, "first"), "description"), objc_msgSend(-[TSUPair second](self, "second"), "description")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = objc_msgSend(-[TSUPair first](self, "first"), "copyWithZone:", a3);
  id v6 = objc_msgSend(-[TSUPair second](self, "second"), "copyWithZone:", a3);
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v5 = objc_msgSend(-[TSUPair first](self, "first"), "copyWithZone:", a3);
  id v6 = objc_msgSend(-[TSUPair second](self, "second"), "copyWithZone:", a3);
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
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

@end