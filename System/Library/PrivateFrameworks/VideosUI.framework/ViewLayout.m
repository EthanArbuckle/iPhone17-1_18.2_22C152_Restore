@interface ViewLayout
- (id)copyWithZone:(void *)a3;
@end

@implementation ViewLayout

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  sub_1E2C76EEC(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1E387E238();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end