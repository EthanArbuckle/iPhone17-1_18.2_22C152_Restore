@interface SASafariAssistantAssetManager
- (_TtC12SearchAssets29SASafariAssistantAssetManager)init;
- (id)assetVersionForLocale:(id)a3;
- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3;
- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4;
- (id)prefilterSafariSummarizationPrefetchRequestWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4;
- (void)ensureSafariSummarizationAssetsDownloadedForLocale:(NSString *)a3 completionHandler:(id)a4;
- (void)resetSafariSummarizationAssets;
- (void)subscribeToAndPreloadSafariSummarizationAssetsForLocale:(NSString *)a3 completionHandler:(id)a4;
- (void)unsubscribeFromSafariSummarizationAssetsWithCompletionHandler:(id)a3;
@end

@implementation SASafariAssistantAssetManager

- (void)subscribeToAndPreloadSafariSummarizationAssetsForLocale:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)ensureSafariSummarizationAssetsDownloadedForLocale:(NSString *)a3 completionHandler:(id)a4
{
}

- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3
{
  uint64_t v4 = sub_25BCA15A0();
  unint64_t v6 = v5;
  v7 = self;
  id v8 = sub_25BC79858(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4
{
  uint64_t v5 = sub_25BCA15A0();
  unint64_t v7 = v6;
  id v8 = self;
  id v9 = sub_25BC79AB0(v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)prefilterSafariSummarizationPrefetchRequestWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4
{
  uint64_t v5 = sub_25BCA15A0();
  unint64_t v7 = v6;
  id v8 = self;
  sub_25BC79B28(v5, v7);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)unsubscribeFromSafariSummarizationAssetsWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  unint64_t v6 = self;
  sub_25BC78E30((uint64_t)&unk_26A554670, v5);
}

- (void)resetSafariSummarizationAssets
{
  v2 = self;
  sub_25BC79FE4();
}

- (id)assetVersionForLocale:(id)a3
{
  uint64_t v4 = sub_25BCA15A0();
  uint64_t v6 = v5;
  unint64_t v7 = self;
  sub_25BC7A0A0(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (_TtC12SearchAssets29SASafariAssistantAssetManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter);
  swift_release();
}

@end