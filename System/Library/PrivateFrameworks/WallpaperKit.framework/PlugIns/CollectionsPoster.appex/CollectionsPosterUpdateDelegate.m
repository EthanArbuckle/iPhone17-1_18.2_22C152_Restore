@interface CollectionsPosterUpdateDelegate
- (_TtC17CollectionsPoster31CollectionsPosterUpdateDelegate)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation CollectionsPosterUpdateDelegate

- (_TtC17CollectionsPoster31CollectionsPosterUpdateDelegate)init
{
  return (_TtC17CollectionsPoster31CollectionsPosterUpdateDelegate *)sub_1000068E8();
}

- (void).cxx_destruct
{
}

- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100003220(&qword_100020720);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100012968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000207A0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000207A8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100010E1C((uint64_t)v11, (uint64_t)&unk_1000207B0, (uint64_t)v16);
  swift_release();
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100003220(&qword_100020720);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100012968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100020730;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000208B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100010E1C((uint64_t)v11, (uint64_t)&unk_100020740, (uint64_t)v16);
  swift_release();
}

@end