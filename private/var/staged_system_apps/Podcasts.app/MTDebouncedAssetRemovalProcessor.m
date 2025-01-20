@interface MTDebouncedAssetRemovalProcessor
+ (MTDebouncedAssetRemovalProcessor)sharedInstance;
- (BOOL)isRunning;
- (BOOL)start;
- (MTDebouncedAssetRemovalProcessor)init;
- (void)setIsRunning:(BOOL)a3;
@end

@implementation MTDebouncedAssetRemovalProcessor

- (BOOL)start
{
  v2 = self;
  sub_100006BA0();
  dispatch thunk of DebouncedEpisodeAndShowProcessor.start()();
  swift_release();
  v3 = (char *)v2 + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess();
  unsigned char *v3 = 1;

  return 1;
}

- (BOOL)isRunning
{
  v2 = (BOOL *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess();
  return *v2;
}

+ (MTDebouncedAssetRemovalProcessor)sharedInstance
{
  if (qword_1005F5A30 != -1) {
    swift_once();
  }
  v2 = (void *)static DebouncedAssetRemovalProcessor.sharedInstance;

  return (MTDebouncedAssetRemovalProcessor *)v2;
}

- (void)setIsRunning:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor_isRunning;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MTDebouncedAssetRemovalProcessor)init
{
  result = (MTDebouncedAssetRemovalProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E218((uint64_t)self + OBJC_IVAR___MTDebouncedAssetRemovalProcessor____lazy_storage___episodeStorage);

  swift_release();
}

@end