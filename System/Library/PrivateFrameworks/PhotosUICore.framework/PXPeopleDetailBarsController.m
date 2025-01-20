@interface PXPeopleDetailBarsController
- (BOOL)wantsActionMenu;
- (PHPerson)person;
- (UIButton)peopleTitleView;
- (id)createAssetActionManager;
- (void)setPeopleTitleView:(id)a3;
- (void)setPerson:(id)a3;
@end

@implementation PXPeopleDetailBarsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_peopleTitleView, 0);
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPeopleTitleView:(id)a3
{
}

- (UIButton)peopleTitleView
{
  return self->_peopleTitleView;
}

- (BOOL)wantsActionMenu
{
  return 1;
}

- (id)createAssetActionManager
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailBarsController;
  v3 = [(PXPhotosDetailsBarsController *)&v6 createAssetActionManager];
  v4 = [(PXPeopleDetailBarsController *)self person];
  [v3 setPerson:v4];

  return v3;
}

@end