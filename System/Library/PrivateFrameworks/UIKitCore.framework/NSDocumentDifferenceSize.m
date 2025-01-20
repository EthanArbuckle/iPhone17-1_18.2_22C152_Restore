@interface NSDocumentDifferenceSize
- (id)description;
- (int64_t)changeCount;
- (int64_t)generationCount;
- (void)setChangeCount:(int64_t)a3;
- (void)setGenerationCount:(int64_t)a3;
@end

@implementation NSDocumentDifferenceSize

- (id)description
{
  return (id)[NSString stringWithFormat:@"(generationCount=%ld, changeCount=%ld)", self->_generationCount, self->_changeCount];
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_generationCount = a3;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(int64_t)a3
{
  self->_changeCount = a3;
}

@end