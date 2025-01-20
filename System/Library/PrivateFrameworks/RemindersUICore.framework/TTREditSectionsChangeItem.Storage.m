@interface TTREditSectionsChangeItem.Storage
- (id)copyWithZone:(void *)a3;
@end

@implementation TTREditSectionsChangeItem.Storage

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  TTREditSectionsChangeItem.Storage.copy(with:)(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1B9970B90();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

@end