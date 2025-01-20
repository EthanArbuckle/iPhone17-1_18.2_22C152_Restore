@interface PUSelectionFeedbackGenerator
- (PUSelectionFeedbackGenerator)init;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (void)performFeedback;
- (void)prepareFeedback;
@end

@implementation PUSelectionFeedbackGenerator

- (void).cxx_destruct
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)performFeedback
{
  id v2 = [(PUSelectionFeedbackGenerator *)self feedbackGenerator];
  [v2 selectionChanged];
}

- (void)prepareFeedback
{
  id v2 = [(PUSelectionFeedbackGenerator *)self feedbackGenerator];
  [v2 prepare];
}

- (PUSelectionFeedbackGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUSelectionFeedbackGenerator;
  id v2 = [(PUSelectionFeedbackGenerator *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB2290] defaultConfiguration];
    v4 = [v3 tweakedConfigurationForCaller:v2 usage:@"photosEditAdjustmentSelection"];

    v5 = [MEMORY[0x1E4FB20B0] feedbackWithDictionaryRepresentation:&unk_1F078B9F8];
    [v4 setFeedback:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v4];
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = (UISelectionFeedbackGenerator *)v6;

    [(UISelectionFeedbackGenerator *)v2->_feedbackGenerator _setOutputMode:5];
  }
  return v2;
}

@end