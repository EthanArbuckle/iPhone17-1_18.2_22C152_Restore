@interface ExternalProvider
+ (id)deserializeFromPersistence:(id)a3;
- (id)serialize;
@end

@implementation ExternalProvider

+ (id)deserializeFromPersistence:(id)a3
{
  id v3 = a3;
  static ExternalProvider.deserialize(from:)(v3, v11);

  uint64_t v4 = v12;
  if (v12)
  {
    v5 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v6 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v5);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    v9 = (void *)sub_236C75918();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serialize
{
  swift_retain();
  id v2 = ExternalProvider.serialize()();
  swift_release();

  return v2;
}

@end