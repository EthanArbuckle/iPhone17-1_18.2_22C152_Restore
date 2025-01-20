@interface MusicManager
- (_TtC8VideosUI12MusicManager)init;
- (void)addSongToMusicWithSongId:(id)a3 isExplicit:(BOOL)a4;
- (void)dealloc;
@end

@implementation MusicManager

- (_TtC8VideosUI12MusicManager)init
{
  return (_TtC8VideosUI12MusicManager *)sub_1E2D03D94();
}

- (void)dealloc
{
  v2 = self;
  sub_1E33B9AD4();
}

- (void).cxx_destruct
{
  sub_1E3877538();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_47();
  v2();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addSongToMusicWithSongId:(id)a3 isExplicit:(BOOL)a4
{
  uint64_t v6 = sub_1E387C928();
  uint64_t v8 = v7;
  v9 = self;
  sub_1E33C1B58(v6, v8, (os_log_type_t)a4);

  swift_bridgeObjectRelease();
}

@end