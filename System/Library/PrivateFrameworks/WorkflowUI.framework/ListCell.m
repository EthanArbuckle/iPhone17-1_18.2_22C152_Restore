@interface ListCell
- (_TtC10WorkflowUI8ListCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUI8ListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ListCell

- (void)layoutSubviews
{
  v2 = self;
  sub_22DB24E48();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_22DB24F54();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_22DC903D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC903B8();
  v8 = self;
  sub_22DB2503C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC10WorkflowUI8ListCell)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI8ListCell *)sub_22DB25CDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUI8ListCell)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI8ListCell *)sub_22DB25D7C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI8ListCell_hostingView));
  swift_release();
}

@end