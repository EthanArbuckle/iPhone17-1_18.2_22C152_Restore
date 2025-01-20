@interface PHABiomeUtilities
+ (BOOL)supportsForBinaryTrainingWithStream:(int64_t)a3;
+ (id)availableAssetBiomeLibraryStream;
+ (id)availableAssetBiomeStreams;
+ (id)availableMemoryBiomeLibraryStream;
+ (id)availableMemoryBiomeStreams;
+ (id)availableSessionBiomeLibraryStream;
+ (id)availableSessionBiomeStreams;
+ (id)readBiomeEventsForPhotoStyleWithInputName:(id)a3 labelName:(id)a4 error:(id *)a5;
+ (id)readUUIDsWithStream:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5;
+ (id)readUUIDsWithStream:(int64_t)a3 subsetName:(id)a4 type:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (int64_t)biomeStreamFor:(id)a3;
- (PHABiomeUtilities)init;
@end

@implementation PHABiomeUtilities

+ (id)availableAssetBiomeStreams
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2380C24, (void (*)(void))sub_1D221FD48);
}

+ (id)availableAssetBiomeLibraryStream
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2380C24, (void (*)(void))sub_1D2220160);
}

+ (id)availableMemoryBiomeStreams
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2381030, (void (*)(void))sub_1D221FD48);
}

+ (id)availableMemoryBiomeLibraryStream
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2381030, (void (*)(void))sub_1D2220160);
}

+ (id)availableSessionBiomeStreams
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2381390, (void (*)(void))sub_1D221FD48);
}

+ (id)availableSessionBiomeLibraryStream
{
  return sub_1D237B9D8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1D2381390, (void (*)(void))sub_1D2220160);
}

+ (id)readUUIDsWithStream:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5
{
  swift_getObjCClassMetadata();
  id v7 = a4;
  id v8 = static BiomeUtilities.readUUIDs(stream:subsetName:type:progressReporter:)(a3, 0, 0, 0);

  return v8;
}

+ (id)readUUIDsWithStream:(int64_t)a3 subsetName:(id)a4 type:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  if (a4)
  {
    uint64_t v10 = sub_1D24253E0();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  swift_getObjCClassMetadata();
  id v13 = a5;
  id v14 = a6;
  id v15 = static BiomeUtilities.readUUIDs(stream:subsetName:type:progressReporter:)(a3, v10, v12, a5);

  swift_bridgeObjectRelease();

  return v15;
}

+ (BOOL)supportsForBinaryTrainingWithStream:(int64_t)a3
{
  return _s13PhotoAnalysis14BiomeUtilitiesC25supportsForBinaryTraining6streamSbAA0C6StreamO_tFZ_0(a3) & 1;
}

+ (id)readBiomeEventsForPhotoStyleWithInputName:(id)a3 labelName:(id)a4 error:(id *)a5
{
  uint64_t v5 = sub_1D24253E0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1D24253E0();
  sub_1D23822E4(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA683530);
  uint64_t v10 = (void *)sub_1D2425550();
  swift_bridgeObjectRelease();

  return v10;
}

+ (int64_t)biomeStreamFor:(id)a3
{
  uint64_t v3 = sub_1D24253E0();
  int64_t v5 = _s13PhotoAnalysis14BiomeUtilitiesC11biomeStream3forAA0cF0OSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (PHABiomeUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BiomeUtilities();
  return [(PHABiomeUtilities *)&v3 init];
}

@end