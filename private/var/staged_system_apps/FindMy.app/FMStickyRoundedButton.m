@interface FMStickyRoundedButton
- (BOOL)isSelected;
- (_TtC6FindMy21FMStickyRoundedButton)initWithCoder:(id)a3;
- (_TtC6FindMy21FMStickyRoundedButton)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMStickyRoundedButton

- (_TtC6FindMy21FMStickyRoundedButton)initWithCoder:(id)a3
{
  result = (_TtC6FindMy21FMStickyRoundedButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = qword_1006AE010;
  id v5 = a3;
  v6 = self;
  v8 = v6;
  if (v4 != -1)
  {
    swift_once();
    v6 = v8;
  }
  [(FMStickyRoundedButton *)v6 setTitleColor:qword_1006D17D8 forState:0];
  uint64_t v7 = qword_1006D17C8;
  [(FMStickyRoundedButton *)v8 setTitleColor:qword_1006D17C8 forState:1];
  [(FMStickyRoundedButton *)v8 setTitleColor:v7 forState:4];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  uint64_t v7 = self;
  sub_1001CABE4(v4, v5, v6, height);
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMStickyRoundedButton();
  return [(FMStickyRoundedButton *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMStickyRoundedButton();
  id v4 = v5.receiver;
  [(FMStickyRoundedButton *)&v5 setSelected:v3];
  [v4 setNeedsDisplay];
}

- (_TtC6FindMy21FMStickyRoundedButton)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy21FMStickyRoundedButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end