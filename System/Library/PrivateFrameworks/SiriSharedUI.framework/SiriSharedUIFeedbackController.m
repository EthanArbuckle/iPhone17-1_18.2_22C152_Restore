@interface SiriSharedUIFeedbackController
- (BOOL)_canShowWhileLocked;
- (BOOL)isProvidingFeedback;
- (SiriSharedUIFeedbackController)initWithCoder:(id)a3;
- (SiriSharedUIFeedbackController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setIsProvidingFeedback:(BOOL)a3;
- (void)userDidReportConcernWithModel:(id)a3;
@end

@implementation SiriSharedUIFeedbackController

- (BOOL)isProvidingFeedback
{
  v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsProvidingFeedback:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (SiriSharedUIFeedbackController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_20CA82F08();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SiriSharedUIFeedbackController *)SiriSharedUIFeedbackController.init(nibName:bundle:)(v5, v7, a4);
}

- (SiriSharedUIFeedbackController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_feedbackController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_evaluationResult) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback) = 0;
  id v4 = a3;

  result = (SiriSharedUIFeedbackController *)sub_20CA83348();
  __break(1u);
  return result;
}

- (void)userDidReportConcernWithModel:(id)a3
{
  id v4 = (SiriSharedUIFeedbackModel *)a3;
  uint64_t v5 = self;
  SiriSharedUIFeedbackController.userDidReportConcern(with:)(v4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SiriSharedUIFeedbackController_feedbackController));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_evaluationResult);
}

@end