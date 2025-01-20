@interface PromptSuggestionValidationObservation
- (_TtC18PhotosIntelligence37PromptSuggestionValidationObservation)init;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation PromptSuggestionValidationObservation

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2596BB32C();
}

- (_TtC18PhotosIntelligence37PromptSuggestionValidationObservation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence37PromptSuggestionValidationObservation_photoLibrary));
  v3 = (char *)self + OBJC_IVAR____TtC18PhotosIntelligence37PromptSuggestionValidationObservation_logger;
  sub_259843A80();
  OUTLINED_FUNCTION_2();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence37PromptSuggestionValidationObservation_observedPeopleFetchRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence37PromptSuggestionValidationObservation_observedAssetFetchRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence37PromptSuggestionValidationObservation_observers));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end