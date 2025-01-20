@interface CollectionViewHeaderView
- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithCoder:(id)a3;
- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation CollectionViewHeaderView

- (void)prepareForReuse
{
  v2 = self;
  sub_22DB03D50();
}

- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI24CollectionViewHeaderView *)sub_22DB042E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI24CollectionViewHeaderView *)sub_22DB04374(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24CollectionViewHeaderView_hostingView));
}

@end