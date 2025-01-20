@interface PXRetailExperienceInterface
+ (id)createRetailExperienceViewController:(id)a3;
- (_TtC12PhotosUICore27PXRetailExperienceInterface)init;
@end

@implementation PXRetailExperienceInterface

+ (id)createRetailExperienceViewController:(id)a3
{
  v3 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v3;
  v4 = (void *)sub_1AA706FCC();
  swift_release();
  return v4;
}

- (_TtC12PhotosUICore27PXRetailExperienceInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXRetailExperienceInterface();
  return [(PXRetailExperienceInterface *)&v3 init];
}

@end