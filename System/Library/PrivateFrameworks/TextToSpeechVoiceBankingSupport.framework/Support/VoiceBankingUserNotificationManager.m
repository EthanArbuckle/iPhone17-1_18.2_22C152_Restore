@interface VoiceBankingUserNotificationManager
- (_TtC13voicebankingd35VoiceBankingUserNotificationManager)init;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 willPresentNotification:(UNNotification *)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
@end

@implementation VoiceBankingUserNotificationManager

- (_TtC13voicebankingd35VoiceBankingUserNotificationManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___userNotificationCenter) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___voicebankingUserNotificationBundle) = (Class)1;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(VoiceBankingUserNotificationManager *)&v5 init];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  sub_10000493C(&qword_10002D370);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10002D3C0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10002D3C8;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_100006D70((uint64_t)v10, (uint64_t)&unk_10002D3D0, (uint64_t)v15);
  swift_release();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 willPresentNotification:(UNNotification *)a4 withCompletionHandler:(id)a5
{
  sub_10000493C(&qword_10002D370);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10002D380;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10002D390;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_100006D70((uint64_t)v10, (uint64_t)&unk_10002D3A0, (uint64_t)v15);
  swift_release();
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100007DCC(a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___userNotificationCenter));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___voicebankingUserNotificationBundle);

  sub_100008058(v3);
}

@end