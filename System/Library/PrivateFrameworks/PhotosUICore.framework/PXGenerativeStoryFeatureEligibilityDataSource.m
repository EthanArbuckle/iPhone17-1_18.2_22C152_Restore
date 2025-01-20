@interface PXGenerativeStoryFeatureEligibilityDataSource
+ (id)fullDescriptionWithFeatureEligibilityState:(id)a3 photoLibrary:(id)a4;
+ (void)generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:(PHPhotoLibraryFeatureAvailabilityReporter *)a3 photoLibrary:(PHPhotoLibrary *)a4 completionHandler:(id)a5;
+ (void)renderImageWithFeatureAvailability:(id)a3 completionHandler:(id)a4;
- (PXGenerativeStoryFeatureEligibilityDataSource)init;
@end

@implementation PXGenerativeStoryFeatureEligibilityDataSource

+ (void)generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:(PHPhotoLibraryFeatureAvailabilityReporter *)a3 photoLibrary:(PHPhotoLibrary *)a4 completionHandler:(id)a5
{
  sub_1A9BF7408(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v20 - v11;
  v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = a1;
  uint64_t v15 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9826D88;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9826D90;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  sub_1A9FD8BA0((uint64_t)v12, (uint64_t)&unk_1E9826D98, (uint64_t)v17);
  swift_release();
}

+ (void)renderImageWithFeatureAvailability:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_1A9FD8214(a3, (uint64_t)sub_1A9FDB6A4, v6);

  swift_release();
}

+ (id)fullDescriptionWithFeatureEligibilityState:(id)a3 photoLibrary:(id)a4
{
}

- (PXGenerativeStoryFeatureEligibilityDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeStoryFeatureEligibilityDataSource();
  return [(PXGenerativeStoryFeatureEligibilityDataSource *)&v3 init];
}

@end