@interface ICDocCamExtractedDocumentPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (ICDocCamExtractedDocumentPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)containerViewWillLayoutSubviews;
@end

@implementation ICDocCamExtractedDocumentPresentationController

- (ICDocCamExtractedDocumentPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamExtractedDocumentPresentationController;
  return [(ICDocCamExtractedDocumentPresentationController *)&v5 initWithPresentedViewController:a3 presentingViewController:a4];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = [(ICDocCamExtractedDocumentPresentationController *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  [(ICDocCamExtractedDocumentPresentationController *)self frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(ICDocCamExtractedDocumentPresentationController *)self presentedView];
  [v11 setFrame:v4, v6, v8, v10];
}

@end