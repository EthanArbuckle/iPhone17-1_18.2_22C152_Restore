@interface TrustedRequestXPCProxy
- (void)cancelWithCompletion:(id)a3;
- (void)nextWithCompletion:(id)a3;
- (void)sendWithData:(id)a3 isComplete:(BOOL)a4 completion:(id)a5;
@end

@implementation TrustedRequestXPCProxy

- (void)sendWithData:(id)a3 isComplete:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = sub_100003918(&qword_10020C3B0);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  id v14 = a3;
  swift_retain();
  uint64_t v15 = sub_1001BF180();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v13;
  uint64_t v19 = sub_1001C0FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  *(void *)(v20 + 32) = self;
  *(void *)(v20 + 40) = v15;
  *(void *)(v20 + 48) = v17;
  *(unsigned char *)(v20 + 56) = a4;
  *(void *)(v20 + 64) = sub_10015CC88;
  *(void *)(v20 + 72) = v18;
  swift_retain();
  sub_100007B14(v15, v17);
  swift_retain();
  sub_1001A1CC0((uint64_t)v12, (uint64_t)&unk_10020F450, v20);
  swift_release();
  swift_release();
  sub_10000792C(v15, v17);
  swift_release();
}

- (void)cancelWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_1001A3FD8(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

- (void)nextWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_1001A2A30((uint64_t)sub_1001A3A44, v4);
  swift_release();
  swift_release();
}

@end