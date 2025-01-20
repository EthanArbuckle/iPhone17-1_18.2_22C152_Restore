@interface PUOneUpFeedbackController
- (PUOneUpFeedbackController)init;
- (PUOneUpFeedbackController)initWithViewModel:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpFeedbackController

- (PUOneUpFeedbackController)initWithViewModel:(id)a3
{
  return (PUOneUpFeedbackController *)sub_1AEA24A4C(a3);
}

- (PUOneUpFeedbackController)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PUOneUpFeedbackController_selectionFeedbackGenerator);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AEA24C18(a3, a4);
}

@end