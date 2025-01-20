@interface PXCuratedLibraryRemoveFiltersActionPerformer
- (NSString)activitySystemImageName;
- (NSString)activityType;
- (PXCuratedLibraryRemoveFiltersActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryRemoveFiltersActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = self;
  sub_1A9E7153C();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)activityType
{
  sub_1AB23A76C();
  v2 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)activitySystemImageName
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1A9E71238();
}

- (PXCuratedLibraryRemoveFiltersActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  sub_1AB23A76C();
  id v6 = a4;
  v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CuratedLibraryRemoveFiltersActionPerformer();
  v8 = [(PXCuratedLibraryActionPerformer *)&v10 initWithActionType:v7 viewModel:v6];

  return v8;
}

@end