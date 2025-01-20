@interface TTRIOptionMenuTitlelessPopupButton
- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation TTRIOptionMenuTitlelessPopupButton

- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[TTRIOptionMenuTitlelessPopupButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B922F264();

  return v7;
}

- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = [(TTRIOptionMenuTitlelessPopupButton *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1B922F264();
  }
  return v6;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3) {
    sub_1B996E9F0();
  }
  v7 = self;
  id v8 = [(TTRIOptionMenuTitlelessPopupButton *)v7 traitCollection];
  id v9 = objc_msgSend(v8, sel_preferredContentSizeCategory);

  sub_1B996FB10();
  v10 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();
  v11.receiver = v7;
  v11.super_class = ObjectType;
  [(TTRIOptionMenuTitlelessPopupButton *)&v11 setTitle:v10 forState:0];

  swift_bridgeObjectRelease();
}

@end