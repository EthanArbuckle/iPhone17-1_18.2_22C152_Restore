@interface PXCMMPosterHeaderViewSpec
- (BOOL)canShowStatus;
- (PXCMMPosterHeaderViewSpec)init;
- (PXCMMPosterHeaderViewSpec)initWithPresentationStyle:(int64_t)a3;
- (UIFont)preferredStatusFont;
- (UIFont)preferredSubtitleFont;
- (UIFont)preferredTitleFont;
- (double)bottomGradientBaselineOffset;
- (double)scaledBottomGradientBaselineOffset;
- (double)scaledStatusBaselineOffset;
- (double)scaledSubtitleBaselineOffset;
- (double)scaledTitleBaselineOffset;
- (double)scaledTopGradientBaselineOffset;
- (double)statusBaselineOffset;
- (double)subtitleBaselineOffset;
- (double)titleBaselineOffset;
- (double)topGradientBaselineOffset;
- (int64_t)bottomGradientFontTextStyle;
- (int64_t)statusFontTextStyle;
- (int64_t)subtitleFontTextStyle;
- (int64_t)titleFontTextStyle;
- (int64_t)topGradientFontTextStyle;
- (unsigned)bottomGradientFontDescriptorSymbolicTraits;
- (unsigned)statusFontDescriptorSymbolicTraits;
- (unsigned)subtitleFontDescriptorSymbolicTraits;
- (unsigned)titleFontDescriptorSymbolicTraits;
- (unsigned)topGradientFontDescriptorSymbolicTraits;
@end

@implementation PXCMMPosterHeaderViewSpec

- (double)bottomGradientBaselineOffset
{
  return self->_bottomGradientBaselineOffset;
}

- (unsigned)bottomGradientFontDescriptorSymbolicTraits
{
  return self->_bottomGradientFontDescriptorSymbolicTraits;
}

- (int64_t)bottomGradientFontTextStyle
{
  return self->_bottomGradientFontTextStyle;
}

- (double)statusBaselineOffset
{
  return self->_statusBaselineOffset;
}

- (unsigned)statusFontDescriptorSymbolicTraits
{
  return self->_statusFontDescriptorSymbolicTraits;
}

- (int64_t)statusFontTextStyle
{
  return self->_statusFontTextStyle;
}

- (BOOL)canShowStatus
{
  return self->_canShowStatus;
}

- (double)topGradientBaselineOffset
{
  return self->_topGradientBaselineOffset;
}

- (unsigned)topGradientFontDescriptorSymbolicTraits
{
  return self->_topGradientFontDescriptorSymbolicTraits;
}

- (int64_t)topGradientFontTextStyle
{
  return self->_topGradientFontTextStyle;
}

- (double)subtitleBaselineOffset
{
  return self->_subtitleBaselineOffset;
}

- (unsigned)subtitleFontDescriptorSymbolicTraits
{
  return self->_subtitleFontDescriptorSymbolicTraits;
}

- (int64_t)subtitleFontTextStyle
{
  return self->_subtitleFontTextStyle;
}

- (double)titleBaselineOffset
{
  return self->_titleBaselineOffset;
}

- (unsigned)titleFontDescriptorSymbolicTraits
{
  return self->_titleFontDescriptorSymbolicTraits;
}

- (int64_t)titleFontTextStyle
{
  return self->_titleFontTextStyle;
}

- (UIFont)preferredStatusFont
{
  int64_t v3 = [(PXCMMPosterHeaderViewSpec *)self statusFontTextStyle];
  uint64_t v4 = [(PXCMMPosterHeaderViewSpec *)self statusFontDescriptorSymbolicTraits];
  if ([(PXCMMPosterHeaderViewSpec *)self canShowStatus])
  {
    v5 = MEMORY[0x1AD10AAF0](v3, v4, 7);
  }
  else
  {
    v5 = 0;
  }
  return (UIFont *)v5;
}

- (UIFont)preferredSubtitleFont
{
  [(PXCMMPosterHeaderViewSpec *)self subtitleFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self subtitleFontDescriptorSymbolicTraits];
  JUMPOUT(0x1AD10AAF0);
}

- (UIFont)preferredTitleFont
{
  [(PXCMMPosterHeaderViewSpec *)self titleFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self titleFontDescriptorSymbolicTraits];
  JUMPOUT(0x1AD10AAF0);
}

- (double)scaledBottomGradientBaselineOffset
{
  [(PXCMMPosterHeaderViewSpec *)self bottomGradientFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self bottomGradientFontDescriptorSymbolicTraits];
  [(PXCMMPosterHeaderViewSpec *)self bottomGradientBaselineOffset];
  if ([(PXCMMPosterHeaderViewSpec *)self canShowStatus])
  {
    PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  }
  return 0.0;
}

- (double)scaledStatusBaselineOffset
{
  [(PXCMMPosterHeaderViewSpec *)self statusFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self statusFontDescriptorSymbolicTraits];
  [(PXCMMPosterHeaderViewSpec *)self statusBaselineOffset];
  if ([(PXCMMPosterHeaderViewSpec *)self canShowStatus])
  {
    PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  }
  return 0.0;
}

- (double)scaledTopGradientBaselineOffset
{
  [(PXCMMPosterHeaderViewSpec *)self topGradientFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self topGradientFontDescriptorSymbolicTraits];
  [(PXCMMPosterHeaderViewSpec *)self topGradientBaselineOffset];
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
}

- (double)scaledSubtitleBaselineOffset
{
  [(PXCMMPosterHeaderViewSpec *)self subtitleFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self subtitleFontDescriptorSymbolicTraits];
  [(PXCMMPosterHeaderViewSpec *)self subtitleBaselineOffset];
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
}

- (double)scaledTitleBaselineOffset
{
  [(PXCMMPosterHeaderViewSpec *)self titleFontTextStyle];
  [(PXCMMPosterHeaderViewSpec *)self titleFontDescriptorSymbolicTraits];
  [(PXCMMPosterHeaderViewSpec *)self titleBaselineOffset];
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
}

- (PXCMMPosterHeaderViewSpec)initWithPresentationStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterHeaderViewSpec;
  result = [(PXCMMPosterHeaderViewSpec *)&v5 init];
  if (result)
  {
    if (a3 == 1)
    {
      result->_titleFontTextStyle = 7;
      result->_titleBaselineOffset = 24.0;
      result->_subtitleFontTextStyle = 11;
      result->_subtitleBaselineOffset = 18.0;
      result->_topGradientFontTextStyle = 7;
      result->_topGradientBaselineOffset = 24.0;
      result->_canShowStatus = 0;
      *(_OWORD *)&result->_titleFontDescriptorSymbolicTraits = xmmword_1AB359C60;
      result->_bottomGradientFontDescriptorSymbolicTraits = 0;
      *(_OWORD *)&result->_statusFontTextStyle = 0u;
      *(_OWORD *)&result->_bottomGradientFontTextStyle = 0u;
    }
    else if (!a3)
    {
      result->_titleFontTextStyle = 3;
      result->_titleBaselineOffset = 32.0;
      result->_subtitleFontTextStyle = 7;
      result->_subtitleBaselineOffset = 24.0;
      result->_topGradientFontTextStyle = 3;
      result->_topGradientBaselineOffset = 26.0;
      result->_canShowStatus = 1;
      *(_OWORD *)&result->_titleFontDescriptorSymbolicTraits = xmmword_1AB359C70;
      result->_statusFontTextStyle = 12;
      result->_statusBaselineOffset = 12.0;
      result->_bottomGradientFontDescriptorSymbolicTraits = 0;
      result->_bottomGradientFontTextStyle = 3;
      result->_bottomGradientBaselineOffset = 26.0;
    }
  }
  return result;
}

- (PXCMMPosterHeaderViewSpec)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPosterHeaderViewSpec.m", 20, @"%s is not available as initializer", "-[PXCMMPosterHeaderViewSpec init]");

  abort();
}

@end