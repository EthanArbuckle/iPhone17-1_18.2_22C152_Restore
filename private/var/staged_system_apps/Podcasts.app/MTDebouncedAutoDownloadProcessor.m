@interface MTDebouncedAutoDownloadProcessor
+ (MTDebouncedAutoDownloadProcessor)sharedInstance;
- (BOOL)isRunning;
- (BOOL)start;
- (MTDebouncedAutoDownloadProcessor)init;
- (void)setIsRunning:(BOOL)a3;
@end

@implementation MTDebouncedAutoDownloadProcessor

- (BOOL)start
{
  v2 = self;
  sub_100008C78();
  dispatch thunk of DebouncedEpisodeAndShowProcessor.start()();
  swift_release();
  v3 = (char *)v2 + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess();
  unsigned char *v3 = 1;

  return 1;
}

- (BOOL)isRunning
{
  v2 = (BOOL *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess();
  return *v2;
}

+ (MTDebouncedAutoDownloadProcessor)sharedInstance
{
  if (qword_1005F5B08 != -1) {
    swift_once();
  }
  v2 = (void *)static DebouncedAutoDownloadProcessor.sharedInstance;

  return (MTDebouncedAutoDownloadProcessor *)v2;
}

- (void)setIsRunning:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_isRunning;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MTDebouncedAutoDownloadProcessor)init
{
  result = (MTDebouncedAutoDownloadProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTDebouncedAutoDownloadProcessor_context);
}

@end