@interface WFCollectionNameFieldCell
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC10WorkflowUI25WFCollectionNameFieldCell)initWithCoder:(id)a3;
- (_TtC10WorkflowUI25WFCollectionNameFieldCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textFieldValueDidChange;
@end

@implementation WFCollectionNameFieldCell

- (_TtC10WorkflowUI25WFCollectionNameFieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI25WFCollectionNameFieldCell *)sub_22DA9FAC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)textFieldValueDidChange
{
  v2 = self;
  sub_22DA9FE28();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22DA9FEF0();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DA9FFD8(v4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DAA0108(v4);

  return 1;
}

- (_TtC10WorkflowUI25WFCollectionNameFieldCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DAA0170();
}

- (void).cxx_destruct
{
  sub_22D9CC274(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10WorkflowUI25WFCollectionNameFieldCell_textDidChangeHandler));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUI25WFCollectionNameFieldCell_textField);
}

@end