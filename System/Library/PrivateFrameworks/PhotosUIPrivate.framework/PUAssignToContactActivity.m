@interface PUAssignToContactActivity
- (PXActivityItemSourceController)itemSourceController;
- (id)_embeddedActivityViewController;
- (id)_systemImageName;
- (id)activityViewController;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUAssignToContactActivity

- (void).cxx_destruct
{
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (id)activityViewController
{
  v5.receiver = self;
  v5.super_class = (Class)PUAssignToContactActivity;
  v3 = [(UIAssignToContactActivity *)&v5 activityViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setDelegate:self];
  }
  return v3;
}

- (id)_embeddedActivityViewController
{
  v5.receiver = self;
  v5.super_class = (Class)PUAssignToContactActivity;
  v3 = [(UIAssignToContactActivity *)&v5 _embeddedActivityViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setDelegate:self];
  }
  return v3;
}

- (id)_systemImageName
{
  return @"person.crop.circle";
}

@end