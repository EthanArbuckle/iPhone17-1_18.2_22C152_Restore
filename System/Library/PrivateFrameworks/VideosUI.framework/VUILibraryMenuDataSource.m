@interface VUILibraryMenuDataSource
- (NSSet)validCategories;
- (VUILibraryMenuDataSource)initWithValidCategories:(id)a3;
- (VUIMenuDataSource)menuItems;
- (void)setMenuItems:(id)a3;
- (void)setValidCategories:(id)a3;
@end

@implementation VUILibraryMenuDataSource

- (VUILibraryMenuDataSource)initWithValidCategories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryMenuDataSource;
  v6 = [(VUILibraryMenuDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validCategories, a3);
  }

  return v7;
}

- (VUIMenuDataSource)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (NSSet)validCategories
{
  return self->_validCategories;
}

- (void)setValidCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validCategories, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
}

@end