@interface PXStoryUIFactory
+ (id)feedViewControllerWithConfiguration:(id)a3;
+ (id)thumbnailActionPerformerWithModel:(id)a3;
+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4;
@end

@implementation PXStoryUIFactory

+ (id)thumbnailActionPerformerWithModel:(id)a3
{
  id v3 = a3;
  v4 = [NSClassFromString(&cfstr_Pustoryuiswift.isa) thumbnailActionPerformerWithModel:v3];

  return v4;
}

+ (id)feedViewControllerWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[PXFeedViewController alloc] initWithConfiguration:v3];

  return v4;
}

+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4
{
  id v5 = a3;
  v6 = [NSClassFromString(&cfstr_Pustoryuiswift.isa) viewControllerWithConfiguration:v5 contentViewController:a4];

  return v6;
}

@end