@interface IMBlockConfigurationPredicate
+ (id)predicateWithBlock:(id)a3;
- (BOOL)evaluateWithContext:(id)a3;
- (id)block;
- (void)setBlock:(id)a3;
@end

@implementation IMBlockConfigurationPredicate

+ (id)predicateWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IMBlockConfigurationPredicate);
  [(IMBlockConfigurationPredicate *)v4 setBlock:v3];

  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(IMBlockConfigurationPredicate *)self block];

  if (v5)
  {
    v6 = [(IMBlockConfigurationPredicate *)self block];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end