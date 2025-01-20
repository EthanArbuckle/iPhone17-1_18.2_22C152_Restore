@interface RCPlatterLeadingWaveformView
- (double)_sliceScale;
- (double)slicePadding;
- (double)sliceWidth;
- (id)accessibilityLabel;
- (unint64_t)numberOfSlices;
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
@end

@implementation RCPlatterLeadingWaveformView

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(RCPlatterLeadingWaveformView *)self invalidateIntrinsicContentSize];
}

- (unint64_t)numberOfSlices
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 platterCompactViewSliceCount];

  return (unint64_t)v3;
}

- (double)sliceWidth
{
  v7.receiver = self;
  v7.super_class = (Class)RCPlatterLeadingWaveformView;
  [(RCPlatterWaveformView *)&v7 sliceWidth];
  double v4 = v3;
  [(RCPlatterLeadingWaveformView *)self _sliceScale];
  return v4 * v5;
}

- (double)slicePadding
{
  v7.receiver = self;
  v7.super_class = (Class)RCPlatterLeadingWaveformView;
  [(RCPlatterWaveformView *)&v7 slicePadding];
  double v4 = v3;
  [(RCPlatterLeadingWaveformView *)self _sliceScale];
  return v4 * v5;
}

- (double)_sliceScale
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 platterWaveformSliceScaleFactorForExpandedMode];
  double v5 = v4;

  double result = 1.0;
  if (self->_style) {
    return v5;
  }
  return result;
}

- (id)accessibilityLabel
{
  unint64_t style = self->_style;
  double v3 = +[NSBundle mainBundle];
  double v4 = v3;
  if (style) {
    CFStringRef v5 = @"AX_WAVEFORM";
  }
  else {
    CFStringRef v5 = @"AX_JINDO_WAVEFORM";
  }
  v6 = [v3 localizedStringForKey:v5 value:@"Waveform" table:0];

  return v6;
}

- (unint64_t)style
{
  return self->_style;
}

@end