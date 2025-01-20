@interface SenseRow
- (UIImageView)checkmark;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC17SequoiaTranslator8SenseRow)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator8SenseRow)initWithFrame:(CGRect)a3;
- (void)setCheckmark:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SenseRow

- (UILabel)titleLabel
{
  v2 = self;
  id v3 = sub_1001A35D8();

  return (UILabel *)v3;
}

- (void)setTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)subtitleLabel
{
  v2 = self;
  id v3 = sub_1001A3780();

  return (UILabel *)v3;
}

- (void)setSubtitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel) = (Class)a3;
  id v3 = a3;
}

- (UIImageView)checkmark
{
  v2 = self;
  id v3 = sub_1001A3960();

  return (UIImageView *)v3;
}

- (void)setCheckmark:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark) = (Class)a3;
  id v3 = a3;
}

- (_TtC17SequoiaTranslator8SenseRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A44B4();
}

- (_TtC17SequoiaTranslator8SenseRow)initWithFrame:(CGRect)a3
{
  result = (_TtC17SequoiaTranslator8SenseRow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmarkImage));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow_sense;

  sub_10000AB68((uint64_t)v3);
}

@end