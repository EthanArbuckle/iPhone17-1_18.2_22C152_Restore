@interface CanonicalInfoCardView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (FocusableTextView)accessibilityDescriptionLabel;
- (VUIImageView)accessibilityImageView;
- (VUILabel)accessibilitySubtitleLabel;
- (VUILabel)accessibilityTitleLabel;
- (_TtC8VideosUI20TomatometerTableView)accessibilityTableView;
- (_TtC8VideosUI21CanonicalInfoCardView)initWithCoder:(id)a3;
- (_TtC8VideosUI21CanonicalInfoCardView)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
@end

@implementation CanonicalInfoCardView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E329FAF4(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E32A0D44();
}

- (VUILabel)accessibilityTitleLabel
{
  v2 = sub_1E329F944();
  return (VUILabel *)v2;
}

- (VUILabel)accessibilitySubtitleLabel
{
  v2 = sub_1E329F998();
  return (VUILabel *)v2;
}

- (FocusableTextView)accessibilityDescriptionLabel
{
  v2 = sub_1E329F9EC();
  return (FocusableTextView *)v2;
}

- (VUIImageView)accessibilityImageView
{
  v2 = sub_1E32A0F70();
  return (VUIImageView *)v2;
}

- (_TtC8VideosUI20TomatometerTableView)accessibilityTableView
{
  v2 = sub_1E32A0FEC();
  return (_TtC8VideosUI20TomatometerTableView *)v2;
}

- (_TtC8VideosUI21CanonicalInfoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI21CanonicalInfoCardView *)sub_1E32A1034();
}

- (_TtC8VideosUI21CanonicalInfoCardView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI21CanonicalInfoCardView *)sub_1E32A10F0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_tableView);
}

@end