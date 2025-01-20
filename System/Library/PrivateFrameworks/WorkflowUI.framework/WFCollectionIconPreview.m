@interface WFCollectionIconPreview
- (_TtC10WorkflowUI23WFCollectionIconPreview)initWithCoder:(id)a3;
- (_TtC10WorkflowUI23WFCollectionIconPreview)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WFCollectionIconPreview

- (_TtC10WorkflowUI23WFCollectionIconPreview)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI23WFCollectionIconPreview *)sub_22DB11348(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DB11454();
}

- (_TtC10WorkflowUI23WFCollectionIconPreview)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB11504();
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI23WFCollectionIconPreview____lazy_storage___iconView);
}

@end