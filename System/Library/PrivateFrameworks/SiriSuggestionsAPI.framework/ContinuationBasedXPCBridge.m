@interface ContinuationBasedXPCBridge
- (_TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge)init;
- (void)connectionErrorWithError:(id)a3;
- (void)finalise;
- (void)sendSuggestionsWithSuggestions:(id)a3;
@end

@implementation ContinuationBasedXPCBridge

- (void)sendSuggestionsWithSuggestions:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_25DB51AA8();
  unint64_t v7 = v6;

  sub_25DB416E8();
  sub_25DAA85D8(v5, v7);
}

- (void)connectionErrorWithError:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_25DB41A8C(v5);
}

- (void)finalise
{
  v2 = self;
  sub_25DB41B34();
}

- (_TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge_continuation;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B36EFC8);
  OUTLINED_FUNCTION_1_0();
  id v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end