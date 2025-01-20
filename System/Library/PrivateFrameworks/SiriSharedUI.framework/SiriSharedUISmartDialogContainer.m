@interface SiriSharedUISmartDialogContainer
- (BOOL)allowDrillingInAndOut;
- (BOOL)shouldBeHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIViewController)popoverViewController;
- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)init;
- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)initWithDelegate:(id)a3;
- (id)view;
- (void)setAllowDrillingInAndOut:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setPopoverViewController:(id)a3;
- (void)triggerSmartDialogAnimationWithDelay:(double)a3;
- (void)updateBodyWithText:(id)a3;
- (void)updateHeaderWithText:(id)a3 color:(id)a4;
- (void)updateWithSmartDialogCard:(id)a3;
- (void)updateWithSmartDialogPluginView:(id)a3;
- (void)updateWithSnippetFrameInGlobal:(id)a3;
@end

@implementation SiriSharedUISmartDialogContainer

- (UIViewController)popoverViewController
{
  v2 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_popoverViewController;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x210553300](v2);
  return (UIViewController *)v3;
}

- (void)setPopoverViewController:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_20CA3DF20();
}

- (BOOL)allowDrillingInAndOut
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_allowDrillingInAndOut;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowDrillingInAndOut:(BOOL)a3
{
  v4 = self;
  sub_20CA3BF28(a3);
}

- (BOOL)shouldBeHidden
{
  v2 = self;
  char v3 = sub_20CA3C0BC();

  return v3 & 1;
}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  char v3 = (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *)sub_20CA3E05C();
  swift_unknownObjectRelease();
  return v3;
}

- (id)view
{
  char v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v8 = (void *)v6(v4, v5);

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  if (sub_20CA3C0BC())
  {

    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    uint64_t v8 = *(void *)&v5->hostingController[OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController
                                         + 8];
    uint64_t v9 = *(void *)&v5->hostingController[OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController
                                         + 16];
    __swift_project_boxed_opaque_existential_1((Class *)((char *)&v5->super.isa+ OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController), v8);
    double v6 = (*(double (**)(uint64_t, uint64_t, double, double))(v9 + 8))(v8, v9, width, height);
    double v7 = v10;
  }
  double v11 = v6;
  double v12 = v7;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)updateHeaderWithText:(id)a3 color:(id)a4
{
  uint64_t v6 = sub_20CA82F08();
  uint64_t v8 = v7;
  id v9 = a4;
  double v10 = self;
  uint64_t v11 = MEMORY[0x210551C60](v9);
  sub_20CA49F10(v6, v8, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateBodyWithText:(id)a3
{
}

- (void)updateWithSmartDialogCard:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20CA3C70C(v4);
}

- (void)updateWithSnippetFrameInGlobal:(id)a3
{
  id v4 = self;
  if (a3) {
    objc_msgSend(a3, sel_rectValue);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CA82318();
}

- (void)updateWithSmartDialogPluginView:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a3;
  swift_retain();
  sub_20CA82318();
}

- (void)setIsInAmbient:(BOOL)a3
{
}

- (void)setInteractionDelegate:(id)a3
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_smartDialogInteractionManager))
    swift_unknownObjectWeakAssign();
}

- (void)triggerSmartDialogAnimationWithDelay:(double)a3
{
  id v4 = self;
  sub_20CA3D68C(a3);
}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)init
{
  CGSize result = (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_smartDialogInteractionManager));
  swift_unknownObjectWeakDestroy();
  char v3 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_delegate;
  sub_20CA202D4((uint64_t)v3);
}

@end