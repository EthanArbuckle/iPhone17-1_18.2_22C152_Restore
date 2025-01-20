@interface PXWidgetBarSpec
- (BOOL)shouldUseSingleLine;
- (UIColor)textColor;
- (UIEdgeInsets)contentInsets;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (double)distanceBetweenLastBaselineAndBottom;
- (double)distanceBetweenTitleBaselineAndSubtitleBaseline;
- (double)distanceBetweenTopAndFirstBaseline;
- (double)horizontalSpacingBetweenTitleAndSubtitle;
- (double)minimumDistanceBetweenLastDescenderAndBottom;
- (double)minimumDistanceBetweenTopAndFirstAscender;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDistanceBetweenLastBaselineAndBottom:(double)a3;
- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3;
- (void)setDistanceBetweenTopAndFirstBaseline:(double)a3;
- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3;
- (void)setMinimumDistanceBetweenLastDescenderAndBottom:(double)a3;
- (void)setMinimumDistanceBetweenTopAndFirstAscender:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setShouldUseSingleLine:(BOOL)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PXWidgetBarSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3
{
  self->_horizontalSpacingBetweenTitleAndSubtitle = a3;
}

- (double)horizontalSpacingBetweenTitleAndSubtitle
{
  return self->_horizontalSpacingBetweenTitleAndSubtitle;
}

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (void)setMinimumDistanceBetweenLastDescenderAndBottom:(double)a3
{
  self->_minimumDistanceBetweenLastDescenderAndBottom = a3;
}

- (double)minimumDistanceBetweenLastDescenderAndBottom
{
  return self->_minimumDistanceBetweenLastDescenderAndBottom;
}

- (void)setMinimumDistanceBetweenTopAndFirstAscender:(double)a3
{
  self->_minimumDistanceBetweenTopAndFirstAscender = a3;
}

- (double)minimumDistanceBetweenTopAndFirstAscender
{
  return self->_minimumDistanceBetweenTopAndFirstAscender;
}

- (void)setDistanceBetweenLastBaselineAndBottom:(double)a3
{
  self->_distanceBetweenLastBaselineAndBottom = a3;
}

- (double)distanceBetweenLastBaselineAndBottom
{
  return self->_distanceBetweenLastBaselineAndBottom;
}

- (void)setDistanceBetweenTopAndFirstBaseline:(double)a3
{
  self->_distanceBetweenTopAndFirstBaseline = a3;
}

- (double)distanceBetweenTopAndFirstBaseline
{
  return self->_distanceBetweenTopAndFirstBaseline;
}

- (void)setShouldUseSingleLine:(BOOL)a3
{
  self->_shouldUseSingleLine = a3;
}

- (BOOL)shouldUseSingleLine
{
  return self->_shouldUseSingleLine;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSecondaryFont:(id)a3
{
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setPrimaryFont:(id)a3
{
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_textColor);
  objc_storeStrong((id *)(v4 + 24), self->_primaryFont);
  objc_storeStrong((id *)(v4 + 32), self->_secondaryFont);
  long long v5 = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)(v4 + 88) = v5;
  *(unsigned char *)(v4 + 8) = self->_shouldUseSingleLine;
  *(double *)(v4 + 40) = self->_distanceBetweenTopAndFirstBaseline;
  *(double *)(v4 + 48) = self->_distanceBetweenLastBaselineAndBottom;
  *(double *)(v4 + 56) = self->_minimumDistanceBetweenTopAndFirstAscender;
  *(double *)(v4 + 64) = self->_minimumDistanceBetweenLastDescenderAndBottom;
  *(double *)(v4 + 72) = self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
  *(double *)(v4 + 80) = self->_horizontalSpacingBetweenTitleAndSubtitle;
  return (id)v4;
}

@end