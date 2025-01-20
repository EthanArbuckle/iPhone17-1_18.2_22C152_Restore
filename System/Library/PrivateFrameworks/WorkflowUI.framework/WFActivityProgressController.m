@interface WFActivityProgressController
- (WFActivityProgressController)init;
- (WFActivityProgressController)initWithTitle:(id)a3;
- (unint64_t)state;
- (void)dismissWithCompletion:(id)a3;
- (void)presentFrom:(id)a3 cancellationHandler:(id)a4;
- (void)setState:(unint64_t)a3;
@end

@implementation WFActivityProgressController

- (unint64_t)state
{
  return sub_22DAE6874();
}

- (void)setState:(unint64_t)a3
{
  v4 = self;
  sub_22DAE68E4(a3);
}

- (WFActivityProgressController)initWithTitle:(id)a3
{
  if (a3)
  {
    uint64_t v3 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (WFActivityProgressController *)ActivityProgressController.init(title:)(v3, v4);
}

- (void)presentFrom:(id)a3 cancellationHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_22DAE86B0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_22DAE6AF0(v8, (uint64_t)v6, v7);
  sub_22D9CC274((uint64_t)v6);
}

- (void)dismissWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_22DAE70B8((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
}

- (WFActivityProgressController)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFActivityProgressController_alertController);
}

@end