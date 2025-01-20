@interface FeedbackSubmission
+ (BOOL)supportsSecureCoding;
- (_TtC9feedbackd18FeedbackSubmission)init;
- (_TtC9feedbackd18FeedbackSubmission)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FeedbackSubmission

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000BB10(v4);
}

- (_TtC9feedbackd18FeedbackSubmission)initWithCoder:(id)a3
{
  return (_TtC9feedbackd18FeedbackSubmission *)sub_10000BD20(a3);
}

- (_TtC9feedbackd18FeedbackSubmission)init
{
  result = (_TtC9feedbackd18FeedbackSubmission *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9feedbackd18FeedbackSubmission_date;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end