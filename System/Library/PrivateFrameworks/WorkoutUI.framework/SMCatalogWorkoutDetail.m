@interface SMCatalogWorkoutDetail
+ (id)canonical;
- (NSNumber)mediaTypeRawValue;
- (SMCatalogWorkout)workout;
- (SMCatalogWorkoutDetail)init;
- (int64_t)assetLoadStatus;
- (int64_t)completedCount;
@end

@implementation SMCatalogWorkoutDetail

- (int64_t)assetLoadStatus
{
  v2 = self;
  int64_t v3 = CatalogWorkoutDetailBridge.assetLoadStatus.getter();

  return v3;
}

- (SMCatalogWorkout)workout
{
  uint64_t v3 = sub_261B8B488();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_261B8B648();
  v8 = (objc_class *)type metadata accessor for CatalogWorkoutBridge();
  v9 = objc_allocWithZone(v8);
  (*(void (**)(unsigned char *, char *, uint64_t))(v4 + 16))(&v9[OBJC_IVAR___SMCatalogWorkout_workout], v6, v3);
  v9[OBJC_IVAR___SMCatalogWorkout_isPartOfAStack] = 0;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = [(SMCatalogWorkoutDetail *)&v12 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (SMCatalogWorkout *)v10;
}

- (int64_t)completedCount
{
  v2 = self;
  int64_t v3 = sub_261B8B628();

  return v3;
}

- (NSNumber)mediaTypeRawValue
{
  v2 = self;
  id v3 = CatalogWorkoutDetailBridge.mediaTypeRawValue.getter();

  return (NSNumber *)v3;
}

- (SMCatalogWorkoutDetail)init
{
  result = (SMCatalogWorkoutDetail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMCatalogWorkoutDetail_workoutDetail;
  uint64_t v3 = sub_261B8B668();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

+ (id)canonical
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v3 = sub_261B8B668();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8B658();
  id v7 = objc_allocWithZone(ObjCClassMetadata);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v7 + OBJC_IVAR___SMCatalogWorkoutDetail_workoutDetail, v6, v3);
  v10.receiver = v7;
  v10.super_class = ObjCClassMetadata;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

@end