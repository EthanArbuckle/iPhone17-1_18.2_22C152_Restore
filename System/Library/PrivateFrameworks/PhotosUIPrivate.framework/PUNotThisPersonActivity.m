@interface PUNotThisPersonActivity
+ (int64_t)_activityStyle;
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUNotThisPersonActivity

+ (int64_t)activityCategory
{
  return 0;
}

+ (int64_t)_activityStyle
{
  return 1;
}

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 assets];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)_systemImageName
{
  return @"person.crop.circle.badge.xmark";
}

- (id)activityTitle
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = [v2 assets];
  [v3 count];

  v4 = [v2 person];
  BOOL v5 = objc_msgSend(v4, "px_localizedName");
  if ([v5 length])
  {
    v6 = PXLocalizedStringForPersonOrPetAndVisibility();
    v7 = PXStringWithValidatedFormat();
  }
  else
  {
    v7 = PXLocalizedStringForPersonOrPetAndVisibility();
  }

  return v7;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A78];
}

@end