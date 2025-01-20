@interface NAUniqueArrayDiffOptions
- (BOOL)allowMoves;
- (NAUniqueArrayDiffOptions)init;
- (id)changeComparator;
- (id)equalComparator;
- (id)hashGenerator;
- (void)setAllowMoves:(BOOL)a3;
- (void)setChangeComparator:(id)a3;
- (void)setEqualComparator:(id)a3;
- (void)setHashGenerator:(id)a3;
@end

@implementation NAUniqueArrayDiffOptions

- (NAUniqueArrayDiffOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)NAUniqueArrayDiffOptions;
  result = [(NAUniqueArrayDiffOptions *)&v3 init];
  if (result) {
    result->_allowMoves = 1;
  }
  return result;
}

- (id)equalComparator
{
  return self->_equalComparator;
}

- (void)setEqualComparator:(id)a3
{
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (void)setHashGenerator:(id)a3
{
}

- (id)changeComparator
{
  return self->_changeComparator;
}

- (void)setChangeComparator:(id)a3
{
}

- (BOOL)allowMoves
{
  return self->_allowMoves;
}

- (void)setAllowMoves:(BOOL)a3
{
  self->_allowMoves = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeComparator, 0);
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_equalComparator, 0);
}

@end