@interface LibraryArtistsContainerViewController
- (UINavigationItem)navigationItem;
- (_TtC5Music37LibraryArtistsContainerViewController)initWithCoder:(id)a3;
- (_TtC5Music37LibraryArtistsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation LibraryArtistsContainerViewController

- (_TtC5Music37LibraryArtistsContainerViewController)initWithCoder:(id)a3
{
  result = (_TtC5Music37LibraryArtistsContainerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_layoutContainer) navigationItem];

  return (UINavigationItem *)v2;
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_1003DC650();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1003DC878();
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController();
  id v2 = v7.receiver;
  [(LibraryArtistsContainerViewController *)&v7 viewSafeAreaInsetsDidChange];
  id v3 = [v2 traitCollection];
  id v4 = [v3 horizontalSizeClass];

  if (v4 != (id)2) {
    goto LABEL_4;
  }
  id v5 = [v2 view];
  if (v5)
  {
    id v6 = v5;
    [v5 setNeedsLayout];

    id v2 = v6;
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1003DCBA0(a3);
}

- (_TtC5Music37LibraryArtistsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_artistListViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_layoutContainer);
}

@end