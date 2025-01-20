@interface PUPhotoEditAdjustmentControl
- (BOOL)_setContentPropertyKey:(id)a3 withValue:(id)a4 forState:(unint64_t)a5;
- (BOOL)displayMappedValue;
- (BOOL)shouldScaleDownImage;
- (BOOL)shouldShowCircularRing;
- (BOOL)shouldShowValueLabel;
- (BOOL)valueChanged;
- (NSMapTable)stateToContentMap;
- (NSNumberFormatter)formatter;
- (PUPhotoEditAdjustmentControl)initWithFrame:(CGRect)a3;
- (PUPhotoEditCircularIndicatorView)circularIndicatorView;
- (UIColor)alternateColor;
- (UIColor)defaultColor;
- (UIImageView)imageView;
- (UILabel)valueLabel;
- (double)defaultValue;
- (double)identityValue;
- (double)maxValue;
- (double)minValue;
- (double)value;
- (id)_contentForState:(unint64_t)a3;
- (id)_currentImage;
- (id)colorForState:(unint64_t)a3;
- (id)imageForState:(unint64_t)a3;
- (void)_layoutImageView;
- (void)_resetAllValues;
- (void)_setContent:(id)a3 forState:(unint64_t)a4;
- (void)_setup;
- (void)_setupImageView;
- (void)_updateFormatter;
- (void)_updateImageView;
- (void)_updateRingVisibility;
- (void)_updateSubviewColors;
- (void)_updateSubviewValues;
- (void)_updateSubviewVisibility;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)resetToDefaults;
- (void)setAlternateColor:(id)a3;
- (void)setCircularIndicatorView:(id)a3;
- (void)setColor:(id)a3 forState:(unint64_t)a4;
- (void)setDefaultColor:(id)a3;
- (void)setDefaultValue:(double)a3;
- (void)setDisplayMappedValue:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFormatter:(id)a3;
- (void)setIdentityValue:(double)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImageView:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldScaleDownImage:(BOOL)a3;
- (void)setShouldShowCircularRing:(BOOL)a3;
- (void)setShouldShowValueLabel:(BOOL)a3;
- (void)setStateToContentMap:(id)a3;
- (void)setValue:(double)a3;
- (void)setValueChanged:(BOOL)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation PUPhotoEditAdjustmentControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_stateToContentMap, 0);
  objc_storeStrong((id *)&self->_circularIndicatorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_alternateColor, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
}

- (void)setFormatter:(id)a3
{
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void)setValueChanged:(BOOL)a3
{
  self->_valueChanged = a3;
}

- (BOOL)valueChanged
{
  return self->_valueChanged;
}

- (void)setStateToContentMap:(id)a3
{
}

- (NSMapTable)stateToContentMap
{
  return self->_stateToContentMap;
}

- (void)setCircularIndicatorView:(id)a3
{
}

- (PUPhotoEditCircularIndicatorView)circularIndicatorView
{
  return self->_circularIndicatorView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setShouldScaleDownImage:(BOOL)a3
{
  self->_shouldScaleDownImage = a3;
}

- (BOOL)shouldScaleDownImage
{
  return self->_shouldScaleDownImage;
}

- (void)setAlternateColor:(id)a3
{
}

- (UIColor)alternateColor
{
  return self->_alternateColor;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (BOOL)shouldShowCircularRing
{
  return self->_shouldShowCircularRing;
}

- (BOOL)displayMappedValue
{
  return self->_displayMappedValue;
}

- (BOOL)shouldShowValueLabel
{
  return self->_shouldShowValueLabel;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setIdentityValue:(double)a3
{
  self->_identityValue = a3;
}

- (double)identityValue
{
  return self->_identityValue;
}

- (void)setDefaultValue:(double)a3
{
  self->_defaultValue = a3;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (double)value
{
  return self->_value;
}

- (void)_updateSubviewValues
{
  [(PUPhotoEditAdjustmentControl *)self minValue];
  double v4 = v3;
  [(PUPhotoEditAdjustmentControl *)self identityValue];
  double v5 = 0.0;
  if (v4 < v6)
  {
    v7 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
    [v7 minValue];
    double v5 = v8;
  }
  [(PUPhotoEditAdjustmentControl *)self value];
  double v10 = v9;
  [(PUPhotoEditAdjustmentControl *)self minValue];
  double v12 = v11;
  [(PUPhotoEditAdjustmentControl *)self identityValue];
  double v14 = v13;
  [(PUPhotoEditAdjustmentControl *)self maxValue];
  double v16 = v15;
  v17 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v17 maxValue];
  if (v16 > v12)
  {
    if (v10 >= v14)
    {
      if (v16 > v14)
      {
        double v19 = (v10 - v14) * v18 / (v16 - v14) + 0.0;
        goto LABEL_10;
      }
    }
    else if (v14 > v12)
    {
      double v19 = v5 + (0.0 - v5) * (v10 - v12) / (v14 - v12);
      goto LABEL_10;
    }
  }
  double v19 = 2.22507386e-308;
LABEL_10:

  if (round(v19 * 100.0) / 100.0 == 0.0) {
    double v19 = 0.0;
  }
  v20 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v20 setCurrentValue:v19];

  if (![(PUPhotoEditAdjustmentControl *)self displayMappedValue])
  {
    [(PUPhotoEditAdjustmentControl *)self value];
    double v19 = v21;
  }
  formatter = self->_formatter;
  id v25 = [NSNumber numberWithDouble:v19];
  v23 = [(NSNumberFormatter *)formatter stringFromNumber:v25];
  v24 = [(PUPhotoEditAdjustmentControl *)self valueLabel];
  [v24 setText:v23];
}

- (void)_updateFormatter
{
  if ([(PUPhotoEditAdjustmentControl *)self displayMappedValue]) {
    double v3 = &unk_1F078CFC8;
  }
  else {
    double v3 = &unk_1F078CFE0;
  }
  id v4 = [(PUPhotoEditAdjustmentControl *)self formatter];
  [v4 setMultiplier:v3];
}

- (void)_updateSubviewColors
{
  double v3 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v3 currentValue];
  double v5 = v4;

  if (v5 <= 0.0) {
    uint64_t v6 = 504;
  }
  else {
    uint64_t v6 = 512;
  }
  v7 = *(Class *)((char *)&self->super.super.super.super.isa + v6);
  double v8 = [(PUPhotoEditAdjustmentControl *)self traitCollection];
  double v9 = [v7 resolvedColorWithTraitCollection:v8];
  double v10 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v10 setRingColor:v9];

  id v13 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  double v11 = [v13 ringColor];
  double v12 = [(PUPhotoEditAdjustmentControl *)self valueLabel];
  [v12 setTextColor:v11];
}

- (void)_updateSubviews
{
  [(PUPhotoEditAdjustmentControl *)self _updateSubviewValues];
  [(PUPhotoEditAdjustmentControl *)self _updateSubviewColors];
}

- (void)_updateSubviewVisibility
{
  if ([(PUPhotoEditAdjustmentControl *)self shouldShowValueLabel]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  double v4 = [(PUPhotoEditAdjustmentControl *)self imageView];
  [v4 setAlpha:v3];

  if ([(PUPhotoEditAdjustmentControl *)self shouldShowValueLabel]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = [(PUPhotoEditAdjustmentControl *)self valueLabel];
  [v6 setAlpha:v5];
}

- (void)_updateRingVisibility
{
  if ([(PUPhotoEditAdjustmentControl *)self shouldShowCircularRing]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v4 setAlpha:v3];
}

- (void)_updateImageView
{
  uint64_t v3 = [(PUPhotoEditAdjustmentControl *)self imageForState:[(PUPhotoEditAdjustmentControl *)self state]];
  id v5 = (id)v3;
  if (v3)
  {
    [(PUPhotoEditAdjustmentControl *)self _setupImageView];
    p_imageView = &self->_imageView;
    [(UIImageView *)*p_imageView setImage:v5];
    uint64_t v3 = (uint64_t)v5;
  }
  else
  {
    p_imageView = &self->_imageView;
  }
  [(UIImageView *)*p_imageView setHidden:v3 == 0];
}

- (void)setShouldShowCircularRing:(BOOL)a3
{
  if (self->_shouldShowCircularRing != a3)
  {
    self->_shouldShowCircularRing = a3;
    [(PUPhotoEditAdjustmentControl *)self _updateRingVisibility];
  }
}

- (void)setDisplayMappedValue:(BOOL)a3
{
  if (self->_displayMappedValue != a3)
  {
    self->_displayMappedValue = a3;
    [(PUPhotoEditAdjustmentControl *)self _updateFormatter];
  }
}

- (void)setShouldShowValueLabel:(BOOL)a3
{
  if (self->_shouldShowValueLabel != a3)
  {
    self->_shouldShowValueLabel = a3;
    [(PUPhotoEditAdjustmentControl *)self _updateSubviewVisibility];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    [(PUPhotoEditAdjustmentControl *)self minValue];
    [(PUPhotoEditAdjustmentControl *)self maxValue];
    PXClamp();
    self->_value = v4;
    [(PUPhotoEditAdjustmentControl *)self _updateSubviews];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotoEditAdjustmentControl *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotoEditAdjustmentControl;
    [(PUPhotoEditAdjustmentControl *)&v5 setEnabled:v3];
    [(PUPhotoEditAdjustmentControl *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotoEditAdjustmentControl *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotoEditAdjustmentControl;
    [(PUPhotoEditAdjustmentControl *)&v5 setSelected:v3];
    [(PUPhotoEditAdjustmentControl *)self setNeedsLayout];
  }
}

- (void)setDefaultColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_defaultColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_defaultColor, a3);
    [(PUPhotoEditAdjustmentControl *)self _updateSubviewColors];
    objc_super v5 = v6;
  }
}

- (id)_currentImage
{
  uint64_t v3 = [(PUPhotoEditAdjustmentControl *)self state];
  return [(PUPhotoEditAdjustmentControl *)self imageForState:v3];
}

- (id)colorForState:(unint64_t)a3
{
  double v4 = [(PUPhotoEditAdjustmentControl *)self _contentForState:a3];
  objc_super v5 = [v4 color];

  if (!v5)
  {
    id v6 = [(PUPhotoEditAdjustmentControl *)self _contentForState:0];
    objc_super v5 = [v6 color];
  }
  return v5;
}

- (void)setColor:(id)a3 forState:(unint64_t)a4
{
}

- (id)imageForState:(unint64_t)a3
{
  double v4 = [(PUPhotoEditAdjustmentControl *)self _contentForState:a3];
  objc_super v5 = [v4 image];

  if (!v5)
  {
    id v6 = [(PUPhotoEditAdjustmentControl *)self _contentForState:0];
    objc_super v5 = [v6 image];
  }
  return v5;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  if ([(PUPhotoEditAdjustmentControl *)self _setContentPropertyKey:@"image" withValue:a3 forState:a4])
  {
    [(PUPhotoEditAdjustmentControl *)self _updateImageView];
  }
}

- (BOOL)_setContentPropertyKey:(id)a3 withValue:(id)a4 forState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(PUPhotoEditAdjustmentControl *)self _contentForState:a5];
  if (!v10)
  {
    double v10 = objc_alloc_init(PUPhotoEditAdjustmentControlContent);
    [(PUPhotoEditAdjustmentControl *)self _setContent:v10 forState:a5];
  }
  id v11 = [(PUPhotoEditAdjustmentControlContent *)v10 valueForKey:v8];
  if (v11 == v9) {
    LOBYTE(v12) = 0;
  }
  else {
    int v12 = [v9 isEqual:v11] ^ 1;
  }
  [(PUPhotoEditAdjustmentControlContent *)v10 setValue:v9 forKey:v8];

  return v12;
}

- (id)_contentForState:(unint64_t)a3
{
  if (self->_stateToContentMap)
  {
    double v4 = [(PUPhotoEditAdjustmentControl *)self stateToContentMap];
    objc_super v5 = [NSNumber numberWithUnsignedInteger:a3];
    id v6 = [v4 objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  id v10 = a3;
  if (!self->_stateToContentMap)
  {
    id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    stateToContentMap = self->_stateToContentMap;
    self->_stateToContentMap = v6;
  }
  id v8 = [(PUPhotoEditAdjustmentControl *)self stateToContentMap];
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  if (v10) {
    [v8 setObject:v10 forKey:v9];
  }
  else {
    [v8 removeObjectForKey:v9];
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PUPhotoEditAdjustmentControl;
  [(PUPhotoEditAdjustmentControl *)&v21 layoutSubviews];
  [(PUPhotoEditAdjustmentControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PUPhotoEditAdjustmentControl *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(PUPhotoEditAdjustmentControl *)self valueLabel];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(PUPhotoEditAdjustmentControl *)self _updateImageView];
  [(PUPhotoEditAdjustmentControl *)self _layoutImageView];
  [(PUPhotoEditAdjustmentControl *)self _updateRingVisibility];
}

- (void)_layoutImageView
{
  imageView = self->_imageView;
  if (imageView && ([(UIImageView *)imageView isHidden] & 1) == 0)
  {
    [(PUPhotoEditAdjustmentControl *)self bounds];
    double v5 = v4;
    [(PUPhotoEditAdjustmentControl *)self bounds];
    -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v5);
    [(PUPhotoEditAdjustmentControl *)self bounds];
    PXRectGetCenter();
    double v7 = v6;
    double v9 = v8;
    id v10 = [(PUPhotoEditAdjustmentControl *)self imageView];
    objc_msgSend(v10, "setCenter:", v7, v9);
  }
}

- (void)_setupImageView
{
  if (!self->_imageView)
  {
    [(PUPhotoEditAdjustmentControl *)self bounds];
    double v4 = v3;
    [(PUPhotoEditAdjustmentControl *)self bounds];
    double v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v4, v5);
    imageView = self->_imageView;
    self->_imageView = v6;

    [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
    double v8 = self->_imageView;
    valueLabel = self->_valueLabel;
    [(PUPhotoEditAdjustmentControl *)self insertSubview:v8 belowSubview:valueLabel];
  }
}

- (void)resetToDefaults
{
  double v3 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v3 resetToDefaults];

  [(PUPhotoEditAdjustmentControl *)self _resetAllValues];
}

- (void)_resetAllValues
{
  [(PUPhotoEditAdjustmentControl *)self setValue:0.0];
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_defaultValue = 0.0;
  self->_identityValue = 0.0;
  defaultColor = self->_defaultColor;
  id v4 = [(PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v4 setRingColor:defaultColor];
}

- (void)_setup
{
  id v20 = +[PUInterfaceManager currentTheme];
  double v3 = [v20 photoEditingAdjustmentControlDefaultColor];
  defaultColor = self->_defaultColor;
  self->_defaultColor = v3;

  double v5 = [v20 photoEditingAdjustmentControlAlternateColor];
  alternateColor = self->_alternateColor;
  self->_alternateColor = v5;

  double v7 = [PUPhotoEditCircularIndicatorView alloc];
  [(PUPhotoEditAdjustmentControl *)self bounds];
  double v8 = -[PUPhotoEditCircularIndicatorView initWithFrame:](v7, "initWithFrame:");
  circularIndicatorView = self->_circularIndicatorView;
  self->_circularIndicatorView = v8;

  [(PUPhotoEditCircularIndicatorView *)self->_circularIndicatorView setRingColor:self->_defaultColor];
  [(PUPhotoEditCircularIndicatorView *)self->_circularIndicatorView setUserInteractionEnabled:0];
  [(PUPhotoEditAdjustmentControl *)self addSubview:self->_circularIndicatorView];
  id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
  [(PUPhotoEditAdjustmentControl *)self bounds];
  id v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:");
  valueLabel = self->_valueLabel;
  self->_valueLabel = v11;

  double v13 = PXMonospacedNumberFontWithSizeAndWeight();
  [(UILabel *)self->_valueLabel setFont:v13];
  [(UILabel *)self->_valueLabel setTextAlignment:1];
  [(UILabel *)self->_valueLabel setTextColor:self->_defaultColor];
  double v14 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  formatter = self->_formatter;
  self->_formatter = v15;

  [(NSNumberFormatter *)self->_formatter setLocale:v14];
  [(NSNumberFormatter *)self->_formatter setMultiplier:&unk_1F078CFC8];
  [(NSNumberFormatter *)self->_formatter setRoundingMode:4];
  double v17 = self->_formatter;
  double v18 = [NSNumber numberWithDouble:self->_value];
  double v19 = [(NSNumberFormatter *)v17 stringFromNumber:v18];
  [(UILabel *)self->_valueLabel setText:v19];

  [(UILabel *)self->_valueLabel setAlpha:0.0];
  [(PUPhotoEditAdjustmentControl *)self addSubview:self->_valueLabel];
  self->_shouldShowCircularRing = 1;
  self->_shouldScaleDownImage = 1;
  self->_displayMappedValue = 1;
}

- (PUPhotoEditAdjustmentControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentControl;
  double v3 = -[PUPhotoEditAdjustmentControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_minValue = -1.0;
    v3->_maxValue = 1.0;
    v3->_value = 0.0;
    v3->_defaultValue = 0.0;
    v3->_identityValue = 0.0;
    [(PUPhotoEditAdjustmentControl *)v3 _setup];
    [(PUPhotoEditAdjustmentControl *)v4 setContentMode:3];
  }
  return v4;
}

@end