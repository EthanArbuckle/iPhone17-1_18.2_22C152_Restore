@interface SBHIconLabelVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBHIconLabelVisualConfiguration)init;
- (double)baselineOffsetFromImage;
- (double)extraWidth;
- (double)fontSize;
- (double)height;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setBaselineOffsetFromImage:(double)a3;
- (void)setExtraWidth:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setHeight:(double)a3;
@end

@implementation SBHIconLabelVisualConfiguration

- (double)baselineOffsetFromImage
{
  return self->_baselineOffsetFromImage;
}

- (double)height
{
  return self->_height;
}

- (double)extraWidth
{
  return self->_extraWidth;
}

- (SBHIconLabelVisualConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconLabelVisualConfiguration;
  result = [(SBHIconLabelVisualConfiguration *)&v3 init];
  if (result)
  {
    result->_height = 26.0;
    *(_OWORD *)&result->_fontSize = xmmword_1D81E5390;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_fontSize;
    *((void *)result + 2) = *(void *)&self->_baselineOffsetFromImage;
    *((void *)result + 3) = *(void *)&self->_height;
    *((void *)result + 4) = *(void *)&self->_extraWidth;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconLabelVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      BOOL v8 = self->_height == v7[3]
        && self->_baselineOffsetFromImage == v7[2]
        && self->_fontSize == v7[1]
        && self->_extraWidth == v7[4];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_fontSize + self->_baselineOffsetFromImage + self->_height + self->_extraWidth);
}

- (NSString)description
{
  return (NSString *)[(SBHIconLabelVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHIconLabelVisualConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBHIconLabelVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHIconLabelVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHIconLabelVisualConfiguration *)self fontSize];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"fontSize");
  [(SBHIconLabelVisualConfiguration *)self baselineOffsetFromImage];
  id v6 = (id)objc_msgSend(v4, "appendFloat:withName:", @"baselineOffsetFromImage");
  [(SBHIconLabelVisualConfiguration *)self height];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"height");
  [(SBHIconLabelVisualConfiguration *)self extraWidth];
  id v8 = (id)objc_msgSend(v4, "appendFloat:withName:", @"extraWidth");
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

- (void)setBaselineOffsetFromImage:(double)a3
{
  self->_baselineOffsetFromImage = a3;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void)setExtraWidth:(double)a3
{
  self->_extraWidth = a3;
}

@end