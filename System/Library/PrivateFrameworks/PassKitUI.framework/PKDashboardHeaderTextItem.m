@interface PKDashboardHeaderTextItem
+ (id)identifier;
+ (id)itemWithHeaderText:(id)a3;
+ (id)itemWithHeaderText:(id)a3 style:(unint64_t)a4;
- (BOOL)preferBaselineAlignment;
- (BOOL)useActionInsets;
- (NSString)actionTitle;
- (NSString)title;
- (UIColor)actionColor;
- (UIColor)titleColor;
- (UIImage)actionImage;
- (UIMenu)menu;
- (id)action;
- (unint64_t)actionStyle;
- (unint64_t)style;
- (void)setAction:(id)a3;
- (void)setActionColor:(id)a3;
- (void)setActionImage:(id)a3;
- (void)setActionStyle:(unint64_t)a3;
- (void)setActionTitle:(id)a3;
- (void)setMenu:(id)a3;
- (void)setPreferBaselineAlignment:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setUseActionInsets:(BOOL)a3;
@end

@implementation PKDashboardHeaderTextItem

+ (id)itemWithHeaderText:(id)a3
{
  return +[PKDashboardHeaderTextItem itemWithHeaderText:a3 style:0];
}

+ (id)itemWithHeaderText:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(PKDashboardHeaderTextItem);
  [(PKDashboardHeaderTextItem *)v6 setTitle:v5];

  [(PKDashboardHeaderTextItem *)v6 setStyle:a4];
  [(PKDashboardHeaderTextItem *)v6 setUseActionInsets:1];

  return v6;
}

+ (id)identifier
{
  return @"headerTextItem";
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (void)setActionImage:(id)a3
{
}

- (UIColor)actionColor
{
  return self->_actionColor;
}

- (void)setActionColor:(id)a3
{
}

- (unint64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(unint64_t)a3
{
  self->_actionStyle = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)useActionInsets
{
  return self->_useActionInsets;
}

- (void)setUseActionInsets:(BOOL)a3
{
  self->_useActionInsets = a3;
}

- (BOOL)preferBaselineAlignment
{
  return self->_preferBaselineAlignment;
}

- (void)setPreferBaselineAlignment:(BOOL)a3
{
  self->_preferBaselineAlignment = a3;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end