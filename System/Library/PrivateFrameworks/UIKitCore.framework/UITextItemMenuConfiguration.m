@interface UITextItemMenuConfiguration
+ (UITextItemMenuConfiguration)configurationWithMenu:(UIMenu *)menu;
+ (UITextItemMenuConfiguration)configurationWithPreview:(UITextItemMenuPreview *)preview menu:(UIMenu *)menu;
- (UIMenu)menu;
- (UITextItemMenuPreview)preview;
- (id)_initWithPreview:(id)a3 menu:(id)a4;
- (int64_t)_preferredExpression;
- (unint64_t)_preferredElementDisplayMode;
- (void)set_preferredElementDisplayMode:(unint64_t)a3;
- (void)set_preferredExpression:(int64_t)a3;
@end

@implementation UITextItemMenuConfiguration

- (id)_initWithPreview:(id)a3 menu:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextItemMenuConfiguration;
  v9 = [(UITextItemMenuConfiguration *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preview, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

+ (UITextItemMenuConfiguration)configurationWithMenu:(UIMenu *)menu
{
  v4 = menu;
  id v5 = objc_alloc((Class)a1);
  v6 = +[UITextItemMenuPreview defaultPreview];
  id v7 = (void *)[v5 _initWithPreview:v6 menu:v4];

  return (UITextItemMenuConfiguration *)v7;
}

+ (UITextItemMenuConfiguration)configurationWithPreview:(UITextItemMenuPreview *)preview menu:(UIMenu *)menu
{
  v6 = menu;
  id v7 = preview;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithPreview:v7 menu:v6];

  return (UITextItemMenuConfiguration *)v8;
}

- (int64_t)_preferredExpression
{
  return self->__preferredExpression;
}

- (void)set_preferredExpression:(int64_t)a3
{
  self->__preferredExpression = a3;
}

- (unint64_t)_preferredElementDisplayMode
{
  return self->__preferredElementDisplayMode;
}

- (void)set_preferredElementDisplayMode:(unint64_t)a3
{
  self->__preferredElementDisplayMode = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UITextItemMenuPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end