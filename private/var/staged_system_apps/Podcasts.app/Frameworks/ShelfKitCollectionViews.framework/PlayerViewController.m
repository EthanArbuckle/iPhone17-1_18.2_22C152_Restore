@interface PlayerViewController
- (UIViewController)presentingViewController;
- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)dealloc;
- (void)playerItemDidPlayToEndWithNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PlayerViewController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  [(PlayerViewController *)&v6 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  id v4 = v6.receiver;
  [(PlayerViewController *)&v6 viewDidAppear:v3];
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) == 1)
  {
    id v5 = [v4 player];
    [v5 play];

    id v4 = v5;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2F0EA0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  id v4 = v6.receiver;
  [(PlayerViewController *)&v6 viewWillDisappear:v3];
  id v5 = [v4 player];
  [v5 pause];
}

- (void)playerItemDidPlayToEndWithNotification:(id)a3
{
  uint64_t v4 = sub_37AD50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37AD40();
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) == 1)
    [(PlayerViewController *)self dismissViewControllerAnimated:1 completion:0];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (UIViewController)presentingViewController
{
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) == 1)
  {
    v2 = (UIViewController *)[(PlayerViewController *)self parentViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for PlayerViewController();
    v2 = [(PlayerViewController *)&v5 presentingViewController];
  }
  BOOL v3 = v2;

  return v3;
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_3843C0();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
    id v6 = a4;
    NSString v7 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlayerViewController();
  v9 = [(PlayerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return [(PlayerViewController *)&v5 initWithCoder:a3];
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithPlayerLayerView:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return [(PlayerViewController *)&v5 initWithPlayerLayerView:a3];
}

@end