@interface BCMAssetWrapper
+ (id)actionTextForType:(int64_t)a3 withAsset:(id)a4;
+ (id)assetWithData:(id)a3;
+ (id)htmlStrippedStandardDescriptionForAsset:(id)a3;
+ (id)htmlStrippedStandardNotesForAsset:(id)a3;
+ (id)nameForResourceType:(int64_t)a3;
- (BCMAssetWrapper)init;
@end

@implementation BCMAssetWrapper

+ (id)assetWithData:(id)a3
{
  uint64_t v3 = sub_1F20F0();
  v4 = (void *)_s8BookCore13MAssetWrapperC5asset4withSo8BFMAsset_pSgSDys11AnyHashableVypG_tFZ_0(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)actionTextForType:(int64_t)a3 withAsset:(id)a4
{
  sub_1F1D40();
  if (swift_dynamicCastClass()
    && (swift_unknownObjectRetain(), MAsset.actionText(for:)(a3), uint64_t v6 = v5, swift_unknownObjectRelease(), v6))
  {
    NSString v7 = sub_1F2160();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

+ (id)htmlStrippedStandardNotesForAsset:(id)a3
{
  return sub_1B7D14((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))MAsset.htmlStrippedStandardNotes.getter);
}

+ (id)htmlStrippedStandardDescriptionForAsset:(id)a3
{
  return sub_1B7D14((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))MAsset.htmlStrippedStandardDescription.getter);
}

+ (id)nameForResourceType:(int64_t)a3
{
  uint64_t v3 = sub_1F1B80();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1F1B90();
  sub_1F1B70();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  NSString v7 = sub_1F2160();
  swift_bridgeObjectRelease();

  return v7;
}

- (BCMAssetWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAssetWrapper();
  return [(BCMAssetWrapper *)&v3 init];
}

@end