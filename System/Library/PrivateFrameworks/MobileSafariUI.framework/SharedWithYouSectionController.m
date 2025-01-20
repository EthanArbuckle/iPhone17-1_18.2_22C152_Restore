@interface SharedWithYouSectionController
- (SharedWithYouSectionController)initWithConfiguration:(id)a3;
- (id)itemControllers;
- (id)title;
- (void)registerItemsWithRegistration:(id)a3;
@end

@implementation SharedWithYouSectionController

- (SharedWithYouSectionController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SharedWithYouSectionController;
  v5 = [(LibrarySectionController *)&v12 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [[CloudTabsLibraryItemController alloc] initWithConfiguration:v4 sectionController:v5];
    cloudTabsItemController = v5->_cloudTabsItemController;
    v5->_cloudTabsItemController = v6;

    v8 = [[SharedWithYouLibraryItemController alloc] initWithConfiguration:v4 sectionController:v5];
    friendsItemController = v5->_friendsItemController;
    v5->_friendsItemController = v8;

    v10 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_friendsItemController) {
    objc_msgSend(v3, "addObject:");
  }
  [v4 addObject:self->_cloudTabsItemController];
  return v4;
}

- (id)title
{
  return &stru_1F3C268E8;
}

- (void)registerItemsWithRegistration:(id)a3
{
  cloudTabsItemController = self->_cloudTabsItemController;
  id v5 = a3;
  [v5 registerItem:cloudTabsItemController forCollectionType:@"CloudTabsCollection"];
  [v5 registerItem:self->_friendsItemController forCollectionType:@"SharedWithYouCollection"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendsItemController, 0);
  objc_storeStrong((id *)&self->_cloudTabsItemController, 0);
}

@end