@interface ShortcutEditSession
+ (ShortcutEditSession)editSessionWithShortcut:(id)a3;
+ (ShortcutEditSession)editSessionWithSuggestion:(id)a3;
+ (id)addSession;
+ (id)addSessionWithShortcut:(id)a3;
+ (id)addSessionWithType:(int64_t)a3 mapItem:(id)a4;
+ (void)captureCreateFavoriteAction;
- (BOOL)alreadySaved;
- (BOOL)canBeSaved;
- (BOOL)canChangeType;
- (BOOL)didResignTitleFocus;
- (BOOL)editOnlyAddress;
- (BOOL)editOnlyLocation;
- (BOOL)isSetupPlaceholder;
- (BOOL)moveToPreferredIndexInFavorites;
- (BOOL)shortcutsContainItem:(id)a3;
- (MapsSuggestionsEntry)originalSuggestionsEntry;
- (MapsSuggestionsShortcutLike)originalShortcut;
- (MapsSuggestionsShortcutLike)shortcut;
- (NSArray)contacts;
- (NSString)titleForAddressPicker;
- (ShortcutEditSession)init;
- (id)completionHandler;
- (id)identifier;
- (id)mapItem;
- (id)shortcutManager;
- (int64_t)editingModeType;
- (void)_saveFavorite:(id)a3 completion:(id)a4;
- (void)_touchMapsSuggestionsEngine;
- (void)addSharing:(id)a3;
- (void)removeFromShortcutsWithCompletion:(id)a3;
- (void)removeSharing:(id)a3;
- (void)saveWithCompletion:(id)a3;
- (void)setAdjustedCoordinate:(CLLocationCoordinate2D)a3;
- (void)setAlreadySaved:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDidResignTitleFocus:(BOOL)a3;
- (void)setEditingModeType:(int64_t)a3;
- (void)setMapItem:(id)a3;
- (void)setMoveToPreferredIndexInFavorites:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOriginalShortcut:(id)a3;
- (void)setOriginalSuggestionsEntry:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ShortcutEditSession

+ (id)addSession
{
  v2 = objc_alloc_init(ShortcutEditSession);
  [(ShortcutEditSession *)v2 setAlreadySaved:0];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = objc_alloc_init(_TtC4Maps16MapsFavoriteItem);
    [(MapsFavoriteItem *)v3 setType:1];
    [(ShortcutEditSession *)v2 setMoveToPreferredIndexInFavorites:1];
  }
  else
  {
    v3 = (_TtC4Maps16MapsFavoriteItem *)[objc_alloc((Class)MapsSuggestionsShortcut) initSetupPlaceholderOfType:1];
  }
  [(ShortcutEditSession *)v2 setOriginalShortcut:v3];

  return v2;
}

+ (id)addSessionWithType:(int64_t)a3 mapItem:(id)a4
{
  id v6 = a4;
  v7 = [v6 _geoMapItem];
  if (v7)
  {
    v8 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v7];
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v9 = objc_alloc_init((Class)MSFavoriteItem);
      [v9 setMapItemStorage:v8];
      v10 = [v6 _geoMapItemStorageForPersistence];
      v11 = [v10 userValues];
      v12 = [v11 name];
      [v9 setCustomName:v12];

      v13 = [[_TtC4Maps16MapsFavoriteItem alloc] initWithFavoriteItem:v9];
      [(MapsFavoriteItem *)v13 setType:a3];
      v14 = [a1 addSessionWithShortcut:v13];
    }
    else
    {
      id v9 = [objc_alloc((Class)MapsSuggestionsShortcut) initWithType:a3 geoMapItem:v8 customName:0];
      v14 = [a1 addSessionWithShortcut:v9];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (ShortcutEditSession)editSessionWithSuggestion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  [(ShortcutEditSession *)v4 setAlreadySaved:0];
  [(ShortcutEditSession *)v4 setOriginalSuggestionsEntry:v3];

  return v4;
}

+ (id)addSessionWithShortcut:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  [(ShortcutEditSession *)v4 setAlreadySaved:0];
  if (+[LibraryUIUtilities isMyPlacesEnabled]) {
    [(ShortcutEditSession *)v4 setMoveToPreferredIndexInFavorites:1];
  }
  [(ShortcutEditSession *)v4 setOriginalShortcut:v3];

  return v4;
}

+ (ShortcutEditSession)editSessionWithShortcut:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ShortcutEditSession);
  [(ShortcutEditSession *)v4 setAlreadySaved:1];
  if (!+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = [v3 copy];

    id v3 = v5;
  }
  [(ShortcutEditSession *)v4 setOriginalShortcut:v3];

  return v4;
}

- (ShortcutEditSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)ShortcutEditSession;
  v2 = [(ShortcutEditSession *)&v10 init];
  if (v2)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100D87AAC;
      block[3] = &unk_1012E5D08;
      id v3 = (id *)&v9;
      id v9 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v4 = [(ShortcutEditSession *)v2 shortcutManager];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100D87B20;
      v6[3] = &unk_1012E7610;
      id v3 = (id *)&v7;
      v7 = v2;
      [v4 loadAllShortcutsWithHandler:v6];
    }
  }
  return v2;
}

- (void)setOriginalSuggestionsEntry:(id)a3
{
  id v5 = (MapsSuggestionsEntry *)a3;
  if (self->_originalSuggestionsEntry != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_originalSuggestionsEntry, a3);
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v6 = (MapsSuggestionsShortcutLike *)objc_alloc_init((Class)MSFavoriteItem);
      [(MapsSuggestionsShortcutLike *)v6 setType:1];
      v7 = [[_TtC4Maps16MapsFavoriteItem alloc] initWithFavoriteItem:v6];
      originalShortcut = self->_originalShortcut;
      self->_originalShortcut = (MapsSuggestionsShortcutLike *)v7;
      id v9 = v7;

      self->_originalShortcutType = (int64_t)[(MapsSuggestionsShortcutLike *)v9 type];
      objc_super v10 = (MapsSuggestionsShortcutLike *)[(MapsSuggestionsShortcutLike *)v9 copy];
      shortcut = self->_shortcut;
      self->_shortcut = v10;
    }
    else
    {
      id v12 = objc_alloc((Class)MapsSuggestionsShortcut);
      [(MapsSuggestionsEntry *)v16 type];
      v13 = (MapsSuggestionsShortcutLike *)[v12 initSetupPlaceholderOfType:MapsSuggestionsShortcutTypeFromEntryType()];
      v14 = self->_originalShortcut;
      self->_originalShortcut = v13;
      id v6 = v13;

      v15 = (MapsSuggestionsShortcutLike *)[(MapsSuggestionsShortcutLike *)v6 copy];
      id v9 = self->_shortcut;
      self->_shortcut = v15;
    }

    id v5 = v16;
  }
}

- (void)setOriginalShortcut:(id)a3
{
  id v5 = (MapsSuggestionsShortcutLike *)a3;
  if (self->_originalShortcut != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_originalShortcut, a3);
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      objc_storeStrong((id *)&self->_shortcut, a3);
      id v6 = [(MapsSuggestionsShortcutLike *)v9 type];
      id v5 = v9;
      self->_originalShortcutType = (int64_t)v6;
    }
    else
    {
      v7 = (MapsSuggestionsShortcutLike *)[(MapsSuggestionsShortcutLike *)v9 copy];
      shortcut = self->_shortcut;
      self->_shortcut = v7;

      id v5 = v9;
    }
  }
}

- (NSString)titleForAddressPicker
{
  id v3 = 0;
  switch((unint64_t)[(MapsSuggestionsShortcutLike *)self->_shortcut type])
  {
    case 0uLL:
    case 1uLL:
      unsigned int v4 = +[LibraryUIUtilities isMyPlacesEnabled];
      id v5 = +[NSBundle mainBundle];
      if (v4) {
        CFStringRef v6 = @"[Shortcut] Add Pin";
      }
      else {
        CFStringRef v6 = @"[Shortcut] Add Favorite";
      }
      goto LABEL_14;
    case 2uLL:
      unsigned __int8 v7 = [(MapsSuggestionsShortcutLike *)self->_shortcut isSetupPlaceholder];
      id v5 = +[NSBundle mainBundle];
      if (v7) {
        CFStringRef v6 = @"[Shortcut] Set up Home";
      }
      else {
        CFStringRef v6 = @"[Shortcut] Change Home Address";
      }
      goto LABEL_14;
    case 3uLL:
      unsigned __int8 v8 = [(MapsSuggestionsShortcutLike *)self->_shortcut isSetupPlaceholder];
      id v5 = +[NSBundle mainBundle];
      if (v8) {
        CFStringRef v6 = @"[Shortcut] Set up Work";
      }
      else {
        CFStringRef v6 = @"[Shortcut] Change Work Address";
      }
LABEL_14:
      id v9 = v5;
      goto LABEL_15;
    case 5uLL:
      id v9 = +[NSBundle mainBundle];
      id v5 = v9;
      CFStringRef v6 = @"[Shortcut] Add School";
      goto LABEL_15;
    case 6uLL:
      id v9 = +[NSBundle mainBundle];
      id v5 = v9;
      CFStringRef v6 = @"[Shortcut] Add Favorite Button";
LABEL_15:
      id v3 = [v9 localizedStringForKey:v6 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return (NSString *)v3;
}

- (BOOL)isSetupPlaceholder
{
  return [(MapsSuggestionsShortcutLike *)self->_shortcut isSetupPlaceholder];
}

- (BOOL)canBeSaved
{
  return (self->_modified || !self->_alreadySaved) && !self->_removing;
}

- (BOOL)canChangeType
{
  return +[LibraryUIUtilities isMyPlacesEnabled]
      || [(MapsSuggestionsShortcutLike *)self->_originalShortcut type] == (id)1;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(MapsSuggestionsShortcutLike *)self->_shortcut setCustomName:v4];
    self->_modified = 1;
  }
}

- (void)setMapItem:(id)a3
{
  id v4 = [a3 _geoMapItem];
  id v5 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v4];

  [(MapsSuggestionsShortcutLike *)self->_shortcut setGeoMapItem:v5];
  self->_modified = 1;
}

- (id)mapItem
{
  return [(MapsSuggestionsShortcutLike *)self->_shortcut geoMapItem];
}

- (id)identifier
{
  return [(MapsSuggestionsShortcutLike *)self->_shortcut identifier];
}

- (void)setType:(int64_t)a3
{
  self->_modified = 1;
}

- (void)setAdjustedCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v16 = self->_shortcut;
  CFStringRef v6 = [(MapsSuggestionsShortcutLike *)v16 geoMapItem];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)GEOMapItemCorrectedLocationAttributes);
    id v8 = objc_alloc_init((Class)GEOLatLng);
    [v8 setLat:latitude];
    [v8 setLng:longitude];
    [v7 setCorrectedCoordinate:v8];
    id v9 = [(MapsSuggestionsShortcutLike *)v16 geoMapItem];
    objc_super v10 = [v9 clientAttributes];
    v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init((Class)GEOMapItemClientAttributes);
    }
    v13 = v12;

    [v13 setCorrectedLocationAttributes:v7];
    v14 = [(MapsSuggestionsShortcutLike *)v16 geoMapItem];
    v15 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14 clientAttributes:v13];
    [(MapsSuggestionsShortcutLike *)v16 setGeoMapItem:v15];

    self->_modified = 1;
  }
}

- (void)addSharing:(id)a3
{
  id v10 = a3;
  id v4 = [v10 suggestionContactValue];
  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  CFStringRef v6 = [(ShortcutEditSession *)self shortcut];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v10 stringValue];
    [v7 addContact:v8];
  }
  else
  {
    [v6 addContact:v4];
  }

  self->_modified = 1;
  contacts = self->_contacts;
  self->_contacts = 0;
}

- (void)removeSharing:(id)a3
{
  id v10 = a3;
  id v4 = [v10 suggestionContactValue];
  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  CFStringRef v6 = [(ShortcutEditSession *)self shortcut];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v10 stringValue];
    [v7 removeContact:v8];
  }
  else
  {
    [v6 removeContact:v4];
  }

  self->_modified = 1;
  contacts = self->_contacts;
  self->_contacts = 0;
}

- (NSArray)contacts
{
  contacts = self->_contacts;
  if (!contacts)
  {
    unsigned int v4 = +[LibraryUIUtilities isMyPlacesEnabled];
    unsigned int v5 = [(MapsSuggestionsShortcutLike *)self->_shortcut contacts];
    if (v4) {
      +[MSPSharedTripContact contactsFromHandles:v5];
    }
    else {
    CFStringRef v6 = +[MSPSharedTripContact contactValuesFromSuggestionsContacts:v5];
    }
    id v7 = self->_contacts;
    self->_contacts = v6;

    contacts = self->_contacts;
  }

  return contacts;
}

- (BOOL)shortcutsContainItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [v4 geoCompletionItem];
    CFStringRef v6 = [v5 geoMapItem];

    if (!v6)
    {
LABEL_16:
      LOBYTE(v8) = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    CFStringRef v6 = [v4 _geoMapItem];
    if (!v6) {
      goto LABEL_16;
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_cachedShortcuts;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 geoMapItem:v17];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [v11 geoMapItem];
          char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();

          if (IsEqualToMapItemForPurpose)
          {
            LOBYTE(v8) = 1;
            goto LABEL_18;
          }
        }
      }
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:

LABEL_19:
  return (char)v8;
}

- (void)saveWithCompletion:(id)a3
{
  id v4 = a3;
  shortcut = self->_shortcut;
  if (shortcut && !self->_removing)
  {
    [(MapsSuggestionsShortcutLike *)shortcut setIsHidden:0];
    char v8 = 0;
    if (!self->_alreadySaved) {
      char v8 = [(MapsSuggestionsEntry *)self->_originalSuggestionsEntry isShortcutForSetup] ^ 1;
    }
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      uint64_t v9 = self->_shortcut;
      if (v9)
      {
        if ([(ShortcutEditSession *)self moveToPreferredIndexInFavorites])
        {
          id v10 = +[MapsFavoritesManager sharedManager];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100D88A14;
          v22[3] = &unk_101323A40;
          v22[4] = self;
          v23 = v9;
          id v24 = v4;
          [v10 loadAllShortcutsWithCompletionHandler:v22];
        }
        else
        {
          [(ShortcutEditSession *)self _saveFavorite:v9 completion:v4];
        }
      }
      else
      {
        if (v4) {
          (*((void (**)(id, void))v4 + 2))(v4, 0);
        }
        v14 = [(ShortcutEditSession *)self completionHandler];

        if (v14)
        {
          v15 = [(ShortcutEditSession *)self completionHandler];
          v15[2]();
        }
      }
    }
    else
    {
      v11 = [(ShortcutEditSession *)self shortcutManager];
      objc_initWeak(&from, v11);

      id v12 = objc_loadWeakRetained(&from);
      v26 = self->_shortcut;
      v13 = +[NSArray arrayWithObjects:&v26 count:1];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100D88A24;
      v16[3] = &unk_101323A90;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      id v17 = v4;
      char v20 = v8;
      [v12 addOrUpdateShortcuts:v13 handler:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    CFStringRef v6 = [(ShortcutEditSession *)self completionHandler];

    if (v6)
    {
      id v7 = [(ShortcutEditSession *)self completionHandler];
      v7[2]();
    }
  }
}

- (void)_saveFavorite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100D88E08;
  v10[3] = &unk_101323B00;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v11 = v8;
  id v12 = self;
  id v9 = v7;
  id v13 = v9;
  [v8 saveWithCompletionHandler:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)removeFromShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void (**)(void, void))v4;
  if (self->_shortcut)
  {
    self->_removing = 1;
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v6 = self->_shortcut;
      if (v6)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100D89228;
        v12[3] = &unk_1012E76C0;
        id v13 = v5;
        [(MapsSuggestionsShortcutLike *)v6 deleteWithCompletionHandler:v12];
      }
      else if (v5)
      {
        v5[2](v5, 0);
      }
    }
    else
    {
      id v7 = [(ShortcutEditSession *)self shortcutManager];
      shortcut = self->_shortcut;
      id v8 = +[NSArray arrayWithObjects:&shortcut count:1];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100D892FC;
      v9[3] = &unk_1012E7DB8;
      objc_copyWeak(&v11, &location);
      id v10 = v5;
      [v7 removeShortcuts:v8 handler:v9];

      objc_destroyWeak(&v11);
    }
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)shortcutManager
{
  v2 = sub_100018584();
  id v3 = [v2 oneFavorites];

  return v3;
}

- (void)_touchMapsSuggestionsEngine
{
  sub_100018584();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 hintRefreshOfType:18];
}

+ (void)captureCreateFavoriteAction
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v2 = +[MapsFavoritesManager sharedManager];
    id v3 = [v2 shortcuts];

    id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) type];
          if (v9 == (id)6 || v9 == (id)1) {
            ++v6;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);

      if (v6 >= 5)
      {
        if ((unint64_t)v6 >= 0xA)
        {
          if ((unint64_t)v6 >= 0xF) {
            uint64_t v6 = 15;
          }
          else {
            uint64_t v6 = 10;
          }
        }
        else
        {
          uint64_t v6 = 5;
        }
      }
    }
    else
    {

      uint64_t v6 = 0;
    }
    id v12 = +[NSString stringWithFormat:@"%d", v6];
    +[GEOAPPortal captureUserAction:2052 target:0 value:v12];
  }
  else
  {
    sub_100018584();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v13 oneFavorites];
    [v11 loadAllShortcutsWithHandler:&stru_101323B20];
  }
}

- (BOOL)editOnlyAddress
{
  return self->_editingModeType == 2;
}

- (BOOL)editOnlyLocation
{
  return self->_editingModeType == 3;
}

- (void)setContacts:(id)a3
{
}

- (MapsSuggestionsShortcutLike)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
}

- (BOOL)alreadySaved
{
  return self->_alreadySaved;
}

- (void)setAlreadySaved:(BOOL)a3
{
  self->_alreadySaved = a3;
}

- (BOOL)didResignTitleFocus
{
  return self->_didResignTitleFocus;
}

- (void)setDidResignTitleFocus:(BOOL)a3
{
  self->_didResignTitleFocus = a3;
}

- (BOOL)moveToPreferredIndexInFavorites
{
  return self->_moveToPreferredIndexInFavorites;
}

- (void)setMoveToPreferredIndexInFavorites:(BOOL)a3
{
  self->_moveToPreferredIndexInFavorites = a3;
}

- (int64_t)editingModeType
{
  return self->_editingModeType;
}

- (void)setEditingModeType:(int64_t)a3
{
  self->_editingModeType = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (MapsSuggestionsEntry)originalSuggestionsEntry
{
  return self->_originalSuggestionsEntry;
}

- (MapsSuggestionsShortcutLike)originalShortcut
{
  return self->_originalShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalShortcut, 0);
  objc_storeStrong((id *)&self->_originalSuggestionsEntry, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_storeStrong((id *)&self->_cachedShortcuts, 0);
}

@end