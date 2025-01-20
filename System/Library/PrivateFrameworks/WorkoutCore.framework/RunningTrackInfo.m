@interface RunningTrackInfo
- (id)copyWithZone:(void *)a3;
@end

@implementation RunningTrackInfo

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  RunningTrackInfo.copy(with:)(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_236C75918();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end