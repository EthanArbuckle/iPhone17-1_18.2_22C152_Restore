@interface PXPhotoKitSocialGroupActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)isDestructiveActionType:(id)a3;
- (PXPhotoKitSocialGroupActionManager)init;
- (PXPhotoKitSocialGroupActionManager)initWithSocialGroups:(id)a3 photoLibrary:(id)a4;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4;
- (id)actionTypeForGenericType:(id)a3;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)systemImageNameForActionType:(id)a3;
@end

@implementation PXPhotoKitSocialGroupActionManager

- (PXPhotoKitSocialGroupActionManager)initWithSocialGroups:(id)a3 photoLibrary:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A9B21070(0, (unint64_t *)&qword_1E9820930);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotoKitSocialGroupActionManager_socialGroups) = (Class)sub_1AB23AADC();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotoKitSocialGroupActionManager_photoLibrary) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a4;
  return [(PXPhotoKitSocialGroupActionManager *)&v9 init];
}

- (id)actionTypeForGenericType:(id)a3
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  if (v5 == sub_1AB23A76C() && v7 == v8)
  {
    id v14 = a3;
    v15 = self;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_1AB23C5AC();
    id v11 = a3;
    v12 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {

      v13 = 0;
      goto LABEL_9;
    }
  }

  v13 = (void *)sub_1AB23A72C();
LABEL_9:
  return v13;
}

- (id)actionPerformerForActionType:(id)a3
{
  sub_1AB23A76C();
  v4 = self;
  sub_1AA630B58();
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  type metadata accessor for PXActionParameterKey(0);
  sub_1A9BF9C7C((unint64_t *)&unk_1E9832F30);
  uint64_t v8 = sub_1AB23A4DC();
  objc_super v9 = self;
  char v10 = (void *)sub_1AA631660(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)canPerformActionType:(id)a3
{
  return sub_1AA632280(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1AA631E34);
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_1AA633068(v5, v7);
}

- (id)systemImageNameForActionType:(id)a3
{
  uint64_t v4 = sub_1AB23A76C();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1AA631FDC(v4, v6);
}

- (BOOL)isDestructiveActionType:(id)a3
{
  return sub_1AA632280(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1AA632174);
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1AA6322E8((uint64_t)sub_1AA6331C0, v5);
}

- (PXPhotoKitSocialGroupActionManager)init
{
  result = (PXPhotoKitSocialGroupActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotoKitSocialGroupActionManager_photoLibrary);
}

@end