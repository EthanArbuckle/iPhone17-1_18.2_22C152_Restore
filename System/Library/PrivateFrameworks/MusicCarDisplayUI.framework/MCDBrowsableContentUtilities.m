@interface MCDBrowsableContentUtilities
+ (id)sharedInstance;
- (NSArray)firstPartyAppBundleIDs;
- (NSArray)nowPlayingIdentifiers;
- (void)setNowPlayingIdentifiers:(id)a3;
@end

@implementation MCDBrowsableContentUtilities

+ (id)sharedInstance
{
  if (sharedInstance_isDispatched != -1) {
    dispatch_once(&sharedInstance_isDispatched, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __46__MCDBrowsableContentUtilities_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(MCDBrowsableContentUtilities);
  return MEMORY[0x270F9A758]();
}

- (void)setNowPlayingIdentifiers:(id)a3
{
  id v5 = a3;
  nowPlayingIdentifiers = self->_nowPlayingIdentifiers;
  p_nowPlayingIdentifiers = &self->_nowPlayingIdentifiers;
  if (![(NSArray *)nowPlayingIdentifiers isEqualToArray:v5])
  {
    objc_storeStrong((id *)p_nowPlayingIdentifiers, a3);
    v8 = MCDGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Posting MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification", v10, 2u);
    }

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification" object:0];
  }
}

- (NSArray)firstPartyAppBundleIDs
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.podcasts";
  v4[1] = @"com.apple.iBooks";
  v4[2] = @"com.apple.Music";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return (NSArray *)v2;
}

- (NSArray)nowPlayingIdentifiers
{
  return self->_nowPlayingIdentifiers;
}

- (void).cxx_destruct
{
}

@end