@interface KTUpdateCloudStorageOperation
- (_TtC13transparencyd29KTUpdateCloudStorageOperation)init;
- (_TtC13transparencyd29KTUpdateCloudStorageOperation)initWithDeps:(id)a3 source:(id)a4 context:(id)a5;
- (void)groupStart;
@end

@implementation KTUpdateCloudStorageOperation

- (_TtC13transparencyd29KTUpdateCloudStorageOperation)initWithDeps:(id)a3 source:(id)a4 context:(id)a5
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_shouldRetry) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_deps) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_source) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_context) = (Class)a5;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for KTUpdateCloudStorageOperation();
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  return [(KTGroupOperation *)&v10 init];
}

- (void)groupStart
{
  v2 = self;
  KTUpdateCloudStorageOperation.groupStart()();
}

- (_TtC13transparencyd29KTUpdateCloudStorageOperation)init
{
  result = (_TtC13transparencyd29KTUpdateCloudStorageOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_deps));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_context);
}

@end