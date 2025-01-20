@interface TIKeyedArchiver
- (unint64_t)tiVersion;
- (void)setTiVersion:(unint64_t)a3;
@end

@implementation TIKeyedArchiver

- (void)setTiVersion:(unint64_t)a3
{
  self->tiVersion = a3;
}

- (unint64_t)tiVersion
{
  return self->tiVersion;
}

@end