@interface ICMoveViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (ICDataSource)dataSource;
- (ICMoveViewController)initWithCoder:(id)a3;
- (ICMoveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICMoveViewController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4;
- (ICMoveViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5;
- (NSArray)sourceObjectIds;
- (id)completionHandler;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)promptToAddFolderIn:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICMoveViewController

- (NSArray)sourceObjectIds
{
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (id)completionHandler
{
  if (*(void *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler])
  {
    uint64_t v2 = *(void *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler + 8];
    v5[4] = *(void *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100196704;
    v5[3] = &unk_10063A558;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCompletionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001A36CC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
  uint64_t v8 = *(void *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10002E70C(v8);
}

- (ICMoveViewController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4
{
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = (ICMoveViewController *)sub_1003D5568((uint64_t)v6, v5);

  return v7;
}

- (ICMoveViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003D56A4();
}

- (void)loadView
{
  uint64_t v2 = self;
  id v3 = sub_1003D5020(&OBJC_IVAR___ICMoveViewController____lazy_storage___collectionView, (uint64_t (*)(uint64_t))sub_1003D4544);
  [(ICMoveViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_1003D3C08();
}

- (ICDataSource)dataSource
{
  uint64_t v2 = self;
  id v3 = sub_1003D4408();

  return (ICDataSource *)v3;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v13 = [v10 cellForItemAtIndexPath:isa];

  if (!v13)
  {

LABEL_6:
    char v16 = 1;
    goto LABEL_7;
  }
  self;
  v14 = (void *)swift_dynamicCastObjCClass();
  if (!v14)
  {

    goto LABEL_6;
  }
  unsigned __int8 v15 = [v14 forceDisabledAppearance];

  char v16 = v15 ^ 1;
LABEL_7:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1003D48AC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)promptToAddFolderIn:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003D4B7C(a3);
}

- (ICMoveViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  id v5 = a4;
  result = (ICMoveViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICMoveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICMoveViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10002E70C(*(void *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler]);

  id v3 = *(void **)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController____lazy_storage___dismissAction];
}

@end