@interface PRUISSwitcherLayout
- (PRUISSwitcherLayout)initWithLayoutMode:(unint64_t)a3;
- (unint64_t)layoutMode;
@end

@implementation PRUISSwitcherLayout

- (PRUISSwitcherLayout)initWithLayoutMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISSwitcherLayout;
  result = [(PRUISSwitcherLayout *)&v5 init];
  if (result) {
    result->_layoutMode = a3;
  }
  return result;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

@end