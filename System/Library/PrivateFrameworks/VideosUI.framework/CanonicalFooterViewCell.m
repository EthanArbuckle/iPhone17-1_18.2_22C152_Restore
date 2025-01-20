@interface CanonicalFooterViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI23CanonicalFooterViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI23CanonicalFooterViewCell)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
@end

@implementation CanonicalFooterViewCell

- (_TtC8VideosUI23CanonicalFooterViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI23CanonicalFooterViewCell *)sub_1E36571FC();
}

- (_TtC8VideosUI23CanonicalFooterViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3657574();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  sub_1E3657674(a4, width);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E36581D4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalFooterViewCell_airingView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI23CanonicalFooterViewCell_separatorView);
}

@end