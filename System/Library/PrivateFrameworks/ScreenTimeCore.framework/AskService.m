@interface AskService
- (void)approveExceptionForRequest:(STAskForTimeRequest *)a3 completionHandler:(id)a4;
- (void)handleAnswer:(int64_t)a3 requestIdentifier:(NSUUID *)a4 timeApproved:(NSNumber *)a5 completionHandler:(id)a6;
- (void)respondToAskForTimeRequestWithIdentifier:(NSString *)a3 answer:(int64_t)a4 completionHandler:(id)a5;
- (void)sendAskForTimeRequest:(STAskForTimeRequest *)a3 completionHandler:(id)a4;
@end

@implementation AskService

- (void)approveExceptionForRequest:(STAskForTimeRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100346860;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100346868;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v9, (uint64_t)&unk_100346870, (uint64_t)v14);
  swift_release();
}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(NSUUID *)a4 timeApproved:(NSNumber *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100346838;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100346840;
  v18[5] = v17;
  v19 = a4;
  v20 = a5;
  swift_retain();
  sub_10025393C((uint64_t)v13, (uint64_t)&unk_100346848, (uint64_t)v18);
  swift_release();
}

- (void)respondToAskForTimeRequestWithIdentifier:(NSString *)a3 answer:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100346810;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100346818;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_10025393C((uint64_t)v11, (uint64_t)&unk_100346820, (uint64_t)v16);
  swift_release();
}

- (void)sendAskForTimeRequest:(STAskForTimeRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10009EE78(&qword_100340F10);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003467D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
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