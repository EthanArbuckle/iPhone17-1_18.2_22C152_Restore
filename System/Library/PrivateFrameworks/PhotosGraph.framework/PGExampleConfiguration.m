@interface PGExampleConfiguration
- (BOOL)exampleBool;
- (double)exampleDouble;
- (int64_t)exampleInteger;
@end

@implementation PGExampleConfiguration

- (BOOL)exampleBool
{
  return self->_exampleBool;
}

- (double)exampleDouble
{
  return self->_exampleDouble;
}

- (int64_t)exampleInteger
{
  return self->_exampleInteger;
}

@end