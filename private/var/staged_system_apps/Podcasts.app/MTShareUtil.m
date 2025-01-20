@interface MTShareUtil
+ (id)shareActivityItems:(id)a3;
+ (id)shareActivityItemsWithEpisode:(id)a3;
+ (id)shareActivityItemsWithPlayerItem:(id)a3;
+ (id)shareActivityItemsWithPodcast:(id)a3;
+ (id)shareActivityItemsWithPodcastDetails:(id)a3;
+ (id)shareViewControllerWithDataSource:(id)a3 applicationActivities:(id)a4;
+ (id)shareViewControllerWithEpisode:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7;
+ (id)shareViewControllerWithPlayerItem:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7;
+ (id)shareViewControllerWithPodcast:(id)a3 applicationActivities:(id)a4;
+ (id)shareViewControllerWithPodcastDetails:(id)a3 applicationActivities:(id)a4;
@end

@implementation MTShareUtil

+ (id)shareViewControllerWithDataSource:(id)a3 applicationActivities:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MTShareUtilActivityViewController alloc] initWithDataSource:v6 applicationActivities:v5];
  if ([v6 shareSupported]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(MTShareUtilActivityViewController *)v7 setSharingStyle:v8];
  [(MTShareUtilActivityViewController *)v7 setObjectManipulationDelegate:v7];
  unsigned int v9 = [v6 shareSupported];

  if (v9 && ![v5 count]) {
    [(MTShareUtilActivityViewController *)v7 setSharingStyle:0];
  }
  v12[0] = UIActivityTypePrint;
  v12[1] = UIActivityTypeAssignToContact;
  v12[2] = UIActivityTypeAddToReadingList;
  v12[3] = UIActivityTypePostToFlickr;
  v12[4] = UIActivityTypePostToVimeo;
  v12[5] = UIActivityTypeSaveToCameraRoll;
  v12[6] = UIActivityTypeCreateReminder;
  v10 = +[NSArray arrayWithObjects:v12 count:7];
  [(MTShareUtilActivityViewController *)v7 setExcludedActivityTypes:v10];

  return v7;
}

+ (id)shareActivityItems:(id)a3
{
  id v3 = a3;
  v4 = [[MTTextActivityItemProvider alloc] initWithDataSource:v3];
  id v5 = [[MTEmailActivityItemProvider alloc] initWithDataSource:v3];
  id v6 = [[MTImageActivityItemProvider alloc] initWithDataSource:v3];
  v7 = [[MTURLActivityItemProvider alloc] initWithDataSource:v3];
  uint64_t v8 = [[MTLinkPresentationActivityItemProvider alloc] initWithDataSource:v3];

  id v9 = [objc_alloc((Class)NSArray) initWithObjects:v4, v5, v6, v7, v8, 0];

  return v9;
}

+ (id)shareViewControllerWithPlayerItem:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7
{
  id v11 = a4;
  id v12 = a3;
  v13 = [[MTShareUtilDataSource alloc] initWithPlayerItem:v12 selectedReferenceTime:a5 selectedPlayerTime:a6 currentPlayerTime:a7];

  v14 = +[MTShareUtil shareViewControllerWithDataSource:v13 applicationActivities:v11];

  return v14;
}

+ (id)shareViewControllerWithEpisode:(id)a3 applicationActivities:(id)a4 selectedReferenceTime:(double)a5 selectedPlayerTime:(double)a6 currentPlayerTime:(double)a7
{
  id v11 = a4;
  id v12 = [a3 uuid];
  v13 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:v12];

  v14 = [[MTShareUtilDataSource alloc] initWithPlayerItem:v13 selectedReferenceTime:a5 selectedPlayerTime:a6 currentPlayerTime:a7];
  v15 = +[MTShareUtil shareViewControllerWithDataSource:v14 applicationActivities:v11];

  return v15;
}

+ (id)shareViewControllerWithPodcast:(id)a3 applicationActivities:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MTShareUtilDataSource alloc] initWithPodcast:v6];

  uint64_t v8 = +[MTShareUtil shareViewControllerWithDataSource:v7 applicationActivities:v5];

  return v8;
}

+ (id)shareViewControllerWithPodcastDetails:(id)a3 applicationActivities:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MTShareUtilDataSource alloc] initWithPodcastDetails:v6];

  uint64_t v8 = +[MTShareUtil shareViewControllerWithDataSource:v7 applicationActivities:v5];

  return v8;
}

+ (id)shareActivityItemsWithPlayerItem:(id)a3
{
  id v3 = a3;
  v4 = [MTShareUtilDataSource alloc];
  [v3 playhead];
  id v6 = [(MTShareUtilDataSource *)v4 initWithPlayerItem:v3 selectedReferenceTime:0.0 selectedPlayerTime:0.0 currentPlayerTime:v5];

  v7 = +[MTShareUtil shareActivityItems:v6];

  return v7;
}

+ (id)shareActivityItemsWithPodcast:(id)a3
{
  id v3 = a3;
  v4 = [[MTShareUtilDataSource alloc] initWithPodcast:v3];

  double v5 = +[MTShareUtil shareActivityItems:v4];

  return v5;
}

+ (id)shareActivityItemsWithEpisode:(id)a3
{
  id v3 = a3;
  v4 = [v3 uuid];
  double v5 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:v4];

  id v6 = [MTShareUtilDataSource alloc];
  [v3 playhead];
  float v8 = v7;

  id v9 = [(MTShareUtilDataSource *)v6 initWithPlayerItem:v5 selectedReferenceTime:0.0 selectedPlayerTime:0.0 currentPlayerTime:v8];
  v10 = +[MTShareUtil shareActivityItems:v9];

  return v10;
}

+ (id)shareActivityItemsWithPodcastDetails:(id)a3
{
  id v3 = a3;
  v4 = [[MTShareUtilDataSource alloc] initWithPodcastDetails:v3];

  double v5 = +[MTShareUtil shareActivityItems:v4];

  return v5;
}

@end