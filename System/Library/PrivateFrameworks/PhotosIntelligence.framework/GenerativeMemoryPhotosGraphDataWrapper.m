@interface GenerativeMemoryPhotosGraphDataWrapper
+ (id)getCuratedAssetPlaybackTimeRangesForMemory:(id)a3;
@end

@implementation GenerativeMemoryPhotosGraphDataWrapper

+ (id)getCuratedAssetPlaybackTimeRangesForMemory:(id)a3
{
  return +[GenerativeMemoryPhotosGraphData getCuratedAssetPlaybackTimeRangesFor:a3];
}

@end