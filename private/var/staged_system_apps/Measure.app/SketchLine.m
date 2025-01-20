@interface SketchLine
- (_TtC7Measure10SketchLine)initWithCoder:(id)a3;
- (_TtC7Measure10SketchLine)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SketchLine

- (_TtC7Measure10SketchLine)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure10SketchLine *)sub_100158618(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for SketchLine, &qword_1004CD698);
}

- (_TtC7Measure10SketchLine)initWithCoder:(id)a3
{
  result = (_TtC7Measure10SketchLine *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100158108();
}

@end