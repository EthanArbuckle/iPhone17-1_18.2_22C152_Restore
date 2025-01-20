@interface HistoryButton
- (_TtC7Measure13HistoryButton)initWithCoder:(id)a3;
- (_TtC7Measure13HistoryButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)showHistoryFrom:(id)a3;
@end

@implementation HistoryButton

- (_TtC7Measure13HistoryButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_tapHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_button) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_controlType) = 0;
  id v5 = a3;

  result = (_TtC7Measure13HistoryButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Measure13HistoryButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure13HistoryButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_tapHandler));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13HistoryButton_button);
}

- (void)showHistoryFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100095970();
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100095A38();

  return v9;
}

@end