@interface IdentityProofingDataSharingSessionProxy
- (void)checkUserConsentWithCompletionHandler:(id)a3;
- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4;
- (void)fetchUserConsentWithCompletionHandler:(id)a3;
@end

@implementation IdentityProofingDataSharingSessionProxy

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
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
  v11[4] = &unk_100724BE8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100724BF0;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100724BF8, (uint64_t)v12);
  swift_release();
}

- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_retain();
  sub_100133EE8(a3, (uint64_t)self, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100007764(&qword_10071FEE0);
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
  v11[4] = &unk_100724BC8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100724BD0;
  v12[5] = v11;
  swift_retain();
  sub_1005A3B00((uint64_t)v7, (uint64_t)&unk_100721260, (uint64_t)v12);
  swift_release();
}

@end