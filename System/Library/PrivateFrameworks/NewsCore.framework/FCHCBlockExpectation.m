@interface FCHCBlockExpectation
- (id)block;
- (void)setBlock:(id)a3;
- (void)validate;
@end

@implementation FCHCBlockExpectation

- (void)validate
{
  v3 = [(FCHCBlockExpectation *)self block];

  if (v3)
  {
    v4 = [(FCHCBlockExpectation *)self block];
    v4[2]();
  }
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