@interface ComposeReviewViewController
- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCompositionURL:(id)a3;
- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ComposeReviewViewController

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_475B50);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_37AF40();
    uint64_t v7 = sub_37AFA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_37AFA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC23ShelfKitCollectionViews27ComposeReviewViewController *)sub_125218((uint64_t)v6);
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_3843C0();
    id v8 = a4;
    a3 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  uint64_t v10 = [(ComposeReviewViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ComposeReviewViewController *)&v5 initWithCoder:a3];
}

@end