@interface TSIssueViewerModule
- (TSIssueViewerModule)init;
@end

@implementation TSIssueViewerModule

- (TSIssueViewerModule)init
{
  result = (TSIssueViewerModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSIssueViewerModule_resolver);
  swift_release();
  v3 = (char *)self + OBJC_IVAR___TSIssueViewerModule_contextBuilder;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end