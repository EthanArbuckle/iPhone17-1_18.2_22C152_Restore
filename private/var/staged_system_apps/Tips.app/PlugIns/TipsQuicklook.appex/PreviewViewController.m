@interface PreviewViewController
- (_TtC13TipsQuicklook21PreviewViewController)initWithCoder:(id)a3;
- (_TtC13TipsQuicklook21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation PreviewViewController

- (_TtC13TipsQuicklook21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100009B40();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
    id v6 = a4;
    NSString v7 = sub_100009B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PreviewViewController();
  v9 = [(PreviewViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC13TipsQuicklook21PreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewViewController();
  return [(PreviewViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController));
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  NSString v7 = _Block_copy(a5);
  uint64_t v8 = sub_100009B40();
  v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_100009B40();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v7);
  v13 = self;
  sub_100003780(v8, v10, v11, a4, (char *)v13, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100002A44();
}

- (void)updateViewConstraints
{
  uint64_t v3 = sub_100009AA0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v7 = self;
  sub_100009A90();
  sub_100009B10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v8 = [(PreviewViewController *)v7 view];
  if (v8)
  {
    v9 = v8;
    [v8 updateConstraints];
  }
  else
  {
    __break(1u);
  }
}

@end