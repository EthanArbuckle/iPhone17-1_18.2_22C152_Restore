@interface UIAccessibilityCustomAction
- (NSAttributedString)attributedName;
- (NSString)category;
- (NSString)name;
- (SEL)selector;
- (UIAccessibilityCustomAction)init;
- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName actionHandler:(UIAccessibilityCustomActionHandler)actionHandler;
- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler;
- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image target:(id)target selector:(SEL)selector;
- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName target:(id)target selector:(SEL)selector;
- (UIAccessibilityCustomAction)initWithName:(NSString *)name actionHandler:(UIAccessibilityCustomActionHandler)actionHandler;
- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler;
- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image target:(id)target selector:(SEL)selector;
- (UIAccessibilityCustomAction)initWithName:(NSString *)name target:(id)target selector:(SEL)selector;
- (UIAccessibilityCustomActionHandler)actionHandler;
- (UIImage)image;
- (id)target;
- (void)setActionHandler:(UIAccessibilityCustomActionHandler)actionHandler;
- (void)setAttributedName:(NSAttributedString *)attributedName;
- (void)setCategory:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setName:(NSString *)name;
- (void)setSelector:(SEL)selector;
- (void)setTarget:(id)target;
@end

@implementation UIAccessibilityCustomAction

- (UIAccessibilityCustomAction)initWithName:(NSString *)name target:(id)target selector:(SEL)selector
{
  v8 = name;
  id v9 = target;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityCustomAction;
  v10 = [(UIAccessibilityCustomAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UIAccessibilityCustomAction *)v10 setName:v8];
    [(UIAccessibilityCustomAction *)v11 setTarget:v9];
    [(UIAccessibilityCustomAction *)v11 setSelector:selector];
  }

  return v11;
}

- (void)setTarget:(id)target
{
}

- (void)setSelector:(SEL)selector
{
  self->_selector = selector;
}

- (void)setName:(NSString *)name
{
  v4 = name;
  if (!v4)
  {
    uint64_t v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = &stru_1ED0E84C0;
  }
  v7 = v4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
  [(UIAccessibilityCustomAction *)self setAttributedName:v6];
}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
  v4 = attributedName;
  if (!v4)
  {
    uint64_t v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }
  v8 = v4;
  v6 = (NSAttributedString *)[(NSAttributedString *)v4 copy];
  v7 = self->_attributedName;
  self->_attributedName = v6;
}

- (UIAccessibilityCustomAction)init
{
  if (dyld_program_sdk_at_least())
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Please use the designated initializer"];
    return 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIAccessibilityCustomAction;
    return [(UIAccessibilityCustomAction *)&v4 init];
  }
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image target:(id)target selector:(SEL)selector
{
  v10 = name;
  v11 = image;
  id v12 = target;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityCustomAction;
  objc_super v13 = [(UIAccessibilityCustomAction *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(UIAccessibilityCustomAction *)v13 setName:v10];
    [(UIAccessibilityCustomAction *)v14 setImage:v11];
    [(UIAccessibilityCustomAction *)v14 setTarget:v12];
    [(UIAccessibilityCustomAction *)v14 setSelector:selector];
  }

  return v14;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image target:(id)target selector:(SEL)selector
{
  v10 = attributedName;
  v11 = image;
  id v12 = target;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityCustomAction;
  objc_super v13 = [(UIAccessibilityCustomAction *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(UIAccessibilityCustomAction *)v13 setAttributedName:v10];
    [(UIAccessibilityCustomAction *)v14 setImage:v11];
    [(UIAccessibilityCustomAction *)v14 setTarget:v12];
    [(UIAccessibilityCustomAction *)v14 setSelector:selector];
  }

  return v14;
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  v8 = name;
  id v9 = image;
  UIAccessibilityCustomActionHandler v10 = actionHandler;
  v14.receiver = self;
  v14.super_class = (Class)UIAccessibilityCustomAction;
  v11 = [(UIAccessibilityCustomAction *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(UIAccessibilityCustomAction *)v11 setName:v8];
    [(UIAccessibilityCustomAction *)v12 setImage:v9];
    [(UIAccessibilityCustomAction *)v12 setActionHandler:v10];
  }

  return v12;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  v8 = attributedName;
  id v9 = image;
  UIAccessibilityCustomActionHandler v10 = actionHandler;
  v14.receiver = self;
  v14.super_class = (Class)UIAccessibilityCustomAction;
  v11 = [(UIAccessibilityCustomAction *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(UIAccessibilityCustomAction *)v11 setAttributedName:v8];
    [(UIAccessibilityCustomAction *)v12 setImage:v9];
    [(UIAccessibilityCustomAction *)v12 setActionHandler:v10];
  }

  return v12;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName target:(id)target selector:(SEL)selector
{
  v8 = attributedName;
  id v9 = target;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityCustomAction;
  UIAccessibilityCustomActionHandler v10 = [(UIAccessibilityCustomAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UIAccessibilityCustomAction *)v10 setAttributedName:v8];
    [(UIAccessibilityCustomAction *)v11 setTarget:v9];
    [(UIAccessibilityCustomAction *)v11 setSelector:selector];
  }

  return v11;
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  v6 = name;
  UIAccessibilityCustomActionHandler v7 = actionHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityCustomAction;
  v8 = [(UIAccessibilityCustomAction *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(UIAccessibilityCustomAction *)v8 setName:v6];
    [(UIAccessibilityCustomAction *)v9 setActionHandler:v7];
  }

  return v9;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  v6 = attributedName;
  UIAccessibilityCustomActionHandler v7 = actionHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityCustomAction;
  v8 = [(UIAccessibilityCustomAction *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(UIAccessibilityCustomAction *)v8 setAttributedName:v6];
    [(UIAccessibilityCustomAction *)v9 setActionHandler:v7];
  }

  return v9;
}

- (NSString)name
{
  v2 = [(UIAccessibilityCustomAction *)self attributedName];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)selector
{
  return self->_selector;
}

- (UIAccessibilityCustomActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end