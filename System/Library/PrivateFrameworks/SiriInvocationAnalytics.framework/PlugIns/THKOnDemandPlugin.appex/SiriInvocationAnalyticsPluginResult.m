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
- (_TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult)init;
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
  return (NSString *)sub_100004E74((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter);
}

+ (NSString)numVTEventsKey
{
  return (NSString *)sub_100004E74((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter);
}

+ (NSString)bookmarkNameKey
{
  sub_100004EC4();
  NSString v2 = sub_100009290();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)conversationIdsKey
{
  sub_100004EA0();
  NSString v2 = sub_100009290();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventIdsKey
{
  sub_100004EE4();
  NSString v2 = sub_100009290();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventSummariesKey
{
  return (NSString *)sub_100004E74((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter);
}

+ (NSString)bookmarkSavedKey
{
  sub_100004E7C();
  NSString v2 = sub_100009290();
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
  NSString v2 = sub_100009290();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBookmarkName:(id)a3
{
  uint64_t v4 = sub_1000092A0();
  uint64_t v6 = v5;
  v7 = self;
  sub_1000044C0(v4, v6);
}

- (NSArray)conversationIds
{
  return (NSArray *)sub_1000046D4((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.conversationIds.getter);
}

- (void)setConversationIds:(id)a3
{
  sub_1000092E0();
  uint64_t v4 = self;
  uint64_t v5 = sub_100004F00();
  sub_100004628(v5);
}

- (NSArray)vtEventIds
{
  return (NSArray *)sub_1000046D4((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.vtEventIds.getter);
}

- (void)setVtEventIds:(id)a3
{
  sub_1000092E0();
  uint64_t v4 = self;
  uint64_t v5 = sub_100004F00();
  sub_100004794(v5);
}

- (NSDictionary)vtEventSummaries
{
  SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter();
  sub_100004DD4(&qword_100011070);
  v2.super.isa = sub_100009270().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setVtEventSummaries:(id)a3
{
  sub_100004DD4(&qword_100011070);
  uint64_t v4 = sub_100009280();
  uint64_t v5 = self;
  sub_10000495C(v4);
}

- (BOOL)bookmarkSaved
{
  return SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter() & 1;
}

- (void)setBookmarkSaved:(BOOL)a3
{
}

- (_TtC17THKOnDemandPlugin35SiriInvocationAnalyticsPluginResult)init
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