@interface CRLiOSPrintCoordinator
- (_TtC8Freeform22CRLiOSPrintCoordinator)init;
- (id)appOptionsViewController;
- (id)printInteractionControllerParentViewController:(id)a3;
- (void)printInteractionControllerDidDismissPrinterOptions:(id)a3;
- (void)printInteractionControllerDidFinishJob:(id)a3;
@end

@implementation CRLiOSPrintCoordinator

- (_TtC8Freeform22CRLiOSPrintCoordinator)init
{
  return (_TtC8Freeform22CRLiOSPrintCoordinator *)sub_1007BFEB8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printOptionsViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionContinuation, &qword_101680D78);
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_parentViewController));
}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController) = 0;
  id v5 = a3;
  v6 = self;

  *((unsigned char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_isPresenting) = 0;
}

- (void)printInteractionControllerDidDismissPrinterOptions:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_isPresenting) = 0;
}

- (id)appOptionsViewController
{
  v2 = self;
  v3 = (void *)sub_1007C02B0();

  return v3;
}

@end