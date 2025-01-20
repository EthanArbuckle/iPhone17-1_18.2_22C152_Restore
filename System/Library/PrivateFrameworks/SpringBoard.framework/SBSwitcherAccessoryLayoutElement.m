@interface SBSwitcherAccessoryLayoutElement
- (SBSwitcherAccessoryLayoutElement)initWithType:(unint64_t)a3;
- (unint64_t)switcherLayoutElementType;
- (unint64_t)type;
@end

@implementation SBSwitcherAccessoryLayoutElement

- (SBSwitcherAccessoryLayoutElement)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherAccessoryLayoutElement;
  result = [(SBSwitcherAccessoryLayoutElement *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (unint64_t)switcherLayoutElementType
{
  return self->_type;
}

- (unint64_t)type
{
  return self->_type;
}

@end