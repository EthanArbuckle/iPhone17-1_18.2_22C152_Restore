@interface VolumeSlider
- (BOOL)isOnScreenForVolumeDisplay;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (_TtC9SeymourUI12VolumeSlider)initWithCoder:(id)a3;
- (_TtC9SeymourUI12VolumeSlider)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation VolumeSlider

- (_TtC9SeymourUI12VolumeSlider)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI12VolumeSlider *)sub_239C71E64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI12VolumeSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C734A8();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_239C72600();
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_onVolumeChanged));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_timerProvider);

  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_volumeController);
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_239C7283C();
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = a3;
  v6 = self;
  sub_239C73680();
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return [(VolumeSlider *)self isHidden] ^ 1;
}

- (NSString)volumeAudioCategory
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI12VolumeSlider_volumeController);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_dataSource);
  self;
  id v5 = (void *)swift_dynamicCastObjCClass();
  if (v5)
  {
    result = (NSString *)objc_msgSend(v5, sel_volumeAudioCategory);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v7 = result;
    sub_23A7FF988();

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  v8 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = self;
  id v3 = [(VolumeSlider *)v2 window];
  id v4 = objc_msgSend(v3, sel_windowScene);

  return (UIWindowScene *)v4;
}

@end