@interface NMUMetricsReporter
+ (id)_actionNameFromAlertAction:(unint64_t)a3;
+ (id)_actionNameFromMoreActionType:(unint64_t)a3;
+ (id)_alertReasonFromDownloadWaitingReason:(unint64_t)a3;
+ (id)_alertReasonFromKeepLocalErrorAlertReason:(unint64_t)a3;
+ (id)_contextNameFromMoreActionContextType:(unint64_t)a3;
+ (id)_launcherNameForLaunchURLType:(unint64_t)a3;
+ (id)_processName;
+ (id)_stringForRoutePickingResult:(unint64_t)a3;
+ (id)_stringFromSuggestionsContextType:(unint64_t)a3;
+ (id)_stringFromSuggestionsMediaType:(unint64_t)a3;
+ (id)_viewNameForViewType:(unint64_t)a3;
+ (id)sharedMetricsReporter;
+ (void)incrementAutoPlayChangeCountWithEndpointType:(unint64_t)a3;
+ (void)incrementBrowsingCountForViewType:(unint64_t)a3;
+ (void)incrementBrowsingCountForViewType:(unint64_t)a3 endpointType:(unint64_t)a4;
+ (void)incrementCrownBasedVolumeControlCountWithEndpointType:(unint64_t)a3;
+ (void)incrementLaunchCountForLaunchURLType:(unint64_t)a3;
+ (void)incrementMediaSuggestionsTappedWithEndpointType:(unint64_t)a3 contextType:(unint64_t)a4 mediaType:(unint64_t)a5;
+ (void)incrementPlaybackRoutePickerPresentationCount;
+ (void)incrementPlaybackShuffleAllCountFromViewType:(unint64_t)a3 endpointType:(unint64_t)a4;
+ (void)incrementPlaybackStartCountFromViewType:(unint64_t)a3 endpointType:(unint64_t)a4;
+ (void)incrementPlaybackStartCountFromViewType:(unint64_t)a3 index:(int64_t)a4 endpointType:(unint64_t)a5 playerBundleID:(id)a6;
+ (void)incrementPlaybackStartCountWithPath:(id)a3 shuffled:(BOOL)a4 endpointType:(unint64_t)a5;
+ (void)incrementPlaybackStartCountWithPath:(id)a3 shuffled:(BOOL)a4 endpointType:(unint64_t)a5 endpointPreviousPlayerState:(int64_t)a6;
+ (void)incrementRepeatModeChangeCountWithEndpointType:(unint64_t)a3;
+ (void)incrementRouteAutoSelectionResult:(unint64_t)a3;
+ (void)incrementRouteChangeCountWithEndpointType:(unint64_t)a3;
+ (void)incrementRouteSelectCountWithEndpointType:(unint64_t)a3;
+ (void)incrementRouteSelectionResult:(unint64_t)a3 endpointType:(unint64_t)a4;
+ (void)incrementShuffleModeChangeCountWithEndpointType:(unint64_t)a3;
+ (void)incrementTapCountForDownloadWaitingReason:(unint64_t)a3 action:(unint64_t)a4;
+ (void)incrementTapCountForKeepLocalErrorAlertReason:(unint64_t)a3 action:(unint64_t)a4;
+ (void)incrementTapCountForMoreActionType:(unint64_t)a3 context:(unint64_t)a4;
+ (void)incrementTrackListTrackSelectionCountWithEndpointType:(unint64_t)a3;
+ (void)updatePinnedAlbumsCount:(int64_t)a3;
+ (void)updatePinnedPlaylistsCount:(int64_t)a3;
+ (void)updatePinnedRecommendationsCount:(int64_t)a3;
+ (void)updateTopLevelContainersCount:(int64_t)a3;
- (NMUMetricsReporter)init;
- (void)_sendEvent:(id)a3 payload:(id)a4;
@end

@implementation NMUMetricsReporter

+ (id)sharedMetricsReporter
{
  return 0;
}

+ (id)_processName
{
  if (_processName_onceToken != -1) {
    dispatch_once(&_processName_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_processName_processName;
  return v2;
}

void __34__NMUMetricsReporter__processName__block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v0 = [v2 processName];
  v1 = (void *)_processName_processName;
  _processName_processName = v0;
}

- (NMUMetricsReporter)init
{
  v8.receiver = self;
  v8.super_class = (Class)NMUMetricsReporter;
  id v2 = [(NMUMetricsReporter *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoMediaUI.metrics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (void)incrementLaunchCountForLaunchURLType:(unint64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v4 = [a1 _launcherNameForLaunchURLType:a3];
  v7 = @"launchURLType";
  v8[0] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"LaunchURL" payload:v5];
}

+ (void)updateTopLevelContainersCount:(int64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"nmu_view";
  v7[1] = @"nmu_count";
  v8[0] = @"TopLevelContainers";
  v4 = [NSNumber numberWithInteger:a3];
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"PinningSettings" payload:v5];
}

+ (void)updatePinnedPlaylistsCount:(int64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"nmu_view";
  v7[1] = @"nmu_count";
  v8[0] = @"PinnedPlaylists";
  v4 = [NSNumber numberWithInteger:a3];
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"PinningSettings" payload:v5];
}

+ (void)updatePinnedAlbumsCount:(int64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"nmu_view";
  v7[1] = @"nmu_count";
  v8[0] = @"PinnedAlbums";
  v4 = [NSNumber numberWithInteger:a3];
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"PinningSettings" payload:v5];
}

+ (void)updatePinnedRecommendationsCount:(int64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"nmu_view";
  v7[1] = @"nmu_count";
  v8[0] = @"PinnedRecommendations";
  v4 = [NSNumber numberWithInteger:a3];
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"PinningSettings" payload:v5];
}

+ (void)incrementBrowsingCountForViewType:(unint64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v4 = [a1 _viewNameForViewType:a3];
  v7 = @"view";
  v8[0] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"Browsing" payload:v5];
}

+ (void)incrementPlaybackStartCountWithPath:(id)a3 shuffled:(BOOL)a4 endpointType:(unint64_t)a5
{
  BOOL v6 = a4;
  v19[4] = *MEMORY[0x263EF8340];
  v18[0] = @"view";
  objc_super v8 = (__CFString *)a3;
  v9 = [(__CFString *)v8 componentsSeparatedByString:@"/"];
  uint64_t v10 = [v9 lastObject];
  v11 = (void *)v10;
  v12 = @"unknown";
  if (v10) {
    v13 = (__CFString *)v10;
  }
  else {
    v13 = @"unknown";
  }
  if (v8) {
    v12 = v8;
  }
  v19[0] = v13;
  v19[1] = v12;
  v18[1] = @"path";
  v18[2] = @"origin";
  if (a5 > 5) {
    v14 = 0;
  }
  else {
    v14 = off_264DA3D58[a5];
  }
  v18[3] = @"action";
  v15 = @"Play";
  if (v6) {
    v15 = @"Shuffle";
  }
  v19[2] = v14;
  v19[3] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  v17 = [a1 sharedMetricsReporter];
  [v17 _sendEvent:@"Playback" payload:v16];
}

+ (void)incrementPlaybackStartCountWithPath:(id)a3 shuffled:(BOOL)a4 endpointType:(unint64_t)a5 endpointPreviousPlayerState:(int64_t)a6
{
  BOOL v8 = a4;
  v22[5] = *MEMORY[0x263EF8340];
  v21[0] = @"view";
  uint64_t v10 = (__CFString *)a3;
  v11 = [(__CFString *)v10 componentsSeparatedByString:@"/"];
  uint64_t v12 = [v11 lastObject];
  v13 = (void *)v12;
  v14 = @"unknown";
  if (v12) {
    v15 = (__CFString *)v12;
  }
  else {
    v15 = @"unknown";
  }
  if (v10) {
    v14 = v10;
  }
  v22[0] = v15;
  v22[1] = v14;
  v21[1] = @"path";
  v21[2] = @"origin";
  if (a5 > 5) {
    v16 = 0;
  }
  else {
    v16 = off_264DA3D58[a5];
  }
  v17 = @"Play";
  if (v8) {
    v17 = @"Shuffle";
  }
  v22[2] = v16;
  v22[3] = v17;
  v21[3] = @"action";
  v21[4] = @"originPreviousPlayerState";
  v18 = [NSNumber numberWithInteger:a6];
  v22[4] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];

  v20 = [a1 sharedMetricsReporter];
  [v20 _sendEvent:@"Playback" payload:v19];
}

+ (void)incrementPlaybackStartCountFromViewType:(unint64_t)a3 endpointType:(unint64_t)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _viewNameForViewType:a3];
  v7 = (void *)v6;
  if (a4 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_264DA3D58[a4];
  }
  v11[0] = @"view";
  v11[1] = @"origin";
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = @"action";
  v12[2] = @"Play";
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v10 = [a1 sharedMetricsReporter];
  [v10 _sendEvent:@"Playback" payload:v9];
}

+ (void)incrementPlaybackStartCountFromViewType:(unint64_t)a3 index:(int64_t)a4 endpointType:(unint64_t)a5 playerBundleID:(id)a6
{
  v18[5] = *MEMORY[0x263EF8340];
  id v10 = a6;
  uint64_t v11 = [a1 _viewNameForViewType:a3];
  uint64_t v12 = (void *)v11;
  if (a5 > 5) {
    v13 = 0;
  }
  else {
    v13 = off_264DA3D58[a5];
  }
  v17[0] = @"view";
  v17[1] = @"origin";
  v18[0] = v11;
  v18[1] = v13;
  v18[2] = @"PlayItem";
  v17[2] = @"action";
  v17[3] = @"index";
  v14 = [NSNumber numberWithInteger:a4];
  v17[4] = @"bundle";
  v18[3] = v14;
  void v18[4] = v10;
  v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  v16 = [a1 sharedMetricsReporter];
  [v16 _sendEvent:@"Playback" payload:v15];
}

+ (void)incrementPlaybackShuffleAllCountFromViewType:(unint64_t)a3 endpointType:(unint64_t)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _viewNameForViewType:a3];
  v7 = (void *)v6;
  if (a4 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_264DA3D58[a4];
  }
  v11[0] = @"view";
  v11[1] = @"origin";
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = @"action";
  v12[2] = @"Shuffle";
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v10 = [a1 sharedMetricsReporter];
  [v10 _sendEvent:@"Playback" payload:v9];
}

+ (void)incrementPlaybackRoutePickerPresentationCount
{
  id v2 = [a1 sharedMetricsReporter];
  [v2 _sendEvent:@"Playback" payload:&unk_26ECD8968];
}

+ (void)incrementCrownBasedVolumeControlCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"Crown";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"VolumeControl" payload:v5];
}

+ (void)incrementRouteSelectCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"RouteSelect";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"RoutePicking" payload:v5];
}

+ (void)incrementRouteChangeCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"RouteChange";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"RoutePicking" payload:v5];
}

+ (void)incrementRouteSelectionResult:(unint64_t)a3 endpointType:(unint64_t)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _stringForRoutePickingResult:a3];
  v7 = (void *)v6;
  if (a4 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_264DA3D58[a4];
  }
  v11[0] = @"action";
  v11[1] = @"result";
  v12[0] = @"Result";
  v12[1] = v6;
  v11[2] = @"origin";
  v12[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v10 = [a1 sharedMetricsReporter];
  [v10 _sendEvent:@"RoutePicking" payload:v9];
}

+ (void)incrementRouteAutoSelectionResult:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  v4 = [a1 _stringForRoutePickingResult:a3];
  v7[0] = @"action";
  v7[1] = @"result";
  v8[0] = @"W1RouteAutoSelect";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"RoutePicking" payload:v5];
}

+ (void)incrementShuffleModeChangeCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"ChangeShuffleMode";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"TrackList" payload:v5];
}

+ (void)incrementRepeatModeChangeCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"ChangeRepeatMode";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"TrackList" payload:v5];
}

+ (void)incrementAutoPlayChangeCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"ChangeQueueEndAction";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"TrackList" payload:v5];
}

+ (void)incrementTrackListTrackSelectionCountWithEndpointType:(unint64_t)a3
{
  void v8[2] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264DA3D58[a3];
  }
  v7[0] = @"action";
  v7[1] = @"origin";
  v8[0] = @"SelectTrack";
  v8[1] = v4;
  dispatch_queue_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v6 = [a1 sharedMetricsReporter];
  [v6 _sendEvent:@"TrackList" payload:v5];
}

+ (void)incrementTapCountForMoreActionType:(unint64_t)a3 context:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _actionNameFromMoreActionType:a3];
  v7 = [a1 _contextNameFromMoreActionContextType:a4];
  v10[0] = @"action";
  v10[1] = @"context";
  v11[0] = v6;
  v11[1] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v9 = [a1 sharedMetricsReporter];
  [v9 _sendEvent:@"MoreMenu" payload:v8];
}

+ (void)incrementMediaSuggestionsTappedWithEndpointType:(unint64_t)a3 contextType:(unint64_t)a4 mediaType:(unint64_t)a5
{
  v13[4] = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    v7 = 0;
  }
  else {
    v7 = off_264DA3D58[a3];
  }
  BOOL v8 = [a1 _stringFromSuggestionsContextType:a4];
  v9 = [a1 _stringFromSuggestionsMediaType:a5];
  v12[0] = @"view";
  v12[1] = @"endpoint";
  v13[0] = @"MediaSuggestions_SuggestionTapped";
  v13[1] = v7;
  v12[2] = @"context";
  v12[3] = @"media_type";
  v13[2] = v8;
  v13[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v11 = [a1 sharedMetricsReporter];
  [v11 _sendEvent:@"SuggestionTapped" payload:v10];
}

+ (void)incrementBrowsingCountForViewType:(unint64_t)a3 endpointType:(unint64_t)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _viewNameForViewType:a3];
  v7 = (void *)v6;
  if (a4 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_264DA3D58[a4];
  }
  v11[0] = @"view";
  v11[1] = @"origin";
  v12[0] = v6;
  v12[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v10 = [a1 sharedMetricsReporter];
  [v10 _sendEvent:@"Browsing" payload:v9];
}

+ (void)incrementTapCountForKeepLocalErrorAlertReason:(unint64_t)a3 action:(unint64_t)a4
{
  void v11[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _alertReasonFromKeepLocalErrorAlertReason:a3];
  v7 = [a1 _actionNameFromAlertAction:a4];
  v10[0] = @"action";
  v10[1] = @"reason";
  v11[0] = v7;
  v11[1] = v6;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v9 = [a1 sharedMetricsReporter];
  [v9 _sendEvent:@"KeepLocalErrorAlert" payload:v8];
}

+ (void)incrementTapCountForDownloadWaitingReason:(unint64_t)a3 action:(unint64_t)a4
{
  void v11[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 _alertReasonFromDownloadWaitingReason:a3];
  v7 = [a1 _actionNameFromAlertAction:a4];
  v10[0] = @"action";
  v10[1] = @"reason";
  v11[0] = v7;
  v11[1] = v6;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v9 = [a1 sharedMetricsReporter];
  [v9 _sendEvent:@"DownloadWaitingAlert" payload:v8];
}

- (void)_sendEvent:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __41__NMUMetricsReporter__sendEvent_payload___block_invoke;
  void v11[3] = &unk_264DA3A88;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void __41__NMUMetricsReporter__sendEvent_payload___block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithFormat:@"%@.%@", @"com.apple.NanoMediaUI", *(void *)(a1 + 32)];
  id v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __41__NMUMetricsReporter__sendEvent_payload___block_invoke_2(uint64_t a1)
{
  v1 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)(a1 + 32)];
  id v2 = +[NMUMetricsReporter _processName];
  [v1 setObject:v2 forKey:@"processName"];

  return v1;
}

+ (id)_launcherNameForLaunchURLType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_264DA3D88[a3];
  }
}

+ (id)_viewNameForViewType:(unint64_t)a3
{
  if (a3 > 0x2A) {
    return @"Unknown";
  }
  else {
    return off_264DA3DA8[a3];
  }
}

+ (id)_actionNameFromMoreActionType:(unint64_t)a3
{
  if (a3 > 0x12) {
    return @"Unknown";
  }
  else {
    return off_264DA3F00[a3];
  }
}

+ (id)_actionNameFromAlertAction:(unint64_t)a3
{
  if (a3 > 6) {
    return @"Unknown";
  }
  else {
    return off_264DA3F98[a3];
  }
}

+ (id)_alertReasonFromKeepLocalErrorAlertReason:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Unknown";
  }
  else {
    return off_264DA3FD0[a3];
  }
}

+ (id)_alertReasonFromDownloadWaitingReason:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_264DA4010[a3];
  }
}

+ (id)_stringForRoutePickingResult:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_264DA4068[a3];
  }
}

+ (id)_contextNameFromMoreActionContextType:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_264DA4080[a3];
  }
}

+ (id)_stringFromSuggestionsContextType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unspecified";
  }
  else {
    return off_264DA40B0[a3 - 1];
  }
}

+ (id)_stringFromSuggestionsMediaType:(unint64_t)a3
{
  id v3 = @"Unspecified";
  if (a3 == 1) {
    id v3 = @"Music";
  }
  if (a3 == 2) {
    return @"Podcast";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
}

@end