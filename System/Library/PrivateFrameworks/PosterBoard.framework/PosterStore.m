@interface PosterStore
- (_TtC11PosterBoard11PosterStore)init;
- (void)dataStoreDidTearDown;
- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateSwitcherConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5;
@end

@implementation PosterStore

- (_TtC11PosterBoard11PosterStore)init
{
  type metadata accessor for IncludeAllPostersFilter();
  uint64_t v2 = swift_allocObject();
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterStore());
  v4 = sub_1D32DE86C(v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC11PosterBoard11PosterStore *)v4;
}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(void *)(v7 + 24) = a4;
  v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = sub_1D32E087C;
  v8[4] = v7;
  v15[4] = sub_1D32E12D8;
  v15[5] = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1D32EF568;
  v15[3] = &block_descriptor_202;
  v9 = _Block_copy(v15);
  v10 = self;
  id v11 = a4;
  v12 = v10;
  id v13 = v11;
  id v14 = a3;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v9);

  swift_release();
}

- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(void *)(v7 + 24) = a4;
  v13[4] = sub_1D32E1230;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1D32EF568;
  v13[3] = &block_descriptor_192;
  v8 = _Block_copy(v13);
  id v9 = a4;
  v10 = self;
  id v11 = v9;
  id v12 = a3;
  swift_release();
  BSDispatchMain();
  _Block_release(v8);
}

- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4
{
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSwitcherConfiguration:(id)a4
{
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
}

- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = self;
  *(void *)(v9 + 24) = a4;
  v16[4] = sub_1D32E0858;
  v16[5] = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1D32EF568;
  v16[3] = &block_descriptor_168;
  v10 = _Block_copy(v16);
  id v11 = a4;
  id v12 = self;
  id v13 = v11;
  id v14 = a3;
  id v15 = a5;
  swift_release();
  BSDispatchMain();
  _Block_release(v10);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
}

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForConfiguration:(id)a4
{
}

- (void)dataStoreDidTearDown
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_1D32E07B4;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1D32EF568;
  v6[3] = &block_descriptor_134;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  BSDispatchMain();
  _Block_release(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PosterBoard11PosterStore_switcherConfig);
}

@end