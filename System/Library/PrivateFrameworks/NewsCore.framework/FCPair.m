@interface FCPair
+ (id)pair;
+ (id)pairWithFirst:(id)a3 second:(id)a4;
+ (id)pairWithPair:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FCPair)init;
- (FCPair)initWithCoder:(id)a3;
- (FCPair)initWithFirst:(id)a3 second:(id)a4;
- (FCPair)initWithPair:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)second;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)p_SetFirst:(id)a3;
- (void)p_SetSecond:(id)a3;
@end

@implementation FCPair

- (unint64_t)hash
{
  v3 = [(FCPair *)self first];
  uint64_t v4 = [v3 hash];
  v5 = [(FCPair *)self second];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FCPair *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(FCPair *)self first];
      unint64_t v6 = [(FCPair *)v4 first];
      if ([v5 isEqual:v6])
      {
        v7 = [(FCPair *)self second];
        v8 = [(FCPair *)v4 second];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
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

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithFirst:v7 second:v6];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(FCPair *)self first];
  id v6 = (void *)[v5 copyWithZone:a3];

  id v7 = [(FCPair *)self second];
  v8 = (void *)[v7 copyWithZone:a3];

  char v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

- (FCPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCPair;
  v8 = [(FCPair *)&v11 init];
  char v9 = v8;
  if (v8)
  {
    [(FCPair *)v8 p_SetFirst:v6];
    [(FCPair *)v9 p_SetSecond:v7];
  }

  return v9;
}

- (void)p_SetSecond:(id)a3
{
}

- (void)p_SetFirst:(id)a3
{
}

+ (id)pairWithPair:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPair:v4];

  return v5;
}

+ (id)pair
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (FCPair)initWithPair:(id)a3
{
  id v4 = a3;
  v5 = [v4 first];
  id v6 = [v4 second];

  id v7 = [(FCPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (FCPair)init
{
  return [(FCPair *)self initWithFirst:0 second:0];
}

- (FCPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObject];
  id v6 = [v4 decodeObject];

  id v7 = [(FCPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FCPair *)self first];
  [v4 encodeObject:v5];

  id v6 = [(FCPair *)self second];
  [v4 encodeObject:v6];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FCPair *)self first];
  v5 = [v4 description];
  id v6 = [(FCPair *)self second];
  id v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"%@, %@", v5, v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [(FCPair *)self first];
  id v6 = (void *)[v5 copyWithZone:a3];

  id v7 = [(FCPair *)self second];
  v8 = (void *)[v7 copyWithZone:a3];

  char v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

@end