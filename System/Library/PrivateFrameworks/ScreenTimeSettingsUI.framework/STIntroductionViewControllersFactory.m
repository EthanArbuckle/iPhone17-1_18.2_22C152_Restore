@interface STIntroductionViewControllersFactory
+ (BOOL)isOfTypeAppAndWebsiteActivityViewController:(id)a3;
+ (BOOL)isOfTypeCommunicationSafetyViewController:(id)a3;
+ (BOOL)isOfTypeDowntimeViewController:(id)a3;
+ (BOOL)isOfTypePresetsViewController:(id)a3;
+ (BOOL)isOfTypeWelcomeViewController:(id)a3;
+ (id)makeControllerUsing:(id)a3 creatingNavigationController:(BOOL)a4;
+ (id)makeIntroPresetsViewControllerWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 continueHandler:(id)a7;
+ (id)makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5;
+ (id)makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5;
+ (id)makeIntroductionDowntimeViewControllerWithIntroductionModel:(id)a3 continueHandler:(id)a4;
+ (id)makeIntroductionPasscodeViewControllerWithIntroductionModel:(id)a3 askForRecoveryForAppleID:(BOOL)a4 altDSID:(id)a5 userURI:(id)a6 isChildOrNotSignedIntoiCloud:(BOOL)a7 continueHandler:(id)a8;
+ (id)makeIntroductionWelcomeViewControllerWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6;
- (_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory)init;
@end

@implementation STIntroductionViewControllersFactory

+ (id)makeIntroductionWelcomeViewControllerWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6
{
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3)
  {
    a3 = (id)sub_225C08420();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  id v15 = objc_allocWithZone((Class)STIntroWelcomeViewController);
  id v16 = sub_225BE0E00((uint64_t)a3, v12, a4, (uint64_t)sub_225BE120C, v13, (uint64_t)sub_225BE120C, v14);

  return v16;
}

+ (BOOL)isOfTypeWelcomeViewController:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroPresetsViewControllerWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 continueHandler:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_225C08420();
  unint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  id v15 = objc_allocWithZone((Class)type metadata accessor for STIntroPresetsViewController());
  swift_unknownObjectRetain();
  id v16 = STIntroPresetsViewController.init(introductionModel:settingsPresetViewModel:name:updateExistingSettings:onContinue:)((uint64_t)a3, a4, v11, v13, a6, (uint64_t)sub_225BE120C, v14);

  return v16;
}

+ (BOOL)isOfTypePresetsViewController:(id)a3
{
  return swift_dynamicCastClass() != 0;
}

+ (id)makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  return sub_225BE0734((int)a1, (int)a2, a3, (int)a4, a5, (int)&unk_26D938940, (uint64_t)sub_225BE120C, (Class *)off_2647667D8, (uint64_t)&block_descriptor_37);
}

+ (BOOL)isOfTypeAppAndWebsiteActivityViewController:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionDowntimeViewControllerWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = objc_allocWithZone((Class)STIntroDowntimeViewController);
  v12[4] = sub_225BE120C;
  v12[5] = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_225BE0F64;
  v12[3] = &block_descriptor_12;
  v8 = _Block_copy(v12);
  id v9 = a3;
  swift_retain();
  id v10 = objc_msgSend(v7, sel_initWithIntroductionModel_continueHandler_, v9, v8);
  _Block_release(v8);

  swift_release();
  swift_release();

  return v10;
}

+ (BOOL)isOfTypeDowntimeViewController:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  return sub_225BE0734((int)a1, (int)a2, a3, (int)a4, a5, (int)&unk_26D9388C8, (uint64_t)sub_225BE120C, (Class *)off_2647667E0, (uint64_t)&block_descriptor_34);
}

+ (BOOL)isOfTypeCommunicationSafetyViewController:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionPasscodeViewControllerWithIntroductionModel:(id)a3 askForRecoveryForAppleID:(BOOL)a4 altDSID:(id)a5 userURI:(id)a6 isChildOrNotSignedIntoiCloud:(BOOL)a7 continueHandler:(id)a8
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116B60);
  MEMORY[0x270FA5388](v14 - 8, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  if (a5)
  {
    a5 = (id)sub_225C08420();
    uint64_t v20 = v19;
    if (a6)
    {
LABEL_3:
      sub_225C075F0();
      uint64_t v21 = sub_225C07600();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 0, 1, v21);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = sub_225C07600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
LABEL_6:
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v18;
  sub_225BE10D8();
  id v24 = sub_225BE091C(a3, a4, (uint64_t)a5, v20, a7, (uint64_t)sub_225BE1174, v23);
  sub_225BE117C((uint64_t)v17);

  return v24;
}

+ (id)makeControllerUsing:(id)a3 creatingNavigationController:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = objc_allocWithZone(MEMORY[0x263F82E10]);
  uint64_t v6 = v5;
  if (v4)
  {
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v6, sel_init);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5B8E0]), sel_initWithRootViewController_, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    id v8 = objc_msgSend(v5, sel_init);
  }

  return v8;
}

- (_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STIntroductionViewControllersFactory();
  return [(STIntroductionViewControllersFactory *)&v3 init];
}

@end