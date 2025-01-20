@interface TKVibrationRecorderProgressDotImageView
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (double)accessibilityFrameAdditionalHeight;
- (double)duration;
- (double)previousPauseDuration;
- (double)previousPauseTimeInterval;
- (double)timeInterval;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityFrameAdditionalHeight:(double)a3;
- (void)setDuration:(double)a3;
- (void)setPreviousPauseDuration:(double)a3;
- (void)setPreviousPauseTimeInterval:(double)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation TKVibrationRecorderProgressDotImageView

- (BOOL)isAccessibilityElement
{
  v2 = [(TKVibrationRecorderProgressDotImageView *)self accessibilityValue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  return (id)TLLocalizedString();
}

- (id)accessibilityValue
{
  BOOL v3 = TLLocalizedString();
  if ([@"VIBRATION_RECORDER_PROGRESS_DOT_VALUE_FORMAT" isEqualToString:v3])
  {
    v4 = 0;
  }
  else
  {
    [(TKVibrationRecorderProgressDotImageView *)self timeInterval];
    v5 = +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
    [(TKVibrationRecorderProgressDotImageView *)self duration];
    v6 = +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
    v4 = objc_msgSend(NSString, "stringWithFormat:", v3, v5, v6);
    [(TKVibrationRecorderProgressDotImageView *)self previousPauseTimeInterval];
    if (v7 > 0.0)
    {
      double v8 = v7;
      v9 = TLLocalizedString();
      if (([@"VIBRATION_RECORDER_PROGRESS_DOT_PREVIOUS_PAUSE_FORMAT" isEqualToString:v9] & 1) == 0)
      {
        v10 = +[TKVibrationInterfaceUtilities descriptionForDuration:v8];
        [(TKVibrationRecorderProgressDotImageView *)self previousPauseDuration];
        v11 = +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
        v12 = objc_msgSend(NSString, "stringWithFormat:", v9, v10, v11);
        uint64_t v13 = [NSString stringWithFormat:@"%@ %@", v4, v12];

        v4 = (void *)v13;
      }
    }
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  [(TKVibrationRecorderProgressDotImageView *)self accessibilityFrameAdditionalHeight];
  double v4 = v3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderProgressDotImageView;
  [(TKVibrationRecorderProgressDotImageView *)&v5 accessibilityFrame];
  return CGRectInset(v6, 0.0, v4 * -0.5);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressDotImageView;
  return [(TKVibrationRecorderProgressDotImageView *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CF00];
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)previousPauseTimeInterval
{
  return self->_previousPauseTimeInterval;
}

- (void)setPreviousPauseTimeInterval:(double)a3
{
  self->_previousPauseTimeInterval = a3;
}

- (double)previousPauseDuration
{
  return self->_previousPauseDuration;
}

- (void)setPreviousPauseDuration:(double)a3
{
  self->_previousPauseDuration = a3;
}

- (double)accessibilityFrameAdditionalHeight
{
  return self->_accessibilityFrameAdditionalHeight;
}

- (void)setAccessibilityFrameAdditionalHeight:(double)a3
{
  self->_accessibilityFrameAdditionalHeight = a3;
}

@end