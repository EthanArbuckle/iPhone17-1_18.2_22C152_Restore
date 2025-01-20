@interface MTSharedPlaybackController
+ (NSString)kIsPlayingKeyPath;
- (BOOL)isPlaying;
- (MTSharedPlaybackController)init;
- (void)playManifest:(id)a3 waitingForEngine:(BOOL)a4 completion:(id)a5;
- (void)setIsPlaying:(BOOL)a3;
@end

@implementation MTSharedPlaybackController

- (void)setIsPlaying:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_isPlaying) = a3;
}

+ (NSString)kIsPlayingKeyPath
{
  if (qword_1005F5A60 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isPlaying
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MTSharedPlaybackController_isPlaying);
}

- (void)playManifest:(id)a3 waitingForEngine:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_10021A39C;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_10026E608(v10, v5, (uint64_t)v8, v9);
  sub_1000536BC((uint64_t)v8);
}

- (MTSharedPlaybackController)init
{
  result = (MTSharedPlaybackController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end