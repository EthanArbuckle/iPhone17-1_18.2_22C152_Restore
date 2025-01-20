@interface WebViewerViewController
- (_TtC7NewsUI223WebViewerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223WebViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(void *)a3 didFailNavigation:(void *)a4 withError:(void *)a5;
@end

@implementation WebViewerViewController

- (_TtC7NewsUI223WebViewerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI223WebViewerViewController_coverViewManager;
  sub_1DFDF1780();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1DFDF1770();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_webView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_url;
  uint64_t v8 = sub_1DFDE7220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_config) = 0;

  result = (_TtC7NewsUI223WebViewerViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI223WebViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223WebViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_styler);
  swift_unknownObjectRelease();
  swift_release();

  sub_1DEA175A0((uint64_t)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_url, (uint64_t (*)(void))sub_1DEA3C638);
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFD76CE0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(WebViewerViewController *)&v4 viewDidAppear:v3];
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFD76E7C();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(WebViewerViewController *)&v3 viewDidLayoutSubviews];
  sub_1DFDF1720();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(WebViewerViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DFD78580();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v7 = type metadata accessor for WebViewerState();
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1E01EFB70]((*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI223WebViewerViewController_eventHandler))[4]+ 16);
  if (v10)
  {
    uint64_t v11 = v10;
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = MEMORY[0x1E01EFB70](v11 + 16);
    id v13 = a3;
    id v14 = a4;
    v15 = self;
    if (v12)
    {
      sub_1DFD77CA4((uint64_t)v9);
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    sub_1DEA175A0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for WebViewerState);
  }
}

- (void)webView:(void *)a3 didFailNavigation:(void *)a4 withError:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = a1;
  sub_1DF6E3A70(v11);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v5 = *(void *)((*(void **)((char *)&self->super.super.super.isa
                               + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_eventHandler))[4]
                 + 32);
  if (MEMORY[0x1E01EFB70](v5 + 24, a2))
  {
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    id v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  char v6 = 1;
  id v4 = a3;
  uint64_t v5 = self;
  sub_1DF0DC0B0(&v6);
}

@end