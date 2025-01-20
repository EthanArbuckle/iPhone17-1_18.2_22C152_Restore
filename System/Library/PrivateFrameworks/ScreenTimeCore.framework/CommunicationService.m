@interface CommunicationService
- (void)authenticatePasscodeForUserWithEndpoint:(NSXPCListenerEndpoint *)a3 completionHandler:(id)a4;
- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3;
@end

@implementation CommunicationService

- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003423F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100342400;
  v12[5] = v11;
  swift_retain();
  sub_10025393C((uint64_t)v7, (uint64_t)&unk_100342408, (uint64_t)v12);
  swift_release();
}

- (void)authenticatePasscodeForUserWithEndpoint:(NSXPCListenerEndpoint *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003423E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003464F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100346060, (uint64_t)v14);
  swift_release();
}

@end