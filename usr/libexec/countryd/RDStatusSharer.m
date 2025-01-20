@interface RDStatusSharer
- (_TtC8countryd14RDStatusSharer)init;
- (void)shareStatusWithEstimate:(RDEstimate *)a3 completionHandler:(id)a4;
- (void)shareStatusesWithEstimates:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation RDStatusSharer

- (_TtC8countryd14RDStatusSharer)init
{
  return (_TtC8countryd14RDStatusSharer *)sub_100003B14();
}

- (void)shareStatusWithEstimate:(RDEstimate *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007F04(&qword_100019300);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10000F500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100019358;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100019360;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1000080E0((uint64_t)v9, (uint64_t)&unk_100019368, (uint64_t)v14);
  swift_release();
}

- (void)shareStatusesWithEstimates:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100007F04(&qword_100019300);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10000F500();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100019310;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100019320;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1000080E0((uint64_t)v9, (uint64_t)&unk_100019330, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
}

@end