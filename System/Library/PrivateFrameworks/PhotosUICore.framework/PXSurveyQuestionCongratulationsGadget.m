@interface PXSurveyQuestionCongratulationsGadget
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXGadgetDelegate)delegate;
- (PXGadgetSpec)gadgetSpec;
- (PXSurveyQuestionCongratulationsGadget)initWithType:(unint64_t)a3;
- (PXSurveyQuestionsCongratulationsGadgetContentView)contentView;
- (id)uniqueGadgetIdentifier;
- (unint64_t)gadgetCapabilities;
- (unint64_t)gadgetType;
- (unint64_t)type;
- (void)congratulationsGadgetContentViewDidSelectActionButton:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGadgetSpec:(id)a3;
@end

@implementation PXSurveyQuestionCongratulationsGadget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setContentView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (PXGadgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetDelegate *)WeakRetained;
}

- (void)setGadgetSpec:(id)a3
{
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)congratulationsGadgetContentViewDidSelectActionButton:(id)a3
{
  id v4 = [(PXSurveyQuestionCongratulationsGadget *)self delegate];
  [v4 didSelectActionButtonForType:self->_type];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(PXSurveyQuestionCongratulationsGadget *)self contentView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (PXSurveyQuestionsCongratulationsGadgetContentView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    unint64_t type = self->_type;
    if (type)
    {
      if (type != 1)
      {
        double v7 = 0;
        double v8 = 0;
        goto LABEL_8;
      }
      v5 = @"PXInternalPhotosChallengeCongratulationsLoadMore";
      double v6 = @"PXInternalPhotosChallengeCongratulationsLoadMoreDetailMessage";
    }
    else
    {
      v5 = @"PXInternalPhotosChallengeCongratulationsFinishedDismiss";
      double v6 = @"PXInternalPhotosChallengeCongratulationsFinishedDetailMessage";
    }
    double v7 = PXLocalizedStringFromTable(v6, @"PhotosUICore");
    double v8 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
LABEL_8:
    double v9 = [[PXSurveyQuestionsCongratulationsGadgetContentView alloc] initWithDetailMessage:v7 buttonTitle:v8];
    double v10 = self->_contentView;
    self->_contentView = v9;

    [(PXSurveyQuestionsCongratulationsGadgetContentView *)self->_contentView setDelegate:self];
    contentView = self->_contentView;
  }
  return contentView;
}

- (id)uniqueGadgetIdentifier
{
  unint64_t type = self->_type;
  v3 = @"PXSurveyQuestionsCongratulationsTypeLoadMore";
  if (type != 1) {
    v3 = 0;
  }
  if (type) {
    return v3;
  }
  else {
    return @"PXSurveyQuestionsCongratulationsTypeDismiss";
  }
}

- (unint64_t)gadgetType
{
  return 2;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (PXSurveyQuestionCongratulationsGadget)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionCongratulationsGadget;
  CGSize result = [(PXSurveyQuestionCongratulationsGadget *)&v5 init];
  if (result) {
    result->_unint64_t type = a3;
  }
  return result;
}

@end