@interface PUSetSocialGroupKeyPhotoActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUSetSocialGroupKeyPhotoActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 socialGroup];
  if (v4)
  {
    v5 = [v3 assets];
    BOOL v6 = [v5 count] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_systemImageName
{
  return @"person.2.square.stack";
}

- (id)activityTitle
{
  return (id)PXLemonadeLocalizedString();
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90AD0];
}

@end