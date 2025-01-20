@interface NAIdentityCharacteristic
- (BOOL)isEqual:(id)a3;
- (NAIdentityCharacteristic)init;
- (NSString)description;
- (id)comparisonBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hashBlock;
- (id)retrievalBlock;
- (int64_t)role;
- (unint64_t)hash;
- (void)setComparisonBlock:(id)a3;
- (void)setHashBlock:(id)a3;
- (void)setRetrievalBlock:(id)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation NAIdentityCharacteristic

- (int64_t)role
{
  return self->_role;
}

- (id)retrievalBlock
{
  return self->_retrievalBlock;
}

- (id)hashBlock
{
  return self->_hashBlock;
}

- (id)comparisonBlock
{
  return self->_comparisonBlock;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void)setRetrievalBlock:(id)a3
{
}

- (NAIdentityCharacteristic)init
{
  v5.receiver = self;
  v5.super_class = (Class)NAIdentityCharacteristic;
  v2 = [(NAIdentityCharacteristic *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NAIdentityCharacteristic *)v2 setComparisonBlock:&__block_literal_global_5_0];
    [(NAIdentityCharacteristic *)v3 setHashBlock:&__block_literal_global_14];
    [(NAIdentityCharacteristic *)v3 setRole:3];
  }
  return v3;
}

- (void)setHashBlock:(id)a3
{
}

- (void)setComparisonBlock:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = [(NAIdentityCharacteristic *)self retrievalBlock];
  [v4 setRetrievalBlock:v5];

  v6 = [(NAIdentityCharacteristic *)self comparisonBlock];
  [v4 setComparisonBlock:v6];

  v7 = [(NAIdentityCharacteristic *)self hashBlock];
  [v4 setHashBlock:v7];

  objc_msgSend(v4, "setRole:", -[NAIdentityCharacteristic role](self, "role"));
  return v4;
}

- (unint64_t)hash
{
  v2 = [(NAIdentityCharacteristic *)self retrievalBlock];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NAIdentityCharacteristic *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = [(NAIdentityCharacteristic *)v4 retrievalBlock];
      v6 = [(NAIdentityCharacteristic *)self retrievalBlock];
      if (v5 == v6)
      {
        v8 = [(NAIdentityCharacteristic *)v4 hashBlock];
        v9 = [(NAIdentityCharacteristic *)self hashBlock];
        if (v8 == v9)
        {
          v10 = [(NAIdentityCharacteristic *)v4 comparisonBlock];
          v11 = [(NAIdentityCharacteristic *)self comparisonBlock];
          BOOL v7 = v10 == v11;
        }
        else
        {
          BOOL v7 = 0;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  unint64_t v3 = +[NADescriptionBuilder builderWithObject:self];
  v4 = [(NAIdentityCharacteristic *)self retrievalBlock];
  objc_super v5 = (void *)MEMORY[0x1BA99CF00]();
  id v6 = (id)[v3 appendObject:v5 withName:@"retrievalBlock"];

  BOOL v7 = [(NAIdentityCharacteristic *)self comparisonBlock];
  v8 = (void *)MEMORY[0x1BA99CF00]();
  id v9 = (id)[v3 appendObject:v8 withName:@"comparisonBlock"];

  v10 = [(NAIdentityCharacteristic *)self hashBlock];
  v11 = (void *)MEMORY[0x1BA99CF00]();
  id v12 = (id)[v3 appendObject:v11 withName:@"hashBlock"];

  v13 = [v3 build];

  return (NSString *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashBlock, 0);
  objc_storeStrong(&self->_comparisonBlock, 0);
  objc_storeStrong(&self->_retrievalBlock, 0);
}

@end