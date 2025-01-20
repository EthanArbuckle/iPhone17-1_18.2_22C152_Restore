@interface TimedMetadataManager
- (_TtC8VideosUI20TimedMetadataManager)init;
- (void)addObserverForPlayer:(id)a3;
- (void)removeObserverForPlayer:(id)a3;
@end

@implementation TimedMetadataManager

- (_TtC8VideosUI20TimedMetadataManager)init
{
  return (_TtC8VideosUI20TimedMetadataManager *)sub_1E2CF5FA0();
}

- (void)addObserverForPlayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E2FDCDEC(v6);
}

- (void)removeObserverForPlayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E2FDCEF4(v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI20TimedMetadataManager_logger;
  uint64_t v4 = sub_1E3877538();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end