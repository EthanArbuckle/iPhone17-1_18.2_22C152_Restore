@interface RowView
- (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView)initWithCoder:(id)a3;
- (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView)initWithFrame:(CGRect)a3;
@end

@implementation RowView

- (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView *)sub_2349DFB38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView *)sub_2349DFBD0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A7122D355652C430CB8A6535180FDA307RowView____lazy_storage___textLabel));
}

@end