@interface ClearAllButton
- (CGSize)intrinsicContentSize;
- (_TtC7Measure14ClearAllButton)initWithCoder:(id)a3;
@end

@implementation ClearAllButton

- (_TtC7Measure14ClearAllButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Measure14ClearAllButton_separator;
  type metadata accessor for SeparatorView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Measure14ClearAllButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_1004C27E0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  if (qword_1004C27D8 != -1) {
    swift_once();
  }
  CGSize.init(_:_:)();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14ClearAllButton_separator));
}

@end