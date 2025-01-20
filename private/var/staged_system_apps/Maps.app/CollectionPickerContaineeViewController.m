@interface CollectionPickerContaineeViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCoder:(id)a3;
- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCollectionEditSession:(id)a3;
- (_TtC4Maps39CollectionPickerContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP4Maps47CollectionPickerContaineeViewControllerDelegate_)delegate;
- (void)cancelTapped;
- (void)dataSource:(DataSource *)a3 confirmDeleteCollections:(NSArray *)a4 sourceView:(UIView *)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation CollectionPickerContaineeViewController

- (_TtP4Maps47CollectionPickerContaineeViewControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps47CollectionPickerContaineeViewControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCollectionEditSession:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionSession) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(CollectionPickerContaineeViewController *)&v8 initWithNibName:0 bundle:0];
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView) = 0;
  id v5 = a3;

  result = (_TtC4Maps39CollectionPickerContaineeViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(ContaineeViewController *)&v7 viewDidLoad];
  id v3 = [v2 cardPresentationController];
  if (v3)
  {
    v4 = v3;
    [v3 setTakesAvailableHeight:1];

    id v5 = [v2 cardPresentationController];
    if (v5)
    {
      id v6 = v5;
      [v5 setPresentedModally:1];

      sub_1002A11BC();
      sub_1002A17A0();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)cancelTapped
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    id v5 = self;
    [v4 collectionPickerContaineeViewControllerCancelTapped:v5];

    swift_unknownObjectRelease();
  }
}

- (void)dataSourceUpdated:(id)a3
{
  id v5 = a3;
  id v6 = self;
  CollectionPickerContaineeViewController.dataSourceUpdated(_:)((DataSource_optional *)a3);
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    objc_super v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_1002A21F0((uint64_t)v10);

  sub_1001189D4((uint64_t)v10);
}

- (void)dataSource:(DataSource *)a3 confirmDeleteCollections:(NSArray *)a4 sourceView:(UIView *)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v16 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v16 - 8);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a7);
  v20 = (CGFloat *)swift_allocObject();
  *((void *)v20 + 2) = a3;
  *((void *)v20 + 3) = a4;
  *((void *)v20 + 4) = a5;
  v20[5] = x;
  v20[6] = y;
  v20[7] = width;
  v20[8] = height;
  *((void *)v20 + 9) = v19;
  *((void *)v20 + 10) = self;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1015D9238;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1015D5D10;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = self;
  sub_1000A2D24((uint64_t)v18, (uint64_t)&unk_1015DA440, (uint64_t)v23);
  swift_release();
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_1001189D4((uint64_t)v7);
}

- (_TtC4Maps39CollectionPickerContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps39CollectionPickerContaineeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController_collectionListDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___modalHeaderView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps39CollectionPickerContaineeViewController____lazy_storage___tableView);
}

@end