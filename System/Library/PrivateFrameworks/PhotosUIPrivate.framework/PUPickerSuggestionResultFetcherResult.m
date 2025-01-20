@interface PUPickerSuggestionResultFetcherResult
- (BOOL)isLiveWallpaperSuggestion;
- (BOOL)selectedFilterableSuggestion;
- (BOOL)shouldReverseSortOrder;
- (NSArray)allowedColumnsOverride;
- (NSDictionary)suggestionSubtypeByAssetUUID;
- (NSSet)inlinePlaybackDisallowedAssetUUIDs;
- (NSString)analyticsName;
- (PUPickerSuggestionResultFetcherResult)init;
- (id)fetchResult;
- (int64_t)numberOfItemsToPlayInline;
- (unint64_t)posterClassification;
@end

@implementation PUPickerSuggestionResultFetcherResult

- (id)fetchResult
{
  v2 = PickerSuggestionResultFetcher.Result.fetchResult.getter();
  return v2;
}

- (NSDictionary)suggestionSubtypeByAssetUUID
{
  if (PickerSuggestionResultFetcher.Result.suggestionSubtypeByAssetUUID.getter())
  {
    sub_1AEA0826C(0, (unint64_t *)&qword_1E9A98E00);
    v2 = (void *)sub_1AEF96C80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSSet)inlinePlaybackDisallowedAssetUUIDs
{
  if (PickerSuggestionResultFetcher.Result.inlinePlaybackDisallowedAssetUUIDs.getter())
  {
    v2 = (void *)sub_1AEF97110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (BOOL)shouldReverseSortOrder
{
  v2 = self;
  unsigned __int8 v3 = PickerSuggestionResultFetcher.Result.shouldReverseSortOrder.getter();

  return v3 & 1;
}

- (BOOL)selectedFilterableSuggestion
{
  return PickerSuggestionResultFetcher.Result.selectedFilterableSuggestion.getter();
}

- (NSString)analyticsName
{
  v2 = self;
  PickerSuggestionResultFetcher.Result.analyticsName.getter();

  unsigned __int8 v3 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)posterClassification
{
  v2 = self;
  unint64_t v3 = PickerSuggestionResultFetcher.Result.posterClassification.getter();

  return v3;
}

- (int64_t)numberOfItemsToPlayInline
{
  v2 = self;
  int64_t v3 = PickerSuggestionResultFetcher.Result.numberOfItemsToPlayInline.getter();

  return v3;
}

- (NSArray)allowedColumnsOverride
{
  if (PickerSuggestionResultFetcher.Result.allowedColumnsOverride.getter())
  {
    v2 = (void *)sub_1AEF96F60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)isLiveWallpaperSuggestion
{
  return PickerSuggestionResultFetcher.Result.isLiveWallpaperSuggestion.getter();
}

- (PUPickerSuggestionResultFetcherResult)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end