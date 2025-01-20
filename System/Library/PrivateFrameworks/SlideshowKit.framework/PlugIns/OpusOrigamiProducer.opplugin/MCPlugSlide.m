@interface MCPlugSlide
- (MCSlide)parentSlide;
- (void)setParentSlide:(id)a3;
@end

@implementation MCPlugSlide

- (MCSlide)parentSlide
{
  return self->_parentSlide;
}

- (void)setParentSlide:(id)a3
{
  self->_parentSlide = (MCSlide *)a3;
}

@end