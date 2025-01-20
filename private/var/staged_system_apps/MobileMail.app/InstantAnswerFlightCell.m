@interface InstantAnswerFlightCell
- (_TtC10MobileMail23InstantAnswerFlightCell)initWithCoder:(id)a3;
- (_TtC10MobileMail23InstantAnswerFlightCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation InstantAnswerFlightCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = type metadata accessor for UICellConfigurationState();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)__chkstk_darwin(v12);
  v5 = self;
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1002D7210(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (_TtC10MobileMail23InstantAnswerFlightCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail23InstantAnswerFlightCell *)sub_1002D93E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail23InstantAnswerFlightCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail23InstantAnswerFlightCell *)sub_1002D94F0(a3);
}

@end