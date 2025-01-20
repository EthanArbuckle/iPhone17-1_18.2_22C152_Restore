@interface MigrationServer
- (_TtC18ReplicatorServices15MigrationServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation MigrationServer

- (_TtC18ReplicatorServices15MigrationServer)init
{
  return (_TtC18ReplicatorServices15MigrationServer *)MigrationServer.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_25B319830(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_localDeviceIDProvider));
  sub_25B319830(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_recordProvider));
  sub_25B319830(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_deviceProvider));
  sub_25B319830(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_clientDescriptorProvider));
  sub_25B319830(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_eraseHandler));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_listener);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_25B35BF70(v8);

  swift_unknownObjectRelease();
}

@end