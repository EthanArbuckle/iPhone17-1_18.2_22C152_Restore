@interface TileGroupSectionsDebugController
+ (id)navigationDestinationTitle;
- (BOOL)canChangeActiveTileGroup;
- (GEOResourceManifestDownload)resourceManifest;
- (TileGroupSectionsDebugController)initWithStyle:(int64_t)a3;
- (id)_tileGroup;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tileGroupIdentifier;
- (void)dealloc;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setCanChangeActiveTileGroup:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setResourceManifest:(id)a3;
- (void)setTileGroupIdentifier:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TileGroupSectionsDebugController

+ (id)navigationDestinationTitle
{
  return @"Tile Group Info";
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3 = [(TileGroupSectionsDebugController *)self tableView];
  [v3 reloadData];
}

- (TileGroupSectionsDebugController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TileGroupSectionsDebugController;
  id v3 = [(TileGroupSectionsDebugController *)&v6 initWithStyle:a3];
  if (v3)
  {
    v4 = +[GEOResourceManifestManager modernManager];
    [v4 addTileGroupObserver:v3 queue:&_dispatch_main_q];
  }
  return v3;
}

- (void)dealloc
{
  id v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TileGroupSectionsDebugController;
  [(MapsDebugValuesViewController *)&v4 dealloc];
}

- (id)_tileGroup
{
  id v3 = [(GEOResourceManifestDownload *)self->_resourceManifest resources];
  if (![v3 tileGroupsCount])
  {
LABEL_12:
    id v11 = 0;
    goto LABEL_15;
  }
  if ([(TileGroupSectionsDebugController *)self tileGroupIdentifier] != -1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v4 = [v3 tileGroups];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          unsigned int v10 = [v9 identifier];
          if ((id)[(TileGroupSectionsDebugController *)self tileGroupIdentifier] == (id)v10)
          {
            id v11 = v9;

            goto LABEL_15;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }
  id v11 = [v3 tileGroupAtIndex:0];
LABEL_15:

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_canChangeActiveTileGroup + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 || !self->_canChangeActiveTileGroup) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] || !self->_canChangeActiveTileGroup)
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"TileSetNavigationCell"];
    if (!v8) {
      id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"TileSetNavigationCell"];
    }
    [v8 setAccessoryType:1];
    id v9 = [v7 row];
    if (v9 == (id)1)
    {
      unsigned int v10 = [v8 textLabel];
      id v11 = v10;
      CFStringRef v12 = @"Layers";
    }
    else
    {
      if (v9) {
        goto LABEL_18;
      }
      unsigned int v10 = [v8 textLabel];
      id v11 = v10;
      CFStringRef v12 = @"Tile Sets";
    }
    [v10 setText:v12];
  }
  else
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    if ([(TileGroupSectionsDebugController *)self tileGroupIdentifier] < 0
      && !GEOConfigGetBOOL()
      || GEOConfigGetBOOL()
      && (int64_t v13 = [(TileGroupSectionsDebugController *)self tileGroupIdentifier],
          +[GEOResourceManifestManager modernManager],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 activeTileGroupIdentifier],
          v14,
          v13 == v15))
    {
      long long v16 = [v8 textLabel];
      [v16 setText:@"Active"];

      [v8 setSelectionStyle:0];
      v17 = +[UIColor secondaryLabelColor];
      v18 = [v8 textLabel];
      [v18 setTextColor:v17];
    }
    else
    {
      v19 = [v8 textLabel];
      [v19 setText:@"Make Active"];

      [v8 setSelectionStyle:1];
    }
    id v11 = [v8 textLabel];
    [v11 setTextAlignment:1];
  }

LABEL_18:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  [a3 deselectRowAtIndexPath:v16 animated:1];
  if ([v16 section] || !self->_canChangeActiveTileGroup)
  {
    id v6 = [v16 row];
    id v7 = v16;
    if (v6) {
      goto LABEL_12;
    }
    id v8 = [TileGroupTileSetsDebugController alloc];
    id v9 = [(TileGroupSectionsDebugController *)self tableView];
    unsigned int v10 = -[TileGroupTileSetsDebugController initWithStyle:](v8, "initWithStyle:", [v9 style]);

    [(TileGroupTileSetsDebugController *)v10 setTileGroupIdentifier:[(TileGroupSectionsDebugController *)self tileGroupIdentifier]];
    [(TileGroupTileSetsDebugController *)v10 setResourceManifest:self->_resourceManifest];
    [(TileGroupTileSetsDebugController *)v10 setTitle:@"Tile Sets"];
    id v11 = [(TileGroupSectionsDebugController *)self navigationItem];
    CFStringRef v12 = [v11 rightBarButtonItem];

    if (!v12)
    {
      int64_t v13 = [(TileGroupTileSetsDebugController *)v10 navigationItem];
      [v13 setRightBarButtonItem:0];
    }
    long long v14 = [(TileGroupSectionsDebugController *)self navigationController];
    [v14 pushViewController:v10 animated:1];
  }
  else
  {
    if ([(TileGroupSectionsDebugController *)self tileGroupIdentifier] < 0)
    {
      _GEOConfigRemoveValue();
      unsigned int v15 = +[GEOResourceManifestManager modernManager];
      [v15 resetActiveTileGroup];
    }
    else
    {
      GEOConfigSetBOOL();
      unsigned int v15 = +[GEOResourceManifestManager modernManager];
      [v15 setActiveTileGroupIdentifier:[self tileGroupIdentifier]];
    }

    unsigned int v10 = [(TileGroupSectionsDebugController *)self tableView];
    [(MapsDebugValuesViewController *)v10 reloadData];
  }

  id v7 = v16;
LABEL_12:
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)tileGroupIdentifier
{
  return self->tileGroupIdentifier;
}

- (void)setTileGroupIdentifier:(int64_t)a3
{
  self->tileGroupIdentifier = a3;
}

- (GEOResourceManifestDownload)resourceManifest
{
  return self->_resourceManifest;
}

- (void)setResourceManifest:(id)a3
{
}

- (BOOL)canChangeActiveTileGroup
{
  return self->_canChangeActiveTileGroup;
}

- (void)setCanChangeActiveTileGroup:(BOOL)a3
{
  self->_canChangeActiveTileGroup = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_resourceManifest, 0);
}

@end