@interface RCApplicationWaveformRenderer
- (BOOL)isCompactView;
- (BOOL)isEditMode;
- (BOOL)isPlayBarOnlyMode;
- (BOOL)isPlayback;
- (BOOL)renderDimmedUnprocessedSegments;
- (BOOL)useCenteredStyleColoring;
- (double)maximumDecibelDisplayRange;
- (double)verticalWaveformPadding;
- (double)waveformHorizontalSpacing;
- (double)waveformWaveWidth;
- (void)setIsCompactView:(BOOL)a3;
- (void)setIsEditMode:(BOOL)a3;
- (void)setIsPlayBarOnlyMode:(BOOL)a3;
- (void)setIsPlayback:(BOOL)a3;
@end

@implementation RCApplicationWaveformRenderer

- (double)waveformWaveWidth
{
  v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([(RCWaveformRenderer *)self displayMode]) {
    [v3 waveformWaveWidth];
  }
  else {
    [v3 overviewWaveformWaveWidth];
  }
  double v5 = v4;

  return v5;
}

- (double)waveformHorizontalSpacing
{
  v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([(RCWaveformRenderer *)self displayMode]) {
    [v3 waveformHorizontalSpacing];
  }
  else {
    [v3 overviewWaveformHorizontalSpacing];
  }
  double v5 = v4;

  return v5;
}

- (double)maximumDecibelDisplayRange
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 maximumDecibelDisplayRange];
  double v4 = v3;

  return v4;
}

- (double)verticalWaveformPadding
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 waveformWaveVerticalPadding];
  double v5 = v4;
  if (![(RCWaveformRenderer *)self displayMode])
  {
    [v3 overviewWaveformWaveVerticalPadding];
    goto LABEL_5;
  }
  if ([(RCApplicationWaveformRenderer *)self isCompactView])
  {
    [v3 compactWaveformWaveVerticalPadding];
LABEL_5:
    double v5 = v6;
  }

  return v5;
}

- (BOOL)useCenteredStyleColoring
{
  return (id)[(RCWaveformRenderer *)self displayMode] == (id)1
      && (![(RCApplicationWaveformRenderer *)self isCompactView]
       || ![(RCWaveformRenderer *)self isLiveWaveform]
       || [(RCApplicationWaveformRenderer *)self isPlayBarOnlyMode]);
}

- (BOOL)renderDimmedUnprocessedSegments
{
  return ![(RCWaveformRenderer *)self isLiveWaveform];
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (void)setIsEditMode:(BOOL)a3
{
  self->_isEditMode = a3;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setIsCompactView:(BOOL)a3
{
  self->_isCompactView = a3;
}

- (BOOL)isPlayBarOnlyMode
{
  return self->_isPlayBarOnlyMode;
}

- (void)setIsPlayBarOnlyMode:(BOOL)a3
{
  self->_isPlayBarOnlyMode = a3;
}

@end