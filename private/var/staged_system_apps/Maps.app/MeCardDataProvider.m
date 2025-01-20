@interface MeCardDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (GEOObserverHashTable)observers;
- (MapsSuggestionsMeCard)meCard;
- (MeCardDataProvider)init;
- (void)_updateMeCardAndNotifyObservers:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)shortcutManagerMeCardDidChange:(id)a3;
@end

@implementation MeCardDataProvider

- (MeCardDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MeCardDataProvider;
  v2 = [(MeCardDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ShortcutManager sharedManager];
    shortcutManager = v2->_shortcutManager;
    v2->_shortcutManager = (ShortcutManager *)v3;
  }
  return v2;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    shortcutManager = self->_shortcutManager;
    if (a3)
    {
      [(ShortcutManager *)shortcutManager addObserver:self];
      [(MeCardDataProvider *)self _updateMeCardAndNotifyObservers:0];
    }
    else
    {
      [(ShortcutManager *)shortcutManager removeObserver:self];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateMeCardAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    objc_super v6 = [(ShortcutManager *)self->_shortcutManager meCard];
    v7 = v6;
    if (v6 && !self->_hasInitialData)
    {
      int v8 = 1;
      self->_hasInitialData = 1;
    }
    else
    {
      int v8 = 0;
    }
    if (v6 == self->_meCard) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = -[MapsSuggestionsMeCard isEqual:](v6, "isEqual:") ^ 1;
    }
    v10 = sub_1000AA148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromSelector(a2);
      v17 = [(MapsSuggestionsMeCard *)v7 shortcutsForAll];
      BOOL v18 = v3;
      unsigned int v14 = [v17 count];
      sub_100097E28(v8);
      v15 = int v19 = v8;
      v16 = sub_100097E28(v9);
      *(_DWORD *)buf = 138413314;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 1024;
      unsigned int v25 = v14;
      BOOL v3 = v18;
      __int16 v26 = 2112;
      v27 = v15;
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, # favorites = %d, hasInitialDataChanged = %@, meCardChanged = %@", buf, 0x30u);

      int v8 = v19;
    }

    if ((v8 | v9) == 1)
    {
      objc_storeStrong((id *)&self->_meCard, v7);
      if (v3) {
        [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
      }
    }
  }
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (MapsSuggestionsMeCard)meCard
{
  return self->_meCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end