@interface LibraryViewController.SyncUnavailableCollectionHeaderView
- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithCoder:(id)a3;
- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation LibraryViewController.SyncUnavailableCollectionHeaderView

- (void)prepareForReuse
{
  v2 = self;
  sub_1000654EC();
}

- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView *)sub_1000655A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithCoder:(id)a3
{
  return (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView *)sub_100065650(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView));

  swift_bridgeObjectRelease();
}

@end