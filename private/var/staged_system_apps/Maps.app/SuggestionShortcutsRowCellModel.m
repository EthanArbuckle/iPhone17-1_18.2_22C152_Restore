@interface SuggestionShortcutsRowCellModel
- (BOOL)_shouldFetchMissingImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)vibrantBackground;
- (MapsSuggestionsEntry)entryLegacy;
- (SuggestionShortcutsRowCellModel)initWithMapsFavoriteItem:(id)a3;
- (SuggestionShortcutsRowCellModel)initWithMapsSuggestionsEntry:(id)a3;
- (_TtC4Maps16MapsFavoriteItem)entry;
- (id)_maps_diffableDataSourceIdentifier;
- (id)image;
- (id)subtitle;
- (id)subtitleColor;
- (id)title;
- (unint64_t)hash;
- (void)_fetchImageWithImageCount:(unint64_t)a3 retryCount:(unint64_t)a4;
- (void)_setFetchedImage:(id)a3;
- (void)_updateTitlesFromEntry;
- (void)dealloc;
- (void)fetchImage;
- (void)fetchImageIfMissing;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SuggestionShortcutsRowCellModel

- (unint64_t)hash
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v4 = 1;
  if (!v3) {
    uint64_t v4 = 0;
  }
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]);

  return (unint64_t)[v5 hash];
}

- (SuggestionShortcutsRowCellModel)initWithMapsFavoriteItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 uniqueIdentifier];
  id v7 = [v6 length];

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SuggestionShortcutsRowCellModel;
    v8 = [(SuggestionShortcutsRowCellModel *)&v15 init];
    v9 = v8;
    if (v8)
    {
      p_entry = (id *)&v8->_entry;
      objc_storeStrong((id *)&v8->_entry, a3);
      [*p_entry addObserver:v9 forKeyPath:@"title" options:0 context:off_1015DFBA8];
      [*p_entry addObserver:v9 forKeyPath:@"subtitle" options:0 context:off_1015DFBA8];
      [(SuggestionShortcutsRowCellModel *)v9 _updateTitlesFromEntry];
      v11 = +[GEOResourceManifestManager modernManager];
      [v11 addTileGroupObserver:v9 queue:&_dispatch_main_q];

      v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v9 selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:0];
    }
    self = v9;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateTitlesFromEntry
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    unsigned int v3 = [(MapsFavoriteItem *)self->_entry title];
    uint64_t v4 = (NSString *)[v3 copy];
    title = self->_title;
    self->_title = v4;

    [(MapsFavoriteItem *)self->_entry subtitle];
  }
  else
  {
    id v7 = [(MapsSuggestionsEntry *)self->_entryLegacy title];
    v8 = (NSString *)[v7 copy];
    v9 = self->_title;
    self->_title = v8;

    [(MapsSuggestionsEntry *)self->_entryLegacy subtitle];
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)[v11 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v6;
}

- (id)_maps_diffableDataSourceIdentifier
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v4 = 1;
  if (!v3) {
    uint64_t v4 = 0;
  }
  id v5 = [*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]) uniqueIdentifier];

  return v5;
}

- (void)_setFetchedImage:(id)a3
{
  id v5 = (UIImage *)a3;
  v6 = v5;
  if (self->_image != v5)
  {
    v9 = v5;
    unsigned __int8 v7 = -[UIImage isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      v8 = [(ShortcutsRowCellModel *)self observers];
      [v8 shortcutsRowCellModelDidUpdate:self];

      v6 = v9;
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SuggestionShortcutsRowCellModel *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (+[LibraryUIUtilities isMyPlacesEnabled]) {
      uint64_t v7 = 64;
    }
    else {
      uint64_t v7 = 56;
    }
    v9 = *(Class *)((char *)&self->super.super.isa + v7);
    uint64_t v10 = [(SuggestionShortcutsRowCellModel *)v6 entry];
    if (v9 == (void *)v10)
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      id v11 = (void *)v10;
      unsigned __int8 v8 = [v9 isEqual:v10];
      v9 = v11;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_fetchImageWithImageCount:(unint64_t)a3 retryCount:(unint64_t)a4
{
  if (a4 <= 4 && self->_imageCount == a3)
  {
    objc_initWeak(&location, self);
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      uint64_t v7 = +[MapsUIImageCache sharedCache];
      entry = self->_entry;
      BOOL v9 = [(SuggestionShortcutsRowCellModel *)self vibrantBackground];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000A6474;
      v18[3] = &unk_1012E8240;
      uint64_t v10 = v19;
      objc_copyWeak(v19, &location);
      v19[1] = (id)a3;
      [v7 getImageForRowFavorite:entry inverted:v9 completion:v18];
    }
    else
    {
      uint64_t v7 = +[MapsUIImageCache sharedCache];
      entryLegacy = self->_entryLegacy;
      BOOL v12 = [(SuggestionShortcutsRowCellModel *)self vibrantBackground];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1003CECE0;
      v16[3] = &unk_1012E8240;
      uint64_t v10 = v17;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a3;
      [v7 getImageForRowSuggestion:entryLegacy inverted:v12 completion:v16];
    }

    objc_destroyWeak(v10);
    dispatch_time_t v13 = dispatch_time(0, 5000000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003CEDE0;
    v14[3] = &unk_1012E8268;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    v15[2] = (id)a4;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)vibrantBackground
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v4 = 1;
  if (!v3) {
    uint64_t v4 = 0;
  }
  id v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4]);

  return [v5 hasVibrantBackground];
}

- (id)title
{
  return self->_title;
}

- (id)subtitle
{
  return self->_subtitle;
}

- (id)subtitleColor
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if (![(MapsFavoriteItem *)self->_entry isShortcutForSetup]) {
      goto LABEL_7;
    }
  }
  else if (![(MapsSuggestionsEntry *)self->_entryLegacy isShortcutForSetup])
  {
    goto LABEL_7;
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    unsigned int v3 = +[UIColor linkColor];
    goto LABEL_8;
  }
LABEL_7:
  unsigned int v3 = +[UIColor secondaryLabelColor];
LABEL_8:

  return v3;
}

- (id)image
{
  image = self->_image;
  if (!image)
  {
    [(SuggestionShortcutsRowCellModel *)self fetchImage];
    image = self->_image;
  }

  return image;
}

- (void)fetchImageIfMissing
{
  if ([(SuggestionShortcutsRowCellModel *)self _shouldFetchMissingImage])
  {
    unsigned int v3 = sub_1000AA148();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      title = self->_title;
      int v5 = 138412290;
      v6 = title;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Fetching missing icon for favorite '%@'", (uint8_t *)&v5, 0xCu);
    }

    [(SuggestionShortcutsRowCellModel *)self fetchImage];
  }
}

- (void)fetchImage
{
}

- (BOOL)_shouldFetchMissingImage
{
  if (self->_image) {
    return 0;
  }
  uint64_t v4 = [(ShortcutsRowCellModel *)self observers];
  int v5 = [v4 allObservers];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v11, "shortcutsRowCellModelShouldFetchMissingImage:", self, (void)v13) & 1) != 0)
        {
          BOOL v2 = 1;
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 0;
LABEL_14:

  return v2;
}

- (_TtC4Maps16MapsFavoriteItem)entry
{
  return self->_entry;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015DFBA8 == a6)
  {
    if (+[NSThread isMainThread])
    {
      [(SuggestionShortcutsRowCellModel *)self _updateTitlesFromEntry];
      id v7 = [(ShortcutsRowCellModel *)self observers];
      [v7 shortcutsRowCellModelDidUpdate:self];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A4E4;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SuggestionShortcutsRowCellModel;
    -[SuggestionShortcutsRowCellModel observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (SuggestionShortcutsRowCellModel)initWithMapsSuggestionsEntry:(id)a3
{
  id v5 = a3;
  id v6 = [v5 uniqueIdentifier];
  id v7 = [v6 length];

  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SuggestionShortcutsRowCellModel;
    objc_super v8 = [(SuggestionShortcutsRowCellModel *)&v15 init];
    uint64_t v9 = v8;
    if (v8)
    {
      p_entryLegacy = (id *)&v8->_entryLegacy;
      objc_storeStrong((id *)&v8->_entryLegacy, a3);
      [*p_entryLegacy addObserver:v9 forKeyPath:@"title" options:0 context:off_1015DFBA8];
      [*p_entryLegacy addObserver:v9 forKeyPath:@"subtitle" options:0 context:off_1015DFBA8];
      [(SuggestionShortcutsRowCellModel *)v9 _updateTitlesFromEntry];
      id v11 = +[GEOResourceManifestManager modernManager];
      [v11 addTileGroupObserver:v9 queue:&_dispatch_main_q];

      BOOL v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:v9 selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:0];
    }
    self = v9;
    long long v13 = self;
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v4 = 1;
  if (!v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = OBJC_IVAR___SuggestionShortcutsRowCellModel__entryLegacy[v4];
  [*(id *)((char *)&self->super.super.isa + v5) removeObserver:self forKeyPath:@"title" context:off_1015DFBA8];
  [*(id *)((char *)&self->super.super.isa + v5) removeObserver:self forKeyPath:@"subtitle" context:off_1015DFBA8];
  id v6 = +[GEOResourceManifestManager modernManager];
  [v6 removeTileGroupObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)SuggestionShortcutsRowCellModel;
  [(SuggestionShortcutsRowCellModel *)&v7 dealloc];
}

- (MapsSuggestionsEntry)entryLegacy
{
  return self->_entryLegacy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_entryLegacy, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end