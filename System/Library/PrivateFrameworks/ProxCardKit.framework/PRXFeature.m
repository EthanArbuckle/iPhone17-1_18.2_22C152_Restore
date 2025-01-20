@interface PRXFeature
+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6;
+ (id)optionalFeatureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7;
- (BOOL)isOn;
- (NSString)detailText;
- (NSString)title;
- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7;
- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 imageView:(id)a5 valueChangedBlock:(id)a6;
- (UIColor)tintColor;
- (UIImage)icon;
- (UISwitch)switchControl;
- (UIView)imageView;
- (double)imageViewSize;
- (id)handler;
- (void)setImageViewSize:(double)a3;
- (void)setOn:(BOOL)a3;
- (void)setSwitchControl:(id)a3;
@end

@implementation PRXFeature

- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 imageView:(id)a5 valueChangedBlock:(id)a6
{
  v10 = (UIView *)a5;
  v24.receiver = self;
  v24.super_class = (Class)PRXFeature;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PRXFeature *)&v24 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v24.receiver, v24.super_class);

  title = v14->_title;
  v14->_title = (NSString *)v15;

  uint64_t v17 = [v12 copy];
  detailText = v14->_detailText;
  v14->_detailText = (NSString *)v17;

  imageView = v14->_imageView;
  v14->_imageView = v10;
  v20 = v10;

  uint64_t v21 = [v11 copy];
  id handler = v14->_handler;
  v14->_id handler = (id)v21;

  v14->_on = 1;
  return v14;
}

- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (UIImage *)a5;
  uint64_t v15 = (UIColor *)a6;
  id v16 = a7;
  if (v14)
  {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v14];
    [v17 setTintColor:v15];
    [v17 setContentMode:1];
    self->_imageViewSize = 32.0;
  }
  else
  {
    uint64_t v17 = 0;
  }
  icon = self->_icon;
  self->_icon = v14;
  v19 = v14;

  tintColor = self->_tintColor;
  self->_tintColor = v15;

  uint64_t v21 = [(PRXFeature *)self initWithTitle:v12 detailText:v13 imageView:v17 valueChangedBlock:v16];
  return v21;
}

+ (id)optionalFeatureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = (void *)[objc_alloc((Class)a1) initWithTitle:v16 detailText:v15 icon:v14 tintColor:v13 valueChangedBlock:v12];

  return v17;
}

+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithTitle:v13 detailText:v12 icon:v11 tintColor:v10 valueChangedBlock:0];

  return v14;
}

+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [v8 makeImageView];
  id v13 = (void *)[v11 initWithTitle:v10 detailText:v9 imageView:v12 valueChangedBlock:0];

  [v8 platterSize];
  double v15 = v14;

  [v13 setImageViewSize:v15];
  return v13;
}

- (void)setSwitchControl:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_switchControl);
    [v6 removeActionForIdentifier:@"PRXToggleSwitch" forControlEvents:4096];

    id v7 = objc_storeWeak((id *)&self->_switchControl, v4);
    BOOL on = self->_on;
    id v9 = v7;
    [v4 setOn:on];

    locatiBOOL on = 0;
    objc_initWeak(&location, self);
    id v10 = objc_loadWeakRetained((id *)&self->_switchControl);
    id v11 = (void *)MEMORY[0x263F1C3C0];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    double v15 = __31__PRXFeature_setSwitchControl___block_invoke;
    id v16 = &unk_264418230;
    objc_copyWeak(&v17, &location);
    id v12 = [v11 actionWithTitle:&stru_26CCF1BC8 image:0 identifier:@"PRXToggleSwitch" handler:&v13];
    objc_msgSend(v10, "addAction:forControlEvents:", v12, 4096, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __31__PRXFeature_setSwitchControl___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v3, "setOn:", objc_msgSend(v2, "isOn"));

    id WeakRetained = v3;
  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    if (!self->_handler)
    {
      id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Cannot turn off a non-optional PRXFeature" userInfo:0];
      objc_exception_throw(v7);
    }
    BOOL v4 = a3;
    self->_BOOL on = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);
    [WeakRetained setOn:v4 animated:1];

    id v6 = (void (*)(void))*((void *)self->_handler + 2);
    v6();
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isOn
{
  return self->_on;
}

- (id)handler
{
  return self->_handler;
}

- (UISwitch)switchControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);
  return (UISwitch *)WeakRetained;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (double)imageViewSize
{
  return self->_imageViewSize;
}

- (void)setImageViewSize:(double)a3
{
  self->_imageViewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_switchControl);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end