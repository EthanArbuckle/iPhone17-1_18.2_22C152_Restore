@interface PFDownloadConsistency
- (PFDownloadConsistency)init;
- (void)beginEnforcementWithCompletionHandler:(id)a3;
- (void)endEnforcement;
@end

@implementation PFDownloadConsistency

- (void)beginEnforcementWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1ACA3A598;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1ACE427C8((uint64_t)v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (void)endEnforcement
{
  uint64_t v3 = OBJC_IVAR___PFDownloadConsistency_listener;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDownloadConsistency_listener))
  {
    v4 = self;
    swift_retain();
    sub_1ACE75848();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_release();
}

- (PFDownloadConsistency)init
{
  result = (PFDownloadConsistency *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_identifier);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_resolutionStrategy);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFDownloadConsistency_effectApplicator);
  uint64_t v3 = (char *)self + OBJC_IVAR___PFDownloadConsistency_environment;
  sub_1ACE42750((uint64_t)v3);
}

@end