@interface PXPhotoKitCollectionListCustomizeActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (_TtC12PhotosUICore48PXPhotoKitCollectionListCustomizeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCollectionListCustomizeActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, sel_canPerformEditOperation_, 7);
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA5E13F4();
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  id v4 = a4;
  v5 = (void *)sub_1AB23A72C();
  id v6 = PXLocalizedString(v5);

  sub_1AB23A76C();
  v7 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  id v4 = (void *)sub_1AB23A72C();
  return v4;
}

- (_TtC12PhotosUICore48PXPhotoKitCollectionListCustomizeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  sub_1AB23A76C();
  type metadata accessor for PXActionParameterKey(0);
  sub_1AA5E1794((unint64_t *)&unk_1E9832F30, type metadata accessor for PXActionParameterKey);
  sub_1AB23A4DC();
  id v7 = a4;
  v8 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1AB23A4CC();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PXPhotoKitCollectionListCustomizeActionPerformer();
  v10 = [(PXPhotoKitCollectionListActionPerformer *)&v12 initWithActionType:v8 collectionList:v7 parameters:v9];

  return v10;
}

@end