@interface FindMyLocateWrapper
- (_TtC13findmydeviced19FindMyLocateWrapper)init;
- (void)processLocationCommandPayload:(NSData *)a3 completion:(id)a4;
- (void)processLocationPayload:(NSData *)a3 completion:(id)a4;
@end

@implementation FindMyLocateWrapper

- (void)processLocationPayload:(NSData *)a3 completion:(id)a4
{
  sub_1000D2A84(&qword_10031DBE8);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031DC38;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031DC40;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000D2EAC((uint64_t)v8, (uint64_t)&unk_10031DC48, (uint64_t)v13);
  swift_release();
}

- (void)processLocationCommandPayload:(NSData *)a3 completion:(id)a4
{
  sub_1000D2A84(&qword_10031DBE8);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031DBF8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031DC08;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1000D2EAC((uint64_t)v8, (uint64_t)&unk_10031DC18, (uint64_t)v13);
  swift_release();
}

- (_TtC13findmydeviced19FindMyLocateWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FindMyLocateWrapper();
  return [(FindMyLocateWrapper *)&v3 init];
}

@end