@interface DownloadQueueManager
- (_TtC8VideosUI20DownloadQueueManager)init;
- (void)downloadManagerDidBecomeInitialized:(id)a3;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)enqueueDownloadsForVideoManagedObjects:(id)a3;
- (void)handleErrors:(id)a3;
- (void)removeDownloadsForVideoManagedObjects:(id)a3;
@end

@implementation DownloadQueueManager

- (_TtC8VideosUI20DownloadQueueManager)init
{
  return (_TtC8VideosUI20DownloadQueueManager *)sub_1E2CF6C00();
}

- (void)downloadManagerDidBecomeInitialized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E2CF72E0((uint64_t)v5, (uint64_t)&unk_1F3E83CA8, (uint64_t)&unk_1EADF6EA0);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)enqueueDownloadsForVideoManagedObjects:(id)a3
{
}

- (void)removeDownloadsForVideoManagedObjects:(id)a3
{
}

- (void)handleErrors:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF9FC20);
  sub_1E387CC98();
  id v4 = self;
  OUTLINED_FUNCTION_11_4();
  sub_1E36EF9F8();

  swift_bridgeObjectRelease();
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E2CF72E0((uint64_t)v5, (uint64_t)&unk_1F3E83CD0, (uint64_t)&unk_1EADF6EB0);
}

@end