@interface PXPhotoKitAssetCollectionChangePersonSortOrder
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
- (NSString)activityType;
- (PXPhotoKitAssetCollectionChangePersonSortOrder)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionChangePersonSortOrder

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (!a4) {
    return 0;
  }
  if (objc_msgSend(a4, sel_respondsToSelector_, sel_people))
  {
    id v5 = a3;
    id v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_people);
    if (v6)
    {
      v7 = v6;
      id v8 = objc_msgSend(v6, sel_count);

      swift_unknownObjectRelease();
      return v8 == (id)1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = a4;
  id v6 = (void *)swift_unknownObjectRetain();
  sub_1AA01B000(v6);
  uint64_t v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)activityType
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = (void *)swift_unknownObjectRetain();
  sub_1AA01B0DC(v9, (uint64_t)sub_1A9FDB6A4, v7);
  v11 = v10;

  swift_unknownObjectRelease();
  swift_release();
  return v11;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA01AA4C();
}

- (PXPhotoKitAssetCollectionChangePersonSortOrder)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  sub_1AB23A76C();
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PhotoKitAssetCollectionChangePersonSortOrder();
  v11 = [(PXAssetCollectionActionPerformer *)&v13 initWithActionType:v10 assetCollectionReference:v8 displayTitleInfo:v9];

  return v11;
}

@end