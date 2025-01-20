@interface GenerativeMemoryPhotosGraphData
+ (id)getCuratedAssetPlaybackTimeRangesFor:(id)a3;
+ (id)parsePromptInformationAsDictionaryWithMemory:(id)a3 error:(id *)a4;
- (_TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData)init;
@end

@implementation GenerativeMemoryPhotosGraphData

+ (id)getCuratedAssetPlaybackTimeRangesFor:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  static GenerativeMemoryPhotosGraphData.getCuratedAssetPlaybackTimeRanges(for:)(v4);
  v6 = v5;

  return v6;
}

+ (id)parsePromptInformationAsDictionaryWithMemory:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  static GenerativeMemoryPhotosGraphData.parsePromptInformationAsDictionary(memory:)(v5);

  v6 = (void *)sub_259843E90();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData_logger;
  uint64_t v4 = sub_259843A80();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  memcpy(v5, (char *)self + OBJC_IVAR____TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData_storyMusicCuration, sizeof(v5));
  sub_259488494((uint64_t)v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PhotosIntelligence31GenerativeMemoryPhotosGraphData____lazy_storage___storyTitleCategory));
}

@end