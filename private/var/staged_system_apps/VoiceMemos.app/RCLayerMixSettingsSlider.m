@interface RCLayerMixSettingsSlider
- (CGRect)trackRect;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (NSArray)regularTickPaths;
- (NSArray)regularTrackPaths;
- (NSArray)tintedTickPaths;
- (NSArray)tintedTrackPaths;
- (RCLayerMixSettingsSlider)init;
- (_RCLayerMixSnapValue)snapValueForValue:(float)a3;
- (double)xPositionWithSelectedTickValue:(double)a3 forTrackRect:(CGRect)a4;
- (float)_defaultStartingValue;
- (float)_maximumValue;
- (float)_minimumValue;
- (float)offsetBetweenTicks;
- (float)snapThresholdPercentage;
- (float)unroundedTickNumberForValue:(float)a3;
- (float)valueForTickNumber:(unint64_t)a3;
- (id)balanceSliderImageForLayerNumber:(unint64_t)a3 muted:(BOOL)a4;
- (unint64_t)numberOfTicks;
- (unint64_t)tickNumberForDefaultValue;
- (void)_createTickPathsForTrackRect:(CGRect)a3;
- (void)_createTrackPathsForTrackRect:(CGRect)a3;
- (void)_drawBezierPaths:(id)a3 tinted:(BOOL)a4;
- (void)_hideDefaultSliderViews;
- (void)_updateMinMaxImages;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setRegularTickPaths:(id)a3;
- (void)setRegularTrackPaths:(id)a3;
- (void)setSnapThresholdPercentage:(float)a3;
- (void)setTintedTickPaths:(id)a3;
- (void)setTintedTrackPaths:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation RCLayerMixSettingsSlider

- (RCLayerMixSettingsSlider)init
{
  v15.receiver = self;
  v15.super_class = (Class)RCLayerMixSettingsSlider;
  v2 = [(RCLayerMixSettingsSlider *)&v15 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1036831949;
    [(RCLayerMixSettingsSlider *)v2 setSnapThresholdPercentage:v3];
    v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    v6 = [(RCLayerMixSettingsSlider *)v4 balanceSliderImageForLayerNumber:1 muted:0];
    [(RCLayerMixSettingsSlider *)v4 setMinimumValueImage:v6];

    v7 = [v5 playbackSpeedSliderImageColor];
    v8 = [(RCLayerMixSettingsSlider *)v4 _minValueView];
    [v8 setTintColor:v7];

    v9 = [(RCLayerMixSettingsSlider *)v4 balanceSliderImageForLayerNumber:2 muted:0];
    [(RCLayerMixSettingsSlider *)v4 setMaximumValueImage:v9];

    v10 = [v5 playbackSpeedSliderImageColor];
    v11 = [(RCLayerMixSettingsSlider *)v4 _maxValueView];
    [v11 setTintColor:v10];

    [(RCLayerMixSettingsSlider *)v4 _minimumValue];
    -[RCLayerMixSettingsSlider setMinimumValue:](v4, "setMinimumValue:");
    [(RCLayerMixSettingsSlider *)v4 _maximumValue];
    -[RCLayerMixSettingsSlider setMaximumValue:](v4, "setMaximumValue:");
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"LAYER_MIX_SLIDER" value:&stru_100228BC8 table:0];
    [(RCLayerMixSettingsSlider *)v4 setAccessibilityLabel:v13];

    [(RCLayerMixSettingsSlider *)v4 setContinuous:0];
  }
  return v4;
}

- (id)balanceSliderImageForLayerNumber:(unint64_t)a3 muted:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  v7 = [v6 multitrackImageForLayerNumber:a3 rounded:0 slash:v4 circleFill:1];
  v8 = +[UIImageSymbolConfiguration configurationWithScale:3];
  v9 = +[UIImageSymbolConfiguration configurationWithWeight:7];
  v10 = [v8 configurationByApplyingConfiguration:v9];

  if (v4)
  {
    v11 = +[UIColor systemBackgroundColor];
    v18[0] = v11;
    v12 = +[UIColor secondaryLabelColor];
    v18[1] = v12;
    v13 = +[NSArray arrayWithObjects:v18 count:2];
    v14 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v13];
    uint64_t v15 = [v10 configurationByApplyingConfiguration:v14];

    v10 = (void *)v15;
  }
  v16 = [v7 imageWithConfiguration:v10];

  return v16;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCLayerMixSettingsSlider;
  [(RCLayerMixSettingsSlider *)&v3 layoutSubviews];
  [(RCLayerMixSettingsSlider *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  [(RCLayerMixSettingsSlider *)self _hideDefaultSliderViews];
  [(RCLayerMixSettingsSlider *)self trackRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[RCLayerMixSettingsSlider _createTickPathsForTrackRect:](self, "_createTickPathsForTrackRect:");
  -[RCLayerMixSettingsSlider _createTrackPathsForTrackRect:](self, "_createTrackPathsForTrackRect:", v5, v7, v9, v11);
  v12 = [(RCLayerMixSettingsSlider *)self regularTrackPaths];
  v13 = [(RCLayerMixSettingsSlider *)self regularTickPaths];
  id v17 = [v12 arrayByAddingObjectsFromArray:v13];

  [(RCLayerMixSettingsSlider *)self _drawBezierPaths:v17 tinted:0];
  v14 = [(RCLayerMixSettingsSlider *)self tintedTrackPaths];
  uint64_t v15 = [(RCLayerMixSettingsSlider *)self tintedTickPaths];
  v16 = [v14 arrayByAddingObjectsFromArray:v15];

  [(RCLayerMixSettingsSlider *)self _drawBezierPaths:v16 tinted:1];
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
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v32 = +[NSMutableArray array];
  double v8 = +[NSMutableArray array];
  double v31 = x;
  v34.origin.CGFloat x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  double MidY = CGRectGetMidY(v34);
  unint64_t v10 = [(RCLayerMixSettingsSlider *)self numberOfTicks];
  unint64_t v11 = [(RCLayerMixSettingsSlider *)self tickNumberForDefaultValue];
  [(RCLayerMixSettingsSlider *)self value];
  id v12 = -[RCLayerMixSettingsSlider snapValueForValue:](self, "snapValueForValue:");
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
      -[RCLayerMixSettingsSlider valueForTickNumber:](self, "valueForTickNumber:", v20, *(void *)&v31);
      -[RCLayerMixSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v22, v31, y, width, height);
      v24 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v23 - v15 * 0.5, v21, v15, v17, v19);
      BOOL v26 = (unint64_t)v12 <= v20 && v20 <= v11;
      if (v11 <= v20 && v20 <= (unint64_t)v12) {
        BOOL v26 = 1;
      }
      v28 = v32;
      if (v26) {
        v28 = v8;
      }
      [v28 addObject:v24];

      ++v20;
    }
    while (v10 != v20);
  }
  id v29 = [v32 copy:v31];
  [(RCLayerMixSettingsSlider *)self setRegularTickPaths:v29];

  id v30 = [v8 copy];
  [(RCLayerMixSettingsSlider *)self setTintedTickPaths:v30];
}

- (void)_createTrackPathsForTrackRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v22 = +[NSMutableArray array];
  double v8 = +[NSMutableArray array];
  [(RCLayerMixSettingsSlider *)self value];
  double v10 = v9;
  [(RCLayerMixSettingsSlider *)self _defaultStartingValue];
  double v12 = v11;
  -[RCLayerMixSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v10, x, y, width, height);
  double v14 = v13;
  -[RCLayerMixSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v12, x, y, width, height);
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
  [(RCLayerMixSettingsSlider *)self setRegularTrackPaths:v20];

  id v21 = [v8 copy];
  [(RCLayerMixSettingsSlider *)self setTintedTrackPaths:v21];
}

- (void)_hideDefaultSliderViews
{
  objc_super v3 = [(RCLayerMixSettingsSlider *)self _minTrackView];
  [v3 setHidden:1];

  id v4 = [(RCLayerMixSettingsSlider *)self _maxTrackView];
  [v4 setHidden:1];
}

- (void)_updateMinMaxImages
{
  [(RCLayerMixSettingsSlider *)self value];
  BOOL v4 = v3 == 1.0;
  [(RCLayerMixSettingsSlider *)self value];
  BOOL v6 = v5 == -1.0;
  double v7 = [(RCLayerMixSettingsSlider *)self balanceSliderImageForLayerNumber:1 muted:v4];
  [(RCLayerMixSettingsSlider *)self setMinimumValueImage:v7];

  id v8 = [(RCLayerMixSettingsSlider *)self balanceSliderImageForLayerNumber:2 muted:v6];
  [(RCLayerMixSettingsSlider *)self setMaximumValueImage:v8];
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[RCLayerMixSettingsSlider snapValueForValue:](self, "snapValueForValue:");
  uint64_t v7 = v6;
  float v8 = *(float *)&v6;
  [(RCLayerMixSettingsSlider *)self value];
  if (*(float *)&v9 != v8)
  {
    float v10 = *(float *)&v9;
    if ((v7 & 0x100000000) != 0)
    {
      id v11 = [objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
      [v11 prepare];
      [v11 impactOccurred];
    }
    v16.receiver = self;
    v16.super_class = (Class)RCLayerMixSettingsSlider;
    *(float *)&double v9 = v8;
    [(RCLayerMixSettingsSlider *)&v16 setValue:v4 animated:v9];
    double v12 = +[NSString stringWithFormat:@"%d", llroundf(v8 * 100.0)];
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"LAYER_MIX_SLIDER_AX_VALUE" value:&stru_100228BC8 table:0];
    double v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

    [(RCLayerMixSettingsSlider *)self setAccessibilityValue:v15];
    if (v10 == -1.0 || v10 == 1.0 || v8 == 1.0 || v8 == -1.0) {
      [(RCLayerMixSettingsSlider *)self _updateMinMaxImages];
    }
  }
}

- (CGRect)trackRect
{
  [(RCLayerMixSettingsSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[RCLayerMixSettingsSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v46 = v15;
  double v18 = v17;
  [(RCLayerMixSettingsSlider *)self minimumValue];
  LODWORD(v40) = v19;
  -[RCLayerMixSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v40);
  CGFloat v44 = v21;
  CGFloat v45 = v20;
  CGFloat v43 = v22;
  CGFloat v24 = v23;
  [(RCLayerMixSettingsSlider *)self maximumValue];
  LODWORD(v41) = v25;
  -[RCLayerMixSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v46, v18, v41);
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
  v16.super_class = (Class)RCLayerMixSettingsSlider;
  -[RCLayerMixSettingsSlider trackRectForBounds:](&v16, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (_RCLayerMixSnapValue)snapValueForValue:(float)a3
{
  -[RCLayerMixSettingsSlider unroundedTickNumberForValue:](self, "unroundedTickNumberForValue:");
  float v6 = v5;
  if (vcvtms_s32_f32(v6 - self->_snapThresholdPercentage) == vcvtms_s32_f32(v6 + self->_snapThresholdPercentage))
  {
    [(RCLayerMixSettingsSlider *)self _defaultStartingValue];
    double v7 = 0;
    float v8 = floorf(v6);
    float v9 = ceilf(v6);
    if (v10 >= a3) {
      float v11 = v9;
    }
    else {
      float v11 = v8;
    }
    unint64_t v12 = (unint64_t)v11;
  }
  else
  {
    unint64_t v12 = vcvtas_u32_f32(v5);
    [(RCLayerMixSettingsSlider *)self valueForTickNumber:v12];
    a3 = v13;
    double v7 = &_mh_execute_header;
  }
  unint64_t v14 = (unint64_t)v7 | LODWORD(a3);
  unint64_t v15 = v12;
  result.var1 = *(float *)&v14;
  result.var2 = BYTE4(v14);
  result.var0 = v15;
  return result;
}

- (float)unroundedTickNumberForValue:(float)a3
{
  [(RCLayerMixSettingsSlider *)self minimumValue];
  float v6 = a3 - v5;
  [(RCLayerMixSettingsSlider *)self offsetBetweenTicks];
  return v6 / v7;
}

- (float)valueForTickNumber:(unint64_t)a3
{
  [(RCLayerMixSettingsSlider *)self offsetBetweenTicks];
  float v6 = v5;
  [(RCLayerMixSettingsSlider *)self minimumValue];
  return v7 + (float)((float)a3 * v6);
}

- (double)xPositionWithSelectedTickValue:(double)a3 forTrackRect:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  [(RCLayerMixSettingsSlider *)self maximumValue];
  float v9 = v8;
  [(RCLayerMixSettingsSlider *)self minimumValue];
  double v11 = width / (float)(v9 - v10);
  [(RCLayerMixSettingsSlider *)self minimumValue];
  return x + (a3 - v12) * v11;
}

- (float)offsetBetweenTicks
{
  [(RCLayerMixSettingsSlider *)self maximumValue];
  float v4 = v3;
  [(RCLayerMixSettingsSlider *)self minimumValue];
  return (float)(v4 - v5) / (float)([(RCLayerMixSettingsSlider *)self numberOfTicks] - 1);
}

- (unint64_t)tickNumberForDefaultValue
{
  [(RCLayerMixSettingsSlider *)self _defaultStartingValue];
  float v4 = v3;
  [(RCLayerMixSettingsSlider *)self minimumValue];
  float v6 = v4 - v5;
  [(RCLayerMixSettingsSlider *)self offsetBetweenTicks];
  return vcvtas_u32_f32(v6 / v7);
}

- (unint64_t)numberOfTicks
{
  return 3;
}

- (float)_minimumValue
{
  return -1.0;
}

- (float)_maximumValue
{
  return 1.0;
}

- (float)_defaultStartingValue
{
  return 0.0;
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

- (float)snapThresholdPercentage
{
  return self->_snapThresholdPercentage;
}

- (void)setSnapThresholdPercentage:(float)a3
{
  self->_snapThresholdPercentage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedTrackPaths, 0);
  objc_storeStrong((id *)&self->_regularTrackPaths, 0);
  objc_storeStrong((id *)&self->_tintedTickPaths, 0);

  objc_storeStrong((id *)&self->_regularTickPaths, 0);
}

@end