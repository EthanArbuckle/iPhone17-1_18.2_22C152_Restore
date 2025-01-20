@interface TintableLabel
- (_TtC9SeymourUI13TintableLabel)initWithCoder:(id)a3;
- (_TtC9SeymourUI13TintableLabel)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation TintableLabel

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TintableLabel();
  id v2 = v4.receiver;
  [(TintableLabel *)&v4 tintColorDidChange];
  id v3 = objc_msgSend(v2, sel_tintColor, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_setTextColor_, v3);
}

- (_TtC9SeymourUI13TintableLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TintableLabel();
  return -[TintableLabel initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI13TintableLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintableLabel();
  return [(TintableLabel *)&v5 initWithCoder:a3];
}

@end