@interface ProfilesSectionController
- (ProfilesSectionController)initWithConfiguration:(id)a3;
- (id)itemControllers;
@end

@implementation ProfilesSectionController

- (ProfilesSectionController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfilesSectionController;
  v5 = [(LibrarySectionController *)&v10 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [[ProfilesLibraryItemController alloc] initWithConfiguration:v4 sectionController:v5];
    profilesItemController = v5->_profilesItemController;
    v5->_profilesItemController = v6;

    v8 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_profilesItemController;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void).cxx_destruct
{
}

@end