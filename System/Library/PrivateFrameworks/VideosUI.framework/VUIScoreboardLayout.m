@interface VUIScoreboardLayout
+ (id)_textColor:(int64_t)a3;
+ (int)_textBlendMode;
- (VUIScoreboardRowLayout)bottomRowLayout;
- (VUIScoreboardRowLayout)topRowLayout;
- (VUITextLayout)textLayout;
- (_VUICornerRadii)borderRadii;
- (double)padding;
- (void)setBorderRadii:(_VUICornerRadii)a3;
- (void)setBottomRowLayout:(id)a3;
- (void)setPadding:(double)a3;
- (void)setTextLayout:(id)a3;
- (void)setTopRowLayout:(id)a3;
@end

@implementation VUIScoreboardLayout

+ (id)_textColor:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", a3);
  v4 = [v3 colorWithAlphaComponent:0.5];

  return v4;
}

+ (int)_textBlendMode
{
  return 26;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft = self->_borderRadii.topLeft;
  double topRight = self->_borderRadii.topRight;
  double bottomLeft = self->_borderRadii.bottomLeft;
  double bottomRight = self->_borderRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (VUIScoreboardRowLayout)topRowLayout
{
  return self->_topRowLayout;
}

- (void)setTopRowLayout:(id)a3
{
}

- (VUIScoreboardRowLayout)bottomRowLayout
{
  return self->_bottomRowLayout;
}

- (void)setBottomRowLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRowLayout, 0);
  objc_storeStrong((id *)&self->_topRowLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

@end