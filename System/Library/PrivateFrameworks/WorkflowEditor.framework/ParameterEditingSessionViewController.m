@interface ParameterEditingSessionViewController
- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithCoder:(id)a3;
- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelEditing;
- (void)finishEditingWithParameterState:(id)a3;
- (void)viewDidLoad;
@end

@implementation ParameterEditingSessionViewController

- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234A07E70();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_234A07F1C();
}

- (void)cancelEditing
{
  v2 = self;
  sub_234A0857C();
}

- (void)finishEditingWithParameterState:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_234A08624();
  swift_unknownObjectRelease();
}

- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_234B3B588();
  }
  id v5 = a4;
  sub_234A08700();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_parameter));
  swift_unknownObjectRelease();
  sub_23494A5D4((uint64_t)self+ OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_currentEditingController);
}

@end