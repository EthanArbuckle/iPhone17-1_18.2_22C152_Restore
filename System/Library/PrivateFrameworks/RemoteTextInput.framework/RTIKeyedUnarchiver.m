@interface RTIKeyedUnarchiver
- (unint64_t)rtiVersion;
- (void)setRtiVersion:(unint64_t)a3;
@end

@implementation RTIKeyedUnarchiver

- (unint64_t)rtiVersion
{
  return self->rtiVersion;
}

- (void)setRtiVersion:(unint64_t)a3
{
  self->rtiVersion = a3;
}

@end