@interface PXSocialGroupMakeKeyPhotoActionPerformer
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (PXSocialGroupMakeKeyPhotoActionPerformer)initWithActionType:(id)a3;
- (void)performBackgroundTask;
@end

@implementation PXSocialGroupMakeKeyPhotoActionPerformer

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA59D004();
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = a3;
    id v7 = objc_msgSend(v5, sel_socialGroup);

    if (v7)
    {

      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = a4;
  sub_1A9BFFA08();

  v5 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = (void *)sub_1AB23A72C();
  return v3;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v6 = _Block_copy(a5);
  sub_1AB23A76C();
  *(void *)(swift_allocObject() + 16) = v6;
  sub_1A9B21070(0, (unint64_t *)&qword_1E9820E20);
  id v7 = a4;
  v8 = (void *)sub_1AB23B82C();
  return v8;
}

- (PXSocialGroupMakeKeyPhotoActionPerformer)initWithActionType:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1AB23A76C();
  v5 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = [(PXActionPerformer *)&v8 initWithActionType:v5];

  return v6;
}

@end