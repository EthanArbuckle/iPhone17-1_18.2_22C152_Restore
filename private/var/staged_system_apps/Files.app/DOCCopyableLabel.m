@interface DOCCopyableLabel
- (BOOL)canBecomeFirstResponder;
- (UIColor)textColor;
- (_TtC5Files16DOCCopyableLabel)initWithCoder:(id)a3;
- (_TtC5Files16DOCCopyableLabel)initWithFrame:(CGRect)a3;
- (void)copyDetail;
- (void)handleTapWithSender:(id)a3;
- (void)setTextColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCopyableLabel

- (UIColor)textColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  v2 = [(DOCCopyableLabel *)&v4 textColor];

  return v2;
}

- (void)setTextColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  [(DOCCopyableLabel *)&v4 setTextColor:a3];
}

- (void)handleTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3 && swift_unknownObjectWeakLoadStrong())
  {
    sub_1004769A0();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)canBecomeFirstResponder
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files16DOCCopyableLabel_supportsCopy);
}

- (void)copyDetail
{
  v2 = self;
  sub_100222CF0();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_100223028();
}

- (_TtC5Files16DOCCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5Files16DOCCopyableLabel *)sub_100223138(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files16DOCCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC5Files16DOCCopyableLabel *)sub_100223268(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCCopyableLabel_textColorIfStaticText));
  swift_bridgeObjectRelease();
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files16DOCCopyableLabel_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCCopyableLabel____lazy_storage___tapGesture));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files16DOCCopyableLabel____lazy_storage___menuInteraction);
}

@end