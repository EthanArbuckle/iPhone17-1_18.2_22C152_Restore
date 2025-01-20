@interface ServerEvaluationStatusMapsSync
+ (_TtC4Maps30ServerEvaluationStatusMapsSync)shared;
- (_TtC4Maps30ServerEvaluationStatusMapsSync)init;
- (void)fetchARPStatusWithCompletion:(id)a3;
- (void)fetchRAPStatusWithCompletion:(id)a3;
- (void)setARPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5;
- (void)setRAPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5;
@end

@implementation ServerEvaluationStatusMapsSync

+ (_TtC4Maps30ServerEvaluationStatusMapsSync)shared
{
  if (qword_1015CBF00 != -1) {
    swift_once();
  }
  v2 = (void *)qword_101611B98;

  return (_TtC4Maps30ServerEvaluationStatusMapsSync *)v2;
}

- (_TtC4Maps30ServerEvaluationStatusMapsSync)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServerEvaluationStatusMapsSync();
  return [(ServerEvaluationStatusMapsSync *)&v3 init];
}

- (void)setARPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_1002C6810;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 32) = self;
  *(void *)(v15 + 40) = v12;
  *(void *)(v15 + 48) = v13;
  *(unsigned char *)(v15 + 56) = a3;
  *(unsigned char *)(v15 + 57) = a4;
  v16 = self;
  sub_1000F4F24((uint64_t)v12);
  sub_100042AF4((uint64_t)v11, (uint64_t)&unk_1015D9AC0, v15);
  swift_release();
  sub_10006C5D8((uint64_t)v12);
}

- (void)fetchARPStatusWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1002C6808;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_1000F4F24((uint64_t)v8);
  sub_100042AF4((uint64_t)v7, (uint64_t)&unk_1015D9AB0, (uint64_t)v11);
  swift_release();
  sub_10006C5D8((uint64_t)v8);
}

- (void)setRAPStatusWithIsBlocked:(BOOL)a3 isTrusted:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_1001225E4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(void *)(v15 + 32) = self;
  *(void *)(v15 + 40) = v12;
  *(void *)(v15 + 48) = v13;
  *(unsigned char *)(v15 + 56) = a3;
  *(unsigned char *)(v15 + 57) = a4;
  v16 = self;
  sub_1000F4F24((uint64_t)v12);
  sub_100042AF4((uint64_t)v11, (uint64_t)&unk_1015D9AA0, v15);
  swift_release();
  sub_10006C5D8((uint64_t)v12);
}

- (void)fetchRAPStatusWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1002C578C;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_1000F4F24((uint64_t)v8);
  sub_100042AF4((uint64_t)v7, (uint64_t)&unk_1015D9A80, (uint64_t)v11);
  swift_release();
  sub_10006C5D8((uint64_t)v8);
}

@end