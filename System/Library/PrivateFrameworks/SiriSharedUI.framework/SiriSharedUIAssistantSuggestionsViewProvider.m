@interface SiriSharedUIAssistantSuggestionsViewProvider
- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)init;
- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4;
- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithTapHandler:(id)a3;
- (id)getInitialSuggestionViews;
- (id)getSuggestionViewsWithText:(id)a3;
- (void)fetchAutoCompletionViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 turnId:(id)a5 completion:(id)a6;
- (void)fetchConversationContinuerViewsWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 completion:(id)a6;
- (void)fetchConversationStarterViewsWithDeviceLocked:(BOOL)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5 isFirstInvocationSinceOSInstalled:(BOOL)a6 completion:(id)a7;
- (void)resetSuggestions;
- (void)setDialogPhase:(id)a3;
- (void)startNewTypingSession;
- (void)suggestionsWereShownForCallback;
@end

@implementation SiriSharedUIAssistantSuggestionsViewProvider

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithTapHandler:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = sub_20CA5BE08();
  _Block_release(v3);
  return (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)v4;
}

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4
{
  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  v9 = sub_20CA5C02C((uint64_t)sub_20CA5D32C, v7, (uint64_t)sub_20CA5D5F0, v8);
  swift_release();
  swift_release();
  return (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)v9;
}

- (void)fetchConversationStarterViewsWithDeviceLocked:(BOOL)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5 isFirstInvocationSinceOSInstalled:(BOOL)a6 completion:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  v13 = self;
  sub_20CA5C2CC(a3, a5, a6, (uint64_t)sub_20CA5D5F8, v12);
  swift_release();
}

- (void)fetchConversationContinuerViewsWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_20CA82F08();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  id v15 = a4;
  v14 = self;
  sub_20CA58878(v10, v12, v15, a5, (uint64_t)sub_20CA5D300, v13);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)fetchAutoCompletionViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 turnId:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_20CA82F08();
  uint64_t v12 = v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676EC250);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_20CA81D68();
    uint64_t v16 = sub_20CA81D88();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = sub_20CA81D88();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v9;
  v19 = self;
  sub_20CA59D8C(v10, v12, v7, (uint64_t)v15, (uint64_t)sub_20CA5D2D4, v18);
  swift_release();
  swift_bridgeObjectRelease();

  sub_20CA0B908((uint64_t)v15, &qword_2676EC250);
}

- (id)getSuggestionViewsWithText:(id)a3
{
  v3 = self;
  sub_20CA5C924();
  swift_bridgeObjectRetain();

  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  v4 = (void *)sub_20CA82FA8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)getInitialSuggestionViews
{
  v2 = self;
  sub_20CA5C924();
  swift_bridgeObjectRetain();

  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  v3 = (void *)sub_20CA82FA8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)resetSuggestions
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionViews);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x263F8EE78];
  void *v3 = MEMORY[0x263F8EE78];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionsList);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

- (void)suggestionsWereShownForCallback
{
  v2 = self;
  sub_20CA5B3E8();
}

- (void)setDialogPhase:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA5B834(v4);
}

- (void)startNewTypingSession
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionsProvider);
  uint64_t v4 = sub_20CA81D88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_20CA81D78();
  uint64_t v9 = v3 + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_typingSessionId;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v9, v7, v4);
  swift_endAccess();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_emittedRequestLink) = 0;
}

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)init
{
  result = (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20CA0B908((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_requestId, &qword_2676EC250);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionsProvider));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end