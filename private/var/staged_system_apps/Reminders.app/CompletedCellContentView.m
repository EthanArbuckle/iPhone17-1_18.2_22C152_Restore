@interface CompletedCellContentView
- (NSArray)accessibilityElements;
- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithArrangedSubviews:(id)a3;
- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithFrame:(CGRect)a3;
- (void)showHideAction:(id)a3;
@end

@implementation CompletedCellContentView

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithCoder:(id)a3
{
  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_1005099D8();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)showHideAction:(id)a3
{
  swift_unknownObjectRetain();
  NSArray v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v5 = *(void (**)(uint64_t))&v4->clearButton[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_1000499C4((uint64_t)v5);
  }

  sub_100038CD8((uint64_t)&v7);
}

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = &self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  uint64_t v4 = *(void *)&self->clearButton[OBJC_IVAR____TtC9RemindersP33_C60407860759646D296FA14F7D6D1E3324CompletedCellContentView_internalConfiguration];
  uint64_t v5 = *((void *)v3 + 5);
  swift_bridgeObjectRelease();
  sub_1000499C4(v4);

  sub_1000499C4(v5);
}

@end