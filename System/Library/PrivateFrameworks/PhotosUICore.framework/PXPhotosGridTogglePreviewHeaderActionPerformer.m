@interface PXPhotosGridTogglePreviewHeaderActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (NSString)activitySystemImageName;
- (NSString)activityType;
- (PXPhotosGridTogglePreviewHeaderActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridTogglePreviewHeaderActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  PXPhotosViewModel.collectionKind.getter();
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = self;
  sub_1AA9A4794();
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

- (int64_t)menuElementState
{
  v2 = self;
  v3 = [(PXPhotosGridActionPerformer *)v2 viewModel];
  unsigned int v4 = [(PXPhotosViewModel *)v3 allowsPreviewHeader];

  return v4;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA9A40D4();
}

- (PXPhotosGridTogglePreviewHeaderActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  sub_1AB23A76C();
  id v6 = a3;
  v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridTogglePreviewHeaderActionPerformer();
  v8 = [(PXPhotosGridActionPerformer *)&v10 initWithViewModel:v6 actionType:v7];

  return v8;
}

@end