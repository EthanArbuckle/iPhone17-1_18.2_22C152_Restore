@interface PXSurveyQuestionsMultipleAnswerSelectionController
- (PXSurveyQuestionsMultipleAnswerSelectionController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7;
@end

@implementation PXSurveyQuestionsMultipleAnswerSelectionController

- (PXSurveyQuestionsMultipleAnswerSelectionController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[PXSurveyQuestionsMultipleAnswerSelectionTableViewController alloc] initWithTitle:v16 message:v15 reasons:v14 currentlySelectedReasons:v13 completion:v12];

  v20.receiver = self;
  v20.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionController;
  v18 = [(PXSurveyQuestionsMultipleAnswerSelectionController *)&v20 initWithRootViewController:v17];

  if (v18) {
    [(PXSurveyQuestionsMultipleAnswerSelectionController *)v18 setModalPresentationStyle:0];
  }
  return v18;
}

@end