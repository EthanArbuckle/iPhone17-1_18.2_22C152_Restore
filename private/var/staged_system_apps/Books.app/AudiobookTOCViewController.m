@interface AudiobookTOCViewController
- (_TtC5Books26AudiobookTOCViewController)initWithCoder:(id)a3;
- (_TtC5Books26AudiobookTOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)dealloc;
- (void)onAppWillEnterForegroundWithNotification:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTimeRemaining;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AudiobookTOCViewController

- (_TtC5Books26AudiobookTOCViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10042EF9C();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  [(AudiobookTOCViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books26AudiobookTOCViewController_headerHeightConstraint));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10042ACBC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10042B830(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  id v4 = v5.receiver;
  [(AudiobookTOCViewController *)&v5 viewDidAppear:v3];
  sub_1004770D4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookTOCViewController();
  id v4 = (char *)v7.receiver;
  [(AudiobookTOCViewController *)&v7 viewWillDisappear:v3];
  objc_super v5 = &v4[OBJC_IVAR____TtC5Books26AudiobookTOCViewController_cancellables];
  swift_beginAccess();
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_10042A66C(v6);
  swift_bridgeObjectRelease();
  *(void *)objc_super v5 = &_swiftEmptySetSingleton;

  swift_bridgeObjectRelease();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  objc_super v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_10042F0D4();

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)updateTimeRemaining
{
  v2 = self;
  sub_10042D874();
}

- (void)onAppWillEnterForegroundWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  id v5 = [(AudiobookTOCViewController *)v8 view];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 window];

    if (v7) {
      sub_1004770D4();
    }
  }
  else
  {
    __break(1u);
  }
}

- (_TtC5Books26AudiobookTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books26AudiobookTOCViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = a3;
  id v7 = self;
  sub_1007F7850();
  swift_release();
  swift_release();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v8 = sub_1007FF290();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v8 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_10042E05C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  sub_10042F3B4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10042E8FC(v4);
}

@end