@interface KTUpdateCloudDeviceOperation
- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)init;
- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)initWithDeps:(id)a3 context:(id)a4;
- (void)groupStart;
@end

@implementation KTUpdateCloudDeviceOperation

- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)initWithDeps:(id)a3 context:(id)a4
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_shouldRetry) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_deps) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_context) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KTUpdateCloudDeviceOperation();
  id v6 = a3;
  id v7 = a4;
  return [(KTGroupOperation *)&v9 init];
}

- (void)groupStart
{
  v2 = self;
  KTUpdateCloudDeviceOperation.groupStart()();
}

- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)init
{
  result = (_TtC13transparencyd28KTUpdateCloudDeviceOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_deps));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_context);
}

@end