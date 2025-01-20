@interface TTRIQuickBarDragSelectableButton
- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TTRIQuickBarDragSelectableButton

- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_draggingSession) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TTRIQuickBarDragSelectableButton();
  v8 = -[TTRIQuickBarDragSelectableButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  [(TTRIQuickBarDragSelectableButton *)v8 setMultipleTouchEnabled:0];
  return v8;
}

- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton *)sub_1B933CF08(a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_1B933D54C();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_draggingSession) = 0;
  id v5 = a4;
  v6 = self;
  swift_release();
  [(TTRIQuickBarDragSelectableButton *)v6 setHighlighted:0];
  [(TTRIQuickBarDragSelectableButton *)v6 setSelected:0];
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_delegate);

  swift_release();
}

@end