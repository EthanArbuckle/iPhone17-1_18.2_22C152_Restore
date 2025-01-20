@interface PXPhotosXCPTestUtilities
+ (NSURL)urlToOpen;
+ (uint64_t)handleAppStartedLaunching;
- (PXPhotosXCPTestUtilities)init;
@end

@implementation PXPhotosXCPTestUtilities

+ (NSURL)urlToOpen
{
  sub_1A9B96C20(0, (unint64_t *)&qword_1E981B730, MEMORY[0x1E4F276F0]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  v5 = (char *)&v14 - v4;
  if (qword_1E9860610 != -1) {
    swift_once();
  }
  sub_1A9B96C20(0, (unint64_t *)&unk_1E981CE68, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1E98605F8);
  swift_beginAccess();
  uint64_t v8 = type metadata accessor for PhotosAppTestLaunchConfiguration();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    uint64_t v9 = sub_1AB2305AC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    v10 = 0;
  }
  else
  {
    sub_1AA317D68(v7, (uint64_t)v5, (unint64_t *)&qword_1E981B730, MEMORY[0x1E4F276F0]);
    uint64_t v11 = sub_1AB2305AC();
    uint64_t v12 = *(void *)(v11 - 8);
    v10 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
    {
      v10 = (void *)sub_1AB23049C();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
    }
  }
  return (NSURL *)v10;
}

- (PXPhotosXCPTestUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosXCPTestUtilities();
  return [(PXPhotosXCPTestUtilities *)&v3 init];
}

+ (uint64_t)handleAppStartedLaunching
{
  sub_1A9B96C20(0, (unint64_t *)&unk_1E981CE68, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  uint64_t v1 = v0;
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v8 = &v19[-v7];
  if (qword_1E9860610 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v1, (uint64_t)qword_1E98605F8);
  swift_beginAccess();
  sub_1AA317D68(v9, (uint64_t)v8, (unint64_t *)&unk_1E981CE68, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  uint64_t v10 = type metadata accessor for PhotosAppTestLaunchConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10);
  uint64_t result = sub_1AA317DD4((uint64_t)v8, (unint64_t *)&unk_1E981CE68, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  if (v12 == 1)
  {
    uint64_t v14 = sub_1AB23BEDC();
    uint64_t v15 = *(void *)(v14 + 16);
    if (v15)
    {
      uint64_t v8 = (unsigned char *)v14;
      sub_1AB23C5FC();
      swift_unknownObjectRetain_n();
      uint64_t v16 = swift_dynamicCastClass();
      if (!v16)
      {
        swift_bridgeObjectRelease();
        uint64_t v16 = MEMORY[0x1E4FBC860];
      }
      uint64_t v17 = *(void *)(v16 + 16);
      swift_release();
      if (v17 == v15 - 1)
      {
        uint64_t v18 = swift_dynamicCastClass();
        if (!v18)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = MEMORY[0x1E4FBC860];
        }
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_1A9E9287C((uint64_t)v8, (uint64_t)(v8 + 32), 1, (2 * v15) | 1);
LABEL_10:
    swift_bridgeObjectRelease();
    PhotosAppTestLaunchConfiguration.init(launchArguments:)(v18, (uint64_t)v4);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v4, 0, 1, v10);
    swift_beginAccess();
    sub_1AA317E30((uint64_t)v4, v9);
    return swift_endAccess();
  }
  return result;
}

@end