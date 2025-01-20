@interface BKAudiobookAsset
- (BKAudiobookAsset)init;
- (id)assetID;
- (id)assetType;
- (id)displayTitle;
- (id)url;
@end

@implementation BKAudiobookAsset

- (id)assetType
{
  NSString v2 = sub_1007FDC30();

  return v2;
}

- (id)assetID
{
  return sub_10029A904();
}

- (id)url
{
  sub_1007F2960((NSURL *)OBJC_IVAR___BKAudiobookAsset_audiobookURL);

  return v2;
}

- (id)displayTitle
{
  return sub_10029A904();
}

- (BKAudiobookAsset)init
{
  result = (BKAudiobookAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BKAudiobookAsset_audiobookURL;
  uint64_t v4 = sub_1007F29D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end