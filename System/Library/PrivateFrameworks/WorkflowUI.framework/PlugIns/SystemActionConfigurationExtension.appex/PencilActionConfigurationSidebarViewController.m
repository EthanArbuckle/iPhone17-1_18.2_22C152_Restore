@interface PencilActionConfigurationSidebarViewController
- (_TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController)initWithCoder:(id)a3;
- (_TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PencilActionConfigurationSidebarViewController

- (_TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000E858();
}

- (void)dealloc
{
  v2 = self;
  sub_10000E91C();
}

- (void).cxx_destruct
{
  sub_100007EA4((uint64_t)self+ OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000EA44();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000FAC0();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000149B0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014970();
  id v10 = a3;
  v11 = self;
  sub_100010B4C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100010E38();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100010EF4((uint64_t)v7, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100010FF8();
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000110B8(v4);
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100011200();
}

- (_TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100015080();
  }
  id v5 = a4;
  sub_10001163C();
}

@end