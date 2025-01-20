@interface RCWaveformSnapshotGenerator
+ (id)snapshotForComposition:(id)a3 size:(CGSize)a4;
@end

@implementation RCWaveformSnapshotGenerator

+ (id)snapshotForComposition:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v7 = objc_alloc_init(RCApplicationWaveformRenderer);
  [(RCApplicationWaveformRenderer *)v7 setIsPlayback:1];
  id v8 = objc_msgSend(objc_alloc((Class)RCCompositionWaveformDataSource), "initWithComposition:trackIndex:", v6, (uint64_t)((void)objc_msgSend(v6, "hasMultipleTracks") << 63) >> 63);

  [v8 beginLoading];
  [v8 waitUntilFinished];
  double y = CGPointZero.y;
  v10 = [(RCApplicationWaveformRenderer *)v7 view];
  [v10 setFrame:CGPointZero.x, y, width, height];

  [(RCWaveformRenderer *)v7 setDataSource:v8];
  RCTimeRangeMake();
  v11 = -[RCWaveformRenderer rasterizeTimeRange:imageSize:afterScreenUpdates:](v7, "rasterizeTimeRange:imageSize:afterScreenUpdates:", 1);

  return v11;
}

@end