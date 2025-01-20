@interface PDShareURLDecorationConfiguration
- (unint64_t)vertical;
- (void)setVertical:(unint64_t)a3;
@end

@implementation PDShareURLDecorationConfiguration

- (unint64_t)vertical
{
  return self->_vertical;
}

- (void)setVertical:(unint64_t)a3
{
  self->_vertical = a3;
}

@end