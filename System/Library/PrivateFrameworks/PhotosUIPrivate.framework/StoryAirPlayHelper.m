@interface StoryAirPlayHelper
- (_TtC15PhotosUIPrivate18StoryAirPlayHelper)init;
- (id)contentViewControllerForAirPlayController:(id)a3;
- (void)airPlayControllerScreenAvailabilityChanged:(id)a3;
- (void)dealloc;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation StoryAirPlayHelper

- (void)dealloc
{
  v2 = self;
  sub_1AEA2F5C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_pickerViewController));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_airPlayContainerViewController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate18StoryAirPlayHelper_airPlayStoryViewController);
}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1AEA2FA8C();

  return v6;
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEA2FBFC(a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEA2FD88(v4);
}

- (_TtC15PhotosUIPrivate18StoryAirPlayHelper)init
{
}

@end