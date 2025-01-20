@interface TPSSharedTipViewController
- (_TtC4Tips26TPSSharedTipViewController)initWithAppController:(id)a3;
- (_TtC4Tips26TPSSharedTipViewController)initWithCoder:(id)a3;
- (_TtC4Tips26TPSSharedTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneTapped:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TPSSharedTipViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  id v4 = v9.receiver;
  [(TPSTipsViewController *)&v9 viewWillAppear:v3];
  id v5 = [v4 tips];
  if (v5)
  {
    v6 = v5;
    sub_100037FDC();
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v8) {
      [v4 showInlineGenericErrorMessage];
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  id v4 = (char *)v6.receiver;
  [(TPSTipsViewController *)&v6 viewDidDisappear:v3];
  id v5 = *(void (**)(char *))&v4[OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed];
  if (v5)
  {
    swift_retain();
    v5(v4);
    sub_100005470((uint64_t)v5);
  }
}

- (void)doneTapped:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  -[TPSSharedTipViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v6, v7);

  sub_10003AA74((uint64_t)&v6);
}

- (_TtC4Tips26TPSSharedTipViewController)initWithAppController:(id)a3
{
  return (_TtC4Tips26TPSSharedTipViewController *)sub_10003C0EC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithAppController_);
}

- (_TtC4Tips26TPSSharedTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    long long v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed);
    *objc_super v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  v11 = [(TPSViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC4Tips26TPSSharedTipViewController)initWithCoder:(id)a3
{
  return (_TtC4Tips26TPSSharedTipViewController *)sub_10003C0EC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (void).cxx_destruct
{
  sub_100005470(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed));
}

@end