@interface RoundChevronButton
- (_TtC8AppStore18RoundChevronButton)init;
- (_TtC8AppStore18RoundChevronButton)initWithCoder:(id)a3;
- (_TtC8AppStore18RoundChevronButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundChevronButton

- (_TtC8AppStore18RoundChevronButton)init
{
  return (_TtC8AppStore18RoundChevronButton *)sub_10007E1BC();
}

- (_TtC8AppStore18RoundChevronButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003BBBB0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003BB6C8();
}

- (_TtC8AppStore18RoundChevronButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore18RoundChevronButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18RoundChevronButton_vibrancyView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore18RoundChevronButton_chevronImageView);
}

@end