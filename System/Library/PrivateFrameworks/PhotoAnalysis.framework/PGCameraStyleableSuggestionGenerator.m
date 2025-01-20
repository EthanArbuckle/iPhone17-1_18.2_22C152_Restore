@interface PGCameraStyleableSuggestionGenerator
- (PGCameraStyleableSuggestionGenerator)init;
- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4;
@end

@implementation PGCameraStyleableSuggestionGenerator

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D22C3FCC((uint64_t)v6, v7);

  v9 = (void *)sub_1D2425550();
  swift_bridgeObjectRelease();

  return v9;
}

- (PGCameraStyleableSuggestionGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraStyleableSuggestionGenerator();
  return [(PGCameraStyleableSuggestionGenerator *)&v3 init];
}

@end