@interface PXActionMenu
+ (id)menuWithTitle:(id)a3 childElements:(id)a4;
- (NSArray)childElements;
- (NSString)systemImageName;
- (NSString)title;
- (PXActionMenu)initWithTitle:(id)a3 systemImageName:(id)a4 childElements:(id)a5;
- (UIImage)image;
@end

@implementation PXActionMenu

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childElements, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSArray)childElements
{
  return self->_childElements;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (PXActionMenu)initWithTitle:(id)a3 systemImageName:(id)a4 childElements:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXActionMenu;
  v11 = [(PXActionMenu *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    childElements = v11->_childElements;
    v11->_childElements = (NSArray *)v16;
  }
  return v11;
}

+ (id)menuWithTitle:(id)a3 childElements:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 systemImageName:0 childElements:v6];

  return v8;
}

@end