@interface VUIAppDocumentUpdateEventDescriptor
+ (id)accountChanged;
+ (id)appDidBecomeActive;
+ (id)appRefresh;
+ (id)brandVisibilityChanged;
+ (id)clearPlayHistory;
+ (id)deviceDiscoveryDataAvailable;
+ (id)entitlements;
+ (id)favorites;
+ (id)favoritesInBackground;
+ (id)favoritesSyncCompleted;
+ (id)federatedAppDidInstall;
+ (id)groupRecoCollectionVisiblityChanged;
+ (id)groupRecoUsersChanged;
+ (id)highlightsChanged;
+ (id)locationAuthorizationChanged;
+ (id)locationRetrieved;
+ (id)pinnedTabsChanged;
+ (id)playActivity;
+ (id)playHistoryUpdated;
+ (id)postPlay;
+ (id)preferredPlaybackDimensionalityChanged;
+ (id)preferredVideoFormat;
+ (id)purchases;
+ (id)removeFromPlayHistory;
+ (id)restrictions;
+ (id)settings;
+ (id)upNext;
+ (id)upNextLockupArtSettingChanged;
+ (id)utsk;
- (BOOL)animated;
- (BOOL)isEqual:(id)a3;
- (VUIAppDocumentUpdateEventDescriptor)init;
- (VUIAppDocumentUpdateEventDescriptor)initWithEventType:(unint64_t)a3;
- (id)description;
- (unint64_t)type;
- (void)setAnimated:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VUIAppDocumentUpdateEventDescriptor

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

+ (id)accountChanged
{
  if (accountChanged___onceToken != -1) {
    dispatch_once(&accountChanged___onceToken, &__block_literal_global_16);
  }
  v2 = (void *)accountChanged___eventDescriptor;
  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (VUIAppDocumentUpdateEventDescriptor)initWithEventType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAppDocumentUpdateEventDescriptor;
  result = [(VUIAppDocumentUpdateEventDescriptor *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentUpdateEventDescriptor;
  v4 = [(VUIAppDocumentUpdateEventDescriptor *)&v12 description];
  [v3 addObject:v4];

  objc_super v5 = NSString;
  v6 = VUIAppDocumentUpdateEventStringRepresentationFromEventType([(VUIAppDocumentUpdateEventDescriptor *)self type]);
  v7 = [v5 stringWithFormat:@"%@=%@", @"type", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [v3 componentsJoinedByString:@", "];
  v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

void __53__VUIAppDocumentUpdateEventDescriptor_accountChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:11];
  v1 = (void *)accountChanged___eventDescriptor;
  accountChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)purchases
{
  if (purchases___onceToken != -1) {
    dispatch_once(&purchases___onceToken, &__block_literal_global_21);
  }
  v2 = (void *)purchases___eventDescriptor;
  return v2;
}

void __48__VUIAppDocumentUpdateEventDescriptor_purchases__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:3];
  v1 = (void *)purchases___eventDescriptor;
  purchases___eventDescriptor = (uint64_t)v0;
}

+ (id)playActivity
{
  if (playActivity___onceToken != -1) {
    dispatch_once(&playActivity___onceToken, &__block_literal_global_2);
  }
  v2 = (void *)playActivity___eventDescriptor;
  return v2;
}

void __51__VUIAppDocumentUpdateEventDescriptor_playActivity__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:5];
  v1 = (void *)playActivity___eventDescriptor;
  playActivity___eventDescriptor = (uint64_t)v0;
}

+ (id)settings
{
  if (settings___onceToken != -1) {
    dispatch_once(&settings___onceToken, &__block_literal_global_4);
  }
  v2 = (void *)settings___eventDescriptor;
  return v2;
}

void __47__VUIAppDocumentUpdateEventDescriptor_settings__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:6];
  v1 = (void *)settings___eventDescriptor;
  settings___eventDescriptor = (uint64_t)v0;
}

+ (id)upNext
{
  if (upNext___onceToken != -1) {
    dispatch_once(&upNext___onceToken, &__block_literal_global_6);
  }
  v2 = (void *)upNext___eventDescriptor;
  return v2;
}

void __45__VUIAppDocumentUpdateEventDescriptor_upNext__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:7];
  v1 = (void *)upNext___eventDescriptor;
  upNext___eventDescriptor = (uint64_t)v0;
}

+ (id)upNextLockupArtSettingChanged
{
  if (upNextLockupArtSettingChanged___onceToken != -1) {
    dispatch_once(&upNextLockupArtSettingChanged___onceToken, &__block_literal_global_8_0);
  }
  v2 = (void *)upNextLockupArtSettingChanged___eventDescriptor;
  return v2;
}

void __68__VUIAppDocumentUpdateEventDescriptor_upNextLockupArtSettingChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:8];
  v1 = (void *)upNextLockupArtSettingChanged___eventDescriptor;
  upNextLockupArtSettingChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)preferredPlaybackDimensionalityChanged
{
  if (preferredPlaybackDimensionalityChanged___onceToken != -1) {
    dispatch_once(&preferredPlaybackDimensionalityChanged___onceToken, &__block_literal_global_10);
  }
  v2 = (void *)preferredPlaybackDimensionalityChanged___eventDescriptor;
  return v2;
}

void __77__VUIAppDocumentUpdateEventDescriptor_preferredPlaybackDimensionalityChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:29];
  v1 = (void *)preferredPlaybackDimensionalityChanged___eventDescriptor;
  preferredPlaybackDimensionalityChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)favorites
{
  if (favorites___onceToken != -1) {
    dispatch_once(&favorites___onceToken, &__block_literal_global_12_0);
  }
  v2 = (void *)favorites___eventDescriptor;
  return v2;
}

void __48__VUIAppDocumentUpdateEventDescriptor_favorites__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:9];
  v1 = (void *)favorites___eventDescriptor;
  favorites___eventDescriptor = (uint64_t)v0;
}

+ (id)favoritesInBackground
{
  if (favoritesInBackground___onceToken != -1) {
    dispatch_once(&favoritesInBackground___onceToken, &__block_literal_global_14);
  }
  v2 = (void *)favoritesInBackground___eventDescriptor;
  return v2;
}

void __60__VUIAppDocumentUpdateEventDescriptor_favoritesInBackground__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:10];
  v1 = (void *)favoritesInBackground___eventDescriptor;
  favoritesInBackground___eventDescriptor = (uint64_t)v0;
}

+ (id)removeFromPlayHistory
{
  if (removeFromPlayHistory___onceToken != -1) {
    dispatch_once(&removeFromPlayHistory___onceToken, &__block_literal_global_18);
  }
  v2 = (void *)removeFromPlayHistory___eventDescriptor;
  return v2;
}

void __60__VUIAppDocumentUpdateEventDescriptor_removeFromPlayHistory__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:12];
  v1 = (void *)removeFromPlayHistory___eventDescriptor;
  removeFromPlayHistory___eventDescriptor = (uint64_t)v0;
}

+ (id)entitlements
{
  if (entitlements___onceToken != -1) {
    dispatch_once(&entitlements___onceToken, &__block_literal_global_20);
  }
  v2 = (void *)entitlements___eventDescriptor;
  return v2;
}

void __51__VUIAppDocumentUpdateEventDescriptor_entitlements__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:13];
  v1 = (void *)entitlements___eventDescriptor;
  entitlements___eventDescriptor = (uint64_t)v0;
}

+ (id)utsk
{
  if (utsk___onceToken != -1) {
    dispatch_once(&utsk___onceToken, &__block_literal_global_22);
  }
  v2 = (void *)utsk___eventDescriptor;
  return v2;
}

void __43__VUIAppDocumentUpdateEventDescriptor_utsk__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:14];
  v1 = (void *)utsk___eventDescriptor;
  utsk___eventDescriptor = (uint64_t)v0;
}

+ (id)restrictions
{
  if (restrictions___onceToken != -1) {
    dispatch_once(&restrictions___onceToken, &__block_literal_global_24);
  }
  v2 = (void *)restrictions___eventDescriptor;
  return v2;
}

void __51__VUIAppDocumentUpdateEventDescriptor_restrictions__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:15];
  v1 = (void *)restrictions___eventDescriptor;
  restrictions___eventDescriptor = (uint64_t)v0;
}

+ (id)preferredVideoFormat
{
  if (preferredVideoFormat___onceToken != -1) {
    dispatch_once(&preferredVideoFormat___onceToken, &__block_literal_global_26);
  }
  v2 = (void *)preferredVideoFormat___eventDescriptor;
  return v2;
}

void __59__VUIAppDocumentUpdateEventDescriptor_preferredVideoFormat__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:16];
  v1 = (void *)preferredVideoFormat___eventDescriptor;
  preferredVideoFormat___eventDescriptor = (uint64_t)v0;
}

+ (id)postPlay
{
  if (postPlay___onceToken != -1) {
    dispatch_once(&postPlay___onceToken, &__block_literal_global_28);
  }
  v2 = (void *)postPlay___eventDescriptor;
  return v2;
}

void __47__VUIAppDocumentUpdateEventDescriptor_postPlay__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:17];
  v1 = (void *)postPlay___eventDescriptor;
  postPlay___eventDescriptor = (uint64_t)v0;
}

+ (id)appDidBecomeActive
{
  if (appDidBecomeActive___onceToken != -1) {
    dispatch_once(&appDidBecomeActive___onceToken, &__block_literal_global_30_0);
  }
  v2 = (void *)appDidBecomeActive___eventDescriptor;
  return v2;
}

void __57__VUIAppDocumentUpdateEventDescriptor_appDidBecomeActive__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:18];
  v1 = (void *)appDidBecomeActive___eventDescriptor;
  appDidBecomeActive___eventDescriptor = (uint64_t)v0;
}

+ (id)playHistoryUpdated
{
  if (playHistoryUpdated___onceToken != -1) {
    dispatch_once(&playHistoryUpdated___onceToken, &__block_literal_global_32);
  }
  v2 = (void *)playHistoryUpdated___eventDescriptor;
  return v2;
}

void __57__VUIAppDocumentUpdateEventDescriptor_playHistoryUpdated__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:19];
  v1 = (void *)playHistoryUpdated___eventDescriptor;
  playHistoryUpdated___eventDescriptor = (uint64_t)v0;
}

+ (id)clearPlayHistory
{
  if (clearPlayHistory___onceToken != -1) {
    dispatch_once(&clearPlayHistory___onceToken, &__block_literal_global_34);
  }
  v2 = (void *)clearPlayHistory___eventDescriptor;
  return v2;
}

void __55__VUIAppDocumentUpdateEventDescriptor_clearPlayHistory__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:20];
  v1 = (void *)clearPlayHistory___eventDescriptor;
  clearPlayHistory___eventDescriptor = (uint64_t)v0;
}

+ (id)appRefresh
{
  if (appRefresh___onceToken != -1) {
    dispatch_once(&appRefresh___onceToken, &__block_literal_global_36);
  }
  v2 = (void *)appRefresh___eventDescriptor;
  return v2;
}

void __49__VUIAppDocumentUpdateEventDescriptor_appRefresh__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:21];
  v1 = (void *)appRefresh___eventDescriptor;
  appRefresh___eventDescriptor = (uint64_t)v0;
}

+ (id)locationAuthorizationChanged
{
  if (locationAuthorizationChanged___onceToken != -1) {
    dispatch_once(&locationAuthorizationChanged___onceToken, &__block_literal_global_38);
  }
  v2 = (void *)locationAuthorizationChanged___eventDescriptor;
  return v2;
}

void __67__VUIAppDocumentUpdateEventDescriptor_locationAuthorizationChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:22];
  v1 = (void *)locationAuthorizationChanged___eventDescriptor;
  locationAuthorizationChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)locationRetrieved
{
  if (locationRetrieved___onceToken != -1) {
    dispatch_once(&locationRetrieved___onceToken, &__block_literal_global_40);
  }
  v2 = (void *)locationRetrieved___eventDescriptor;
  return v2;
}

void __56__VUIAppDocumentUpdateEventDescriptor_locationRetrieved__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:23];
  v1 = (void *)locationRetrieved___eventDescriptor;
  locationRetrieved___eventDescriptor = (uint64_t)v0;
}

+ (id)highlightsChanged
{
  if (highlightsChanged___onceToken != -1) {
    dispatch_once(&highlightsChanged___onceToken, &__block_literal_global_42);
  }
  v2 = (void *)highlightsChanged___eventDescriptor;
  return v2;
}

void __56__VUIAppDocumentUpdateEventDescriptor_highlightsChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:24];
  v1 = (void *)highlightsChanged___eventDescriptor;
  highlightsChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)groupRecoCollectionVisiblityChanged
{
  if (groupRecoCollectionVisiblityChanged___onceToken != -1) {
    dispatch_once(&groupRecoCollectionVisiblityChanged___onceToken, &__block_literal_global_44);
  }
  v2 = (void *)groupRecoCollectionVisiblityChanged___eventDescriptor;
  return v2;
}

void __74__VUIAppDocumentUpdateEventDescriptor_groupRecoCollectionVisiblityChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:25];
  v1 = (void *)groupRecoCollectionVisiblityChanged___eventDescriptor;
  groupRecoCollectionVisiblityChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)groupRecoUsersChanged
{
  if (groupRecoUsersChanged___onceToken != -1) {
    dispatch_once(&groupRecoUsersChanged___onceToken, &__block_literal_global_46);
  }
  v2 = (void *)groupRecoUsersChanged___eventDescriptor;
  return v2;
}

void __60__VUIAppDocumentUpdateEventDescriptor_groupRecoUsersChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:26];
  v1 = (void *)groupRecoUsersChanged___eventDescriptor;
  groupRecoUsersChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)deviceDiscoveryDataAvailable
{
  if (deviceDiscoveryDataAvailable___onceToken != -1) {
    dispatch_once(&deviceDiscoveryDataAvailable___onceToken, &__block_literal_global_48);
  }
  v2 = (void *)deviceDiscoveryDataAvailable___eventDescriptor;
  return v2;
}

void __67__VUIAppDocumentUpdateEventDescriptor_deviceDiscoveryDataAvailable__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:27];
  v1 = (void *)deviceDiscoveryDataAvailable___eventDescriptor;
  deviceDiscoveryDataAvailable___eventDescriptor = (uint64_t)v0;
}

+ (id)favoritesSyncCompleted
{
  if (favoritesSyncCompleted___onceToken != -1) {
    dispatch_once(&favoritesSyncCompleted___onceToken, &__block_literal_global_50);
  }
  v2 = (void *)favoritesSyncCompleted___eventDescriptor;
  return v2;
}

void __61__VUIAppDocumentUpdateEventDescriptor_favoritesSyncCompleted__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:28];
  v1 = (void *)favoritesSyncCompleted___eventDescriptor;
  favoritesSyncCompleted___eventDescriptor = (uint64_t)v0;
}

+ (id)brandVisibilityChanged
{
  if (brandVisibilityChanged___onceToken != -1) {
    dispatch_once(&brandVisibilityChanged___onceToken, &__block_literal_global_52);
  }
  v2 = (void *)brandVisibilityChanged___eventDescriptor;
  return v2;
}

void __61__VUIAppDocumentUpdateEventDescriptor_brandVisibilityChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:30];
  v1 = (void *)brandVisibilityChanged___eventDescriptor;
  brandVisibilityChanged___eventDescriptor = (uint64_t)v0;
}

+ (id)federatedAppDidInstall
{
  if (federatedAppDidInstall___onceToken != -1) {
    dispatch_once(&federatedAppDidInstall___onceToken, &__block_literal_global_54);
  }
  v2 = (void *)federatedAppDidInstall___eventDescriptor;
  return v2;
}

void __61__VUIAppDocumentUpdateEventDescriptor_federatedAppDidInstall__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:31];
  v1 = (void *)federatedAppDidInstall___eventDescriptor;
  federatedAppDidInstall___eventDescriptor = (uint64_t)v0;
}

+ (id)pinnedTabsChanged
{
  if (pinnedTabsChanged___onceToken != -1) {
    dispatch_once(&pinnedTabsChanged___onceToken, &__block_literal_global_56);
  }
  v2 = (void *)pinnedTabsChanged___eventDescriptor;
  return v2;
}

void __56__VUIAppDocumentUpdateEventDescriptor_pinnedTabsChanged__block_invoke()
{
  v0 = [[VUIAppDocumentUpdateEventDescriptor alloc] initWithEventType:32];
  v1 = (void *)pinnedTabsChanged___eventDescriptor;
  pinnedTabsChanged___eventDescriptor = (uint64_t)v0;
}

- (VUIAppDocumentUpdateEventDescriptor)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  objc_super v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIAppDocumentUpdateEventDescriptor *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t v7 = [(VUIAppDocumentUpdateEventDescriptor *)self type];
    uint64_t v8 = [(VUIAppDocumentUpdateEventDescriptor *)v6 type];

    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

@end