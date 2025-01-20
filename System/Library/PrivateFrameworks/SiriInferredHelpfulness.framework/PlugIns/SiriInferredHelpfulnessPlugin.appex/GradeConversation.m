@interface GradeConversation
- (_TtC29SiriInferredHelpfulnessPlugin17GradeConversation)init;
- (_TtC29SiriInferredHelpfulnessPlugin17GradeConversation)initWithTrialClient:(id)a3;
- (void)run:(id)a3;
@end

@implementation GradeConversation

- (_TtC29SiriInferredHelpfulnessPlugin17GradeConversation)initWithTrialClient:(id)a3
{
  if (a3)
  {
    sub_100006DA0();
    id v5 = a3;
    sub_100006D80();
    sub_100006D90();

    swift_release();
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GradeConversation();
  v6 = [(GradeConversation *)&v8 init];

  return v6;
}

- (void)run:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_100006388(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC29SiriInferredHelpfulnessPlugin17GradeConversation)init
{
  result = (_TtC29SiriInferredHelpfulnessPlugin17GradeConversation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end