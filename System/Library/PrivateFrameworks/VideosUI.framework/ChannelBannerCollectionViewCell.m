@interface ChannelBannerCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)onSystemTraitCollectionDidChange:(id)a3;
@end

@implementation ChannelBannerCollectionViewCell

- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI31ChannelBannerCollectionViewCell *)sub_1E344D4B0();
}

- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E344D568();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  double v6 = OUTLINED_FUNCTION_11_2();
  sub_1E344D610(a4, v6);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31ChannelBannerCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31ChannelBannerCollectionViewCell_transitionBackgroundView));
  swift_release();
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
  sub_1E344F428();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

@end