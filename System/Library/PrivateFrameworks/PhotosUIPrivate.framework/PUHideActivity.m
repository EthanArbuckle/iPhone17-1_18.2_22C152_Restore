@interface PUHideActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUHideActivity

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(PXActivity *)self itemSourceController];
  if ([v4 isPreparingIndividualItems])
  {
    v5 = (void *)MEMORY[0x1E4F90290];
    v6 = [v4 assets];
    LOBYTE(v5) = [v5 canPerformOnAllAssets:v6];

    if (v5)
    {
      v7 = (void *)MEMORY[0x1E4F90290];
      v8 = [v4 assets];
      self->_hiding = [v7 toggledValueForAssets:v8];

      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
      self->_hiding = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_systemImageName
{
  if (self->_hiding) {
    return @"eye.slash";
  }
  else {
    return @"eye";
  }
}

- (id)activityTitle
{
  if (self->_hiding) {
    return PULocalizedString(@"HIDE_MENU_ITEM_ITEM");
  }
  else {
    return PULocalizedString(@"UNHIDE_MENU_ITEM_ITEM");
  }
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A10];
}

- (void)setItemSourceController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUHideActivity;
  [(PXActivity *)&v7 setItemSourceController:a3];
  v4 = [(PXActivity *)self itemSourceController];
  v5 = (void *)MEMORY[0x1E4F90290];
  v6 = [v4 assets];
  self->_hiding = [v5 toggledValueForAssets:v6];
}

+ (int64_t)activityCategory
{
  return 0;
}

@end