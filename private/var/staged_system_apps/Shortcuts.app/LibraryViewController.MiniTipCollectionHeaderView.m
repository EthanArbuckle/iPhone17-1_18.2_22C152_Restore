@interface LibraryViewController.MiniTipCollectionHeaderView
- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithCoder:(id)a3;
- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation LibraryViewController.MiniTipCollectionHeaderView

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AFDE0();
}

- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView *)sub_1000AFE98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithCoder:(id)a3
{
  return (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView *)sub_1000AFF44(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView));

  swift_bridgeObjectRelease();
}

@end