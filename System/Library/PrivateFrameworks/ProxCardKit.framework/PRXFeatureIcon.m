@interface PRXFeatureIcon
- (NSString)symbolName;
- (PRXFeatureIcon)initWithImage:(id)a3;
- (PRXFeatureIcon)initWithImageView:(id)a3;
- (PRXFeatureIcon)initWithSystemImageNamed:(id)a3;
- (UIColor)platterColor;
- (UIView)imageView;
- (double)platterCornerRadius;
- (double)platterSize;
- (id)makeImageView;
- (void)setPlatterColor:(id)a3;
- (void)setPlatterCornerRadius:(double)a3;
- (void)setPlatterSize:(double)a3;
@end

@implementation PRXFeatureIcon

- (PRXFeatureIcon)initWithSystemImageNamed:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureIcon;
  id v3 = a3;
  v4 = [(PRXFeatureIcon *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  symbolName = v4->_symbolName;
  v4->_symbolName = (NSString *)v5;

  return v4;
}

- (PRXFeatureIcon)initWithImage:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F1C6D0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithImage:v5];

  v7 = [(PRXFeatureIcon *)self initWithImageView:v6];
  return v7;
}

- (PRXFeatureIcon)initWithImageView:(id)a3
{
  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureIcon;
  id v5 = [(PRXFeatureIcon *)&v8 init];
  imageView = v5->_imageView;
  v5->_imageView = v4;

  return v5;
}

- (void)setPlatterColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterColor, a3);
  if (a3)
  {
    [(PRXFeatureIcon *)self setPlatterCornerRadius:9.0];
    [(PRXFeatureIcon *)self setPlatterSize:40.0];
  }
}

- (id)makeImageView
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = [(PRXFeatureIcon *)self imageView];

  if (v3)
  {
    id v4 = [(PRXFeatureIcon *)self imageView];
  }
  else
  {
    v20 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D300]];
    id v5 = (void *)MEMORY[0x263F1C6B0];
    v6 = [(PRXFeatureIcon *)self symbolName];
    v19 = [v5 systemImageNamed:v6 withConfiguration:v20];

    v7 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v19];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v8 = [MEMORY[0x263F1C550] whiteColor];
    [v7 setTintColor:v8];

    [v7 setContentMode:4];
    [v7 setMaximumContentSizeCategory:*MEMORY[0x263F1D180]];
    id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v4 _setLayoutDebuggingIdentifier:@"PRXFeaturePlatter"];
    v9 = [(PRXFeatureIcon *)self platterColor];
    [v4 setBackgroundColor:v9];

    [(PRXFeatureIcon *)self platterCornerRadius];
    objc_msgSend(v4, "_setContinuousCornerRadius:");
    [v4 addSubview:v7];
    v10 = (void *)MEMORY[0x263F08938];
    v11 = [v4 centerXAnchor];
    v12 = [v7 centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v21[0] = v13;
    v14 = [v4 centerYAnchor];
    v15 = [v7 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v21[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    [v10 activateConstraints:v17];
  }
  return v4;
}

- (double)platterCornerRadius
{
  return self->_platterCornerRadius;
}

- (void)setPlatterCornerRadius:(double)a3
{
  self->_platterCornerRadius = a3;
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (double)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(double)a3
{
  self->_platterSize = a3;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
}

@end