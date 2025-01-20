@interface ServiceURLsDebugController
+ (id)navigationDestinationTitle;
- (ServiceURLsDebugController)init;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation ServiceURLsDebugController

+ (id)navigationDestinationTitle
{
  return @"Service URLs";
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v3 = [(ServiceURLsDebugController *)self tableView];
  [v3 reloadData];
}

- (ServiceURLsDebugController)init
{
  v16.receiver = self;
  v16.super_class = (Class)ServiceURLsDebugController;
  v2 = [(AuxiliaryDebugViewController *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[ServiceURLList defaultServiceURLLists];
    serviceURLs = v2->_serviceURLs;
    v2->_serviceURLs = (NSArray *)v3;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = v2->_serviceURLs;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) defaultsKey:v12];
          _GEOConfigAddDelegateListenerForKey();
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }

    v10 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)ServiceURLsDebugController;
  [(MapsDebugValuesViewController *)&v3 dealloc];
}

- (id)title
{
  return @"Service URLs";
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_serviceURLs count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_serviceURLs objectAtIndexedSubscript:a4];
  v5 = (char *)[v4 count] + 2;

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_serviceURLs objectAtIndexedSubscript:a4];
  v5 = [v4 serviceName];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_101324E70;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ServiceURLCell"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"ServiceURLCell"];
  }
  [v7 setAccessoryView:0];
  uint64_t v8 = [v7 detailTextLabel];
  [v8 setText:0];

  v9 = -[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", [v6 section]);
  [v9 defaultsKey];
  v10 = GEOConfigGetValueWithSourceString();
  if ([v6 row])
  {
    v11 = (char *)[v6 row] - 1;
    if (v11 < [v9 count])
    {
      long long v12 = [v9 nameAtIndex:((char *)[v6 row]) - 1];
      long long v13 = [v7 textLabel];
      [v13 setText:v12];

      long long v14 = [v9 URLAtIndex:[v6 row] - 1];
      long long v15 = [v7 detailTextLabel];
      [v15 setText:v14];

      if (v10)
      {
        if ([v14 isEqualToString:v10]) {
          uint64_t v16 = 3;
        }
        else {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      [v7 setAccessoryType:v16];

      goto LABEL_26;
    }
    v20 = [v7 textLabel];
    [v20 setText:@"Custom"];

    int v21 = 0;
    if ([v9 count])
    {
      unint64_t v22 = 0;
      do
      {
        v23 = [v9 URLAtIndex:v22];
        v24 = v23;
        if (v10) {
          unsigned int v25 = [v23 isEqualToString:v10];
        }
        else {
          unsigned int v25 = 0;
        }
        v21 &= v25 ^ 1;

        ++v22;
      }
      while (v22 < (unint64_t)[v9 count]);
    }
    v26 = [v7 detailTextLabel];
    v27 = v26;
    if (v21) {
      v28 = v10;
    }
    else {
      v28 = 0;
    }
    if (v21) {
      uint64_t v29 = 3;
    }
    else {
      uint64_t v29 = 0;
    }
    [v26 setText:v28];

    v19 = v7;
    uint64_t v18 = v29;
  }
  else
  {
    v17 = [v7 textLabel];
    [v17 setText:@"Default"];

    uint64_t v18 = 3;
    v19 = v7;
  }
  [v19 setAccessoryType:v18];
LABEL_26:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v22 = a4;
  [a3 deselectRowAtIndexPath:v22 animated:1];
  id v6 = -[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", [v22 section]);
  if ([v22 row])
  {
    id v7 = (char *)[v22 row] - 1;
    if (v7 >= [v6 count])
    {
      long long v15 = [CustomServiceURLDebugController alloc];
      uint64_t v16 = [(ServiceURLsDebugController *)self tableView];
      uint64_t v8 = -[CustomServiceURLDebugController initWithStyle:](v15, "initWithStyle:", [v16 style]);

      id v17 = [v6 defaultsKey];
      -[CustomServiceURLDebugController setDefaultsKey:](v8, "setDefaultsKey:", v17, v18);
      v19 = [v6 defaultCustomURLString];
      [(CustomServiceURLDebugController *)v8 setDefaultURLString:v19];

      v20 = [v6 callback];
      [(CustomServiceURLDebugController *)v8 setCallback:v20];

      int v21 = [(ServiceURLsDebugController *)self navigationController];
      [v21 pushViewController:v8 animated:1];
    }
    else
    {
      [v6 URLAtIndex:[v22 row] - 1];
      uint64_t v8 = (CustomServiceURLDebugController *)objc_claimAutoreleasedReturnValue();
      v9 = [v6 infoAtIndex:[v22 row] - 1];
      [v6 defaultsKey];
      GEOConfigSetString();
      v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:GEOCountryConfigurationProvidersDidChangeNotification object:self userInfo:0];

      v11 = [v6 callback];

      if (v11)
      {
        long long v12 = [v6 callback];
        ((void (**)(void, CustomServiceURLDebugController *, void *))v12)[2](v12, v8, v9);
      }
    }
  }
  else
  {
    [v6 defaultsKey];
    _GEOConfigRemoveValue();
    long long v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:GEOCountryConfigurationProvidersDidChangeNotification object:self userInfo:0];

    long long v14 = [v6 callback];

    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v8 = [v6 callback];
    (*(void (**)(CustomServiceURLDebugController *, void, void))&v8->_defaultsKey.key.identifier)(v8, 0, 0);
  }

LABEL_10:
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceURLs, 0);
}

@end