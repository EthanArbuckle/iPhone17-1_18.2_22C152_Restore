@interface ImportantEntitiesTuning
+ (BOOL)evaluateChildrenAndPetsInferenceAcrossParametersInGraph:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (_TtC11PhotosGraph23ImportantEntitiesTuning)init;
@end

@implementation ImportantEntitiesTuning

+ (BOOL)evaluateChildrenAndPetsInferenceAcrossParametersInGraph:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_1D18E21C8((uint64_t)v8, v9, (uint64_t)v10);

  return 1;
}

- (_TtC11PhotosGraph23ImportantEntitiesTuning)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImportantEntitiesTuning();
  return [(ImportantEntitiesTuning *)&v3 init];
}

@end