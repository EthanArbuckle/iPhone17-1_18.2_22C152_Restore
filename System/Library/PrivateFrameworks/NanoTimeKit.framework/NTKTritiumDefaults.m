@interface NTKTritiumDefaults
+ (id)sharedInstance;
- (BOOL)allBundleIDsPrivateInTritium;
- (BOOL)isBundleIdPrivateInTritium:(id)a3;
- (BOOL)isSiriPlatterPrivateInTritium:(id)a3;
- (NTKTritiumDefaults)init;
- (id)_domainAccessor;
- (id)_privateBundleIDs;
- (id)_privateSiriCardIDs;
- (void)_observe;
- (void)_synchronize;
- (void)addObserver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setAllBundleIDsPrivateInTritium:(BOOL)a3;
- (void)setBundleIDs:(id)a3 privateInTritium:(BOOL)a4;
- (void)setSiriPlatters:(id)a3 privateInTritium:(BOOL)a4;
@end

@implementation NTKTritiumDefaults

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NTKTritiumDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_25 != -1) {
    dispatch_once(&sharedInstance_onceToken_25, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_10;
  return v2;
}

void __36__NTKTritiumDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_10;
  sharedInstance___sharedInstance_10 = (uint64_t)v1;
}

- (NTKTritiumDefaults)init
{
  v11.receiver = self;
  v11.super_class = (Class)NTKTritiumDefaults;
  v2 = [(NTKTritiumDefaults *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(NTKTritiumDefaults *)v2 _synchronize];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
    domainAccessor = v3->_domainAccessor;
    v3->_domainAccessor = (NPSDomainAccessor *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.NanoTimeKit"];
    defaults = v3->_defaults;
    v3->_defaults = (NSUserDefaults *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v8;

    [(NTKTritiumDefaults *)v3 _observe];
  }
  return v3;
}

- (id)_domainAccessor
{
  return self->_domainAccessor;
}

- (void)_synchronize
{
  v2 = [(NTKTritiumDefaults *)self _domainAccessor];
  id v3 = (id)[v2 synchronize];

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"NTKAllComplicationsPrivate", @"NTKSpecificComplicationsPrivate", @"NTKSpecificSiriCardsPrivate", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  [v4 synchronizeNanoDomain:@"com.apple.NanoTimeKit" keys:v5 cloudEnabled:1];
}

- (BOOL)allBundleIDsPrivateInTritium
{
  char v9 = 0;
  id v3 = [(NTKTritiumDefaults *)self _domainAccessor];
  LOBYTE(v4) = [v3 BOOLForKey:@"NTKAllComplicationsPrivate" keyExistsAndHasValidFormat:&v9];

  if (!v9)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTPrivacyEnabled", @"com.apple.system.prefs", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v6 = AppBooleanValue == 0;
    }
    else {
      BOOL v6 = 1;
    }
    uint64_t v4 = !v6;
    [(NTKTritiumDefaults *)self setAllBundleIDsPrivateInTritium:v4];
  }
  return v4;
}

- (void)setAllBundleIDsPrivateInTritium:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NTKTritiumDefaults *)self _domainAccessor];
  [v5 setBool:v3 forKey:@"NTKAllComplicationsPrivate"];

  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification" object:0];

  [(NTKTritiumDefaults *)self _synchronize];
}

- (BOOL)isBundleIdPrivateInTritium:(id)a3
{
  id v4 = a3;
  if ([(NTKTritiumDefaults *)self allBundleIDsPrivateInTritium])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v6 = [(NTKTritiumDefaults *)self _privateBundleIDs];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (BOOL)isSiriPlatterPrivateInTritium:(id)a3
{
  id v4 = a3;
  char v5 = [(NTKTritiumDefaults *)self _privateSiriCardIDs];
  if ([(NTKTritiumDefaults *)self allBundleIDsPrivateInTritium]
    || ([v5 containsObject:v4] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 containsObject:@"com.apple.NanoTimeKit.NTKTritiumSettingsAllSiriPlattersHidden"];
  }

  return v6;
}

- (void)setBundleIDs:(id)a3 privateInTritium:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  uint64_t v8 = [(NTKTritiumDefaults *)self _privateBundleIDs];
  id v12 = [v6 setWithArray:v8];

  if (v4) {
    [v12 unionSet:v7];
  }
  else {
    [v12 minusSet:v7];
  }

  char v9 = [(NTKTritiumDefaults *)self _domainAccessor];
  v10 = [v12 allObjects];
  [v9 setObject:v10 forKey:@"NTKSpecificComplicationsPrivate"];

  [(NTKTritiumDefaults *)self _synchronize];
  objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification" object:0];
}

- (void)setSiriPlatters:(id)a3 privateInTritium:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  uint64_t v8 = [(NTKTritiumDefaults *)self _privateSiriCardIDs];
  id v12 = [v6 setWithArray:v8];

  if (v4) {
    [v12 unionSet:v7];
  }
  else {
    [v12 minusSet:v7];
  }

  char v9 = [(NTKTritiumDefaults *)self _domainAccessor];
  v10 = [v12 allObjects];
  [v9 setObject:v10 forKey:@"NTKSpecificSiriCardsPrivate"];

  [(NTKTritiumDefaults *)self _synchronize];
  objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification" object:0];
}

- (id)_privateBundleIDs
{
  v2 = [(NTKTritiumDefaults *)self _domainAccessor];
  uint64_t v3 = [v2 objectForKey:@"NTKSpecificComplicationsPrivate"];

  if (v3) {
    BOOL v4 = (void *)v3;
  }
  else {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_privateSiriCardIDs
{
  v2 = [(NTKTritiumDefaults *)self _domainAccessor];
  uint64_t v3 = [v2 objectForKey:@"NTKSpecificSiriCardsPrivate"];

  if (v3) {
    BOOL v4 = (void *)v3;
  }
  else {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (void)_observe
{
  [(NSUserDefaults *)self->_defaults addObserver:self forKeyPath:@"NTKSpecificComplicationsPrivate" options:0 context:0];
  defaults = self->_defaults;
  [(NSUserDefaults *)defaults addObserver:self forKeyPath:@"NTKAllComplicationsPrivate" options:0 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "tritiumPrivacySettingsDidChange", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end