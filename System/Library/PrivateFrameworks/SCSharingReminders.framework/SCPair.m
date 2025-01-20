@interface SCPair
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPair:(id)a3;
- (id)description;
- (id)first;
- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4;
- (id)second;
- (unint64_t)hash;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation SCPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SCPair alloc] initNonMemoizedWithFirst:v6 second:v5];

  return v7;
}

- (id)initNonMemoizedWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCPair;
  v9 = [(SCPair *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SCPair *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(SCPair *)self isEqualToPair:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPair:(id)a3
{
  id v4 = a3;
  id v5 = [(SCPair *)self first];
  BOOL v6 = [v4 first];
  if (v5 == v6)
  {
    id v8 = [(SCPair *)self second];
    v9 = [v4 second];
    BOOL v7 = v8 == v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p first:%@ second:%@>", objc_opt_class(), self, self->_first, self->_second];
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end