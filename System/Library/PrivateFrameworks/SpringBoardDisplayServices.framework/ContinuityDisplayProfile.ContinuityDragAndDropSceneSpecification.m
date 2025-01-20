@interface ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification
- (NSArray)defaultExtensions;
- (NSString)uiSceneSessionRole;
- (_TtCO26SpringBoardDisplayServices24ContinuityDisplayProfileP33_C9A72AE6FF25D4F41A26732DC6990FFA39ContinuityDragAndDropSceneSpecification)init;
@end

@implementation ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification

- (NSString)uiSceneSessionRole
{
  v2 = self;
  v3 = (void *)sub_25E3AB730();

  return (NSString *)v3;
}

- (NSArray)defaultExtensions
{
  v2 = self;
  uint64_t v3 = sub_25E3AA32C();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6ECF78);
    v4 = (void *)sub_25E3AB750();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (_TtCO26SpringBoardDisplayServices24ContinuityDisplayProfileP33_C9A72AE6FF25D4F41A26732DC6990FFA39ContinuityDragAndDropSceneSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification();
  return [(ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification *)&v3 init];
}

@end