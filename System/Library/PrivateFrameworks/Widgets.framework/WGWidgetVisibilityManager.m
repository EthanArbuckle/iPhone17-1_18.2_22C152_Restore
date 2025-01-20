@interface WGWidgetVisibilityManager
- (BOOL)_updateWidgetVisibilityPreference:(id)a3;
- (BOOL)_updateWidgetVisibilityPreferences;
- (BOOL)isWidgetWithIdentifierVisible:(id)a3;
- (NSMutableDictionary)_mobileGestaltAnswerByWidgetTag;
- (WGWidgetVisibilityDelegate)delegate;
- (WGWidgetVisibilityManager)init;
- (id)_allWidgetTags;
- (id)_widgetTagsForWidgetExtensionInfoDictionary:(id)a3;
- (void)_registerForVisiblityPreferenceChanges;
- (void)_unregisterForVisiblityPreferenceChanges;
- (void)_updateMobileGestaltQuestions;
- (void)_updateWidgetTagsAndIconVisibilityForExtension:(id)a3;
- (void)_updateWidgetTagsAndVisibilityForExtensions:(id)a3;
- (void)_widgetVisibilityChanged;
- (void)_widgetVisibilityPreferencesChanged;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMobileGestaltAnswerByWidgetTag:(id)a3;
- (void)updateVisibilityForExtensions:(id)a3;
@end

@implementation WGWidgetVisibilityManager

- (void)_widgetVisibilityPreferencesChanged
{
  if ([(WGWidgetVisibilityManager *)self _updateWidgetVisibilityPreferences])
  {
    [(WGWidgetVisibilityManager *)self _widgetVisibilityChanged];
  }
}

- (BOOL)_updateWidgetVisibilityPreferences
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_visibilityOverridenIdentifiers;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= -[WGWidgetVisibilityManager _updateWidgetVisibilityPreference:](self, "_updateWidgetVisibilityPreference:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (BOOL)_updateWidgetVisibilityPreference:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibilityPreferenceByIdentifier objectForKey:v4];
  char v6 = [v5 BOOLValue];
  Boolean keyExistsAndHasValidFormat = 0;
  if (_os_feature_enabled_impl()
    && (WGWidgetVisibilityManagerFirstPartyAvocadoBlackList(),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v4],
        v7,
        v8))
  {
    BOOL v9 = 0;
    Boolean keyExistsAndHasValidFormat = 1;
  }
  else
  {
    BOOL v9 = CFPreferencesGetAppBooleanValue(@"SBIconVisibility", v4, &keyExistsAndHasValidFormat) != 0;
    int v10 = keyExistsAndHasValidFormat;
    if (!keyExistsAndHasValidFormat) {
      goto LABEL_6;
    }
  }
  visibilityPreferenceByIdentifier = self->_visibilityPreferenceByIdentifier;
  long long v12 = [NSNumber numberWithBool:v9];
  [(NSMutableDictionary *)visibilityPreferenceByIdentifier setObject:v12 forKey:v4];

  int v10 = keyExistsAndHasValidFormat;
LABEL_6:
  char v13 = v10 != (v5 != 0) || v6 != v9;

  return v13;
}

- (WGWidgetVisibilityManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)WGWidgetVisibilityManager;
  v2 = [(WGWidgetVisibilityManager *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    widgetTagsByIdentifier = v2->_widgetTagsByIdentifier;
    v2->_widgetTagsByIdentifier = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    extensionHashByIdentifier = v2->_extensionHashByIdentifier;
    v2->_extensionHashByIdentifier = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mobileGestaltAnswerByWidgetTag = v2->_mobileGestaltAnswerByWidgetTag;
    v2->_mobileGestaltAnswerByWidgetTag = v7;

    v2->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    BOOL v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mobileGestaltQuestions = v2->_mobileGestaltQuestions;
    v2->_mobileGestaltQuestions = v9;

    long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    visibilityDefaultValueByIdentifier = v2->_visibilityDefaultValueByIdentifier;
    v2->_visibilityDefaultValueByIdentifier = v11;

    char v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    visibilityOverridenIdentifiers = v2->_visibilityOverridenIdentifiers;
    v2->_visibilityOverridenIdentifiers = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    visibilityPreferenceByIdentifier = v2->_visibilityPreferenceByIdentifier;
    v2->_visibilityPreferenceByIdentifier = v15;

    [(WGWidgetVisibilityManager *)v2 _registerForVisiblityPreferenceChanges];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1) {
    MGCancelNotifications();
  }
  [(WGWidgetVisibilityManager *)self _unregisterForVisiblityPreferenceChanges];
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetVisibilityManager;
  [(WGWidgetVisibilityManager *)&v3 dealloc];
}

- (BOOL)isWidgetWithIdentifierVisible:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v5 = [(NSMutableDictionary *)self->_widgetTagsByIdentifier objectForKey:v4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__WGWidgetVisibilityManager_isWidgetWithIdentifierVisible___block_invoke;
  v13[3] = &unk_2646764F0;
  v13[4] = self;
  v13[5] = &v14;
  [v5 enumerateObjectsUsingBlock:v13];
  if (*((unsigned char *)v15 + 24)
    && [(NSMutableSet *)self->_visibilityOverridenIdentifiers containsObject:v4])
  {
    char v6 = [(NSMutableDictionary *)self->_visibilityPreferenceByIdentifier objectForKey:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      char v8 = [v6 BOOLValue];
      *((unsigned char *)v15 + 24) = v8;
    }
    else
    {
      BOOL v9 = [(NSMutableDictionary *)self->_visibilityDefaultValueByIdentifier objectForKey:v4];
      char v10 = [v9 BOOLValue];
      *((unsigned char *)v15 + 24) = v10;
    }
  }
  char v11 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __59__WGWidgetVisibilityManager_isWidgetWithIdentifierVisible___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:a2];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (a4) {
      *a4 = 1;
    }
  }
}

- (void)updateVisibilityForExtensions:(id)a3
{
  [(WGWidgetVisibilityManager *)self _updateWidgetTagsAndVisibilityForExtensions:a3];
  [(WGWidgetVisibilityManager *)self _updateMobileGestaltQuestions];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateRespondsToWidgetVisibilityDidChange = p_delegate & 1;
}

- (id)_widgetTagsForWidgetExtensionInfoDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"SBAppTags", objc_opt_class());
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF980] array];
  }
  else
  {
    id v5 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && MGIsQuestionValid()) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_allWidgetTags
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSMutableDictionary *)self->_widgetTagsByIdentifier count])
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(NSMutableDictionary *)self->_widgetTagsByIdentifier allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_updateWidgetTagsAndVisibilityForExtensions:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_extensionHashByIdentifier allKeys];
  uint64_t v6 = (void *)[v5 mutableCopy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v12 = [v11 identifier];
        long long v13 = [(NSMutableDictionary *)self->_extensionHashByIdentifier objectForKey:v12];
        long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        if (([v13 isEqual:v14] & 1) == 0) {
          [(WGWidgetVisibilityManager *)self _updateWidgetTagsAndIconVisibilityForExtension:v11];
        }
        [(NSMutableDictionary *)self->_extensionHashByIdentifier setObject:v14 forKey:v12];
        [v6 removeObject:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NSMutableSet *)self->_visibilityOverridenIdentifiers removeObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_widgetTagsByIdentifier removeObjectsForKeys:v15];
  [(NSMutableDictionary *)self->_extensionHashByIdentifier removeObjectsForKeys:v15];
  [(NSMutableDictionary *)self->_visibilityDefaultValueByIdentifier removeObjectsForKeys:v15];
  [(NSMutableDictionary *)self->_visibilityPreferenceByIdentifier removeObjectsForKeys:v15];
}

- (void)_updateWidgetTagsAndIconVisibilityForExtension:(id)a3
{
  id v17 = a3;
  id v4 = [v17 identifier];
  if ([v4 hasPrefix:@"com.apple."])
  {
    uint64_t v5 = [v17 infoDictionary];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(WGWidgetVisibilityManager *)self _widgetTagsForWidgetExtensionInfoDictionary:v5];
  if (v6) {
    [(NSMutableDictionary *)self->_widgetTagsByIdentifier setObject:v6 forKey:v4];
  }
  uint64_t v7 = [v5 objectForKey:@"SBIconVisibilitySetByAppPreference"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    [(NSMutableSet *)self->_visibilityOverridenIdentifiers addObject:v4];
    uint64_t v9 = [v5 objectForKey:@"SBIconVisibilityDefaultVisible"];
    if (v9)
    {
      [(NSMutableDictionary *)self->_visibilityDefaultValueByIdentifier setObject:v9 forKey:v4];
    }
    else
    {
      long long v10 = [v5 objectForKey:@"SBIconVisibilityDefaultVisibleInstallTypes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (MGGetBoolAnswer())
        {
          long long v11 = @"internal";
        }
        else if (MGGetBoolAnswer())
        {
          long long v11 = @"carrier";
        }
        else
        {
          long long v11 = @"user";
        }
        uint64_t v12 = [v10 containsObject:v11];
        visibilityDefaultValueByIdentifier = self->_visibilityDefaultValueByIdentifier;
        long long v14 = [NSNumber numberWithBool:v12];
        [(NSMutableDictionary *)visibilityDefaultValueByIdentifier setObject:v14 forKey:v4];
      }
    }
    [(WGWidgetVisibilityManager *)self _updateWidgetVisibilityPreference:v4];
  }
  if (_os_feature_enabled_impl())
  {
    id v15 = WGWidgetVisibilityManagerFirstPartyAvocadoBlackList();
    int v16 = [v15 containsObject:v4];

    if (v16)
    {
      [(NSMutableSet *)self->_visibilityOverridenIdentifiers addObject:v4];
      [(WGWidgetVisibilityManager *)self _updateWidgetVisibilityPreference:v4];
    }
  }
}

- (void)_updateMobileGestaltQuestions
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(WGWidgetVisibilityManager *)self _allWidgetTags];
  if (([(NSMutableSet *)self->_mobileGestaltQuestions isEqualToSet:v3] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_mobileGestaltAnswerByWidgetTag removeAllObjects];
    [(NSMutableSet *)self->_mobileGestaltQuestions removeAllObjects];
    if (self->_mobileGestaltNotificationToken != (MGNotificationTokenStruct *)-1) {
      MGCancelNotifications();
    }
    if ([v3 count])
    {
      [(NSMutableSet *)self->_mobileGestaltQuestions unionSet:v3];
      objc_initWeak(&location, self);
      [(NSMutableSet *)self->_mobileGestaltQuestions allObjects];
      id v4 = MEMORY[0x263EF83A0];
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      long long v22 = __58__WGWidgetVisibilityManager__updateMobileGestaltQuestions__block_invoke;
      long long v23 = &unk_264676518;
      objc_copyWeak(&v24, &location);
      self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

      [v3 allObjects];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = (id)MGCopyMultipleAnswers();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            CFBooleanRef v10 = (const __CFBoolean *)[v5 objectForKey:v9];
            CFBooleanRef v11 = v10;
            if (v10)
            {
              CFTypeID v12 = CFGetTypeID(v10);
              BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
              mobileGestaltAnswerByWidgetTag = self->_mobileGestaltAnswerByWidgetTag;
              id v15 = [NSNumber numberWithBool:v13];
              [(NSMutableDictionary *)mobileGestaltAnswerByWidgetTag setObject:v15 forKey:v9];
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
        }
        while (v6);
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_mobileGestaltNotificationToken = (MGNotificationTokenStruct *)-1;
    }
  }
}

void __58__WGWidgetVisibilityManager__updateMobileGestaltQuestions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MGCopyAnswer();
  if (!v4) {
    return;
  }
  id v5 = (const void *)v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained _mobileGestaltAnswerByWidgetTag];
  uint64_t v7 = [v6 objectForKey:a2];
  int v8 = [v7 BOOLValue];

  CFTypeID v9 = CFGetTypeID(v5);
  if (v9 == CFBooleanGetTypeID())
  {
    BOOL v10 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
    if (v8 == v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v8)
  {
    BOOL v10 = 0;
LABEL_8:
    CFBooleanRef v11 = [WeakRetained _mobileGestaltAnswerByWidgetTag];
    CFTypeID v12 = [NSNumber numberWithBool:v10];
    [v11 setObject:v12 forKey:a2];

    [WeakRetained _widgetVisibilityChanged];
  }
LABEL_9:
  CFRelease(v5);
}

- (void)_registerForVisiblityPreferenceChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NCWidgetVisibilityPreferencesChanged, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForVisiblityPreferenceChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0);
}

- (void)_widgetVisibilityChanged
{
  if (self->_delegateRespondsToWidgetVisibilityDidChange)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained widgetVisibilityDidChange];
  }
}

- (WGWidgetVisibilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetVisibilityDelegate *)WeakRetained;
}

- (NSMutableDictionary)_mobileGestaltAnswerByWidgetTag
{
  return self->_mobileGestaltAnswerByWidgetTag;
}

- (void)setMobileGestaltAnswerByWidgetTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mobileGestaltQuestions, 0);
  objc_storeStrong((id *)&self->_visibilityOverridenIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibilityPreferenceByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibilityDefaultValueByIdentifier, 0);
  objc_storeStrong((id *)&self->_mobileGestaltAnswerByWidgetTag, 0);
  objc_storeStrong((id *)&self->_extensionHashByIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetTagsByIdentifier, 0);
}

@end