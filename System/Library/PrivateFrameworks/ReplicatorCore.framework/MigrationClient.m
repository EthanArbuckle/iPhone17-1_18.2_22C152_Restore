@interface MigrationClient
- (_TtC14ReplicatorCore15MigrationClient)init;
@end

@implementation MigrationClient

- (_TtC14ReplicatorCore15MigrationClient)init
{
  result = (_TtC14ReplicatorCore15MigrationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_recordMetadataStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_recordStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_clientDescriptorStore);
  v3 = (char *)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_url;
  uint64_t v4 = sub_25B0F1D68();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_queue);
}

@end