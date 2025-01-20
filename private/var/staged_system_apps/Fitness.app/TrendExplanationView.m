@interface TrendExplanationView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC10FitnessApp20TrendExplanationView)initWithCoder:(id)a3;
- (_TtC10FitnessApp20TrendExplanationView)initWithFrame:(CGRect)a3;
@end

@implementation TrendExplanationView

- (_TtC10FitnessApp20TrendExplanationView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp20TrendExplanationView *)sub_1006A517C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp20TrendExplanationView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC10FitnessApp20TrendExplanationView_textView;
  type metadata accessor for TrendsFooterTextView();
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&self->super.super.super.isa + v4) = v7;

  type metadata accessor for TrendExplanationView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a6 == 0;
}

- (void).cxx_destruct
{
}

@end