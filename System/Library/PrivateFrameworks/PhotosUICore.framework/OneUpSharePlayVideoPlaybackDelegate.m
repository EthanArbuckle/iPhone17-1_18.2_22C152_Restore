@interface OneUpSharePlayVideoPlaybackDelegate
- (_TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate)init;
- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4;
@end

@implementation OneUpSharePlayVideoPlaybackDelegate

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate_displayAsset);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id result = objc_msgSend(v6, sel_uuid);
  if (result)
  {
    id v11 = result;
    sub_1AB23A76C();

    v12 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate)init
{
  id result = (_TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end