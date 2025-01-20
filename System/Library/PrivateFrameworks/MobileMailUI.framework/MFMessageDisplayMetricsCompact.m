@interface MFMessageDisplayMetricsCompact
- (double)baselineToBaselineSpacing;
- (double)firstSeparatorToSubjectBaseline;
- (double)headerBottomPadding;
- (double)statusIndicatorVerticalSpacing;
- (double)topToSenderBaseline;
@end

@implementation MFMessageDisplayMetricsCompact

- (double)topToSenderBaseline
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:34.0];
  return result;
}

- (double)baselineToBaselineSpacing
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:20.0];
  return result;
}

- (double)firstSeparatorToSubjectBaseline
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2990] fontStyle:32.0];
  return result;
}

- (double)headerBottomPadding
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2908] fontStyle:20.0];
  return result;
}

- (double)statusIndicatorVerticalSpacing
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:22.0];
  return result;
}

@end