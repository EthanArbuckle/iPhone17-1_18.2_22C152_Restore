@interface _UISegmentedControlSegmentHoverIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifier:(id)a3;
- (BOOL)isSelected;
- (_UISegmentedControlSegmentHoverIdentifier)initWithIndex:(int64_t)a3 selected:(BOOL)a4;
- (int64_t)index;
- (unint64_t)hash;
@end

@implementation _UISegmentedControlSegmentHoverIdentifier

- (_UISegmentedControlSegmentHoverIdentifier)initWithIndex:(int64_t)a3 selected:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UISegmentedControlSegmentHoverIdentifier;
  result = [(_UISegmentedControlSegmentHoverIdentifier *)&v7 init];
  if (result)
  {
    result->_index = a3;
    result->_isSelected = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_index ^ self->_isSelected;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UISegmentedControlSegmentHoverIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UISegmentedControlSegmentHoverIdentifier *)self isEqualToIdentifier:v4];
  }

  return v5;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  v4 = a3;
  BOOL v5 = v4 && self->_index == v4[1] && self->_isSelected == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (int64_t)index
{
  return self->_index;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

@end