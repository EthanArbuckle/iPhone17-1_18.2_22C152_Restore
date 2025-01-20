@interface FilterButton
- (BOOL)isHighlighted;
- (_TtC9SeymourUI12FilterButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI12FilterButton)initWithFrame:(CGRect)a3;
- (void)handleTimer:(id)a3;
- (void)handleTouchDown:(id)a3;
- (void)handleTouchUp:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation FilterButton

- (_TtC9SeymourUI12FilterButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI12FilterButton *)sub_239F0F58C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI12FilterButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_shouldShowHighlight) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI12FilterButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilterButton();
  return [(FilterButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_239F0F7E8(a3);
}

- (void)handleTimer:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_shouldShowHighlight) = 1;
  [(FilterButton *)self setHighlighted:1];
}

- (void)handleTouchDown:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  v8 = (objc_class *)objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_handleTimer_, 0, 0, 0.12);
  id v9 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer);
  *(Class *)((char *)&v7->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer) = v8;
}

- (void)handleTouchUp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI12FilterButton_highlightTimer));
}

@end