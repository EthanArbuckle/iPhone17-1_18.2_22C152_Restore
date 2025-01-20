@interface _PXSharedLibrarySettingsItem
+ (id)itemWithTitle:(id)a3;
- (BOOL)refusesSelection;
- (NSString)title;
- (SEL)action;
- (UIImage)image;
- (UIView)accessoryView;
- (UIView)customView;
- (void)setAccessoryView:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setCustomView:(id)a3;
- (void)setImage:(id)a3;
- (void)setRefusesSelection:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _PXSharedLibrarySettingsItem

+ (id)itemWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setTitle:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setRefusesSelection:(BOOL)a3
{
  self->_refusesSelection = a3;
}

- (BOOL)refusesSelection
{
  return self->_refusesSelection;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setAccessoryView:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setCustomView:(id)a3
{
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

@end