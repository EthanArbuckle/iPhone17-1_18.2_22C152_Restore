@interface PlaceSummaryTextHighlightConfiguration
- (NSString)typedAutocompleteQuery;
- (_TtC4Maps29PlaceSummaryTextHighlightType)type;
- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)init;
- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)initWithTypedAutocompleteQuery:(id)a3 type:(id)a4;
@end

@implementation PlaceSummaryTextHighlightConfiguration

- (NSString)typedAutocompleteQuery
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC4Maps29PlaceSummaryTextHighlightType)type
{
  return (_TtC4Maps29PlaceSummaryTextHighlightType *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_type));
}

- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)initWithTypedAutocompleteQuery:(id)a3 type:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_typedAutocompleteQuery);
  uint64_t *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_type) = (Class)a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlaceSummaryTextHighlightConfiguration();
  id v9 = a4;
  return [(PlaceSummaryTextHighlightConfiguration *)&v11 init];
}

- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)init
{
  result = (_TtC4Maps38PlaceSummaryTextHighlightConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_type);
}

@end