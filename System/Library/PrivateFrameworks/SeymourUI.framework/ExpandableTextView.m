@interface ExpandableTextView
- (UIView)viewForLastBaselineLayout;
- (_TtC9SeymourUI18ExpandableTextView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18ExpandableTextView)initWithFrame:(CGRect)a3;
- (void)didTapLink:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)layoutSubviews;
@end

@implementation ExpandableTextView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_textLabel));
}

- (_TtC9SeymourUI18ExpandableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18ExpandableTextView *)sub_23A06B26C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18ExpandableTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A06D088();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandableTextView();
  id v2 = v3.receiver;
  [(ExpandableTextView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 0.0;
  v5.size.height = 0.0;
  if (!CGRectEqualToRect(v4, v5)) {
    sub_23A06BDDC(*((unsigned char *)v2 + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_state));
  }
}

- (void)didTapLink:(id)a3
{
  id v4 = a3;
  CGRect v5 = self;
  sub_23A06D480((uint64_t)v4);
}

- (void)handleTapGesture:(id)a3
{
  objc_super v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_onMoreTapped);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_239D03E2C((uint64_t)v3);
    v3(v6);
    sub_239C25118((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_onMoreTapped));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_linksBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_textLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_moreTextLabel));

  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18ExpandableTextView_tapTargetView);
}

@end