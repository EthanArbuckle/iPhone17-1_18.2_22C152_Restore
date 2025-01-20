@interface SessionStackedLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)noDataIndicator;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (_TtC9SeymourUI23SessionStackedLabelView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23SessionStackedLabelView)initWithFrame:(CGRect)a3;
@end

@implementation SessionStackedLabelView

- (UILabel)primaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel));
}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel));
}

- (_TtC9SeymourUI23SessionStackedLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23SessionStackedLabelView *)sub_23A313BEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23SessionStackedLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3143B0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel);
  v4 = self;
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v6 = v5;
  v7 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel);
  objc_msgSend(v7, sel_intrinsicContentSize);
  if (v6 <= v8) {
    double v6 = v8;
  }
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v10 = v9;
  objc_msgSend(v7, sel_intrinsicContentSize);
  double v12 = v11;

  double v13 = v10 + v12;
  double v14 = v6;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_secondaryLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionStackedLabelView_stackView);
}

- (NSString)noDataIndicator
{
  type metadata accessor for SeymourLocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = self;
  double v5 = self;
  id v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23A7F6298();

  v7 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

@end