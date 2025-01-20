@interface SBHFloatingDockVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (CGSize)maximumEditingIconSize;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setMaximumEditingIconSize:(CGSize)a3;
@end

@implementation SBHFloatingDockVisualConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result) {
    *(CGSize *)((char *)result + 8) = self->_maximumEditingIconSize;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHFloatingDockVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0
      && self->_maximumEditingIconSize.height == v4->_maximumEditingIconSize.height
      && self->_maximumEditingIconSize.width == v4->_maximumEditingIconSize.width;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_maximumEditingIconSize.width + self->_maximumEditingIconSize.height);
}

- (NSString)description
{
  return (NSString *)[(SBHFloatingDockVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHFloatingDockVisualConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHFloatingDockVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHFloatingDockVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHFloatingDockVisualConfiguration *)self maximumEditingIconSize];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"maximumEditingIconSize");
  return v4;
}

- (CGSize)maximumEditingIconSize
{
  double width = self->_maximumEditingIconSize.width;
  double height = self->_maximumEditingIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  self->_maximumEditingIconSize = a3;
}

@end