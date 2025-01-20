@interface PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (NSString)activitySystemImageName;
- (NSString)activityType;
- (PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return objc_msgSend(a4, sel_supportsSocialGroupActions, a3);
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = self;
  v4 = PXContentFilterTitleForItemTag(20);
  if (v4)
  {
    v5 = v4;
    sub_1AB23A76C();

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
  v3 = [(PXPhotosGridActionPerformer *)v2 currentContentFilterState];
  unsigned int v4 = [(PXContentFilterState *)v3 isContentFilterActive:20];

  return v4;
}

- (void)performUserInteractionTask
{
  v2 = self;
  v3 = [(PXPhotosGridActionPerformer *)v2 currentContentFilterState];
  [(PXContentFilterState *)v3 setIncludeOthersInSocialGroupAssets:[(PXContentFilterState *)v3 includeOthersInSocialGroupAssets] ^ 1];
  [(PXPhotosGridToggleFilterActionPerformer *)v2 updateToContentFilterStateAndFinishTask:v3];
}

- (PXPhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  sub_1AB23A76C();
  id v6 = a3;
  v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridToggleIncludeOthersInSocialGroupAssetsFilterActionPerformer();
  v8 = [(PXPhotosGridActionPerformer *)&v10 initWithViewModel:v6 actionType:v7];

  return v8;
}

@end