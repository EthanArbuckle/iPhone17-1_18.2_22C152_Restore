@interface UIStoryboardPreviewingRegistrant
- (UIStoryboardPreviewingRegistrant)initWithCoder:(id)a3;
- (UIView)sourceView;
- (UIViewController)viewController;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)registerForPreviewing;
- (void)setSourceView:(id)a3;
- (void)setViewController:(id)a3;
- (void)unregisterForPreviewing;
@end

@implementation UIStoryboardPreviewingRegistrant

- (UIStoryboardPreviewingRegistrant)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStoryboardPreviewingRegistrant;
  return [(UIStoryboardPreviewingRegistrant *)&v4 init];
}

- (void)registerForPreviewing
{
  p_sourceView = &self->_sourceView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  if (!WeakRetained)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIStoryboardPreviewingRegistrant.m" lineNumber:37 description:@"Cannot register without a source view to register for."];
  }
  if (self->_previewingContext)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIStoryboardPreviewingRegistrant.m" lineNumber:39 description:@"It is a programming error to register multiple times."];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_viewController);
  id v6 = objc_loadWeakRetained((id *)p_sourceView);
  v7 = [v11 registerForPreviewingWithDelegate:self sourceView:v6];
  previewingContext = self->_previewingContext;
  self->_previewingContext = v7;
}

- (void)unregisterForPreviewing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained unregisterForPreviewingWithContext:self->_previewingContext];

  previewingContext = self->_previewingContext;
  self->_previewingContext = 0;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  segueTemplateStorage = self->_segueTemplateStorage;
  self->_segueTemplateStorage = 0;

  v9 = [v7 sourceView];
  v10 = objc_msgSend(v9, "hitTest:withEvent:", 0, x, y);
  id v11 = self->_segueTemplateStorage;
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (v12)
  {
    v13 = v10;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v10, "_previewingSegueTemplateStorageForLocation:inView:", v9, x, y);
      v14 = (UIStoryboardPreviewingSegueTemplateStorage *)objc_claimAutoreleasedReturnValue();
      v15 = self->_segueTemplateStorage;
      self->_segueTemplateStorage = v14;

      if (v10 == v9) {
        break;
      }
      v13 = [v10 superview];

      id v11 = self->_segueTemplateStorage;
      if (!v11)
      {
        v10 = v13;
        if (v13) {
          continue;
        }
      }
      goto LABEL_12;
    }
    id v11 = self->_segueTemplateStorage;
    v13 = v9;
  }
LABEL_12:
  v16 = [(UIStoryboardPreviewingSegueTemplateStorage *)v11 sender];
  v17 = [(UIStoryboardPreviewingSegueTemplateStorage *)self->_segueTemplateStorage sender];
  [v17 bounds];
  objc_msgSend(v16, "convertRect:toView:", v9);
  objc_msgSend(v7, "setSourceRect:");

  v18 = [(UIStoryboardPreviewingSegueTemplateStorage *)self->_segueTemplateStorage previewTemplate];
  v19 = [(UIStoryboardPreviewingSegueTemplateStorage *)self->_segueTemplateStorage sender];
  v20 = [v18 perform:v19];
  v21 = [v20 destinationViewController];

  return v21;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v9 = a4;
  v5 = [(UIStoryboardPreviewingSegueTemplateStorage *)self->_segueTemplateStorage commitTemplate];
  id v6 = [(UIStoryboardPreviewingSegueTemplateStorage *)self->_segueTemplateStorage sender];
  id v7 = (id)[v5 _performWithDestinationViewController:v9 sender:v6];

  segueTemplateStorage = self->_segueTemplateStorage;
  self->_segueTemplateStorage = 0;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_segueTemplateStorage, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
}

@end