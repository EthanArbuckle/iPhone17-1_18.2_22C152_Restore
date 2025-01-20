@interface AXWaveformSelectionBarElement
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)adjustsStartTime;
- (BOOL)isWaveformOverview;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseValue:(BOOL)a3 isThreeFingerScroll:(BOOL)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setAdjustsStartTime:(BOOL)a3;
@end

@implementation AXWaveformSelectionBarElement

- (BOOL)isWaveformOverview
{
  BOOL v5 = 0;
  v2 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v3 = [v2 safeValueForKey:@"_isOverView"];
  [v3 getValue:&v5];

  return v5;
}

- (id)accessibilityLabel
{
  char v7 = 0;
  v3 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"_insertMode"];
  [v4 getValue:&v7];

  if (!v7) {
    [(AXWaveformSelectionBarElement *)self isWaveformOverview];
  }
  [(AXWaveformSelectionBarElement *)self adjustsStartTime];
  BOOL v5 = RCLocalizedFrameworkString();

  return v5;
}

- (id)accessibilityHint
{
  return (id)RCLocalizedFrameworkString();
}

- (id)accessibilityValue
{
  v3 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"_selectedTimeRange"];
  [v4 getValue:&v7];

  [(AXWaveformSelectionBarElement *)self adjustsStartTime];
  BOOL v5 = UIAXTimeStringForDuration();

  return v5;
}

- (CGRect)accessibilityFrame
{
  v4 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  NSClassFromString(@"RCWaveformSelectionOverlay");
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v30 = +[NSAssertionHandler currentHandler];
    v31 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
    [v30 handleFailureInMethod:a2, self, @"RCWaveformSelectionOverlay.m", 1287, @"Unexpected class for container of waveform selection bar: %@", v31 object file lineNumber description];
  }
  v6 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  uint64_t v7 = [v6 safeValueForKey:@"_selectionRect"];
  [v7 CGRectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v16 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v17 = [v16 safeValueForKey:@"_xAdjustmentAmount"];
  [v17 floatValue];
  float v19 = v18;

  if ([(AXWaveformSelectionBarElement *)self adjustsStartTime])
  {
    v32.origin.CGFloat x = v9;
    v32.origin.CGFloat y = v11;
    v32.size.CGFloat width = v13;
    v32.size.CGFloat height = v15;
    double MaxX = CGRectGetMinX(v32) + v19;
  }
  else
  {
    v33.origin.CGFloat x = v9;
    v33.origin.CGFloat y = v11;
    v33.size.CGFloat width = v13;
    v33.size.CGFloat height = v15;
    double MaxX = CGRectGetMaxX(v33);
  }
  v21 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  v34.size.CGFloat width = 10.0;
  v34.origin.CGFloat x = MaxX;
  v34.origin.CGFloat y = v11;
  v34.size.CGFloat height = v15;
  CGRect v35 = UIAccessibilityConvertFrameToScreenCoordinates(v34, v21);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;

  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AXWaveformSelectionBarElement;
  return UIAccessibilityTraitAdjustable | [(AXWaveformSelectionBarElement *)&v3 accessibilityTraits];
}

- (void)_accessibilityIncreaseValue:(BOOL)a3 isThreeFingerScroll:(BOOL)a4
{
  BOOL v4 = a3;
  v34[0] = 0;
  v34[1] = 0;
  v6 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  uint64_t v7 = [v6 safeValueForKey:@"_selectedTimeRange"];
  [v7 getValue:v34];

  double v33 = 0.0;
  double v8 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  CGFloat v9 = [v8 safeValueForKey:@"_assetDuration"];
  [v9 getValue:&v33];

  [(AXWaveformSelectionBarElement *)self isWaveformOverview];
  unsigned int v10 = [(AXWaveformSelectionBarElement *)self adjustsStartTime];
  if (v4)
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else if (v10)
  {
LABEL_5:
    RCTimeRangeMake();
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 1;
    goto LABEL_7;
  }
  RCTimeRangeMake();
  double v12 = v17;
  double v14 = v18;
  uint64_t v16 = 0;
  uint64_t v15 = 1;
LABEL_7:
  if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
  {
    float v19 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
    v20 = [v19 safeValueForKey:@"_delegate"];
    v21 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
    [v20 waveformSelectionOverlay:v21 willChangeSelectedTimeRange:v16 isTrackingMin:v15 isTrackingMax:v14];
    double v23 = v22;
    double v25 = v24;

    if (v23 >= 0.0 && v25 <= v33)
    {
      double v27 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
      [v27 setSelectedTimeRange:v23, v25];
    }
  }
  double v28 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  double v29 = [v28 safeValueForKey:@"_delegate"];
  v30 = [(AXWaveformSelectionBarElement *)self accessibilityContainer];
  [v29 waveformSelectionOverlay:v30 didFinishTrackingSelectionBeginTime:v16 endTime:v15 assetCurrentTime:0];

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  UIAccessibilityNotifications v31 = UIAccessibilityAnnouncementNotification;
  CGRect v32 = [(AXWaveformSelectionBarElement *)self accessibilityValue];
  UIAccessibilityPostNotification(v31, v32);
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = 0;
  if (a3 == 3) {
    goto LABEL_4;
  }
  if (a3 == 4)
  {
    BOOL v5 = 1;
LABEL_4:
    -[AXWaveformSelectionBarElement _accessibilityIncreaseValue:isThreeFingerScroll:](self, "_accessibilityIncreaseValue:isThreeFingerScroll:", v5, 1, v3, v4);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)adjustsStartTime
{
  return self->_adjustsStartTime;
}

- (void)setAdjustsStartTime:(BOOL)a3
{
  self->_adjustsStartTime = a3;
}

@end