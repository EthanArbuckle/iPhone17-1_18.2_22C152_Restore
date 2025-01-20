@interface SportsCanonicalBannerCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithCoder:(id)a3;
- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)onSystemTraitCollectionDidChange:(id)a3;
- (void)vui_cellDidEndDisplaying;
- (void)vui_cellWillBeDisplayed;
- (void)vui_prepareForReuse;
@end

@implementation SportsCanonicalBannerCell

- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25SportsCanonicalBannerCell *)sub_1E3749BC4();
}

- (_TtC8VideosUI25SportsCanonicalBannerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3749CE0();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3749E0C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_uberBackgroundView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_transitionBackgroundView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_newBannerAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_newBannerView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsCanonicalBannerCell_scoreboardUpdateTimer));
  swift_release();
  swift_release();
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E3749FD0();
}

- (void)vui_cellWillBeDisplayed
{
  v2 = self;
  sub_1E374A0E8((SEL *)&selRef_vui_cellWillBeDisplayed, (uint64_t (*)(id))sub_1E3257F74);
}

- (void)vui_cellDidEndDisplaying
{
  v2 = self;
  sub_1E374A0E8((SEL *)&selRef_vui_cellDidEndDisplaying, (uint64_t (*)(id))sub_1E325877C);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E374A1A4(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)onSystemTraitCollectionDidChange:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  double v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  double v10 = self;
  sub_1E374C6D8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

@end