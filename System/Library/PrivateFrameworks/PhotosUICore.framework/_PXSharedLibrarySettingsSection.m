@interface _PXSharedLibrarySettingsSection
- (NSArray)items;
- (NSString)caption;
- (NSString)title;
- (void)addItemWithConfigurationHandler:(id)a3;
- (void)setCaption:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _PXSharedLibrarySettingsSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (NSArray)items
{
  return &self->_items->super;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)addItemWithConfigurationHandler:(id)a3
{
  v7 = (void (**)(id, void *))a3;
  if (!self->_items)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    items = self->_items;
    self->_items = v4;
  }
  v6 = objc_opt_new();
  v7[2](v7, v6);
  [(NSMutableArray *)self->_items addObject:v6];
}

@end