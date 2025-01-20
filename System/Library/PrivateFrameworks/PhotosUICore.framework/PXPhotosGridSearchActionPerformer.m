@interface PXPhotosGridSearchActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (NSString)activitySystemImageName;
- (NSString)activityType;
- (PXPhotosGridSearchActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridSearchActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = self;
  v4 = (void *)sub_1AB23A72C();
  id v5 = PXLocalizedString(v4);

  sub_1AB23A76C();
  v6 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
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
  sub_1AA1066A4();
}

- (PXPhotosGridSearchActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  sub_1AB23A76C();
  id v6 = a3;
  v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridSearchActionPerformer();
  v8 = [(PXPhotosGridActionPerformer *)&v10 initWithViewModel:v6 actionType:v7];

  return v8;
}

@end