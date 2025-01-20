@interface SBHIconAccessoryVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (CGPoint)offset;
- (CGSize)size;
- (NSString)description;
- (SBHIconAccessoryVisualConfiguration)init;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setFontSize:(double)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SBHIconAccessoryVisualConfiguration

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SBHIconAccessoryVisualConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconAccessoryVisualConfiguration;
  CGSize result = [(SBHIconAccessoryVisualConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_fontSize = xmmword_1D81E7F80;
    result->_offset.double y = 11.0;
    *(_OWORD *)&result->_size.double height = xmmword_1D81E7F90;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_fontSize;
    *((_OWORD *)result + 1) = self->_size;
    *((_OWORD *)result + 2) = self->_offset;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconAccessoryVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      BOOL v9 = self->_size.width == v7[2]
        && self->_size.height == v7[3]
        && self->_offset.y == v7[5]
        && self->_offset.x == v7[4];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_fontSize + self->_size.width + self->_size.height + self->_offset.x + self->_offset.y);
}

- (NSString)description
{
  return (NSString *)[(SBHIconAccessoryVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHIconAccessoryVisualConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBHIconAccessoryVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHIconAccessoryVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHIconAccessoryVisualConfiguration *)self fontSize];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"fontSize");
  [(SBHIconAccessoryVisualConfiguration *)self size];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"size");
  [(SBHIconAccessoryVisualConfiguration *)self offset];
  id v7 = (id)objc_msgSend(v4, "appendPoint:withName:", @"offset");
  return v4;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end