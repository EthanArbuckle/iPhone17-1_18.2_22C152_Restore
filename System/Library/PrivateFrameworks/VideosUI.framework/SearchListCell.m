@interface SearchListCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIButton)buttonView;
- (VUILabel)resultsContextLabel;
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (_TtC8VideosUI14SearchListCell)initWithCoder:(id)a3;
- (_TtC8VideosUI14SearchListCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setButtonView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setResultsContextLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SearchListCell

- (VUILabel)resultsContextLabel
{
  v2 = sub_1E378AE60();
  return (VUILabel *)v2;
}

- (void)setResultsContextLabel:(id)a3
{
  OUTLINED_FUNCTION_33_99((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  OUTLINED_FUNCTION_8_8();
  sub_1E378AEE4();
}

- (VUILabel)titleLabel
{
  v2 = sub_1E378B058();
  return (VUILabel *)v2;
}

- (void)setTitleLabel:(id)a3
{
  OUTLINED_FUNCTION_33_99((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  OUTLINED_FUNCTION_8_8();
  sub_1E378B0DC();
}

- (VUILabel)subtitleLabel
{
  v2 = sub_1E378B210();
  return (VUILabel *)v2;
}

- (void)setSubtitleLabel:(id)a3
{
  OUTLINED_FUNCTION_33_99((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  OUTLINED_FUNCTION_8_8();
  sub_1E378B294();
}

- (VUIButton)buttonView
{
  v2 = sub_1E378B94C();
  return (VUIButton *)v2;
}

- (void)setButtonView:(id)a3
{
  OUTLINED_FUNCTION_33_99((uint64_t)self, (uint64_t)a2, a3);
  id v4 = v3;
  OUTLINED_FUNCTION_8_8();
  sub_1E378B9D0();
}

- (_TtC8VideosUI14SearchListCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI14SearchListCell *)sub_1E378BD6C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_1E378BE98(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E378D498();
}

- (_TtC8VideosUI14SearchListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E378D534();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E378D628();
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_1E378D6F8(a3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_1E378D8BC(a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_resultsContextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_cellImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell_badgeView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI14SearchListCell____lazy_storage___bottomSeparatorView);
}

- (id)zoomSourceView
{
  v2 = self;
  id v3 = (void *)sub_1E378DEC0();

  return v3;
}

@end