@interface CanvasPickerToolbar
- (_TtC21JournalShareExtension19CanvasPickerToolbar)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension19CanvasPickerToolbar)initWithFrame:(CGRect)a3;
- (void)onButtonSelected:(id)a3;
@end

@implementation CanvasPickerToolbar

- (_TtC21JournalShareExtension19CanvasPickerToolbar)initWithCoder:(id)a3
{
  result = (_TtC21JournalShareExtension19CanvasPickerToolbar *)sub_10010AA60();
  __break(1u);
  return result;
}

- (void)onButtonSelected:(id)a3
{
  id v4 = a3;
  v7 = self;
  uint64_t v5 = sub_1000E0A64((unint64_t)[v4 tag], 0);
  if (v5 <= 0xFDu)
  {
    uint64_t v6 = v5;
    sub_1000E060C(v5);
    (*(void (**)(uint64_t))((char *)&v7->super.super.super.super.isa
                                    + OBJC_IVAR____TtC21JournalShareExtension19CanvasPickerToolbar_onSelect))(v6);
  }
}

- (_TtC21JournalShareExtension19CanvasPickerToolbar)initWithFrame:(CGRect)a3
{
  result = (_TtC21JournalShareExtension19CanvasPickerToolbar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end