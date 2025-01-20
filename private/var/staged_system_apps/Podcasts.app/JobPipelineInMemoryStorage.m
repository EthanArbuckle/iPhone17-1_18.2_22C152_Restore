@interface JobPipelineInMemoryStorage
- (id)downloadAtIndex:(int64_t)a3;
- (id)downloadForEpisodeWithUuid:(id)a3;
- (int64_t)indexForDownload:(id)a3;
- (int64_t)numberOfDownloads;
- (int64_t)numberOfDownloadsFrom:(id)a3;
@end

@implementation JobPipelineInMemoryStorage

- (id)downloadForEpisodeWithUuid:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  v6 = (void *)sub_100417D60(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (int64_t)indexForDownload:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  int64_t v4 = sub_1004180A8(a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

- (id)downloadAtIndex:(int64_t)a3
{
  swift_retain();
  int64_t v4 = (void *)sub_100418398(a3);
  swift_release();

  return v4;
}

- (int64_t)numberOfDownloads
{
  uint64_t v3 = *(void **)self->lock;
  swift_retain();
  [v3 lock];
  swift_beginAccess();
  unint64_t v4 = *(void *)self->pipelines;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  [*(id *)self->lock unlock];
  swift_release();
  return v5;
}

- (int64_t)numberOfDownloadsFrom:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  int64_t v6 = sub_10041861C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end