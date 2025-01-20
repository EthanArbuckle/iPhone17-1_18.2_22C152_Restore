@interface ProactiveSuggestionProvider
- (_TtC13SleepHealthUI27ProactiveSuggestionProvider)init;
- (void)hksp_suggestedSleepScheduleWithCompletion:(id)a3;
@end

@implementation ProactiveSuggestionProvider

- (void)hksp_suggestedSleepScheduleWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F4B2F0]);
  v7 = self;
  id v8 = objc_msgSend(v6, sel_init);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1AD86FAD0;
  *(void *)(v9 + 24) = v5;
  v11[4] = sub_1AD870844;
  v11[5] = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1AD86F738;
  v11[3] = &block_descriptor_13;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_predictedSleepSuggestionWithCompletionHandler_, v10);
  _Block_release(v10);

  swift_release();
}

- (_TtC13SleepHealthUI27ProactiveSuggestionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProactiveSuggestionProvider();
  return [(ProactiveSuggestionProvider *)&v3 init];
}

@end