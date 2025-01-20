@interface DBSExternalDisplayIconView
+ (Class)layerClass;
- (DBSExternalDisplayIconView)initWithFrame:(CGRect)a3 displayName:(id)a4;
- (UILabel)nameField;
- (void)setNameField:(id)a3;
@end

@implementation DBSExternalDisplayIconView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DBSExternalDisplayIconView)initWithFrame:(CGRect)a3 displayName:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26[2] = *MEMORY[0x263EF8340];
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DBSExternalDisplayIconView;
  v10 = -[DBSExternalDisplayIconView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = [(DBSExternalDisplayIconView *)v10 layer];
    id v13 = [MEMORY[0x263F825C8] colorWithRed:0.576470588 green:0.705882353 blue:0.749019608 alpha:1.0];
    v26[0] = [v13 CGColor];
    id v14 = [MEMORY[0x263F825C8] colorWithRed:0.760784314 green:0.850980392 blue:0.874509804 alpha:1.0];
    v26[1] = [v14 CGColor];
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    [v12 setColors:v15];

    id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.1];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    [v12 setBorderWidth:1.0];
    [v12 setCornerRadius:5.0];
    v17 = objc_opt_new();
    [v17 setText:v9];
    [(DBSExternalDisplayIconView *)v11 addSubview:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [v17 centerXAnchor];
    v19 = [(DBSExternalDisplayIconView *)v11 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [v17 centerYAnchor];
    v22 = [(DBSExternalDisplayIconView *)v11 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    [(DBSExternalDisplayIconView *)v11 setNameField:v17];
  }

  return v11;
}

- (UILabel)nameField
{
  return self->_nameField;
}

- (void)setNameField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end