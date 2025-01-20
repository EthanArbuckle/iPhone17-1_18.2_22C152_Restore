@interface SFStepperContainer
- (SFStepper)stepper;
- (SFStepperContainer)initWithCoder:(id)a3;
- (SFStepperContainer)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)hideStepperWithCompletion:(id)a3;
- (void)setStepper:(id)a3;
@end

@implementation SFStepperContainer

- (SFStepperContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper) = 0;
  id v4 = a3;

  result = (SFStepperContainer *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (SFStepperContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = sub_18C6F8AB8();
  MEMORY[0x1F4188790](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper) = 0;
  v13.receiver = self;
  v13.super_class = (Class)SFStepperContainer;
  v11 = -[SFStepperContainer initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  MEMORY[0x192F94580]();
  sub_18C6F8A98();
  MEMORY[0x192F94590](v10);

  return v11;
}

- (SFStepper)stepper
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepperContainer_stepper);
  swift_beginAccess();
  return (SFStepper *)*v2;
}

- (void)setStepper:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C6F1100(a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = self;
  id v8 = a4;
  uint64_t v9 = [(SFStepperContainer *)v7 stepper];
  if (v9)
  {
    v10 = v9;
    v15.receiver = v7;
    v15.super_class = (Class)SFStepperContainer;
    id v11 = -[SFStepperContainer hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
    v12 = v11;
    if (v11)
    {
      unsigned __int8 v13 = objc_msgSend(v11, sel_isDescendantOfView_, v10);

      if ((v13 & 1) == 0)
      {

        v12 = 0;
      }
    }
    else
    {
    }
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (void)hideStepperWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  SFStepperContainer.hideStepper(completion:)((uint64_t)sub_18C448038, v5);

  swift_release();
}

- (void).cxx_destruct
{
}

@end