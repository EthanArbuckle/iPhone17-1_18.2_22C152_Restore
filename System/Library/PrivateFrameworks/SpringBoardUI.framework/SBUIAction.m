@interface SBUIAction
- (NSString)subtitle;
- (NSString)systemImageName;
- (NSString)title;
- (SBUIAction)init;
- (SBUIAction)initWithTitle:(id)a3 handler:(id)a4;
- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5;
- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 badgeView:(id)a6 handler:(id)a7;
- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 handler:(id)a6;
- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 systemImageName:(id)a5 badgeView:(id)a6 handler:(id)a7;
- (UIImage)image;
- (UIView)badgeView;
- (id)handler;
@end

@implementation SBUIAction

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 badgeView:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBUIAction;
  v17 = [(SBUIAction *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    uint64_t v22 = [v14 _imageThatSuppressesAccessibilityHairlineThickening];
    image = v17->_image;
    v17->_image = (UIImage *)v22;

    objc_storeStrong((id *)&v17->_badgeView, a6);
    uint64_t v24 = [v16 copy];
    id handler = v17->_handler;
    v17->_id handler = (id)v24;
  }
  return v17;
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 systemImageName:(id)a5 badgeView:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBUIAction;
  v17 = [(SBUIAction *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    systemImageName = v17->_systemImageName;
    v17->_systemImageName = (NSString *)v22;

    objc_storeStrong((id *)&v17->_badgeView, a6);
    uint64_t v24 = [v16 copy];
    id handler = v17->_handler;
    v17->_id handler = (id)v24;
  }
  return v17;
}

- (SBUIAction)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithTitle:subtitle:image:badgeView:handler:].", "-[SBUIAction init]", v6 format];

  return [(SBUIAction *)self initWithTitle:0 subtitle:0 image:0 badgeView:0 handler:0];
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 handler:(id)a6
{
  return [(SBUIAction *)self initWithTitle:a3 subtitle:a4 image:a5 badgeView:0 handler:a6];
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5
{
  return [(SBUIAction *)self initWithTitle:a3 subtitle:a4 image:0 badgeView:0 handler:a5];
}

- (SBUIAction)initWithTitle:(id)a3 handler:(id)a4
{
  return [(SBUIAction *)self initWithTitle:a3 subtitle:0 image:0 badgeView:0 handler:a4];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end