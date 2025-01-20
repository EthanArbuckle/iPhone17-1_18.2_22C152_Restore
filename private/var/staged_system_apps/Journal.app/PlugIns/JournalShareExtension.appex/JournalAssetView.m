@interface JournalAssetView
- (_TtC21JournalShareExtension16JournalAssetView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension16JournalAssetView)initWithFrame:(CGRect)a3;
@end

@implementation JournalAssetView

- (_TtC21JournalShareExtension16JournalAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC21JournalShareExtension16JournalAssetView *)sub_10009D8F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21JournalShareExtension16JournalAssetView)initWithCoder:(id)a3
{
  return (_TtC21JournalShareExtension16JournalAssetView *)sub_10009DA04(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension16JournalAssetView_fallbackView));
  v3 = (char *)self + OBJC_IVAR____TtC21JournalShareExtension16JournalAssetView_loadingDelegate;

  sub_100024244((uint64_t)v3);
}

@end