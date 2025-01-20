@interface PXCollectionSortMenuItemConfiguration
- (BOOL)actionAscending;
- (BOOL)selected;
- (NSString)systemImageName;
- (NSString)title;
- (PXCollectionSortMenuItemConfiguration)initWithSortOrder:(int64_t)a3 title:(id)a4 systemImageName:(id)a5 selected:(BOOL)a6 actionAscending:(BOOL)a7;
- (int64_t)sortOrder;
@end

@implementation PXCollectionSortMenuItemConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)actionAscending
{
  return self->_actionAscending;
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (PXCollectionSortMenuItemConfiguration)initWithSortOrder:(int64_t)a3 title:(id)a4 systemImageName:(id)a5 selected:(BOOL)a6 actionAscending:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXCollectionSortMenuItemConfiguration;
  v15 = [(PXCollectionSortMenuItemConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_sortOrder = a3;
    objc_storeStrong((id *)&v15->_title, a4);
    objc_storeStrong((id *)&v16->_systemImageName, a5);
    v16->_selected = a6;
    v16->_actionAscending = a7;
  }

  return v16;
}

@end