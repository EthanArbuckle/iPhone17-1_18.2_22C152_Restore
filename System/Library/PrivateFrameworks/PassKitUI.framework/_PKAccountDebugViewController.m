@interface _PKAccountDebugViewController
- (_PKAccountDebugViewController)initWithCoder:(id)a3;
- (_PKAccountDebugViewController)initWithConfiguration:(id)a3;
- (_PKAccountDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dictionaryRepresentation;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAccountDebugViewController

- (_PKAccountDebugViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountDebugViewController *)AccountDebugViewController.init(withConfiguration:)(a3);
}

- (_PKAccountDebugViewController)initWithCoder:(id)a3
{
  result = (_PKAccountDebugViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B7158(type metadata accessor for AccountDebugViewController, &OBJC_IVAR____PKAccountDebugViewController_hostingVC);
}

- (void)viewWillLayoutSubviews
{
}

- (id)dictionaryRepresentation
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____PKAccountDebugViewController_debugModel);
  v3 = self;
  id v4 = v2;
  id v5 = sub_19FAF526C();

  sub_19F5B74BC((uint64_t)v5);
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x1E4F1C9E8]);
  v7 = (void *)sub_1A03B47E8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithDictionary_copyItems_, v7, 0);

  return v8;
}

- (_PKAccountDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____PKAccountDebugViewController_debugModel);
}

@end