@interface PXSurveyQuestionPlaceholderGadget
- (CGSize)sizeThatFits:(CGSize)result;
- (Class)collectionViewItemClass;
- (PXGadgetDelegate)delegate;
- (PXGadgetSpec)gadgetSpec;
- (PXSurveyQuestionPlaceholderGadgetView)contentView;
- (UIViewController)overrideContainerViewController;
- (id)uniqueGadgetIdentifier;
- (unint64_t)gadgetCapabilities;
- (unint64_t)gadgetType;
- (void)placeholderGadgetView:(id)a3 invokeActionWithCompletionHandler:(id)a4;
- (void)placeholderGadgetViewSizeThatFitsDidChange:(id)a3;
- (void)prepareCollectionViewItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGadgetSpec:(id)a3;
- (void)setOverrideContainerViewController:(id)a3;
@end

@implementation PXSurveyQuestionPlaceholderGadget

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideContainerViewController);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)setOverrideContainerViewController:(id)a3
{
}

- (UIViewController)overrideContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideContainerViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setGadgetSpec:(id)a3
{
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setDelegate:(id)a3
{
}

- (PXGadgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetDelegate *)WeakRetained;
}

- (void)placeholderGadgetViewSizeThatFitsDidChange:(id)a3
{
  id v4 = [(PXSurveyQuestionPlaceholderGadget *)self delegate];
  [v4 gadget:self didChange:64];
}

- (void)placeholderGadgetView:(id)a3 invokeActionWithCompletionHandler:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSurveyQuestionPlaceholderGadget.m", 84, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PXSurveyQuestionPlaceholderGadget.m", 85, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v8 = [(PXSurveyQuestionPlaceholderGadget *)self delegate];
  v9 = [v8 presentationEnvironmentForGadget:self];

  PXGenerateSurveyQuestionsWithOptions(533075965, -1, v9, v7);
}

- (PXSurveyQuestionPlaceholderGadgetView)contentView
{
  return self->_view;
}

- (id)uniqueGadgetIdentifier
{
  return @"PXSurveyQuestionsPlaceholderGadget";
}

- (void)prepareCollectionViewItem:(id)a3
{
  v19 = (PXSurveyQuestionPlaceholderGadgetView *)a3;
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = [(PXSurveyQuestionPlaceholderGadgetView *)v19 px_descriptionForAssertionMessage];
    [v14 handleFailureInMethod:a2, self, @"PXSurveyQuestionPlaceholderGadget.m", 50, @"%@ should be an instance inheriting from %@, but it is %@", @"collectionViewItem", v16, v18 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXSurveyQuestionPlaceholderGadget.m", 50, @"%@ should be an instance inheriting from %@, but it is nil", @"collectionViewItem", v16 object file lineNumber description];
  }

LABEL_3:
  view = self->_view;
  self->_view = v19;

  v6 = [MEMORY[0x1E4FB1658] emptyConfiguration];
  id v7 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderTitle", @"PhotosUICore");
  [v6 setText:v7];

  v8 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderMessage", @"PhotosUICore");
  [v6 setSecondaryText:v8];

  v9 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderButtonTitle", @"PhotosUICore");
  v10 = [v6 buttonProperties];
  v11 = [v10 configuration];
  [v11 setTitle:v9];

  [(PXSurveyQuestionPlaceholderGadgetView *)self->_view setPlaceholderContentUnavailableConfiguration:v6];
  id v12 = [MEMORY[0x1E4FB1658] loadingConfiguration];
  v13 = PXLocalizedStringFromTable(@"PXForYouPhotosChallengePlaceholderActivityTitle", @"PhotosUICore");
  [v12 setText:v13];

  [(PXSurveyQuestionPlaceholderGadgetView *)self->_view setLoadingContentUnavailableConfiguration:v12];
  [(PXSurveyQuestionPlaceholderGadgetView *)self->_view setDelegate:self];
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width = result.width;
  result.height = width;
  return result;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (unint64_t)gadgetType
{
  return 0;
}

@end