@interface ExtragalacticPosterUpdating
- (_TtC19ExtragalacticPoster27ExtragalacticPosterUpdating)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation ExtragalacticPosterUpdating

- (_TtC19ExtragalacticPoster27ExtragalacticPosterUpdating)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExtragalacticPosterUpdating();
  return [(ExtragalacticPosterUpdating *)&v3 init];
}

- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000060C0(&qword_1000278D8);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100018AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100027928;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100027930;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10000DE98((uint64_t)v11, (uint64_t)&unk_100027938, (uint64_t)v16);
  swift_release();
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000060C0(&qword_1000278D8);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100018AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000278E8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000278F8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10000DE98((uint64_t)v11, (uint64_t)&unk_100027908, (uint64_t)v16);
  swift_release();
}

@end