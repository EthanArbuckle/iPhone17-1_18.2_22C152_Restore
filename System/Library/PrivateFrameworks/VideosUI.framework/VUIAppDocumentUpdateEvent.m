@interface VUIAppDocumentUpdateEvent
+ (id)accountChanged;
+ (id)appDidBecomeActive;
+ (id)appRefresh;
+ (id)brandVisibilityChanged;
+ (id)clearPlayHistory;
+ (id)deviceDiscoveryDataAvailable;
+ (id)entitlements;
+ (id)favorites;
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
+ (id)preferredVideoFormat;
+ (id)purchases;
+ (id)removeFromPlayHistory;
+ (id)restrictions;
+ (id)settings;
+ (id)upNextLockupArtSettingChanged;
+ (id)utsk;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRefreshEvent;
- (NSDictionary)dictionaryRepresentation;
- (VUIAppDocumentUpdateEvent)init;
- (VUIAppDocumentUpdateEvent)initWithDescriptor:(id)a3;
- (VUIAppDocumentUpdateEventDescriptor)descriptor;
- (id)coalescedEvent:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setDescriptor:(id)a3;
@end

@implementation VUIAppDocumentUpdateEvent

+ (id)purchases
{
  if (purchases___onceToken_0 != -1) {
    dispatch_once(&purchases___onceToken_0, &__block_literal_global_163);
  }
  v2 = (void *)purchases___event;
  return v2;
}

void __38__VUIAppDocumentUpdateEvent_purchases__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor purchases];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)purchases___event;
  purchases___event = v1;
}

+ (id)playActivity
{
  if (playActivity___onceToken_0 != -1) {
    dispatch_once(&playActivity___onceToken_0, &__block_literal_global_4_3);
  }
  v2 = (void *)playActivity___event;
  return v2;
}

void __41__VUIAppDocumentUpdateEvent_playActivity__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor playActivity];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)playActivity___event;
  playActivity___event = v1;
}

+ (id)settings
{
  if (settings___onceToken_0 != -1) {
    dispatch_once(&settings___onceToken_0, &__block_literal_global_6_2);
  }
  v2 = (void *)settings___event;
  return v2;
}

void __37__VUIAppDocumentUpdateEvent_settings__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor settings];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)settings___event;
  settings___event = v1;
}

+ (id)favorites
{
  if (favorites___onceToken_0 != -1) {
    dispatch_once(&favorites___onceToken_0, &__block_literal_global_8_3);
  }
  v2 = (void *)favorites___event;
  return v2;
}

void __38__VUIAppDocumentUpdateEvent_favorites__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor favorites];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)favorites___event;
  favorites___event = v1;
}

+ (id)accountChanged
{
  if (accountChanged___onceToken_0 != -1) {
    dispatch_once(&accountChanged___onceToken_0, &__block_literal_global_10_1);
  }
  v2 = (void *)accountChanged___event;
  return v2;
}

void __43__VUIAppDocumentUpdateEvent_accountChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor accountChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)accountChanged___event;
  accountChanged___event = v1;
}

+ (id)removeFromPlayHistory
{
  if (removeFromPlayHistory___onceToken_0 != -1) {
    dispatch_once(&removeFromPlayHistory___onceToken_0, &__block_literal_global_12_3);
  }
  v2 = (void *)removeFromPlayHistory___event;
  return v2;
}

void __50__VUIAppDocumentUpdateEvent_removeFromPlayHistory__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)removeFromPlayHistory___event;
  removeFromPlayHistory___event = v1;
}

+ (id)entitlements
{
  if (entitlements___onceToken_0 != -1) {
    dispatch_once(&entitlements___onceToken_0, &__block_literal_global_14_0);
  }
  v2 = (void *)entitlements___event;
  return v2;
}

void __41__VUIAppDocumentUpdateEvent_entitlements__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor entitlements];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)entitlements___event;
  entitlements___event = v1;
}

+ (id)restrictions
{
  if (restrictions___onceToken_0 != -1) {
    dispatch_once(&restrictions___onceToken_0, &__block_literal_global_16_2);
  }
  v2 = (void *)restrictions___event;
  return v2;
}

void __41__VUIAppDocumentUpdateEvent_restrictions__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor restrictions];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)restrictions___event;
  restrictions___event = v1;
}

+ (id)utsk
{
  if (utsk___onceToken_0 != -1) {
    dispatch_once(&utsk___onceToken_0, &__block_literal_global_18_1);
  }
  v2 = (void *)utsk___event;
  return v2;
}

void __33__VUIAppDocumentUpdateEvent_utsk__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor utsk];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)utsk___event;
  utsk___event = v1;
}

+ (id)preferredVideoFormat
{
  if (preferredVideoFormat___onceToken_0 != -1) {
    dispatch_once(&preferredVideoFormat___onceToken_0, &__block_literal_global_20_2);
  }
  v2 = (void *)preferredVideoFormat___event;
  return v2;
}

void __49__VUIAppDocumentUpdateEvent_preferredVideoFormat__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor preferredVideoFormat];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)preferredVideoFormat___event;
  preferredVideoFormat___event = v1;
}

+ (id)appDidBecomeActive
{
  if (appDidBecomeActive___onceToken_0 != -1) {
    dispatch_once(&appDidBecomeActive___onceToken_0, &__block_literal_global_22_0);
  }
  v2 = (void *)appDidBecomeActive___event;
  return v2;
}

void __47__VUIAppDocumentUpdateEvent_appDidBecomeActive__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)appDidBecomeActive___event;
  appDidBecomeActive___event = v1;
}

+ (id)playHistoryUpdated
{
  if (playHistoryUpdated___onceToken_0 != -1) {
    dispatch_once(&playHistoryUpdated___onceToken_0, &__block_literal_global_24_2);
  }
  v2 = (void *)playHistoryUpdated___event;
  return v2;
}

void __47__VUIAppDocumentUpdateEvent_playHistoryUpdated__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor playHistoryUpdated];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)playHistoryUpdated___event;
  playHistoryUpdated___event = v1;
}

+ (id)clearPlayHistory
{
  if (clearPlayHistory___onceToken_0 != -1) {
    dispatch_once(&clearPlayHistory___onceToken_0, &__block_literal_global_26_1);
  }
  v2 = (void *)clearPlayHistory___event;
  return v2;
}

void __45__VUIAppDocumentUpdateEvent_clearPlayHistory__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor clearPlayHistory];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)clearPlayHistory___event;
  clearPlayHistory___event = v1;
}

+ (id)appRefresh
{
  if (appRefresh___onceToken_0 != -1) {
    dispatch_once(&appRefresh___onceToken_0, &__block_literal_global_28_1);
  }
  v2 = (void *)appRefresh___event;
  return v2;
}

void __39__VUIAppDocumentUpdateEvent_appRefresh__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor appRefresh];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)appRefresh___event;
  appRefresh___event = v1;
}

+ (id)locationAuthorizationChanged
{
  if (locationAuthorizationChanged___onceToken_0 != -1) {
    dispatch_once(&locationAuthorizationChanged___onceToken_0, &__block_literal_global_30_1);
  }
  v2 = (void *)locationAuthorizationChanged___event;
  return v2;
}

void __57__VUIAppDocumentUpdateEvent_locationAuthorizationChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor locationAuthorizationChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)locationAuthorizationChanged___event;
  locationAuthorizationChanged___event = v1;
}

+ (id)locationRetrieved
{
  if (locationRetrieved___onceToken_0 != -1) {
    dispatch_once(&locationRetrieved___onceToken_0, &__block_literal_global_32_0);
  }
  v2 = (void *)locationRetrieved___event;
  return v2;
}

void __46__VUIAppDocumentUpdateEvent_locationRetrieved__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor locationRetrieved];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)locationRetrieved___event;
  locationRetrieved___event = v1;
}

+ (id)highlightsChanged
{
  if (highlightsChanged___onceToken_0 != -1) {
    dispatch_once(&highlightsChanged___onceToken_0, &__block_literal_global_34_0);
  }
  v2 = (void *)highlightsChanged___event;
  return v2;
}

void __46__VUIAppDocumentUpdateEvent_highlightsChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor highlightsChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)highlightsChanged___event;
  highlightsChanged___event = v1;
}

+ (id)groupRecoCollectionVisiblityChanged
{
  if (groupRecoCollectionVisiblityChanged___onceToken_0 != -1) {
    dispatch_once(&groupRecoCollectionVisiblityChanged___onceToken_0, &__block_literal_global_36_0);
  }
  v2 = (void *)groupRecoCollectionVisiblityChanged___event;
  return v2;
}

void __64__VUIAppDocumentUpdateEvent_groupRecoCollectionVisiblityChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor groupRecoCollectionVisiblityChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)groupRecoCollectionVisiblityChanged___event;
  groupRecoCollectionVisiblityChanged___event = v1;
}

+ (id)groupRecoUsersChanged
{
  if (groupRecoUsersChanged___onceToken_0 != -1) {
    dispatch_once(&groupRecoUsersChanged___onceToken_0, &__block_literal_global_38_2);
  }
  v2 = (void *)groupRecoUsersChanged___event;
  return v2;
}

void __50__VUIAppDocumentUpdateEvent_groupRecoUsersChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor groupRecoUsersChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)groupRecoUsersChanged___event;
  groupRecoUsersChanged___event = v1;
}

+ (id)upNextLockupArtSettingChanged
{
  if (upNextLockupArtSettingChanged___onceToken_0[0] != -1) {
    dispatch_once(upNextLockupArtSettingChanged___onceToken_0, &__block_literal_global_40_0);
  }
  v2 = (void *)upNextLockupArtSettingChanged___event;
  return v2;
}

void __58__VUIAppDocumentUpdateEvent_upNextLockupArtSettingChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor upNextLockupArtSettingChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)upNextLockupArtSettingChanged___event;
  upNextLockupArtSettingChanged___event = v1;
}

+ (id)deviceDiscoveryDataAvailable
{
  if (deviceDiscoveryDataAvailable___onceToken_0 != -1) {
    dispatch_once(&deviceDiscoveryDataAvailable___onceToken_0, &__block_literal_global_42_0);
  }
  v2 = (void *)deviceDiscoveryDataAvailable___event;
  return v2;
}

void __57__VUIAppDocumentUpdateEvent_deviceDiscoveryDataAvailable__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor deviceDiscoveryDataAvailable];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)deviceDiscoveryDataAvailable___event;
  deviceDiscoveryDataAvailable___event = v1;
}

+ (id)favoritesSyncCompleted
{
  if (favoritesSyncCompleted___onceToken_0[0] != -1) {
    dispatch_once(favoritesSyncCompleted___onceToken_0, &__block_literal_global_44_1);
  }
  v2 = (void *)favoritesSyncCompleted___event;
  return v2;
}

void __51__VUIAppDocumentUpdateEvent_favoritesSyncCompleted__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor favoritesSyncCompleted];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)favoritesSyncCompleted___event;
  favoritesSyncCompleted___event = v1;
}

+ (id)brandVisibilityChanged
{
  if (brandVisibilityChanged___onceToken_0 != -1) {
    dispatch_once(&brandVisibilityChanged___onceToken_0, &__block_literal_global_46_1);
  }
  v2 = (void *)brandVisibilityChanged___event;
  return v2;
}

void __51__VUIAppDocumentUpdateEvent_brandVisibilityChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor brandVisibilityChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)brandVisibilityChanged___event;
  brandVisibilityChanged___event = v1;
}

+ (id)federatedAppDidInstall
{
  if (federatedAppDidInstall___onceToken_0 != -1) {
    dispatch_once(&federatedAppDidInstall___onceToken_0, &__block_literal_global_48_2);
  }
  v2 = (void *)federatedAppDidInstall___event;
  return v2;
}

void __51__VUIAppDocumentUpdateEvent_federatedAppDidInstall__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor federatedAppDidInstall];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)federatedAppDidInstall___event;
  federatedAppDidInstall___event = v1;
}

+ (id)pinnedTabsChanged
{
  if (pinnedTabsChanged___onceToken_0 != -1) {
    dispatch_once(&pinnedTabsChanged___onceToken_0, &__block_literal_global_50_0);
  }
  v2 = (void *)pinnedTabsChanged___event;
  return v2;
}

void __46__VUIAppDocumentUpdateEvent_pinnedTabsChanged__block_invoke()
{
  v0 = [VUIAppDocumentUpdateEvent alloc];
  id v3 = +[VUIAppDocumentUpdateEventDescriptor pinnedTabsChanged];
  uint64_t v1 = [(VUIAppDocumentUpdateEvent *)v0 initWithDescriptor:v3];
  v2 = (void *)pinnedTabsChanged___event;
  pinnedTabsChanged___event = v1;
}

- (VUIAppDocumentUpdateEvent)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIAppDocumentUpdateEvent)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentUpdateEvent;
  v6 = [(VUIAppDocumentUpdateEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  id v3 = VUIAppDocumentUpdateEventStringRepresentationFromEventType([v2 type]);

  v6 = @"type";
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (id)coalescedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 descriptor];
  v6 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = self;
  }
  else
  {
    objc_super v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(VUIAppDocumentModifiedFavoritesEvent *)self coalescedEvent:v9];
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)isRefreshEvent
{
  v2 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  unint64_t v3 = [v2 type];

  return v3 < 3;
}

- (unint64_t)hash
{
  v2 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIAppDocumentUpdateEvent *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    int v7 = [(VUIAppDocumentUpdateEvent *)self descriptor];
    v8 = [(VUIAppDocumentUpdateEvent *)v6 descriptor];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqual:v10];
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentUpdateEvent;
  id v4 = [(VUIAppDocumentUpdateEvent *)&v12 description];
  [v3 addObject:v4];

  id v5 = NSString;
  v6 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  int v7 = [v5 stringWithFormat:@"%@=%@", @"descriptor", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (VUIAppDocumentUpdateEventDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end