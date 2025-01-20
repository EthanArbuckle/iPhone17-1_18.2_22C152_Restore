@interface UndoButton
- (UIControl)undoButton;
- (_TtC7Measure10UndoButton)initWithCoder:(id)a3;
- (_TtC7Measure10UndoButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setUndoButton:(id)a3;
- (void)undoFrom:(id)a3;
@end

@implementation UndoButton

- (UIControl)undoButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC7Measure10UndoButton_undoButton));
}

- (void)setUndoButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure10UndoButton)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure10UndoButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_isEnabled) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_controlType) = 0;
  id v5 = a3;

  result = (_TtC7Measure10UndoButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Measure10UndoButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure10UndoButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure10UndoButton_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton);
}

- (void)undoFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100204634();
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100204764();

  return v9;
}

@end