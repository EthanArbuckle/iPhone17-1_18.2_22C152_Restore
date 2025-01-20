@interface BatchSettingsVC
- (_TtC7Journal15BatchSettingsVC)initWithCoder:(id)a3;
- (_TtC7Journal15BatchSettingsVC)initWithNibName:(id)a3 bundle:(id)a4;
- (void)actionAssetTypeActivitySwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeAudioSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeBooksSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeContactSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeLinkSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeMotionActivitySwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeMultiPinMapSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeMusicSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypePhotosSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypePodcastsSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeRouteSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeVideoSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeVisitSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeWorkoutIconSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetTypeWorkoutRouteSwitchStateDidChangeWithSender:(id)a3;
- (void)actionAssetsNeededSwitchStateDidChangeWithSender:(id)a3;
- (void)actionBatchCountSliderValueDidChangeWithSender:(id)a3;
- (void)actionLastRandomDaysSliderValueDidChangeWithSender:(id)a3;
- (void)actionMaxRangeSliderValueDidChangeWithSender:(id)a3;
- (void)actionMinRangeSliderValueDidChangeWithSender:(id)a3;
- (void)actionSyncEnableSwitchStateDidChangeWithSender:(id)a3;
- (void)loadView;
@end

@implementation BatchSettingsVC

- (void)loadView
{
  v2 = self;
  sub_10024D600();
}

- (void)actionSyncEnableSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002504B8(a3);
}

- (void)actionBatchCountSliderValueDidChangeWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002555CC();
}

- (void)actionLastRandomDaysSliderValueDidChangeWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002558B8();
}

- (void)actionAssetsNeededSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100250CD4(a3);
}

- (void)actionAssetTypePhotosSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100250F04(a3);
}

- (void)actionAssetTypeMusicSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251120(a3);
}

- (void)actionAssetTypePodcastsSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10025133C(a3);
}

- (void)actionAssetTypeBooksSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251558(a3);
}

- (void)actionAssetTypeVisitSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251774(a3);
}

- (void)actionAssetTypeMultiPinMapSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251990(a3);
}

- (void)actionAssetTypeVideoSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251BAC(a3);
}

- (void)actionAssetTypeAudioSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251DC8(a3);
}

- (void)actionAssetTypeActivitySwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100251FE4(a3);
}

- (void)actionAssetTypeRouteSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252200(a3);
}

- (void)actionAssetTypeLinkSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10025241C(a3);
}

- (void)actionAssetTypeContactSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252638(a3);
}

- (void)actionAssetTypeWorkoutRouteSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252854(a3);
}

- (void)actionAssetTypeWorkoutIconSwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252A70(a3);
}

- (void)actionAssetTypeMotionActivitySwitchStateDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252C8C(a3);
}

- (void)actionMaxRangeSliderValueDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100252EA8(a3);
}

- (void)actionMinRangeSliderValueDidChangeWithSender:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100253410(a3);
}

- (_TtC7Journal15BatchSettingsVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal15BatchSettingsVC *)sub_100253978(v5, v7, a4);
}

- (_TtC7Journal15BatchSettingsVC)initWithCoder:(id)a3
{
  return (_TtC7Journal15BatchSettingsVC *)sub_1002540DC(a3);
}

- (void).cxx_destruct
{
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15BatchSettingsVC_pass));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_labelDatesDaysCount));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_sliderDatesDaysCount));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_switchAssetsNeeded));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_switchWorkoutRoute));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_switchWorkoutActivity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_switchMotionActivity));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_labelMotionActivity));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC_scrollViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC____lazy_storage___view1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC____lazy_storage___view2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15BatchSettingsVC____lazy_storage___view3));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal15BatchSettingsVC____lazy_storage___view4);
}

@end