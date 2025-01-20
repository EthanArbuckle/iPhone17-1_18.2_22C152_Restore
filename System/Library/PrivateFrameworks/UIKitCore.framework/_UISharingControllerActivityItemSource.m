@interface _UISharingControllerActivityItemSource
- (UICloudSharingController)viewController;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (void)setViewController:(id)a3;
@end

@implementation _UISharingControllerActivityItemSource

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F9F358]]) {
    v5 = self;
  }
  else {
    v5 = 0;
  }
  return v5;
}

- (UICloudSharingController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end