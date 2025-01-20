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
- (_TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult)init;
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
  return (NSString *)sub_1000041EC((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numConversationsKey.getter);
}

+ (NSString)numVTEventsKey
{
  return (NSString *)sub_1000041EC((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.numVTEventsKey.getter);
}

+ (NSString)bookmarkNameKey
{
  sub_10000423C();
  NSString v2 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)conversationIdsKey
{
  sub_100004218();
  NSString v2 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventIdsKey
{
  sub_10000425C();
  NSString v2 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)vtEventSummariesKey
{
  return (NSString *)sub_1000041EC((uint64_t)a1, (uint64_t)a2, (void (*)(void))static SiriInvocationAnalyticsPluginResult.vtEventSummariesKey.getter);
}

+ (NSString)bookmarkSavedKey
{
  sub_1000041F4();
  NSString v2 = sub_1000085D0();
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
  NSString v2 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBookmarkName:(id)a3
{
  uint64_t v4 = sub_1000085E0();
  uint64_t v6 = v5;
  v7 = self;
  sub_100003838(v4, v6);
}

- (NSArray)conversationIds
{
  return (NSArray *)sub_100003A4C((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.conversationIds.getter);
}

- (void)setConversationIds:(id)a3
{
  sub_100008610();
  uint64_t v4 = self;
  uint64_t v5 = sub_100004278();
  sub_1000039A0(v5);
}

- (NSArray)vtEventIds
{
  return (NSArray *)sub_100003A4C((uint64_t)self, (uint64_t)a2, (void (*)(void))SiriInvocationAnalyticsPluginResult.vtEventIds.getter);
}

- (void)setVtEventIds:(id)a3
{
  sub_100008610();
  uint64_t v4 = self;
  uint64_t v5 = sub_100004278();
  sub_100003B0C(v5);
}

- (NSDictionary)vtEventSummaries
{
  SiriInvocationAnalyticsPluginResult.vtEventSummaries.getter();
  sub_10000414C(&qword_100011978);
  v2.super.isa = sub_1000085B0().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setVtEventSummaries:(id)a3
{
  sub_10000414C(&qword_100011978);
  uint64_t v4 = sub_1000085C0();
  uint64_t v5 = self;
  sub_100003CD4(v4);
}

- (BOOL)bookmarkSaved
{
  return SiriInvocationAnalyticsPluginResult.bookmarkSaved.getter() & 1;
}

- (void)setBookmarkSaved:(BOOL)a3
{
}

- (_TtC29SiriInvocationAnalyticsPlugin35SiriInvocationAnalyticsPluginResult)init
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