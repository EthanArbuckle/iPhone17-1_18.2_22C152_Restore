@interface MusicApplicationContextProvider
- (BOOL)allowsModalMessageDisplay;
- (_TtC16MusicApplication31MusicApplicationContextProvider)init;
- (double)lastMessageDisplayTime;
- (id)contextPropertyWithName:(id)a3;
- (id)presentationPolicyForPolicyGroup:(int64_t)a3;
- (id)viewControllerForModalPresentation;
- (void)messageCoordinator:(id)a3 didRequestAction:(id)a4;
- (void)setLastMessageDisplayTime:(double)a3;
@end

@implementation MusicApplicationContextProvider

- (_TtC16MusicApplication31MusicApplicationContextProvider)init
{
  return (_TtC16MusicApplication31MusicApplicationContextProvider *)sub_1B96F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_nowPlaying));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_cachedPresentationPolicyNormal));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_cachedPresentationPolicyRestricted));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_playerRequestController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_notificationSettingsManager));

  swift_release();
}

- (id)contextPropertyWithName:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  sub_1BA88C(v5, v7, (uint64_t)v17);

  swift_bridgeObjectRelease();
  uint64_t v10 = v18;
  if (v18)
  {
    v11 = __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t v12 = *(void *)(v10 - 8);
    __chkstk_darwin(v11);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    v15 = (void *)sub_AB8630();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)allowsModalMessageDisplay
{
  return (*((unsigned char *)&self->super.isa
          + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_nowPlayingItemHasVideo) & 1) == 0;
}

- (id)viewControllerForModalPresentation
{
  v2 = (void *)sub_1BC614();

  return v2;
}

- (void)messageCoordinator:(id)a3 didRequestAction:(id)a4
{
  uint64_t v7 = sub_AB6250();
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_1BB674(v8, v7);

  swift_bridgeObjectRelease();
}

- (id)presentationPolicyForPolicyGroup:(int64_t)a3
{
  v4 = self;
  id v5 = sub_1BB980(a3);

  return v5;
}

- (double)lastMessageDisplayTime
{
  v3 = self;
  v4 = self;
  id v5 = [v3 standardUserDefaults];
  double v6 = sub_1BBF50();

  return v6;
}

- (void)setLastMessageDisplayTime:(double)a3
{
  id v5 = self;
  double v6 = self;
  id v7 = [v5 standardUserDefaults];
  v9[3] = &type metadata for Double;
  *(double *)id v9 = a3;
  v8[0] = 0xD00000000000001CLL;
  v8[1] = 0x8000000000B395F0;
  sub_3C71C();
  NSUserDefaults.subscript.setter((uint64_t)v9, (uint64_t)v8, (uint64_t)&type metadata for String);
}

@end