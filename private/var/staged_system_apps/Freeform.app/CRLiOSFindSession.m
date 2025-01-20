@interface CRLiOSFindSession
- (BOOL)allowsReplacementForCurrentlyHighlightedResult;
- (BOOL)supportsReplacement;
- (_TtC8Freeform17CRLiOSFindSession)init;
- (int64_t)highlightedResultIndex;
- (int64_t)resultCount;
- (void)dealloc;
- (void)highlightNextResultInDirection:(int64_t)a3;
- (void)invalidateFoundResults;
- (void)performSearchWithQuery:(id)a3 options:(id)a4;
- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5;
- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5;
@end

@implementation CRLiOSFindSession

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v3 = self;
  id v4 = [v2 findReplaceDelegate];
  if (v4)
  {
    id v5 = [v4 interactiveCanvasControllerForFindController:v2];
    swift_unknownObjectRelease();
    [v5 setShowGrayOverlay:0];
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for CRLiOSFindSession();
  [(CRLiOSFindSession *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController));

  swift_unknownObjectWeakDestroy();
}

- (int64_t)resultCount
{
  v2 = self;
  sub_100DFC038();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)highlightedResultIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  int64_t v3 = self;
  id v4 = [v2 findResultIndex];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;

    int64_t result = v5 - 1;
    if (v5 - 1 >= 0) {
      return result;
    }
    __break(1u);
  }
  int64_t v7 = NSNotFound.getter();

  return v7;
}

- (void)highlightNextResultInDirection:(int64_t)a3
{
  id v4 = self;
  sub_100DFC160(a3);
}

- (void)invalidateFoundResults
{
  v2 = self;
  sub_100DFC250();
}

- (void)performSearchWithQuery:(id)a3 options:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_100DFC3A0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)supportsReplacement
{
  v2 = self;
  char v3 = sub_100DFC524();

  return v3 & 1;
}

- (BOOL)allowsReplacementForCurrentlyHighlightedResult
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  char v3 = self;
  id v4 = [v2 primaryFindResultSearchReference];
  if (v4)
  {
    unsigned __int8 v5 = [v4 isReplaceable];

    swift_unknownObjectRelease();
    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  id v8 = a5;
  id v9 = self;
  id v10 = String._bridgeToObjectiveC()();
  [v7 replaceWithString:v10 findAgain:0];

  swift_bridgeObjectRelease();
}

- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  id v8 = a5;
  id v9 = self;
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = String._bridgeToObjectiveC()();
  [v7 replaceAllOccurrencesOfString:v10 withString:v11];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8Freeform17CRLiOSFindSession)init
{
  int64_t result = (_TtC8Freeform17CRLiOSFindSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end