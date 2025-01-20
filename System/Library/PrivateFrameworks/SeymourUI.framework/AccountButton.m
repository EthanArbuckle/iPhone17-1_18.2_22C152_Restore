@interface AccountButton
- (UIColor)tintColor;
- (_TtC9SeymourUI13AccountButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI13AccountButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)longPressWithGesture:(id)a3;
- (void)setTintColor:(id)a3;
- (void)tappedDown;
- (void)tappedUp;
@end

@implementation AccountButton

- (_TtC9SeymourUI13AccountButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13AccountButton *)AccountButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13AccountButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A133194();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AccountButton();
  v2 = (char *)v4.receiver;
  [(AccountButton *)&v4 layoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightView], sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AccountButton();
  v2 = [(AccountButton *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AccountButton();
  id v4 = a3;
  CGRect v5 = (char *)v8.receiver;
  [(AccountButton *)&v8 setTintColor:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI13AccountButton_imageView];
  id v7 = objc_msgSend(v5, sel_tintColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setTintColor_, v7);
}

- (void)tappedDown
{
  v2 = self;
  sub_23A1321F4();
}

- (void)tappedUp
{
  uint64_t v2 = OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightTask;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightTask))
  {
    id v3 = self;
    swift_retain();
    sub_23A7FF5A8();
    swift_release();
  }
  else
  {
    id v4 = self;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v2) = 0;
  swift_release();
  sub_23A13276C(0);
}

- (void)longPressWithGesture:(id)a3
{
  id v4 = a3;
  id v7 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    CGRect v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.super.isa
                                        + OBJC_IVAR____TtC9SeymourUI13AccountButton_onLongPressed);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_239C25118((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13AccountButton_onLongPressed));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13AccountButton_avatarViewController));

  swift_release();
}

@end