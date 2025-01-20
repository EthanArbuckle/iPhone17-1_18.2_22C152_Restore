@interface ExpandViewController
- (_TtC17PromotedContentUI20ExpandViewController)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI20ExpandViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)closeButtonTappedWithSender:(id)a3;
- (void)dealloc;
- (void)tapRecognized:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webProcessMRAIDJSODidCallClose;
- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5;
- (void)webProcessMRAIDJSODidCallOpen:(id)a3;
- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame;
@end

@implementation ExpandViewController

- (_TtC17PromotedContentUI20ExpandViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5CFD048();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webView);
  v5 = self;
  id v6 = v4;
  sub_1B5DAA198();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(ExpandViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_closeButton));
  id v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_expandedDestinationURL;
  uint64_t v4 = sub_1B5DB9868();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_navigationCoordinator));
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webProcessDelegate);
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_actionDelegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5CEF924((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_backgroundedTime, (uint64_t *)&unk_1EB8493A0);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5CFB2E0();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5CFB874(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B5CFBA54();
}

- (void)closeButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  id v6 = self;
  sub_1B5DBAD88();
  sub_1B5CEE190();
  v5 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();

  sub_1B5CFBD38();
}

- (void)tapRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5CFD178();
}

- (_TtC17PromotedContentUI20ExpandViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17PromotedContentUI20ExpandViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  v2 = self;
  sub_1B5CFC214();
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4 = sub_1B5DB9868();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  v8 = (void *)MEMORY[0x1BA9AC660]((char *)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webProcessDelegate);
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallOpen_))
    {
      v10 = self;
      v11 = (void *)sub_1B5DB9818();
      objc_msgSend(v9, sel_webProcessMRAIDJSODidCallOpen_, v11);

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessMRAIDJSODidCallClose
{
  v2 = self;
  sub_1B5CFC5F4();
}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v5 = sub_1B5DB9868();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  sub_1B5CFD2E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end