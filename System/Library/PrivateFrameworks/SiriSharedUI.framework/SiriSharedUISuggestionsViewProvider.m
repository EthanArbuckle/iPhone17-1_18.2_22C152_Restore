@interface SiriSharedUISuggestionsViewProvider
- (_TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider)init;
- (id)makeSuggestionsViewWithSuggestionsResizeHandler:(id)a3;
- (void)filterSuggestionsWithText:(id)a3;
- (void)hideConversationStarterSuggestionsIfNecessary;
- (void)makeConversationContinuerSuggestionsViewWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 keyboardShowing:(BOOL)a6 suggestionTapHandler:(id)a7;
- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 invocationSource:(int64_t)a6 suggestionTapHandler:(id)a7;
- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 suggestionTapHandler:(id)a6;
- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 suggestionTapHandler:(id)a5;
- (void)setShowSuggestions:(BOOL)a3;
- (void)showConversationStarterSuggestionsForTwoShot;
@end

@implementation SiriSharedUISuggestionsViewProvider

- (id)makeSuggestionsViewWithSuggestionsResizeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_20CA393A8((uint64_t)sub_20CA3ACAC, v5);

  swift_release();
  return v7;
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 suggestionTapHandler:(id)a5
{
  BOOL v6 = a3;
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  sub_20CA397FC(v6, a4, 0, 0, (uint64_t)sub_20CA3AFD8, v9);

  swift_release();
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 suggestionTapHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_20CA397FC(v8, a4, v6, 0, (uint64_t)sub_20CA3AFD8, v11);

  swift_release();
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 invocationSource:(int64_t)a6 suggestionTapHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v10 = a3;
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  v14 = self;
  sub_20CA397FC(v10, a4, v8, a6, (uint64_t)sub_20CA3AFD8, v13);

  swift_release();
}

- (void)makeConversationContinuerSuggestionsViewWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 keyboardShowing:(BOOL)a6 suggestionTapHandler:(id)a7
{
  BOOL v8 = a5;
  uint64_t v11 = _Block_copy(a7);
  uint64_t v12 = sub_20CA82F08();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  id v16 = a4;
  v17 = self;
  sub_20CA39CB8(v12, v14, v16, v8, a6, (uint64_t)sub_20CA3AC98, v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)hideConversationStarterSuggestionsIfNecessary
{
}

- (void)showConversationStarterSuggestionsForTwoShot
{
}

- (void)setShowSuggestions:(BOOL)a3
{
  v4 = self;
  swift_retain();
  sub_20CA316BC(a3);

  swift_release();
}

- (void)filterSuggestionsWithText:(id)a3
{
}

- (_TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider_suggestionsDataModel;
  type metadata accessor for SiriSharedUISuggestionsDataModel();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_20CA301C0();
  uint64_t v5 = (Class *)((char *)&v4->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider_suggestionsView);
  *uint64_t v5 = 0;
  v5[1] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SiriSharedUISuggestionsViewProvider();
  return [(SiriSharedUISuggestionsViewProvider *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end