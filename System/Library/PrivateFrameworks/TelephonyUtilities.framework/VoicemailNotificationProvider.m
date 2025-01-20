@interface VoicemailNotificationProvider
- (_TtC13callservicesd29VoicemailNotificationProvider)init;
- (void)onlineStatusChangedWithNotification:(id)a3;
- (void)subscriptionStateChangedWithNotification:(id)a3;
- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4;
- (void)voicemailsChangedWithNotification:(id)a3;
@end

@implementation VoicemailNotificationProvider

- (_TtC13callservicesd29VoicemailNotificationProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_telephonyClient));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_contactStore));
  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_voicemailDataSource);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100235804((uint64_t)self + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_mostRecentVoicemailDate, &qword_100584B40);
  sub_100235804((uint64_t)self + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_mostRecentNonVisualVoicemailDate, &qword_100584B40);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_add));
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_replace));
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_removeNotification));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13callservicesd29VoicemailNotificationProvider_updateBadgeValue);

  sub_100208490(v3);
}

- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10036B5BC();
}

- (void)voicemailsChangedWithNotification:(id)a3
{
  sub_10036DF28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"Voicemails changed: %s", (uint64_t)&unk_100516C78, (uint64_t)sub_10036F28C, (uint64_t)&unk_100516C90, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14,
    v15);
}

- (void)onlineStatusChangedWithNotification:(id)a3
{
  sub_10036DF28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"Online status changed: %s", (uint64_t)&unk_100516C28, (uint64_t)sub_10036F270, (uint64_t)&unk_100516C40, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14,
    v15);
}

- (void)subscriptionStateChangedWithNotification:(id)a3
{
  sub_10036DF28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)"Subscription status changed: %s", (uint64_t)&unk_100516BD8, (uint64_t)sub_10036F560, (uint64_t)&unk_100516BF0, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14,
    v15);
}

@end