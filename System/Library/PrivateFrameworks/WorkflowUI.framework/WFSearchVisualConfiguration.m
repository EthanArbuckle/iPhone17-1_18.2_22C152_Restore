@interface WFSearchVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (UIEdgeInsets)textFieldLandscapeLayoutInsets;
- (UIEdgeInsets)textFieldPortraitLayoutInsets;
- (WFSearchVisualConfiguration)init;
- (double)textFieldWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setTextFieldLandscapeLayoutInsets:(UIEdgeInsets)a3;
- (void)setTextFieldPortraitLayoutInsets:(UIEdgeInsets)a3;
- (void)setTextFieldWidth:(double)a3;
@end

@implementation WFSearchVisualConfiguration

- (void)setTextFieldLandscapeLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldLandscapeLayoutInsets = a3;
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

- (void)setTextFieldPortraitLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldPortraitLayoutInsets = a3;
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

- (void)setTextFieldWidth:(double)a3
{
  self->_textFieldWidth = a3;
}

- (double)textFieldWidth
{
  return self->_textFieldWidth;
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

- (BOOL)isEqual:(id)a3
{
  v4 = (WFSearchVisualConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
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

- (WFSearchVisualConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSearchVisualConfiguration;
  v2 = [(WFSearchVisualConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_textFieldWidth = 0.0;
    v2->_textFieldPortraitLayoutInsets.double top = 0.0;
    v2->_textFieldPortraitLayoutInsets.double left = 0.0;
    v2->_textFieldPortraitLayoutInsets.double bottom = 25.0;
    v2->_textFieldLandscapeLayoutInsets.double top = 0.0;
    v2->_textFieldLandscapeLayoutInsets.double left = 0.0;
    v2->_textFieldPortraitLayoutInsets.double right = 0.0;
    *(_OWORD *)&v2->_textFieldLandscapeLayoutInsets.double bottom = xmmword_22DCC33D0;
    v4 = v2;
  }

  return v3;
}

@end