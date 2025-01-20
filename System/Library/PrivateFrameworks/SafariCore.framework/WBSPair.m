@interface WBSPair
- (BOOL)isEqual:(id)a3;
- (WBSPair)init;
- (WBSPair)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
- (void)getFirst:(id *)a3 second:(id *)a4;
@end

@implementation WBSPair

- (WBSPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPair;
  v9 = [(WBSPair *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
    v11 = v10;
  }

  return v10;
}

- (id)first
{
  return self->_first;
}

- (id)second
{
  return self->_second;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (WBSPair)init
{
  return 0;
}

- (void)getFirst:(id *)a3 second:(id *)a4
{
  *a3 = self->_first;
  *a4 = self->_second;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPair *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WBSPair *)v5 first];
      if (WBSIsEqual(v6, self->_first))
      {
        id v7 = [(WBSPair *)v5 second];
        char v8 = WBSIsEqual(v7, self->_second);
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, first: %@, second: %@>", objc_opt_class(), self, self->_first, self->_second];
}

@end