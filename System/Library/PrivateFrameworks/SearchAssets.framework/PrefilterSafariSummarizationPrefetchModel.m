@interface PrefilterSafariSummarizationPrefetchModel
- (BOOL)hasMatchedPattern;
- (NSString)prefilterUrl;
- (_TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel)init;
@end

@implementation PrefilterSafariSummarizationPrefetchModel

- (NSString)prefilterUrl
{
  sub_25BC7A5F0();
  if (v2)
  {
    v3 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)hasMatchedPattern
{
  return sub_25BC7A650() & 1;
}

- (_TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel)init
{
}

- (void).cxx_destruct
{
}

@end