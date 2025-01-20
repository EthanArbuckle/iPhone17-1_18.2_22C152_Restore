@interface PSSliderTableCell
- (BOOL)canReload;
- (PSSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)controlValue;
- (id)newControl;
- (id)titleLabel;
- (void)_configureLayout;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PSSliderTableCell

- (PSSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PSSliderTableCell;
  v5 = [(PSControlTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PSTableCell *)v5 setShouldHideTitle:1];
    [(PSSliderTableCell *)v6 _configureLayout];
  }
  return v6;
}

- (void)_configureLayout
{
  v31[4] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v3 = [(PSControlTableCell *)self control];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [(PSControlTableCell *)self control];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [(PSControlTableCell *)self control];
    v28 = [v30 leadingAnchor];
    v29 = [(PSSliderTableCell *)self contentView];
    v27 = [v29 layoutMarginsGuide];
    v26 = [v27 leadingAnchor];
    v25 = [v28 constraintEqualToAnchor:v26];
    v31[0] = v25;
    v24 = [(PSSliderTableCell *)self contentView];
    v23 = [v24 layoutMarginsGuide];
    v21 = [v23 trailingAnchor];
    v22 = [(PSControlTableCell *)self control];
    v19 = [v22 trailingAnchor];
    v18 = [v21 constraintEqualToAnchor:v19];
    v31[1] = v18;
    v17 = [(PSControlTableCell *)self control];
    v7 = [v17 topAnchor];
    objc_super v8 = [(PSSliderTableCell *)self contentView];
    v9 = [v8 topAnchor];
    v10 = [v7 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v9 multiplier:1.0];
    v31[2] = v10;
    v11 = [(PSSliderTableCell *)self contentView];
    v12 = [v11 bottomAnchor];
    v13 = [(PSControlTableCell *)self control];
    v14 = [v13 bottomAnchor];
    v15 = [v12 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];
    v31[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v20 activateConstraints:v16];
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PSControlTableCell *)self control];
  v6 = [v4 name];
  v36 = self;
  [(PSTableCell *)self setTitle:v6];

  v7 = [v4 propertyForKey:@"defaults"];
  objc_super v8 = [v7 lastPathComponent];

  if (([v8 hasPrefix:@"com.apple"] & 1) == 0 && objc_msgSend(v8, "length")
    || ([v4 propertyForKey:@"isContinuous"],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 BOOLValue],
        v9,
        (v10 & 1) == 0))
  {
    [v5 setContinuous:0];
  }
  v11 = [v4 propertyForKey:@"min"];
  v12 = [v4 propertyForKey:@"max"];
  if (v11)
  {
    [v11 floatValue];
    objc_msgSend(v5, "setMinimumValue:");
  }
  v34 = v11;
  if (v12)
  {
    [v12 floatValue];
    objc_msgSend(v5, "setMaximumValue:");
  }
  v13 = [v4 propertyForKey:@"isSegmented"];
  uint64_t v14 = [v13 BOOLValue];

  [v5 setSegmented:v14];
  v15 = [v4 propertyForKey:@"locksToSegment"];
  v16 = v15;
  if (v15) {
    objc_msgSend(v5, "setLocksToSegment:", objc_msgSend(v15, "BOOLValue"));
  }
  v35 = v8;
  v17 = [v4 propertyForKey:@"snapsToSegment"];
  v18 = v17;
  if (v17) {
    objc_msgSend(v5, "setSnapsToSegment:", objc_msgSend(v17, "BOOLValue"));
  }
  v19 = [v4 propertyForKey:@"segmentCount"];
  objc_msgSend(v5, "setSegmentCount:", objc_msgSend(v19, "unsignedIntegerValue"));
  v20 = [v4 propertyForKey:@"rightImage"];
  if (v20) {
    goto LABEL_14;
  }
  v30 = [v4 propertyForKey:@"rightImagePromise"];
  if (v30)
  {
    v31 = v30;
    v20 = [v30 image];
    [v4 setProperty:v20 forKey:@"rightImage"];
    [v4 removePropertyForKey:@"rightImagePromise"];

    if (v20)
    {
LABEL_14:
      v21 = [v4 propertyForKey:@"iconImageShouldFlipForRightToLeft"];
      int v22 = [v21 BOOLValue];

      if (v22)
      {
        uint64_t v23 = [v20 imageFlippedForRightToLeftLayoutDirection];

        v20 = (void *)v23;
      }
      [v5 setMaximumValueImage:v20];
    }
  }
  v24 = [v4 propertyForKey:@"leftImage"];
  if (v24) {
    goto LABEL_18;
  }
  v32 = [v4 propertyForKey:@"leftImagePromise"];
  if (v32)
  {
    v33 = v32;
    v24 = [v32 image];
    [v4 setProperty:v24 forKey:@"leftImage"];
    [v4 removePropertyForKey:@"leftImagePromise"];

    if (v24)
    {
LABEL_18:
      v25 = [v4 propertyForKey:@"iconImageShouldFlipForRightToLeft"];
      int v26 = [v25 BOOLValue];

      if (v26)
      {
        uint64_t v27 = [v24 imageFlippedForRightToLeftLayoutDirection];

        v24 = (void *)v27;
      }
      [v5 setMinimumValueImage:v24];
    }
  }
  v28 = [v4 propertyForKey:@"showValue"];
  v29 = v28;
  if (v28) {
    objc_msgSend(v5, "setShowValue:", objc_msgSend(v28, "BOOLValue"));
  }
  v37.receiver = v36;
  v37.super_class = (Class)PSSliderTableCell;
  [(PSControlTableCell *)&v37 refreshCellContentsWithSpecifier:v4];
}

- (void)prepareForReuse
{
  v3 = [(PSControlTableCell *)self control];
  if ([(PSTableCell *)self type] == 5)
  {
    [v3 setContinuous:1];
    [v3 setMinimumValue:0.0];
    LODWORD(v4) = 1.0;
    [v3 setMaximumValue:v4];
    [v3 setMaximumValueImage:0];
    [v3 setMinimumValueImage:0];
    [v3 setShowValue:0];
    [v3 setSegmented:0];
    [v3 setSegmentCount:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PSSliderTableCell;
  [(PSTableCell *)&v5 prepareForReuse];
}

- (id)newControl
{
  v2 = [PSSegmentableSlider alloc];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[PSSegmentableSlider initWithFrame:](v2, "initWithFrame:", v3, v4, v5, v6);
}

- (id)titleLabel
{
  return 0;
}

- (BOOL)canReload
{
  int v3 = [(PSSliderTableCell *)self isMemberOfClass:objc_opt_class()];
  if (v3) {
    LOBYTE(v3) = [(PSSliderTableCell *)self tag] == 5;
  }
  return v3;
}

- (id)controlValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(UIControl *)self->super._control value];
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

- (void)setValue:(id)a3
{
  id v6 = a3;
  if (self->super.super._value != v6)
  {
    objc_storeStrong(&self->super.super._value, a3);
    control = self->super._control;
    [v6 floatValue];
    -[UIControl setValue:](control, "setValue:");
  }
}

- (void).cxx_destruct
{
}

@end