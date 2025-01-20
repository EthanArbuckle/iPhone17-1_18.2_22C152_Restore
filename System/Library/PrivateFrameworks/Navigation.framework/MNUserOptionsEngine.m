@interface MNUserOptionsEngine
+ (id)sharedInstance;
- (MNUserOptions)options;
- (MNUserOptionsEngine)init;
- (NSString)currentVoiceLanguage;
- (id)localizedStringForKey:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)update:(id)a3;
- (void)updateNavigationSessionLanguage:(id)a3;
@end

@implementation MNUserOptionsEngine

- (void)update:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(MNUserOptions *)self->_options isEqual:v4])
    {
      GetAudioLogForMNUserOptionsEngineCategory();
      v5 = (MNUserOptions *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B542B000, &v5->super, OS_LOG_TYPE_INFO, "ⓤ Ignoring options update; they are unchanged",
          (uint8_t *)&v10,
          2u);
      }
    }
    else
    {
      v5 = self->_options;
      v6 = (MNUserOptions *)[v4 copy];
      options = self->_options;
      self->_options = v6;

      v8 = GetAudioLogForMNUserOptionsEngineCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = self->_options;
        int v10 = 138412546;
        v11 = v5;
        __int16 v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓤ Notifying observers with old options : %@ and new options : %@", (uint8_t *)&v10, 0x16u);
      }

      [(MNObserverHashTable *)self->_observers userOptionsEngine:self didChangeFrom:v5 to:self->_options];
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1EB59C150 != -1) {
    dispatch_once(&qword_1EB59C150, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_30;
  return v2;
}

uint64_t __37__MNUserOptionsEngine_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals_30;
  _MergedGlobals_30 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MNUserOptionsEngine)init
{
  v7.receiver = self;
  v7.super_class = (Class)MNUserOptionsEngine;
  v2 = [(MNUserOptionsEngine *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    options = v2->_options;
    v2->_options = (MNUserOptions *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)currentVoiceLanguage
{
  navSessionLanguage = self->_navSessionLanguage;
  if (navSessionLanguage)
  {
    uint64_t v3 = navSessionLanguage;
  }
  else
  {
    uint64_t v3 = +[MNVoiceLanguageUtil systemDefaultVoiceLanguage];
  }
  return v3;
}

- (void)registerObserver:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1F0E55918])
    {
      if (!self->_observers)
      {
        v6 = GetAudioLogForMNUserOptionsEngineCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "ⓤ Creating observer table", (uint8_t *)&v11, 2u);
        }

        objc_super v7 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E55918];
        observers = self->_observers;
        self->_observers = v7;
      }
      v9 = GetAudioLogForMNUserOptionsEngineCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        __int16 v12 = v5;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓤ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      [(MNObserverHashTable *)self->_observers registerObserver:v5];
    }
    else
    {
      int v10 = GetAudioLogForMNUserOptionsEngineCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        __int16 v12 = v5;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "⒰ object isn't a MNUserOptionsObserver : %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 conformsToProtocol:&unk_1F0E55918];
    p_super = GetAudioLogForMNUserOptionsEngineCategory();
    BOOL v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if ((v6 & 1) == 0)
    {
      if (v8)
      {
        int v10 = 138412290;
        int v11 = v5;
        _os_log_impl(&dword_1B542B000, p_super, OS_LOG_TYPE_DEBUG, "⒰ object isn't a MNUserOptionsObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (v8)
    {
      int v10 = 138412290;
      int v11 = v5;
      _os_log_impl(&dword_1B542B000, p_super, OS_LOG_TYPE_DEBUG, "ⓤ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    [(MNObserverHashTable *)self->_observers unregisterObserver:v5];
    if (![(MNObserverHashTable *)self->_observers hasObservers])
    {
      v9 = GetAudioLogForMNUserOptionsEngineCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "ⓤ Observer table empty; destroying",
          (uint8_t *)&v10,
          2u);
      }

      p_super = &self->_observers->super;
      self->_observers = 0;
LABEL_11:
    }
  }
}

- (id)localizedStringForKey:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F28B50] _navigationBundle];
    char v6 = [(MNUserOptionsEngine *)self currentVoiceLanguage];
    if ([v6 length])
    {
      objc_super v7 = (void *)MEMORY[0x1E4F28B50];
      BOOL v8 = [v5 localizations];
      v26[0] = v6;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      int v10 = [v7 preferredLocalizationsFromArray:v8 forPreferences:v9];

      int v11 = [v10 firstObject];
      uint64_t v12 = [v5 localizedStringForKey:v4 value:&stru_1F0E08010 table:@"Navigation" localization:v11];
      uint64_t v13 = GetAudioLogForMNUserOptionsEngineCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412802;
        id v21 = v4;
        __int16 v22 = 2112;
        v23 = v6;
        __int16 v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "⒰ trying to find key: %@, language: %@, canonical language identifier: %@", (uint8_t *)&v20, 0x20u);
      }

      if (v12)
      {
        if ([v12 isEqualToString:v4])
        {
          uint64_t v14 = GetAudioLogForMNUserOptionsEngineCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v20 = 138412802;
            id v21 = v4;
            __int16 v22 = 2112;
            v23 = v6;
            __int16 v24 = 2112;
            v25 = v11;
            _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "⒰ a string for key wasn't found : key: %@, language: %@, canonical language identifier: %@", (uint8_t *)&v20, 0x20u);
          }
        }
        id v15 = v12;
      }
      else
      {
        uint64_t v16 = _MNLocalizedStringFromThisBundle(v4);
        v17 = (void *)v16;
        if (v16) {
          v18 = (void *)v16;
        }
        else {
          v18 = v4;
        }
        id v15 = v18;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)updateNavigationSessionLanguage:(id)a3
{
}

- (MNUserOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_navSessionLanguage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end