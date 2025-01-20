@interface ShortcutManager
+ (id)sharedManager;
- (MapsSuggestionsMeCard)meCard;
- (NSString)uniqueName;
- (id)_observers;
- (void)_loadMapsSuggestionsEngineIfNecessary;
- (void)_touchMapsSuggestionsEngine;
- (void)_updateMeCard:(id)a3;
- (void)addObserver:(id)a3;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
- (void)moveShortcut:(id)a3 toIndex:(int64_t)a4 completion:(id)a5;
- (void)prefetchMeCard;
- (void)removeObserver:(id)a3;
@end

@implementation ShortcutManager

- (void)_updateMeCard:(id)a3
{
  v7 = (MapsSuggestionsMeCard *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = v7;
  if (self->_meCard != v7)
  {
    unsigned __int8 v6 = -[MapsSuggestionsMeCard isEqual:](v7, "isEqual:");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_meCard, a3);
      [(GEOObserverHashTable *)self->_observers shortcutManagerMeCardDidChange:self];
      v5 = v7;
    }
  }
}

- (id)_observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___ShortcutManagerObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(ShortcutManager *)self _observers];
  [v5 registerObserver:v4];

  [(ShortcutManager *)self _loadMapsSuggestionsEngineIfNecessary];
}

- (void)_loadMapsSuggestionsEngineIfNecessary
{
  if (!self->_engine)
  {
    objc_initWeak(&location, self);
    sub_100018584();
    v3 = (MapsSuggestionsEngine *)objc_claimAutoreleasedReturnValue();
    engine = self->_engine;
    self->_engine = v3;

    v5 = [(MapsSuggestionsEngine *)self->_engine oneFavorites];
    [v5 registerMeCardObserver:self];

    unsigned __int8 v6 = [(MapsSuggestionsEngine *)self->_engine oneFavorites];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002B5EC;
    v7[3] = &unk_1012E9280;
    objc_copyWeak(&v8, &location);
    [v6 readMeCardWithHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (MapsSuggestionsMeCard)meCard
{
  return self->_meCard;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001095E8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_1016108C0 != -1) {
    dispatch_once(&qword_1016108C0, block);
  }
  v2 = (void *)qword_1016108B8;

  return v2;
}

- (void)_touchMapsSuggestionsEngine
{
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ShortcutManager *)self _observers];
  [v5 unregisterObserver:v4];
}

- (void)prefetchMeCard
{
}

- (NSString)uniqueName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B5E7B4;
  v5[3] = &unk_1012E5D58;
  v5[4] = self;
  id v6 = [a4 copy:a3];
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)moveShortcut:(id)a3 toIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (self->_engine && self->_meCard)
  {
    objc_initWeak(&location, self);
    v11 = [(MapsSuggestionsEngine *)self->_engine oneFavorites];
    v12 = [(MapsSuggestionsMeCard *)self->_meCard shortcutsForAll];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100B5E928;
    v13[3] = &unk_1013193F8;
    id v14 = v10;
    objc_copyWeak(&v15, &location);
    [v11 moveShortcut:v8 toIndex:a4 withSnapshot:v12 handler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end