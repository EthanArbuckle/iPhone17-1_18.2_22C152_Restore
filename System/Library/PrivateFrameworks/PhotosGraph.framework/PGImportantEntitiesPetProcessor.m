@interface PGImportantEntitiesPetProcessor
+ (void)processUserPetsInGraph:(id)a3 progressBlock:(id)a4 withProcessInferredPetNodeClosure:(id)a5;
- (PGImportantEntitiesPetProcessor)init;
@end

@implementation PGImportantEntitiesPetProcessor

+ (void)processUserPetsInGraph:(id)a3 progressBlock:(id)a4 withProcessInferredPetNodeClosure:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v17[2] = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  _Block_copy(v7);
  id v11 = a3;
  objc_msgSend(v10, sel_usersPetsInferenceRecencyThresholdFromLatestMomentDateYears);
  double v13 = v12 * 31557600.0;
  objc_msgSend(v10, sel_usersPetsInferenceMinimumLifespanYears);
  *(double *)v18 = v13;
  *(double *)&v18[1] = v14 * 31557600.0;
  v18[2] = 10;
  long long v19 = xmmword_1D1F4B670;
  uint64_t v20 = 0;
  type metadata accessor for ImportantEntitiesPetContainer();
  uint64_t v15 = swift_allocObject();
  id v16 = v11;
  swift_retain();
  sub_1D1AA2EF0(v16, (void (*)(double))sub_1D1969ED0, (uint64_t)v17, (uint64_t)sub_1D1969ED0, v9);
  sub_1D19C05DC(v15, (uint64_t)v18, 1, v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  _Block_release(v7);
}

- (PGImportantEntitiesPetProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImportantEntitiesPetProcessor();
  return [(PGImportantEntitiesPetProcessor *)&v3 init];
}

@end