@interface PUAssetHighlightTimeRangesProducer
- (NSArray)highlightTimeRanges;
- (PUAssetHighlightTimeRangesProducer)init;
- (PUAssetHighlightTimeRangesProducer)initWithMediaAnalyzer:(id)a3;
- (PUAssetHighlightTimeRangesProducerDelegate)delegate;
- (PXDisplayAsset)asset;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightTimeRanges:(id)a3;
- (void)setSearchQueryMatchInfo:(id)a3;
@end

@implementation PUAssetHighlightTimeRangesProducer

- (PUAssetHighlightTimeRangesProducer)init
{
  return (PUAssetHighlightTimeRangesProducer *)AssetHighlightTimeRangesProducer.init()();
}

- (PUAssetHighlightTimeRangesProducer)initWithMediaAnalyzer:(id)a3
{
  return (PUAssetHighlightTimeRangesProducer *)AssetHighlightTimeRangesProducer.init(mediaAnalyzer:)((uint64_t)a3);
}

- (PXDisplayAsset)asset
{
  v2 = (void *)sub_1AEB3B150();
  return (PXDisplayAsset *)v2;
}

- (void)setAsset:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEB3B1D0((uint64_t)a3);
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  v2 = sub_1AEB3B3E8();
  return (PXSearchQueryMatchInfo *)v2;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB3B48C(a3);
}

- (PUAssetHighlightTimeRangesProducerDelegate)delegate
{
  v2 = (void *)sub_1AEB3B6FC();
  return (PUAssetHighlightTimeRangesProducerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB3B7A0();
}

- (NSArray)highlightTimeRanges
{
  if (sub_1AEB3B924())
  {
    sub_1AEA0826C(0, (unint64_t *)&unk_1E9A96A40);
    v2 = (void *)sub_1AEF96F60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setHighlightTimeRanges:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1AEA0826C(0, (unint64_t *)&unk_1E9A96A40);
    uint64_t v3 = sub_1AEF96F70();
  }
  id v5 = self;
  sub_1AEB3BA10(v3);
}

- (void)dealloc
{
  v2 = self;
  AssetHighlightTimeRangesProducer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUAssetHighlightTimeRangesProducer_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PUAssetHighlightTimeRangesProducer_analysisProgress);
}

@end