@interface CardTitleView
- (CGSize)intrinsicContentSize;
- (UILabel)title;
- (_TtC7Measure13CardTitleView)init;
- (_TtC7Measure13CardTitleView)initWithCoder:(id)a3;
- (_TtC7Measure13CardTitleView)initWithFrame:(CGRect)a3;
@end

@implementation CardTitleView

- (UILabel)title
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC7Measure13CardTitleView_title));
}

- (_TtC7Measure13CardTitleView)init
{
  return (_TtC7Measure13CardTitleView *)sub_1000E5510();
}

- (_TtC7Measure13CardTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000E70B8();
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_1004C27E0;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1004F7DF8;
  if (qword_1004C2820 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1004F7E38;

  double v6 = *(double *)&v4;
  double v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7Measure13CardTitleView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC7Measure13CardTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13CardTitleView_separator);
}

@end