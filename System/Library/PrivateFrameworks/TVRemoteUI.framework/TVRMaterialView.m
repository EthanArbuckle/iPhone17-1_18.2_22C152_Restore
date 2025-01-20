@interface TVRMaterialView
+ (id)backgroundMaterialViewWithWeighting:(double)a3;
+ (id)seperatorMaterialView;
+ (id)trackpadMaterialView;
- (TVRMaterialView)initWithDarkMaterialView;
- (TVRMaterialView)initWithMaterialView:(id)a3;
- (double)weighting;
- (void)layoutSubviews;
- (void)setWeighting:(double)a3;
@end

@implementation TVRMaterialView

- (TVRMaterialView)initWithDarkMaterialView
{
  v3 = [MEMORY[0x263F53FE8] materialViewWithRecipe:4];
  v4 = [(TVRMaterialView *)self initWithMaterialView:v3];

  return v4;
}

- (TVRMaterialView)initWithMaterialView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMaterialView;
  v6 = [(TVRMaterialView *)&v9 init];
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_materialView, a3);
    [(TVRMaterialView *)v7 addSubview:v7->_materialView];
  }

  return v7;
}

+ (id)trackpadMaterialView
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F53FE8] materialViewWithRecipe:4];
  v3 = [[TVRMaterialView alloc] initWithMaterialView:v2];
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  [v4 setBackgroundColor:v5];

  [v4 setAlpha:0.12];
  [v4 setAutoresizingMask:18];
  v6 = [v4 layer];
  v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
  v10[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v6 setCompositingFilter:v8];

  [(TVRMaterialView *)v3 insertSubview:v4 aboveSubview:v3->_materialView];
  return v3;
}

+ (id)seperatorMaterialView
{
  v2 = [[TVRMaterialView alloc] initWithMaterialView:0];
  v3 = [MEMORY[0x263F54000] _visualStylingProviderForRecipe:4 andCategory:0];
  [v3 automaticallyUpdateView:v2 withStyle:0];

  return v2;
}

+ (id)backgroundMaterialViewWithWeighting:(double)a3
{
  v3 = [MEMORY[0x263F53FE8] materialViewWithRecipe:20 options:0 initialWeighting:a3];
  id v4 = [[TVRMaterialView alloc] initWithMaterialView:v3];

  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TVRMaterialView;
  [(TVRMaterialView *)&v4 layoutSubviews];
  materialView = self->_materialView;
  [(TVRMaterialView *)self bounds];
  -[MTMaterialView setFrame:](materialView, "setFrame:");
}

- (void)setWeighting:(double)a3
{
}

- (double)weighting
{
  [(MTMaterialView *)self->_materialView weighting];
  return result;
}

- (void).cxx_destruct
{
}

@end