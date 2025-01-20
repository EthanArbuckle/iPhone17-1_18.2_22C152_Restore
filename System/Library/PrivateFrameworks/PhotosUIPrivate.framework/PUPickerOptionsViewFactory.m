@interface PUPickerOptionsViewFactory
+ (id)viewControllerWithConfiguration:(id)a3 selectionCoordinator:(id)a4 additionalSelectionState:(id)a5;
- (PUPickerOptionsViewFactory)init;
@end

@implementation PUPickerOptionsViewFactory

+ (id)viewControllerWithConfiguration:(id)a3 selectionCoordinator:(id)a4 additionalSelectionState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1AEA4F054(v7, v8, v9);

  return v10;
}

- (PUPickerOptionsViewFactory)init
{
  return (PUPickerOptionsViewFactory *)sub_1AEA4F260();
}

@end