@interface IntentHandlerMessageStore
+ (_TtP18PhoneIntentHandler32IntentHandlerVoicemailDataSource_)sharedInstance;
- (BOOL)isOnlineAndSubscribed;
- (IntentHandlerMessageStore)init;
- (void)fetchVoicemailWithIdentifier:(NSString *)a3 completion:(id)a4;
- (void)fetchVoicemailsMatching:(id)a3 completion:;
- (void)markRead:(id)a3;
@end

@implementation IntentHandlerMessageStore

+ (_TtP18PhoneIntentHandler32IntentHandlerVoicemailDataSource_)sharedInstance
{
  if (qword_100058578 != -1) {
    swift_once();
  }
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP18PhoneIntentHandler32IntentHandlerVoicemailDataSource_ *)v2;
}

- (IntentHandlerMessageStore)init
{
  return (IntentHandlerMessageStore *)sub_10002C270();
}

- (BOOL)isOnlineAndSubscribed
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IntentHandlerMessageStore_vmManager);
  v3 = self;
  if ([v2 isOnlineAndSubscribed]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [*(id *)((char *)&v3->super.isa + OBJC_IVAR___IntentHandlerMessageStore_messageStore) isOnlineAndSubscribed];
  }

  return v4;
}

- (void)fetchVoicemailsMatching:(id)a3 completion:
{
  unsigned __int8 v4 = v3;
  uint64_t v7 = sub_10002B504(&qword_100058870);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1000328C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000588A0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000588A8;
  v15[5] = v14;
  v16 = self;
  sub_10002F198((uint64_t)v9, (uint64_t)&unk_1000588B0, (uint64_t)v15);
  swift_release();
}

- (void)fetchVoicemailWithIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10002B504(&qword_100058870);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000328C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100058880;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000587D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10002F198((uint64_t)v9, (uint64_t)&unk_100058890, (uint64_t)v14);
  swift_release();
}

- (void)markRead:(id)a3
{
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IntentHandlerMessageStore_featureFlags);
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  unsigned int v6 = [v5 vmdEnabled];
  uint64_t v7 = &OBJC_IVAR___IntentHandlerMessageStore_vmManager;
  if (!v6) {
    uint64_t v7 = &OBJC_IVAR___IntentHandlerMessageStore_messageStore;
  }
  [*(id *)((char *)&v8->super.isa + *v7) markRead:a3];
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end