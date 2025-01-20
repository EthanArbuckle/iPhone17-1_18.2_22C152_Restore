@interface CanvasPickerToolbar
- (_TtC7Journal19CanvasPickerToolbar)initWithCoder:(id)a3;
- (_TtC7Journal19CanvasPickerToolbar)initWithFrame:(CGRect)a3;
- (void)onButtonSelected:(id)a3;
@end

@implementation CanvasPickerToolbar

- (_TtC7Journal19CanvasPickerToolbar)initWithCoder:(id)a3
{
  result = (_TtC7Journal19CanvasPickerToolbar *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)onButtonSelected:(id)a3
{
  id v4 = a3;
  v7 = self;
  uint64_t v5 = sub_1001982B0((unint64_t)[v4 tag], 0);
  if (v5 <= 0xFDu)
  {
    uint64_t v6 = v5;
    sub_100197DC8(v5);
    (*(void (**)(uint64_t))((char *)&v7->super.super.super.super.isa
                                    + OBJC_IVAR____TtC7Journal19CanvasPickerToolbar_onSelect))(v6);
  }
}

- (_TtC7Journal19CanvasPickerToolbar)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal19CanvasPickerToolbar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end