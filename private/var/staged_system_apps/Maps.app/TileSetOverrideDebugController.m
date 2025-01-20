@interface TileSetOverrideDebugController
+ (id)navigationDestinationTitle;
- (NSString)baseURL;
- (NSString)localizationURL;
- (TileSetOverrideDebugController)initWithStyle:(int64_t)a3;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int)scale;
- (int)size;
- (int)style;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unsigned)version;
- (void)_reloadTileSetBeingOverridden;
- (void)dealloc;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizationURL:(id)a3;
- (void)setScale:(int)a3;
- (void)setSize:(int)a3;
- (void)setStyle:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TileSetOverrideDebugController

+ (id)navigationDestinationTitle
{
  return @"Overrides";
}

- (void)setVersion:(unsigned int)a3
{
  self->_hasOverrideVersion = 1;
  self->_version = a3;
}

- (TileSetOverrideDebugController)initWithStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TileSetOverrideDebugController;
  v3 = [(TileSetOverrideDebugController *)&v16 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    v3->_style = 1;
    v3->_scale = 0;
    v3->_size = 2;
    v5 = (UITextField *)objc_alloc_init((Class)UITextField);
    versionTextField = v4->_versionTextField;
    v4->_versionTextField = v5;

    [(UITextField *)v4->_versionTextField setAutoresizingMask:18];
    v7 = +[UIColor clearColor];
    [(UITextField *)v4->_versionTextField setBackgroundColor:v7];

    [(UITextField *)v4->_versionTextField setAutocorrectionType:1];
    [(UITextField *)v4->_versionTextField setAutocapitalizationType:0];
    [(UITextField *)v4->_versionTextField setKeyboardType:4];
    [(UITextField *)v4->_versionTextField setReturnKeyType:9];
    [(UITextField *)v4->_versionTextField setClearButtonMode:1];
    [(UITextField *)v4->_versionTextField setDelegate:v4];
    v8 = (UITextField *)objc_alloc_init((Class)UITextField);
    baseURLTextField = v4->_baseURLTextField;
    v4->_baseURLTextField = v8;

    [(UITextField *)v4->_baseURLTextField setAutoresizingMask:18];
    v10 = +[UIColor clearColor];
    [(UITextField *)v4->_baseURLTextField setBackgroundColor:v10];

    [(UITextField *)v4->_baseURLTextField setAutocorrectionType:1];
    [(UITextField *)v4->_baseURLTextField setAutocapitalizationType:0];
    [(UITextField *)v4->_baseURLTextField setKeyboardType:3];
    [(UITextField *)v4->_baseURLTextField setReturnKeyType:9];
    [(UITextField *)v4->_baseURLTextField setClearButtonMode:1];
    [(UITextField *)v4->_baseURLTextField setDelegate:v4];
    v11 = (UITextField *)objc_alloc_init((Class)UITextField);
    localizationURLTextField = v4->_localizationURLTextField;
    v4->_localizationURLTextField = v11;

    [(UITextField *)v4->_localizationURLTextField setAutoresizingMask:18];
    v13 = +[UIColor clearColor];
    [(UITextField *)v4->_localizationURLTextField setBackgroundColor:v13];

    [(UITextField *)v4->_localizationURLTextField setAutocorrectionType:1];
    [(UITextField *)v4->_localizationURLTextField setAutocapitalizationType:0];
    [(UITextField *)v4->_localizationURLTextField setKeyboardType:3];
    [(UITextField *)v4->_localizationURLTextField setReturnKeyType:9];
    [(UITextField *)v4->_localizationURLTextField setClearButtonMode:1];
    [(UITextField *)v4->_localizationURLTextField setDelegate:v4];
    [(TileSetOverrideDebugController *)v4 _reloadTileSetBeingOverridden];
    v14 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(UITextField *)self->_versionTextField setDelegate:0];
  [(UITextField *)self->_baseURLTextField setDelegate:0];
  [(UITextField *)self->_localizationURLTextField setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TileSetOverrideDebugController;
  [(MapsDebugValuesViewController *)&v3 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 5) {
    return 0;
  }
  else {
    return *(&off_1012F72A8 + a4);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 6) {
    return 0;
  }
  else {
    return qword_100F71CC8[a4];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (id)6)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    id v9 = [v7 row];
    v10 = [v8 textLabel];
    v11 = v10;
    if (v9) {
      CFStringRef v12 = @"Remove Override";
    }
    else {
      CFStringRef v12 = @"Apply Override";
    }
    [v10 setText:v12];

    v13 = [v8 textLabel];
    [v13 setTextAlignment:1];
LABEL_6:

    goto LABEL_20;
  }
  if ([v7 section] == (id)3)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    [v8 setAccessoryType:0];
    [v8 setSelectionStyle:0];
    uint64_t v14 = 104;
    versionTextField = self->_versionTextField;
    if (self->_hasOverrideVersion)
    {
      objc_super v16 = +[NSString stringWithFormat:@"%i", self->_version];
      [(UITextField *)versionTextField setText:v16];
    }
    else
    {
      [(UITextField *)self->_versionTextField setText:0];
    }
    baseURLTextField = self->_versionTextField;
    tileSetBeingOverridden = self->_tileSetBeingOverridden;
    if (!tileSetBeingOverridden)
    {
      [(UITextField *)self->_versionTextField setPlaceholder:0];
      goto LABEL_19;
    }
    uint64_t v18 = +[NSString stringWithFormat:@"%i", [(GEOActiveTileSet *)tileSetBeingOverridden version]];
LABEL_17:
    v20 = (void *)v18;
    [(UITextField *)baseURLTextField setPlaceholder:v18];

LABEL_19:
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v14) sizeToFit];
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v14) frame];
    double v22 = v21;
    v23 = [v8 contentView];
    [v23 bounds];
    double v25 = v24 + -12.0;

    v26 = [v8 contentView];
    [v26 bounds];
    double v28 = (v27 - v25) * 0.5;

    v29 = [v8 contentView];
    [v29 bounds];
    double v31 = (v30 - v22) * 0.5;

    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v14) setFrame:v28, v31, v25, v22];
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v14) removeFromSuperview];
    v32 = [v8 contentView];
    [v32 addSubview:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v14)];

    goto LABEL_20;
  }
  if ([v7 section] == (id)4)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    [v8 setAccessoryType:0];
    [v8 setSelectionStyle:0];
    uint64_t v14 = 112;
    [(UITextField *)self->_baseURLTextField setText:self->_baseURL];
    baseURLTextField = self->_baseURLTextField;
    uint64_t v18 = [(GEOActiveTileSet *)self->_tileSetBeingOverridden baseURL];
    goto LABEL_17;
  }
  if ([v7 section] == (id)5)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    [v8 setAccessoryType:0];
    [v8 setSelectionStyle:0];
    uint64_t v14 = 120;
    [(UITextField *)self->_localizationURLTextField setText:self->_localizationURL];
    baseURLTextField = self->_localizationURLTextField;
    uint64_t v18 = [(GEOActiveTileSet *)self->_tileSetBeingOverridden localizationURL];
    goto LABEL_17;
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"TileSetInfoCell"];
  if (!v8) {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"TileSetInfoCell"];
  }
  switch((unint64_t)[v7 section])
  {
    case 0uLL:
      unint64_t v34 = (unint64_t)[v7 row];
      if (v34 >= 0x1E)
      {
        int v35 = -1;
        v36 = +[NSString stringWithFormat:@"(unknown: %i)", 0xFFFFFFFFLL];
      }
      else
      {
        int v35 = dword_100F71D00[v34];
        v36 = *(&off_1012F72D8 + v34);
      }
      v42 = [v8 textLabel];
      [v42 setText:v36];

      uint64_t v43 = 140;
      goto LABEL_39;
    case 1uLL:
      id v37 = [v7 row];
      if ((unint64_t)v37 >= 3)
      {
        int v35 = -1;
        v38 = +[NSString stringWithFormat:@"(unknown: %i)", 0xFFFFFFFFLL];
      }
      else
      {
        v38 = *(&off_1012F73C8 + (void)v37);
        int v35 = (int)v37;
      }
      v44 = [v8 textLabel];
      [v44 setText:v38];

      uint64_t v43 = 144;
      goto LABEL_39;
    case 2uLL:
      id v39 = [v7 row];
      if ((unint64_t)v39 >= 3)
      {
        int v35 = -1;
        v40 = +[NSString stringWithFormat:@"(unknown: %i)", 0xFFFFFFFFLL];
      }
      else
      {
        v40 = *(&off_1012F73E0 + (void)v39);
        int v35 = (int)v39;
      }
      v45 = [v8 textLabel];
      [v45 setText:v40];

      uint64_t v43 = 148;
LABEL_39:
      if (*(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + v43) == v35) {
        uint64_t v46 = 3;
      }
      else {
        uint64_t v46 = 0;
      }
      [v8 setAccessoryType:v46];
      break;
    case 3uLL:
      v13 = +[NSString stringWithFormat:@"%i", self->_version];
      v41 = [v8 textLabel];
      [v41 setText:v13];

      goto LABEL_6;
    default:
      break;
  }
LABEL_20:

  return v8;
}

- (void)_reloadTileSetBeingOverridden
{
  tileSetBeingOverridden = self->_tileSetBeingOverridden;
  self->_tileSetBeingOverridden = 0;

  v4 = +[GEOResourceManifestManager modernManager];
  v5 = [v4 activeTileGroup];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 tileSets];
  id v7 = (GEOActiveTileSet *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    v13 = v5;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (GEOActiveTileSet *)((char *)i + 1))
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 style] == self->_style
          && [v10 scale] == self->_scale
          && [v10 size] == self->_size)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (GEOActiveTileSet *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
LABEL_13:
    v5 = v13;
  }

  v11 = self->_tileSetBeingOverridden;
  self->_tileSetBeingOverridden = v7;

  CFStringRef v12 = [(TileSetOverrideDebugController *)self tableView];
  [v12 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UITextField *)self->_versionTextField resignFirstResponder];
  [(UITextField *)self->_baseURLTextField resignFirstResponder];
  [(UITextField *)self->_localizationURLTextField resignFirstResponder];
  switch((unint64_t)[v7 section])
  {
    case 0uLL:
      unint64_t v8 = (unint64_t)[v7 row];
      if (v8 > 0x1D) {
        int v9 = -1;
      }
      else {
        int v9 = dword_100F71D00[v8];
      }
      uint64_t v11 = 140;
      goto LABEL_40;
    case 1uLL:
      id v13 = [v7 row];
      if ((unint64_t)v13 >= 3) {
        int v9 = -1;
      }
      else {
        int v9 = (int)v13;
      }
      uint64_t v11 = 144;
      goto LABEL_40;
    case 2uLL:
      id v10 = [v7 row];
      if ((unint64_t)v10 >= 3) {
        int v9 = -1;
      }
      else {
        int v9 = (int)v10;
      }
      uint64_t v11 = 148;
LABEL_40:
      *(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + v11) = v9;
      [(TileSetOverrideDebugController *)self _reloadTileSetBeingOverridden];
      break;
    case 3uLL:
      versionTextField = self->_versionTextField;
      goto LABEL_15;
    case 4uLL:
      versionTextField = self->_baseURLTextField;
      goto LABEL_15;
    case 5uLL:
      versionTextField = self->_localizationURLTextField;
LABEL_15:
      [(UITextField *)versionTextField becomeFirstResponder];
      break;
    case 6uLL:
      v38 = v7;
      id v39 = v6;
      long long v14 = GEOConfigGetArray();
      v40 = +[NSMutableArray arrayWithArray:v14];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v14;
      id v15 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      uint64_t v43 = self;
      if (v15)
      {
        id v16 = v15;
        uint64_t v42 = *(void *)v45;
        uint64_t v17 = GEOActiveTileGroupOverrideStyleKey;
        uint64_t v18 = GEOActiveTileGroupOverrideSizeKey;
        uint64_t v19 = GEOActiveTileGroupOverrideScaleKey;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v45 != v42) {
              objc_enumerationMutation(obj);
            }
            double v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            double v22 = [v21 objectForKeyedSubscript:v17, v38];
            unsigned int v23 = [v22 intValue];

            double v24 = [v21 objectForKeyedSubscript:v18];
            unsigned int v25 = [v24 intValue];

            v26 = [v21 objectForKeyedSubscript:v19];
            unsigned int v27 = [v26 intValue];

            self = v43;
            if (v23 == v43->_style && v25 == v43->_size && v27 == v43->_scale) {
              [v40 removeObject:v21];
            }
          }
          id v16 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v16);
      }

      id v7 = v38;
      double v28 = v40;
      if (![v38 row])
      {
        v48[0] = GEOActiveTileGroupOverrideStyleKey;
        v29 = +[NSNumber numberWithInt:self->_style];
        v49[0] = v29;
        v48[1] = GEOActiveTileGroupOverrideSizeKey;
        double v30 = +[NSNumber numberWithInt:self->_size];
        v49[1] = v30;
        v48[2] = GEOActiveTileGroupOverrideScaleKey;
        double v31 = +[NSNumber numberWithInt:self->_scale];
        v49[2] = v31;
        v32 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
        v33 = +[NSMutableDictionary dictionaryWithDictionary:v32];

        self = v43;
        if (v43->_hasOverrideVersion)
        {
          unint64_t v34 = +[NSNumber numberWithUnsignedInt:v43->_version];
          [v33 setObject:v34 forKeyedSubscript:GEOActiveTileGroupOverrideVersionKey];
        }
        if ([(NSString *)v43->_baseURL length]) {
          [v33 setObject:v43->_baseURL forKeyedSubscript:GEOActiveTileGroupOverrideBaseURLKey];
        }
        if ([(NSString *)v43->_localizationURL length]) {
          [v33 setObject:v43->_localizationURL forKeyedSubscript:GEOActiveTileGroupOverrideLocalizationURLKey];
        }
        [v40 addObject:v33];
      }
      id v6 = v39;
      if (!objc_msgSend(v40, "count", v38))
      {

        double v28 = 0;
      }
      GEOConfigSetArray();
      int v35 = +[NSNotificationCenter defaultCenter];
      [v35 postNotificationName:@"ActiveTileGroupOverridesDidChangeNotification" object:0];

      v36 = [(TileSetOverrideDebugController *)self navigationController];
      id v37 = [v36 popViewControllerAnimated:1];

      break;
    default:
      break;
  }
  [v6 reloadData];
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = (UITextField *)a3;
  if (self->_versionTextField == v4)
  {
    unint64_t v8 = v4;
    id v6 = [(UITextField *)v4 text];
    if ([v6 length])
    {
      self->_hasOverrideVersion = 1;
      self->_version = [v6 intValue];
      [(UITextField *)v8 resignFirstResponder];
      id v7 = [(TileSetOverrideDebugController *)self tableView];
      [v7 reloadData];
    }
    else
    {
      self->_hasOverrideVersion = 0;
    }
  }
  else
  {
    if (self->_baseURLTextField == v4)
    {
      unint64_t v8 = v4;
      v5 = [(UITextField *)v4 text];
      [(TileSetOverrideDebugController *)self setBaseURL:v5];
    }
    else
    {
      if (self->_localizationURLTextField != v4) {
        goto LABEL_11;
      }
      unint64_t v8 = v4;
      v5 = [(UITextField *)v4 text];
      [(TileSetOverrideDebugController *)self setLocalizationURL:v5];
    }

    [(UITextField *)v8 resignFirstResponder];
    id v6 = [(TileSetOverrideDebugController *)self tableView];
    [v6 reloadData];
  }

  v4 = v8;
LABEL_11:
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

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  self->_size = a3;
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)localizationURL
{
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileSetBeingOverridden, 0);
  objc_storeStrong((id *)&self->_localizationURLTextField, 0);
  objc_storeStrong((id *)&self->_baseURLTextField, 0);

  objc_storeStrong((id *)&self->_versionTextField, 0);
}

@end