@interface SBHSearchVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBHSearchVisualConfiguration)init;
- (UIEdgeInsets)textFieldLandscapeLayoutInsets;
- (UIEdgeInsets)textFieldPortraitLayoutInsets;
- (double)textFieldWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setTextFieldLandscapeLayoutInsets:(UIEdgeInsets)a3;
- (void)setTextFieldPortraitLayoutInsets:(UIEdgeInsets)a3;
- (void)setTextFieldWidth:(double)a3;
@end

@implementation SBHSearchVisualConfiguration

- (SBHSearchVisualConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHSearchVisualConfiguration;
  result = [(SBHSearchVisualConfiguration *)&v3 init];
  if (result)
  {
    result->_textFieldWidth = 0.0;
    result->_textFieldPortraitLayoutInsets.top = 0.0;
    result->_textFieldPortraitLayoutInsets.left = 0.0;
    result->_textFieldPortraitLayoutInsets.bottom = 25.0;
    result->_textFieldLandscapeLayoutInsets.top = 0.0;
    result->_textFieldLandscapeLayoutInsets.left = 0.0;
    result->_textFieldPortraitLayoutInsets.right = 0.0;
    *(_OWORD *)&result->_textFieldLandscapeLayoutInsets.bottom = xmmword_1D81E7F10;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_textFieldWidth;
    long long v5 = *(_OWORD *)&self->_textFieldPortraitLayoutInsets.bottom;
    *((_OWORD *)result + 1) = *(_OWORD *)&self->_textFieldPortraitLayoutInsets.top;
    *((_OWORD *)result + 2) = v5;
    long long v6 = *(_OWORD *)&self->_textFieldLandscapeLayoutInsets.bottom;
    *((_OWORD *)result + 3) = *(_OWORD *)&self->_textFieldLandscapeLayoutInsets.top;
    *((_OWORD *)result + 4) = v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHSearchVisualConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    long long v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if (self->_textFieldWidth == v7->f64[1]
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldPortraitLayoutInsets.top, v7[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldPortraitLayoutInsets.bottom, v7[2]))), 0xFuLL))) & 1) != 0)
      {
        char v8 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldLandscapeLayoutInsets.top, v7[3]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldLandscapeLayoutInsets.bottom, v7[4]))), 0xFuLL)));
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8 & 1;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_textFieldWidth
                          + self->_textFieldPortraitLayoutInsets.top
                          + self->_textFieldPortraitLayoutInsets.left
                          + self->_textFieldPortraitLayoutInsets.bottom
                          + self->_textFieldPortraitLayoutInsets.right
                          + self->_textFieldLandscapeLayoutInsets.top
                          + self->_textFieldLandscapeLayoutInsets.left
                          + self->_textFieldLandscapeLayoutInsets.bottom
                          + self->_textFieldLandscapeLayoutInsets.right);
}

- (NSString)description
{
  return (NSString *)[(SBHSearchVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHSearchVisualConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBHSearchVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHSearchVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHSearchVisualConfiguration *)self textFieldWidth];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"textFieldWidth");
  [(SBHSearchVisualConfiguration *)self textFieldPortraitLayoutInsets];
  long long v6 = NSStringFromUIEdgeInsets(v10);
  [v4 appendString:v6 withName:@"textFieldPortraitLayoutInsets"];

  [(SBHSearchVisualConfiguration *)self textFieldLandscapeLayoutInsets];
  v7 = NSStringFromUIEdgeInsets(v11);
  [v4 appendString:v7 withName:@"textFieldLandscapeLayoutInsets"];

  return v4;
}

- (double)textFieldWidth
{
  return self->_textFieldWidth;
}

- (void)setTextFieldWidth:(double)a3
{
  self->_textFieldWidth = a3;
}

- (UIEdgeInsets)textFieldPortraitLayoutInsets
{
  double top = self->_textFieldPortraitLayoutInsets.top;
  double left = self->_textFieldPortraitLayoutInsets.left;
  double bottom = self->_textFieldPortraitLayoutInsets.bottom;
  double right = self->_textFieldPortraitLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextFieldPortraitLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldPortraitLayoutInsets = a3;
}

- (UIEdgeInsets)textFieldLandscapeLayoutInsets
{
  double top = self->_textFieldLandscapeLayoutInsets.top;
  double left = self->_textFieldLandscapeLayoutInsets.left;
  double bottom = self->_textFieldLandscapeLayoutInsets.bottom;
  double right = self->_textFieldLandscapeLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextFieldLandscapeLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldLandscapeLayoutInsets = a3;
}

@end