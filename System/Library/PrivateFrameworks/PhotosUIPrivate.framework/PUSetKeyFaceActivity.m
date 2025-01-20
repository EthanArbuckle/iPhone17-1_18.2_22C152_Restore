@interface PUSetKeyFaceActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUSetKeyFaceActivity

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
  v4 = [v3 assets];
  BOOL v5 = [v4 count] == 1;

  return v5;
}

- (id)_systemImageName
{
  return @"rectangle.stack.person.crop";
}

- (id)activityTitle
{
  return (id)PXLocalizedString();
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90AB8];
}

@end