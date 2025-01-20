@interface WFIconPreview
- (_TtC10WorkflowUI13WFIconPreview)initWithCoder:(id)a3;
- (_TtC10WorkflowUI13WFIconPreview)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFIconPreview

- (_TtC10WorkflowUI13WFIconPreview)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI13WFIconPreview *)sub_22DBB2234(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DBB2340();
}

- (_TtC10WorkflowUI13WFIconPreview)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DBB2764();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI13WFIconPreview____lazy_storage___iconView);
}

@end