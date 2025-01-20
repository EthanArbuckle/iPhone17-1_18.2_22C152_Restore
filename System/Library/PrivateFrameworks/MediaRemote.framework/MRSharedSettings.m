@interface MRSharedSettings
+ (MRSharedSettings)currentSettings;
- (BOOL)allowSingleRoomExpandedRows;
- (BOOL)canHostMultiplayerStream;
- (BOOL)isMultiplayerAware;
- (BOOL)isMultiplayerHost;
- (BOOL)showMembersInsteadOfRooms;
- (BOOL)supportAirPlayLeaderInfoSync;
- (BOOL)supportGroupSession;
- (BOOL)supportGroupSessionHome;
- (BOOL)supportGroupSessionHomePodBoop;
- (BOOL)supportLockScreenBackground;
- (BOOL)supportManyRecommendationsPlatters;
- (BOOL)supportNanoStandalone;
- (BOOL)supportNowPlayingSessionDataSource;
- (BOOL)supportPTOTRefactorPart2;
- (BOOL)supportSessionBasedLockScreenPlatter;
- (BOOL)supportSessionBasedUI;
- (BOOL)supportShowMore;
- (BOOL)suppressScreenMirroringErrors;
- (BOOL)verboseImageLoadingLogging;
- (BOOL)verboseMediaControlLogging;
- (double)autoRouteInactiveTimeout;
- (double)lockScreenAPLRatio;
- (double)lockScreenAPLTarget;
- (double)oneTapSuggestionInactiveTimeout;
- (double)quickControlsInactiveTimeout;
@end

@implementation MRSharedSettings

+ (MRSharedSettings)currentSettings
{
  if (currentSettings___once_0 != -1) {
    dispatch_once(&currentSettings___once_0, &__block_literal_global_72);
  }
  v2 = (void *)currentSettings___currentSharedSettings;

  return (MRSharedSettings *)v2;
}

- (BOOL)isMultiplayerHost
{
  int IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
  {
    LOBYTE(IsAudioAccessory) = _os_feature_enabled_impl();
  }
  return IsAudioAccessory;
}

- (BOOL)canHostMultiplayerStream
{
  if (![(MRSharedSettings *)self isMultiplayerHost]) {
    return 0;
  }
  v2 = +[MRAVClusterController sharedController];
  BOOL v3 = [v2 clusterType] != 2;

  return v3;
}

- (BOOL)supportNanoStandalone
{
  return 0;
}

uint64_t __35__MRSharedSettings_currentSettings__block_invoke()
{
  currentSettings___currentSharedSettings = objc_alloc_init(MRSharedSettings);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportGroupSession
{
  return _os_feature_enabled_impl();
}

- (BOOL)isMultiplayerAware
{
  return 1;
}

- (BOOL)supportShowMore
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNowPlayingSessionDataSource
{
  int IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
  {
    LOBYTE(IsAudioAccessory) = _os_feature_enabled_impl();
  }
  return IsAudioAccessory;
}

- (BOOL)supportSessionBasedUI
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = MRSupportsSystemUIActivities();
  }
  return v2;
}

- (BOOL)supportSessionBasedLockScreenPlatter
{
  int v2 = [(MRSharedSettings *)self supportSessionBasedUI];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)supportLockScreenBackground
{
  int v2 = [(MRSharedSettings *)self supportSessionBasedLockScreenPlatter];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)allowSingleRoomExpandedRows
{
  return _os_feature_enabled_impl();
}

- (BOOL)showMembersInsteadOfRooms
{
  return _os_feature_enabled_impl();
}

- (double)quickControlsInactiveTimeout
{
  int v2 = +[MRUserSettings currentSettings];
  [v2 quickControlsInactiveTimeout];
  double v4 = v3;

  return v4;
}

- (double)lockScreenAPLTarget
{
  int v2 = +[MRUserSettings currentSettings];
  [v2 lockScreenAPLTarget];
  double v4 = v3;

  return v4;
}

- (double)lockScreenAPLRatio
{
  int v2 = +[MRUserSettings currentSettings];
  [v2 lockScreenAPLRatio];
  double v4 = v3;

  return v4;
}

- (BOOL)supportGroupSessionHome
{
  int v2 = _os_feature_enabled_impl();
  if (MSVDeviceIsAudioAccessory()) {
    return v2 & _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)supportGroupSessionHomePodBoop
{
  int v2 = [(MRSharedSettings *)self supportGroupSessionHome];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)supportAirPlayLeaderInfoSync
{
  if ([(MRSharedSettings *)self supportGroupSessionHomePodBoop]) {
    return 1;
  }
  double v3 = +[MRUserSettings currentSettings];
  if ([v3 supportMRRelay])
  {
    char v2 = 1;
  }
  else
  {
    double v4 = +[MRUserSettings currentSettings];
    if ([v4 supportRoutingContinuity])
    {
      char v2 = 1;
    }
    else
    {
      v5 = +[MRUserSettings currentSettings];
      char v2 = [v5 supportTopologyHealing];
    }
  }

  return v2;
}

- (double)oneTapSuggestionInactiveTimeout
{
  char v2 = +[MRUserSettings currentSettings];
  [v2 oneTapSuggestionInactiveTimeout];
  double v4 = v3;

  return v4;
}

- (double)autoRouteInactiveTimeout
{
  char v2 = +[MRUserSettings currentSettings];
  [v2 autoRouteInactiveTimeout];
  double v4 = v3;

  return v4;
}

- (BOOL)supportManyRecommendationsPlatters
{
  char v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 supportManyRecommendationsPlatters];

  return v3;
}

- (BOOL)suppressScreenMirroringErrors
{
  char v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 suppressScreenMirroringErrors];

  return v3;
}

- (BOOL)verboseImageLoadingLogging
{
  char v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 verboseImageLoadingLogging];

  return v3;
}

- (BOOL)verboseMediaControlLogging
{
  char v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 verboseMediaControlLogging];

  return v3;
}

- (BOOL)supportPTOTRefactorPart2
{
  char v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 supportPTOTRefactorPart2];

  return v3;
}

@end