@interface PHAPromptSuggestionCachingTask
- (PHAPromptSuggestionCachingTask)init;
@end

@implementation PHAPromptSuggestionCachingTask

- (PHAPromptSuggestionCachingTask)init
{
  result = (PHAPromptSuggestionCachingTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PHAPromptSuggestionCachingTask_worker);
  v3 = (char *)self + OBJC_IVAR___PHAPromptSuggestionCachingTask_logger;
  uint64_t v4 = sub_1D2425030();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end