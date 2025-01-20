@interface TSMagazineFeedModule
- (TSMagazineFeedModule)init;
@end

@implementation TSMagazineFeedModule

- (TSMagazineFeedModule)init
{
  result = (TSMagazineFeedModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSMagazineFeedModule_resolver);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSMagazineFeedModule_contextBuilder);
  v3 = (char *)self + OBJC_IVAR___TSMagazineFeedModule_mastheadModelProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end