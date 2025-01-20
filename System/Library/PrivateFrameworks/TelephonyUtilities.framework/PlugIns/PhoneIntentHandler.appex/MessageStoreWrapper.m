@interface MessageStoreWrapper
- (BOOL)isOnlineAndSubscribed;
- (void)fetchVoicemailWithIdentifier:(NSString *)a3 completion:(id)a4;
- (void)fetchVoicemailsMatching:(id)a3 completion:;
- (void)markRead:(id)a3;
@end

@implementation MessageStoreWrapper

- (BOOL)isOnlineAndSubscribed
{
  return _TUCallScreeningEnabled(0, 0);
}

- (void)fetchVoicemailsMatching:(id)a3 completion:
{
  v4 = v3;
  sub_10002B504(&qword_100058870);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = _Block_copy(v4);
  v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000328C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000587E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000587E8;
  v14[5] = v13;
  swift_retain();
  sub_10002F198((uint64_t)v8, (uint64_t)&unk_1000587F0, (uint64_t)v14);
  swift_release();
}

- (void)fetchVoicemailWithIdentifier:(NSString *)a3 completion:(id)a4
{
  sub_10002B504(&qword_100058870);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_1000328C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000587C8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000587D0;
  v13[5] = v12;
  v14 = a3;
  swift_retain();
  sub_10002F198((uint64_t)v8, (uint64_t)&unk_100058890, (uint64_t)v13);
  swift_release();
}

- (void)markRead:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_100029938(a3);
  swift_unknownObjectRelease();

  swift_release();
}

@end