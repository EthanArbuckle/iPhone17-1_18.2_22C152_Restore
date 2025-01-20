@interface EnvironmentInfoViewController
- (EnvironmentInfoViewController)initWithStyle:(int64_t)a3 environment:(id)a4 editable:(BOOL)a5;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_urlStringForIndexPath:(id)a3 isFromManifest:(BOOL *)a4 isFromOverrides:(BOOL *)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_beginEditing:(id)a3;
- (void)_endEditing:(id)a3;
- (void)_updateNavigationItem;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)urlCell:(id)a3 didChangeURLString:(id)a4;
@end

@implementation EnvironmentInfoViewController

- (EnvironmentInfoViewController)initWithStyle:(int64_t)a3 environment:(id)a4 editable:(BOOL)a5
{
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)EnvironmentInfoViewController;
  v10 = [(EnvironmentInfoViewController *)&v28 initWithStyle:a3];
  v11 = v10;
  if (v10)
  {
    v12 = [(EnvironmentInfoViewController *)v10 tableView];
    [v12 setRowHeight:UITableViewAutomaticDimension];

    v13 = [(EnvironmentInfoViewController *)v11 tableView];
    [v13 setSectionFooterHeight:UITableViewAutomaticDimension];

    v14 = [(EnvironmentInfoViewController *)v11 tableView];
    [v14 setSectionHeaderHeight:UITableViewAutomaticDimension];

    objc_storeStrong((id *)&v11->_environment, a4);
    v15 = [(GEOEnvironmentInfo *)v11->_environment displayName];
    [(EnvironmentInfoViewController *)v11 setTitle:v15];

    uint64_t v16 = [(GEOEnvironmentInfo *)v11->_environment serviceURLs];
    urlStrings = v11->_urlStrings;
    v11->_urlStrings = (NSDictionary *)v16;

    uint64_t v18 = [(GEOEnvironmentInfo *)v11->_environment useProxyAuth];
    proxyRequirements = v11->_proxyRequirements;
    v11->_proxyRequirements = (NSDictionary *)v18;

    v20 = [(NSDictionary *)v11->_urlStrings allKeys];
    uint64_t v21 = [v20 sortedArrayUsingComparator:&stru_101322390];
    urlTypes = v11->_urlTypes;
    v11->_urlTypes = (NSArray *)v21;

    v11->_editable = a5;
    v23 = [v9 overrideURLs];
    v24 = (NSMapTable *)[v23 copy];
    overrideURLs = v11->_overrideURLs;
    v11->_overrideURLs = v24;

    [(EnvironmentInfoViewController *)v11 _updateNavigationItem];
    v26 = v11;
  }

  return v11;
}

- (void)_updateNavigationItem
{
  if (self->_editable)
  {
    BOOL editing = self->_editing;
    id v4 = objc_alloc((Class)UIBarButtonItem);
    if (editing) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    v6 = &selRef__beginEditing_;
    if (editing) {
      v6 = &selRef__endEditing_;
    }
    id v8 = [v4 initWithBarButtonSystemItem:v5 target:self action:*v6];
  }
  else
  {
    id v8 = 0;
  }
  v7 = [(EnvironmentInfoViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (void)_beginEditing:(id)a3
{
  self->_BOOL editing = 1;
  [(EnvironmentInfoViewController *)self _updateNavigationItem];
  id v4 = [(EnvironmentInfoViewController *)self tableView];
  [v4 reloadData];
}

- (void)_endEditing:(id)a3
{
  self->_BOOL editing = 0;
  [(EnvironmentInfoViewController *)self _updateNavigationItem];
  id v4 = [(EnvironmentInfoViewController *)self tableView];
  [v4 reloadData];

  environment = self->_environment;
  overrideURLs = self->_overrideURLs;

  [(GEOEnvironmentInfo *)environment updateWithURLs:overrideURLs];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_urlStrings) {
    return (int64_t)[(NSArray *)self->_urlTypes count] + self->_editing;
  }
  else {
    return 0;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1 && !self->_editing) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_urlStringForIndexPath:(id)a3 isFromManifest:(BOOL *)a4 isFromOverrides:(BOOL *)a5
{
  id v8 = a3;
  if (((unint64_t)[v8 section] & 0x8000000000000000) != 0
    || (id v9 = [v8 section], v9 >= (id)-[NSDictionary count](self->_urlStrings, "count")))
  {
    v14 = 0;
    goto LABEL_12;
  }
  v10 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v8 section]);
  id v11 = [v10 integerValue];

  overrideURLs = self->_overrideURLs;
  v13 = +[NSNumber numberWithUnsignedInteger:v11];
  v14 = [(NSMapTable *)overrideURLs objectForKey:v13];

  id v15 = [v14 length];
  if (v15 || [v14 length])
  {
LABEL_7:
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  urlStrings = self->_urlStrings;
  v17 = +[NSNumber numberWithUnsignedInteger:v11];
  uint64_t v18 = [(NSDictionary *)urlStrings objectForKeyedSubscript:v17];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = GEOURLStringIgnoringManifest();

    goto LABEL_7;
  }
  BOOL v19 = 1;
  v14 = v18;
  if (a4) {
LABEL_8:
  }
    *a4 = v19;
LABEL_9:
  if (a5) {
    *a5 = v15 != 0;
  }
LABEL_12:

  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_editing && [(NSDictionary *)self->_urlStrings count] == a4)
  {
    v7 = 0;
  }
  else
  {
    id v8 = [(NSArray *)self->_urlTypes objectAtIndexedSubscript:a4];
    unint64_t v9 = (unint64_t)[v8 integerValue];

    if (v9 > 0x41) {
      v10 = 0;
    }
    else {
      v10 = off_1013223B0[v9];
    }
    proxyRequirements = self->_proxyRequirements;
    v12 = +[NSNumber numberWithUnsignedInteger:v9];
    v13 = [(NSDictionary *)proxyRequirements objectForKeyedSubscript:v12];
    unsigned int v14 = [v13 BOOLValue];

    id v15 = "NO";
    if (v14) {
      id v15 = "YES";
    }
    v7 = +[NSString stringWithFormat:@"%@ - Auth: %s", v10, v15];
  }

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (self->_editing
    || (-[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v5 section]),
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 integerValue],
        v8,
        v9 == (id)1)
    && [v6 row] == (id)1)
  {
    double v7 = UITableViewDefaultRowHeight;
  }
  else
  {
    uint64_t v10 = [(EnvironmentInfoViewController *)self _urlStringForIndexPath:v6 isFromManifest:0 isFromOverrides:0];
    if (v10) {
      id v11 = (__CFString *)v10;
    }
    else {
      id v11 = @"(none)";
    }
    v12 = +[NSParagraphStyle defaultParagraphStyle];
    id v13 = [v12 mutableCopy];

    [v13 setLineBreakMode:1];
    unsigned int v14 = [(EnvironmentInfoViewController *)self tableView];
    [v14 bounds];
    double v16 = v15 + -40.0;
    v28[0] = NSFontAttributeName;
    +[UIFont labelFontSize];
    v17 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    v28[1] = NSParagraphStyleAttributeName;
    v29[0] = v17;
    v29[1] = v13;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    -[__CFString boundingRectWithSize:options:attributes:context:](v11, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v16, 1.79769313e308);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v30.origin.x = v20;
    v30.origin.y = v22;
    v30.size.width = v24;
    v30.size.height = v26;
    double v7 = CGRectGetMaxY(v30) + 20.0;
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_editing)
  {
    id v9 = [v7 section];
    if (v9 == (id)[(NSArray *)self->_urlTypes count])
    {
      uint64_t v10 = (_EnvironmentURLTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      id v11 = +[UIColor systemRedColor];
      [(_EnvironmentURLTableViewCell *)v10 setBackgroundColor:v11];

      v12 = +[UIColor systemRedColor];
      id v13 = [v12 colorWithAlphaComponent:0.800000012];
      [(_EnvironmentURLTableViewCell *)v10 setSelectionTintColor:v13];

      unsigned int v14 = +[UIColor whiteColor];
      double v15 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v15 setTextColor:v14];

      double v16 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v16 setText:@"Delete Environment"];

      v17 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v17 setTextAlignment:1];
LABEL_4:

      goto LABEL_21;
    }
  }
  uint64_t v18 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v8 section]);
  id v19 = [v18 integerValue];

  if (self->_editing)
  {
    uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:@"EnvironmentInfoServiceURLEditingCell"];
    if (!v10) {
      uint64_t v10 = [[_EnvironmentURLTableViewCell alloc] initWithReuseIdentifier:@"EnvironmentInfoServiceURLEditingCell"];
    }
    [(_EnvironmentURLTableViewCell *)v10 setDelegate:self];
    __int16 v36 = 0;
    CGFloat v20 = [(EnvironmentInfoViewController *)self _urlStringForIndexPath:v8 isFromManifest:(char *)&v36 + 1 isFromOverrides:&v36];
    double v21 = [(_EnvironmentURLTableViewCell *)v10 editableTextField];
    [v21 setText:v20];

    [(_EnvironmentURLTableViewCell *)v10 setUrlType:v19];
  }
  else if (v19 == (id)1 && [v8 row] == (id)1)
  {
    uint64_t v10 = (_EnvironmentURLTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    CGFloat v22 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
    [v22 setText:@"Tile Groups"];

    [(_EnvironmentURLTableViewCell *)v10 setAccessoryType:1];
  }
  else
  {
    uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:@"EnvironmentInfoServiceURLCell"];
    if (!v10)
    {
      uint64_t v10 = (_EnvironmentURLTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"EnvironmentInfoServiceURLCell"];
      double v23 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v23 setLineBreakMode:1];

      CGFloat v24 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v24 setNumberOfLines:0];

      [(_EnvironmentURLTableViewCell *)v10 setSelectionStyle:0];
    }
    __int16 v35 = 0;
    double v25 = [(EnvironmentInfoViewController *)self _urlStringForIndexPath:v8 isFromManifest:(char *)&v35 + 1 isFromOverrides:&v35];
    CGFloat v26 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
    [v26 setText:v25];

    if ((_BYTE)v35)
    {
      uint64_t v27 = +[UIColor systemBlueColor];
    }
    else
    {
      if (HIBYTE(v35)) {
        +[UIColor purpleColor];
      }
      else {
      uint64_t v27 = +[UIColor labelColor];
      }
    }
    objc_super v28 = (void *)v27;
    v29 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
    [v29 setTextColor:v28];

    CGRect v30 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
    v31 = [v30 text];

    if (!v31)
    {
      v33 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v33 setText:@"(none)"];

      v17 = +[UIColor secondaryLabelColor];
      v34 = [(_EnvironmentURLTableViewCell *)v10 textLabel];
      [v34 setTextColor:v17];

      goto LABEL_4;
    }
  }
LABEL_21:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 < (id)[(NSArray *)self->_urlTypes count])
  {
    id v9 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v7 section]);
    id v10 = [v9 integerValue];

    if (v10 == (id)1 && [v7 row] == (id)1)
    {
      id v11 = [ActiveTileGroupDebugController alloc];
      v12 = [(GEOEnvironmentInfo *)self->_environment resourceManifest];
      id v13 = [(ActiveTileGroupDebugController *)v11 initWithResourceManifest:v12];

      unsigned int v14 = [(EnvironmentInfoViewController *)self navigationController];
      [v14 pushViewController:v13 animated:1];

LABEL_9:
      goto LABEL_10;
    }
  }
  if (self->_editing)
  {
    id v15 = [v7 section];
    if (v15 == (id)[(NSArray *)self->_urlTypes count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = +[UIAlertController alertControllerWithTitle:@"Delete Environment" message:@"Are you sure you want to delete this custom environment?" preferredStyle:0];
        double v16 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
        [(ActiveTileGroupDebugController *)v13 addAction:v16];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100D2411C;
        v18[3] = &unk_1012E6DE0;
        v18[4] = self;
        v17 = +[UIAlertAction actionWithTitle:@"Delete" style:2 handler:v18];
        [(ActiveTileGroupDebugController *)v13 addAction:v17];

        [(EnvironmentInfoViewController *)self presentViewController:v13 animated:1 completion:0];
        [v6 deselectRowAtIndexPath:v7 animated:1];
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (void)urlCell:(id)a3 didChangeURLString:(id)a4
{
  id v6 = a4;
  id v7 = [a3 urlType];
  overrideURLs = self->_overrideURLs;
  id v9 = +[NSNumber numberWithUnsignedInteger:v7];
  [(NSMapTable *)overrideURLs setObject:v6 forKey:v9];

  id v10 = [(EnvironmentInfoViewController *)self tableView];
  [v10 reloadData];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideURLs, 0);
  objc_storeStrong((id *)&self->_urlTypes, 0);
  objc_storeStrong((id *)&self->_proxyRequirements, 0);
  objc_storeStrong((id *)&self->_urlStrings, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end