@interface ICQLiftUIDataSource
- (_TtC11iCloudQuota19ICQLiftUIDataSource)init;
- (_TtC11iCloudQuota19ICQLiftUIDataSource)initWithAccount:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
@end

@implementation ICQLiftUIDataSource

- (_TtC11iCloudQuota19ICQLiftUIDataSource)initWithAccount:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID) = xmmword_1D58D3CA0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(ICQLiftUIDataSource *)&v8 init];
}

- (_TtC11iCloudQuota19ICQLiftUIDataSource)init
{
  result = (_TtC11iCloudQuota19ICQLiftUIDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID);
  uint64_t v4 = *(void *)&self->account[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID];
  sub_1D58C720C(v3, v4);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v12 = sub_1D58CC5E0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  sub_1D58CC5D0();
  _Block_copy(v16);
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v20 = self;
  sub_1D58C72D0((uint64_t)v15, (uint64_t)v20, (uint64_t)v16);
  _Block_release(v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

@end