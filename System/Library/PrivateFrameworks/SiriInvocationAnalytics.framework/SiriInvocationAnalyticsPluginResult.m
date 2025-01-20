@interface SiriInvocationAnalyticsPluginResult
+ (NSString)bookmarkNameKey;
+ (NSString)bookmarkSavedKey;
+ (NSString)conversationIdsKey;
+ (NSString)numConversationsKey;
+ (NSString)numVTEventsKey;
+ (NSString)vtEventIdsKey;
+ (NSString)vtEventSummariesKey;
- (BOOL)bookmarkSaved;
- (NSArray)conversationIds;
- (NSArray)vtEventIds;
- (NSDictionary)vtEventSummaries;
- (NSString)bookmarkName;
- (_TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult)init;
- (int64_t)numFeaturizedConversations;
- (int64_t)numFeaturizedVoiceTriggerEvents;
- (void)setBookmarkName:(id)a3;
- (void)setBookmarkSaved:(BOOL)a3;
- (void)setConversationIds:(id)a3;
- (void)setNumFeaturizedConversations:(int64_t)a3;
- (void)setNumFeaturizedVoiceTriggerEvents:(int64_t)a3;
- (void)setVtEventIds:(id)a3;
- (void)setVtEventSummaries:(id)a3;
@end

@implementation SiriInvocationAnalyticsPluginResult

+ (NSString)numConversationsKey
{
  return (NSString *)OUTLINED_FUNCTION_2_22((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter);
}

+ (NSString)numVTEventsKey
{
  return (NSString *)OUTLINED_FUNCTION_2_22((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter);
}

+ (NSString)bookmarkNameKey
{
  OUTLINED_FUNCTION_5_15();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)conversationIdsKey
{
  OUTLINED_FUNCTION_4_22();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventIdsKey
{
  OUTLINED_FUNCTION_6_16();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventSummariesKey
{
  return (NSString *)OUTLINED_FUNCTION_2_22((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter);
}

+ (NSString)bookmarkSavedKey
{
  OUTLINED_FUNCTION_3_21();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)numFeaturizedConversations
{
  return SiriInvocationAnalyticsPluginResult.numFeaturizedConversations.getter();
}

- (void)setNumFeaturizedConversations:(int64_t)a3
{
}

- (int64_t)numFeaturizedVoiceTriggerEvents
{
  return SiriInvocationAnalyticsPluginResult.numFeaturizedVoiceTriggerEvents.getter();
}

- (void)setNumFeaturizedVoiceTriggerEvents:(int64_t)a3
{
}

- (NSString)bookmarkName
{
  SiriInvocationAnalyticsPluginResult.bookmarkName.getter();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBookmarkName:(id)a3
{
  uint64_t v4 = sub_25CA459A8();
  uint64_t v6 = v5;
  v7 = self;
  sub_25CA1EB6C(v4, v6);
}

- (NSArray)conversationIds
{
  return (NSArray *)sub_25CA1ED80((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.conversationIds.getter);
}

- (void)setConversationIds:(id)a3
{
  sub_25CA45B58();
  uint64_t v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_7_21();
  sub_25CA1ECD4(v5);
}

- (NSArray)vtEventIds
{
  return (NSArray *)sub_25CA1ED80((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.vtEventIds.getter);
}

- (void)setVtEventIds:(id)a3
{
  sub_25CA45B58();
  uint64_t v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_7_21();
  sub_25CA1EE40(v5);
}

- (NSDictionary)vtEventSummaries
{
  SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1AE0);
  v2 = (void *)sub_25CA45868();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setVtEventSummaries:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1AE0);
  uint64_t v4 = sub_25CA45878();
  uint64_t v5 = self;
  sub_25CA1EFD4(v4);
}

- (BOOL)bookmarkSaved
{
  return SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter() & 1;
}

- (void)setBookmarkSaved:(BOOL)a3
{
}

- (_TtC23SiriInvocationAnalytics35SiriInvocationAnalyticsPluginResult)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end