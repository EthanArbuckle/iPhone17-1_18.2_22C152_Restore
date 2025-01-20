@interface MapsDebugSliderTableRow
- (MapsDebugSliderTableRow)init;
- (NSString)subtitleFormatString;
- (float)maximum;
- (float)minimum;
- (id)_createSliderForIdiom:(int64_t)a3;
- (id)get;
- (id)set;
- (id)subtitleHandler;
- (id)validate;
- (int64_t)cellStyle;
- (void)_sliderDidChangeValue:(id)a3;
- (void)_updateSecondaryText:(float)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)invalidate;
- (void)setGet:(id)a3;
- (void)setMaximum:(float)a3;
- (void)setMinimum:(float)a3;
- (void)setSet:(id)a3;
- (void)setSubtitleFormatString:(id)a3;
- (void)setSubtitleHandler:(id)a3;
- (void)setValidate:(id)a3;
@end

@implementation MapsDebugSliderTableRow

- (MapsDebugSliderTableRow)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsDebugSliderTableRow;
  v2 = [(MapsDebugTableRow *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MapsDebugSliderTableRow *)v2 setSubtitleFormatString:@"%f"];
    v3->_minimum = 0.0;
    v3->_maximum = 100.0;
  }
  return v3;
}

- (void)invalidate
{
  [(MapsDebugSliderTableRow *)self setGet:0];
  [(MapsDebugSliderTableRow *)self setSet:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugSliderTableRow;
  [(MapsDebugTableRow *)&v3 invalidate];
}

- (float)minimum
{
  return self->_minimum;
}

- (float)maximum
{
  return self->_maximum;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (void)setSubtitleFormatString:(id)a3
{
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
}

- (id)validate
{
  return self->_validate;
}

- (void)setValidate:(id)a3
{
}

- (id)subtitleHandler
{
  return self->_subtitleHandler;
}

- (void)setSubtitleHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subtitleHandler, 0);
  objc_storeStrong(&self->_validate, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);

  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
}

- (int64_t)cellStyle
{
  objc_super v3 = [(MapsDebugSliderTableRow *)self subtitleFormatString];
  id v4 = [v3 length];

  if (v4) {
    return 3;
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsDebugSliderTableRow;
  return [(MapsDebugTableRow *)&v6 cellStyle];
}

- (id)_createSliderForIdiom:(int64_t)a3
{
  id v4 = [objc_alloc((Class)UISlider) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MapsDebugSliderTableRow *)self minimum];
  [v4 setMinimumValue:];
  [(MapsDebugSliderTableRow *)self maximum];
  [v4 setMaximumValue:];
  [v4 addTarget:self action:"_sliderDidChangeValue:" forControlEvents:4096];
  objc_super v5 = [(MapsDebugSliderTableRow *)self get];

  if (v5)
  {
    objc_super v6 = [(MapsDebugSliderTableRow *)self get];
    float v7 = v6[2]();

    [(MapsDebugSliderTableRow *)self maximum];
    if (v7 >= v8)
    {
      [(MapsDebugSliderTableRow *)self maximum];
      float v7 = v9;
    }
    [(MapsDebugSliderTableRow *)self minimum];
    if (v7 <= *(float *)&v10)
    {
      [(MapsDebugSliderTableRow *)self minimum];
      float v7 = *(float *)&v10;
    }
    *(float *)&double v10 = v7;
    [v4 setValue:v10];
  }
  [v4 sizeToFit];
  [v4 frame];
  [v4 setFrame:];
  [v4 setAccessibilityIdentifier:@"MapsDebugSlider"];

  return v4;
}

- (void)configureCell:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MapsDebugSliderTableRow;
  id v4 = a3;
  [(MapsDebugTableRow *)&v7 configureCell:v4];
  objc_super v5 = objc_msgSend(v4, "traitCollection", v7.receiver, v7.super_class);
  objc_super v6 = -[MapsDebugSliderTableRow _createSliderForIdiom:](self, "_createSliderForIdiom:", [v5 userInterfaceIdiom]);

  [v6 value];
  -[MapsDebugSliderTableRow _updateSecondaryText:](self, "_updateSecondaryText:");
  [v4 setAccessoryView:v6];
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsDebugSliderTableRow;
  [(MapsDebugTableRow *)&v10 configureCollectionViewCell:v4];
  id v5 = v4;
  objc_super v6 = [v5 traitCollection];
  objc_super v7 = -[MapsDebugSliderTableRow _createSliderForIdiom:](self, "_createSliderForIdiom:", [v6 userInterfaceIdiom]);

  [v7 value];
  -[MapsDebugSliderTableRow _updateSecondaryText:](self, "_updateSecondaryText:");
  id v8 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v7];
  [v8 setMaintainsFixedSize:1];
  id v11 = v8;
  float v9 = +[NSArray arrayWithObjects:&v11 count:1];
  [v5 setTrailingAccessoryConfigurations:v9];
}

- (void)setMinimum:(float)a3
{
  if (self->_minimum != a3)
  {
    self->_minimum = a3;
    id v6 = [(MapsDebugTableRow *)self currentCell];
    id v4 = [v6 accessoryView];
    *(float *)&double v5 = a3;
    [v4 setMinimumValue:v5];
  }
}

- (void)setMaximum:(float)a3
{
  if (self->_maximum != a3)
  {
    self->_maximum = a3;
    id v6 = [(MapsDebugTableRow *)self currentCell];
    id v4 = [v6 accessoryView];
    *(float *)&double v5 = a3;
    [v4 setMaximumValue:v5];
  }
}

- (void)_sliderDidChangeValue:(id)a3
{
  [a3 value];
  float v5 = v4;
  id v6 = [(MapsDebugSliderTableRow *)self validate];

  if (v6)
  {
    objc_super v7 = [(MapsDebugSliderTableRow *)self validate];
    float v5 = v7[2](v5);
  }
  id v8 = [(MapsDebugSliderTableRow *)self set];

  if (v8)
  {
    objc_super v10 = [(MapsDebugSliderTableRow *)self set];
    v10[2](v5);
  }
  *(float *)&double v9 = v5;

  [(MapsDebugSliderTableRow *)self _updateSecondaryText:v9];
}

- (void)_updateSecondaryText:(float)a3
{
  float v5 = [(MapsDebugSliderTableRow *)self subtitleHandler];

  if (v5)
  {
    id v6 = [(MapsDebugTableRow *)self currentCell];
    id v15 = [v6 contentConfiguration];

    objc_super v7 = [(MapsDebugSliderTableRow *)self subtitleHandler];
    id v8 = v7[2](a3);
    [v15 setSecondaryText:v8];
  }
  else
  {
    double v9 = [(MapsDebugSliderTableRow *)self subtitleFormatString];

    if (!v9) {
      return;
    }
    objc_super v10 = [(MapsDebugTableRow *)self currentCell];
    id v15 = [v10 contentConfiguration];

    objc_super v7 = [(MapsDebugSliderTableRow *)self subtitleFormatString];
    *(float *)&double v11 = a3;
    id v8 = +[NSNumber numberWithFloat:v11];
    v12 = [v8 stringValue];
    v13 = [v7 stringByReplacingOccurrencesOfString:@"%f" withString:v12];
    [v15 setSecondaryText:v13];
  }
  v14 = [(MapsDebugTableRow *)self currentCell];
  [v14 setContentConfiguration:v15];
}

@end