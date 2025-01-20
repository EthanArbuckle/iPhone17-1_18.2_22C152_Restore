@interface UserSessionConfiguration
- (id)copyWithZone:(void *)a3;
@end

@implementation UserSessionConfiguration

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  sub_25B892F44(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_25B9006E8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end