@interface PDFReplicaViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NSArray)keyCommands;
- (_TtC12NewsArticles24PDFReplicaViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles24PDFReplicaViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4;
- (void)handleKeyCommandWithKeyCommand:(id)a3;
- (void)handlePinchGesture;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PDFReplicaViewController

- (_TtC12NewsArticles24PDFReplicaViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF6DF3EC();
}

- (_TtC12NewsArticles24PDFReplicaViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles24PDFReplicaViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_delegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pdfView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_focusableView));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingIndicatorProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pinchRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingStateMachine));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF6DC770();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v9.receiver;
  id v5 = a3;
  [(PDFReplicaViewController *)&v9 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
  v7 = *(void **)&v4[OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingStateMachine];
  if (v7)
  {
    uint64_t v8 = sub_1BF6DF1FC(objc_msgSend(v7, sel_state));
    sub_1BF6DF588(v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1BF6DCA98(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1BF6DCBDC();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  id v3 = sub_1BF6DD604();

  if (v3)
  {
    sub_1BF4A7104(0, (unint64_t *)&unk_1EBA5B2A0);
    id v4 = (void *)sub_1BF7E3C68();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)handleKeyCommandWithKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BF6DD818(v4);
}

- (void)handlePinchGesture
{
  uint64_t v3 = MEMORY[0x1C18B4040]((char *)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_delegate, a2);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pdfView);
    id v6 = self;
    objc_msgSend(v5, sel_scaleFactor);
    if (*(void *)(v4 + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_barVisibilityAnimator))
    {
      swift_unknownObjectRetain();
      sub_1BF653B1C(1, 1);

      swift_unknownObjectRelease();
    }
    else
    {
    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  sub_1BF4A7104(0, (unint64_t *)&qword_1EBA60E90);
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = self;
  LOBYTE(a3) = sub_1BF7E45A8();

  return a3 & 1;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  uint64_t v6 = sub_1BF7DD068();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  __swift_project_boxed_opaque_existential_1(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_eventHandler)+ 6, (*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_eventHandler))[9]);
  id v10 = a3;
  v11 = self;
  sub_1BF5D9EDC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end