@interface MFMessageDisplayMetricsRegular
- (double)baselineToBaselineSpacing;
- (double)firstSeparatorToSubjectBaseline;
- (double)headerBottomPadding;
- (double)recipientBaselineToFirstSeparator;
- (double)statusIndicatorVerticalSpacing;
- (double)topToSenderBaseline;
@end

@implementation MFMessageDisplayMetricsRegular

- (double)topToSenderBaseline
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:34.0];
  double v4 = v3;
  if (![(MFMessageDisplayMetrics *)self hasGenerousMargins]) {
    return v4;
  }
  [(MFMessageDisplayMetrics *)self layoutMargins];
  return v4 + v5 * 0.4;
}

- (double)baselineToBaselineSpacing
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:22.0];
  return result;
}

- (double)recipientBaselineToFirstSeparator
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28F0] fontStyle:20.0];
  return result;
}

- (double)firstSeparatorToSubjectBaseline
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2990] fontStyle:56.0];
  return result;
}

- (double)headerBottomPadding
{
  v2 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  double v3 = [v2 cachedFont:&__block_literal_global_7 forKey:@"messageRegularDisplayMetrics.bodyFont"];

  double v4 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke_2;
  v9[3] = &unk_1E6D1AFD0;
  id v5 = v3;
  id v10 = v5;
  [v4 cachedFloat:v9 forKey:@"messageRegularDisplayMetrics.headerBottomPadding"];
  double v7 = v6;

  return v7;
}

id __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x10000 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

uint64_t __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _scaledValueForValue:56.0];
  [*(id *)(a1 + 32) lineHeight];
  return UIRoundToViewScale();
}

- (double)statusIndicatorVerticalSpacing
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:24.0];
  return result;
}

@end