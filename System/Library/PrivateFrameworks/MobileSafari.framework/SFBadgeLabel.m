@interface SFBadgeLabel
- (_TtC12MobileSafari12SFBadgeLabel)initWithCoder:(id)a3;
- (_TtC12MobileSafari12SFBadgeLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SFBadgeLabel

- (_TtC12MobileSafari12SFBadgeLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12MobileSafari12SFBadgeLabel_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12MobileSafari12SFBadgeLabel *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SFBadgeLabel();
  id v2 = v3.receiver;
  [(SFBadgeLabel *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  objc_msgSend(v2, sel__setContinuousCornerRadius_, CGRectGetHeight(v4) * 0.5);
}

- (_TtC12MobileSafari12SFBadgeLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC12MobileSafari12SFBadgeLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end