@interface SensitiveMessageIndicatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11TelephonyUI29SensitiveMessageIndicatorView)initWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation SensitiveMessageIndicatorView

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2F667C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1C2F66944(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtC11TelephonyUI29SensitiveMessageIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  double v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  double v9 = [(MessageIndicatorView *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel));
}

@end