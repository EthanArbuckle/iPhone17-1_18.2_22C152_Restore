@interface UserEngagementStatsAnalytics
- (_TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics)init;
@end

@implementation UserEngagementStatsAnalytics

- (_TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics_conversationStream));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics_utils));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics_biomeUtils));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23SiriInvocationAnalytics28UserEngagementStatsAnalytics_uesModel);
}

@end