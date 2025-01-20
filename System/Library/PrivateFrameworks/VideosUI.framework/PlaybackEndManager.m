@interface PlaybackEndManager
- (_TtC8VideosUI18PlaybackEndManager)init;
- (id)playbackBroadcastDidEndHandler;
- (void)monitor:(id)a3;
- (void)remove:(id)a3;
- (void)removeAllPlayers;
- (void)setPlaybackBroadcastDidEndHandler:(id)a3;
@end

@implementation PlaybackEndManager

- (id)playbackBroadcastDidEndHandler
{
  uint64_t v2 = sub_1E3201950();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1E2C9E704;
    v6[3] = &block_descriptor_45;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setPlaybackBroadcastDidEndHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1E31EEAAC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1E3201A44((uint64_t)v4, v5);
}

- (void)monitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3201B74(v6);
}

- (void)remove:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3202888(v6);
}

- (void)removeAllPlayers
{
  uint64_t v2 = self;
  sub_1E3202B0C();
}

- (_TtC8VideosUI18PlaybackEndManager)init
{
  return (_TtC8VideosUI18PlaybackEndManager *)sub_1E3202CEC();
}

- (void).cxx_destruct
{
  sub_1E3877538();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_47();
  v3();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8VideosUI18PlaybackEndManager_playbackBroadcastDidEndHandler);
  sub_1E2C5FB90(v4);
}

@end