@interface RCPlaybackSettingsSlider
- (CGRect)trackRect;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (NSArray)regularTickPaths;
- (NSArray)regularTrackPaths;
- (NSArray)tintedTickPaths;
- (NSArray)tintedTrackPaths;
- (RCPlaybackSettingsSlider)init;
- (double)_defaultStartingValue;
- (double)_maximumValue;
- (double)_minimumValue;
- (double)offsetBetweenTicks;
- (double)valueForTickNumber:(unint64_t)a3;
- (double)xPositionWithSelectedTickValue:(double)a3 forTrackRect:(CGRect)a4;
- (unint64_t)numberOfTicks;
- (unint64_t)tickNumberForDefaultValue;
- (unint64_t)tickNumberForSelectedValue;
- (unint64_t)tickNumberForValue:(double)a3;
- (void)_createTickPathsForTrackRect:(CGRect)a3;
- (void)_createTrackPathsForTrackRect:(CGRect)a3;
- (void)_drawBezierPaths:(id)a3 tinted:(BOOL)a4;
- (void)_hideDefaultSliderViews;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setRegularTickPaths:(id)a3;
- (void)setRegularTrackPaths:(id)a3;
- (void)setTintedTickPaths:(id)a3;
- (void)setTintedTrackPaths:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation RCPlaybackSettingsSlider

- (RCPlaybackSettingsSlider)init
{
  v15.receiver = self;
  v15.super_class = (Class)RCPlaybackSettingsSlider;
  v2 = [(RCPlaybackSettingsSlider *)&v15 init];
  if (v2)
  {
    v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    v4 = [v3 playbackSpeedSliderMinimumValueImage];
    [(RCPlaybackSettingsSlider *)v2 setMinimumValueImage:v4];

    v5 = [v3 playbackSpeedSliderImageColor];
    v6 = [(RCPlaybackSettingsSlider *)v2 _minValueView];
    [v6 setTintColor:v5];

    v7 = [v3 playbackSpeedSliderMaximumValueImage];
    [(RCPlaybackSettingsSlider *)v2 setMaximumValueImage:v7];

    v8 = [v3 playbackSpeedSliderImageColor];
    v9 = [(RCPlaybackSettingsSlider *)v2 _maxValueView];
    [v9 setTintColor:v8];

    [(RCPlaybackSettingsSlider *)v2 _minimumValue];
    *(float *)&double v10 = v10;
    [(RCPlaybackSettingsSlider *)v2 setMinimumValue:v10];
    [(RCPlaybackSettingsSlider *)v2 _maximumValue];
    *(float *)&double v11 = v11;
    [(RCPlaybackSettingsSlider *)v2 setMaximumValue:v11];
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"PLAYBACK_SPEED_SLIDER" value:&stru_100228BC8 table:0];
    [(RCPlaybackSettingsSlider *)v2 setAccessibilityLabel:v13];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCPlaybackSettingsSlider;
  [(RCPlaybackSettingsSlider *)&v3 layoutSubviews];
  [(RCPlaybackSettingsSlider *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  [(RCPlaybackSettingsSlider *)self _hideDefaultSliderViews];
  [(RCPlaybackSettingsSlider *)self trackRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[RCPlaybackSettingsSlider _createTickPathsForTrackRect:](self, "_createTickPathsForTrackRect:");
  -[RCPlaybackSettingsSlider _createTrackPathsForTrackRect:](self, "_createTrackPathsForTrackRect:", v5, v7, v9, v11);
  v12 = [(RCPlaybackSettingsSlider *)self regularTrackPaths];
  v13 = [(RCPlaybackSettingsSlider *)self regularTickPaths];
  id v17 = [v12 arrayByAddingObjectsFromArray:v13];

  [(RCPlaybackSettingsSlider *)self _drawBezierPaths:v17 tinted:0];
  v14 = [(RCPlaybackSettingsSlider *)self tintedTrackPaths];
  objc_super v15 = [(RCPlaybackSettingsSlider *)self tintedTickPaths];
  v16 = [v14 arrayByAddingObjectsFromArray:v15];

  [(RCPlaybackSettingsSlider *)self _drawBezierPaths:v16 tinted:1];
}

- (void)_drawBezierPaths:(id)a3 tinted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v7 = v6;
  if (v4) {
    [v6 playbackSpeedTintedTrackColor];
  }
  else {
  double v8 = [v6 playbackSpeedRegularTrackColor];
  }
  [v8 set];

  double v9 = +[UIBezierPath bezierPath];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 appendPath:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14) v15];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [v9 fill];
}

- (void)_createTickPathsForTrackRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v31 = +[NSMutableArray array];
  double v8 = +[NSMutableArray array];
  CGFloat v30 = x;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v33);
  unint64_t v10 = [(RCPlaybackSettingsSlider *)self numberOfTicks];
  unint64_t v11 = [(RCPlaybackSettingsSlider *)self tickNumberForDefaultValue];
  unint64_t v12 = [(RCPlaybackSettingsSlider *)self tickNumberForSelectedValue];
  uint64_t v13 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v13 playbackSpeedSliderTickSize];
  double v15 = v14;
  double v17 = v16;
  [v13 playbackSpeedSliderTickCornerRadius];
  if (v10)
  {
    double v19 = v18;
    unint64_t v20 = 0;
    double v21 = MidY - v17 * 0.5;
    do
    {
      -[RCPlaybackSettingsSlider valueForTickNumber:](self, "valueForTickNumber:", v20, *(void *)&v30);
      -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:");
      v23 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v22 - v15 * 0.5, v21, v15, v17, v19);
      BOOL v25 = v12 <= v20 && v20 <= v11;
      if (v11 <= v20 && v20 <= v12) {
        BOOL v25 = 1;
      }
      v27 = v31;
      if (v25) {
        v27 = v8;
      }
      [v27 addObject:v23];

      ++v20;
    }
    while (v10 != v20);
  }
  id v28 = [v31 copy:v30];
  [(RCPlaybackSettingsSlider *)self setRegularTickPaths:v28];

  id v29 = [v8 copy];
  [(RCPlaybackSettingsSlider *)self setTintedTickPaths:v29];
}

- (void)_createTrackPathsForTrackRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = +[NSMutableArray array];
  double v8 = +[NSMutableArray array];
  [(RCPlaybackSettingsSlider *)self value];
  double v10 = v9;
  [(RCPlaybackSettingsSlider *)self _defaultStartingValue];
  double v12 = v11;
  -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v10, x, y, width, height);
  double v14 = v13;
  -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v12, x, y, width, height);
  if (v14 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  if (v14 < v15) {
    double v14 = v15;
  }
  double v17 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, v16 - x, height);
  [v22 addObject:v17];

  double v18 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v14, y, x + width - v14, height);
  [v22 addObject:v18];

  double v19 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, y, v14 - v16, height);
  [v8 addObject:v19];

  id v20 = [v22 copy];
  [(RCPlaybackSettingsSlider *)self setRegularTrackPaths:v20];

  id v21 = [v8 copy];
  [(RCPlaybackSettingsSlider *)self setTintedTrackPaths:v21];
}

- (void)_hideDefaultSliderViews
{
  objc_super v3 = [(RCPlaybackSettingsSlider *)self _minTrackView];
  [v3 setHidden:1];

  id v4 = [(RCPlaybackSettingsSlider *)self _maxTrackView];
  [v4 setHidden:1];
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(RCPlaybackSettingsSlider *)self valueForTickNumber:[(RCPlaybackSettingsSlider *)self tickNumberForValue:a3]];
  double v7 = v6;
  [(RCPlaybackSettingsSlider *)self value];
  if (v7 != v8)
  {
    id v9 = [objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
    [v9 prepare];
    *(float *)&double v10 = v7;
    v15.receiver = self;
    v15.super_class = (Class)RCPlaybackSettingsSlider;
    [(RCPlaybackSettingsSlider *)&v15 setValue:v4 animated:v10];
    [v9 impactOccurred];
    double v11 = +[NSString stringWithFormat:@"%g", *(void *)&v7];
    double v12 = +[NSBundle mainBundle];
    double v13 = [v12 localizedStringForKey:@"PLAYBACK_SPEED_SLIDER_AX_VALUE" value:&stru_100228BC8 table:0];
    double v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);

    [(RCPlaybackSettingsSlider *)self setAccessibilityValue:v14];
  }
}

- (CGRect)trackRect
{
  [(RCPlaybackSettingsSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[RCPlaybackSettingsSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v46 = v15;
  double v18 = v17;
  [(RCPlaybackSettingsSlider *)self minimumValue];
  LODWORD(v40) = v19;
  -[RCPlaybackSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v40);
  CGFloat v44 = v21;
  CGFloat v45 = v20;
  CGFloat v43 = v22;
  CGFloat v24 = v23;
  [(RCPlaybackSettingsSlider *)self maximumValue];
  LODWORD(v41) = v25;
  -[RCPlaybackSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v46, v18, v41);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  v47.origin.double x = v45;
  v47.origin.double y = v44;
  v47.size.double width = v43;
  v47.size.double height = v24;
  double MidX = CGRectGetMidX(v47);
  v48.origin.double x = v27;
  v48.origin.double y = v29;
  v48.size.double width = v31;
  v48.size.double height = v33;
  double v34 = CGRectGetMidX(v48);
  v49.origin.double x = v45;
  v49.origin.double y = v44;
  v49.size.double width = v43;
  v49.size.double height = v24;
  CGFloat MidY = CGRectGetMidY(v49);
  double v36 = v34 - MidX;
  double v37 = v18;
  double v38 = MidY - v18 * 0.5;
  double v39 = v12 + (v46 - (v34 - MidX)) * 0.5;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v38;
  result.origin.double x = v39;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RCPlaybackSettingsSlider;
  -[RCPlaybackSettingsSlider trackRectForBounds:](&v16, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v9 playbackSpeedSliderHeight];
  double v11 = v10;

  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (unint64_t)tickNumberForValue:(double)a3
{
  [(RCPlaybackSettingsSlider *)self offsetBetweenTicks];
  double v6 = v5;
  [(RCPlaybackSettingsSlider *)self minimumValue];
  float v8 = (a3 - v7) / v6;
  return vcvtas_u32_f32(v8);
}

- (double)valueForTickNumber:(unint64_t)a3
{
  [(RCPlaybackSettingsSlider *)self offsetBetweenTicks];
  double v6 = v5;
  [(RCPlaybackSettingsSlider *)self minimumValue];
  return v7 + (double)a3 * v6;
}

- (double)xPositionWithSelectedTickValue:(double)a3 forTrackRect:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  [(RCPlaybackSettingsSlider *)self maximumValue];
  float v9 = v8;
  [(RCPlaybackSettingsSlider *)self minimumValue];
  double v11 = width / (float)(v9 - v10);
  [(RCPlaybackSettingsSlider *)self minimumValue];
  return x + (a3 - v12) * v11;
}

- (double)offsetBetweenTicks
{
  [(RCPlaybackSettingsSlider *)self maximumValue];
  float v4 = v3;
  [(RCPlaybackSettingsSlider *)self minimumValue];
  return (float)((float)(v4 - v5) / (float)([(RCPlaybackSettingsSlider *)self numberOfTicks] - 1));
}

- (unint64_t)tickNumberForDefaultValue
{
  [(RCPlaybackSettingsSlider *)self _defaultStartingValue];

  return -[RCPlaybackSettingsSlider tickNumberForValue:](self, "tickNumberForValue:");
}

- (unint64_t)tickNumberForSelectedValue
{
  [(RCPlaybackSettingsSlider *)self value];
  double v4 = v3;

  return [(RCPlaybackSettingsSlider *)self tickNumberForValue:v4];
}

- (unint64_t)numberOfTicks
{
  return 7;
}

- (double)_minimumValue
{
  return 0.5;
}

- (double)_maximumValue
{
  return 2.0;
}

- (double)_defaultStartingValue
{
  return 1.0;
}

- (NSArray)regularTickPaths
{
  return self->_regularTickPaths;
}

- (void)setRegularTickPaths:(id)a3
{
}

- (NSArray)tintedTickPaths
{
  return self->_tintedTickPaths;
}

- (void)setTintedTickPaths:(id)a3
{
}

- (NSArray)regularTrackPaths
{
  return self->_regularTrackPaths;
}

- (void)setRegularTrackPaths:(id)a3
{
}

- (NSArray)tintedTrackPaths
{
  return self->_tintedTrackPaths;
}

- (void)setTintedTrackPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedTrackPaths, 0);
  objc_storeStrong((id *)&self->_regularTrackPaths, 0);
  objc_storeStrong((id *)&self->_tintedTickPaths, 0);

  objc_storeStrong((id *)&self->_regularTickPaths, 0);
}

@end