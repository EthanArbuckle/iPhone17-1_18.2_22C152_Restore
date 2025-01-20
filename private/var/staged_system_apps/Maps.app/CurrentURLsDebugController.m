@interface CurrentURLsDebugController
+ (id)navigationDestinationTitle;
- (CurrentURLsDebugController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation CurrentURLsDebugController

+ (id)navigationDestinationTitle
{
  return @"Current URL Config";
}

- (CurrentURLsDebugController)init
{
  v39.receiver = self;
  v39.super_class = (Class)CurrentURLsDebugController;
  v2 = [(AuxiliaryDebugViewController *)&v39 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 300.0, 200.0];
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    +[UIFont systemFontSize];
    v5 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [v4 setFont:v5];

    [v4 setText:@"Where did a URL come from?"];
    [v4 setOpaque:0];
    [v4 setBackgroundColor:0];
    v6 = +[UIColor secondaryLabelColor];
    [v4 setTextColor:v6];

    [v4 sizeToFit];
    [v4 frame];
    double v8 = v7;
    double v10 = v9;
    [v3 bounds];
    float v12 = v11 - v8;
    [v4 setFrame:floorf(v12 * 0.5), 20.0, v8, v10];
    [v3 addSubview:v4];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    double v37 = 0.0;
    [v4 frame];
    double v37 = CGRectGetMaxY(v40) + 20.0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = sub_10088EE58;
    v32 = &unk_1012FE950;
    v34 = v38;
    v35 = v36;
    id v13 = v3;
    id v33 = v13;
    v14 = objc_retainBlock(&v29);
    v15 = +[UIColor labelColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Default", v15);

    v16 = +[UIColor purpleColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Resource Manifest", v16);

    v17 = +[UIColor systemBlueColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"User Defaults", v17);

    v18 = +[UIColor systemOrangeColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Network Defaults", v18);

    v19 = +[UIColor systemTealColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Remote Config", v19);

    v20 = +[UIColor systemRedColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Profile", v20);

    v21 = +[UIColor systemGreenColor];
    ((void (*)(void ***, const __CFString *, void *))v14[2])(v14, @"Custom Environment", v21);

    [v13 bounds];
    [v13 setBounds:0.0, 0.0];
    v22 = [(CurrentURLsDebugController *)v2 tableView];
    [v22 setTableHeaderView:v13];

    v23 = +[NSMutableArray array];
    for (unint64_t i = 0; i != 66; ++i)
    {
      if (i - 23 < 0x2B || i <= 0x15 && ((1 << i) & 0x3DDE27) != 0)
      {
        v25 = +[NSNumber numberWithUnsignedInteger:i];
        [(NSArray *)v23 addObject:v25];
      }
    }
    urlTypes = v2->_urlTypes;
    v2->_urlTypes = v23;

    v27 = v2;
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
  }
  return v2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_urlTypes count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0 || [(NSArray *)self->_urlTypes count] <= a4)
  {
    double v10 = 0;
  }
  else
  {
    double v7 = [(NSArray *)self->_urlTypes objectAtIndexedSubscript:a4];
    unint64_t v8 = (unint64_t)[v7 integerValue];

    if (v8 > 0x41) {
      double v9 = 0;
    }
    else {
      double v9 = off_1012FE9B0[v8];
    }
    int v11 = GEOURLNeedsAuthForURLType();
    float v12 = "NO";
    if (v11) {
      float v12 = "YES";
    }
    double v10 = +[NSString stringWithFormat:@"%@ - Auth: %s", v9, v12];
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (((unint64_t)[v7 section] & 0x8000000000000000) != 0
    || (id v8 = [v7 section], v8 >= (id)-[NSArray count](self->_urlTypes, "count")))
  {
    id v10 = 0;
  }
  else
  {
    double v9 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v7 section]);
    [v9 integerValue];

    id v10 = [v6 dequeueReusableCellWithIdentifier:@"URLDebugCell"];
    if (!v10)
    {
      id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"URLDebugCell"];
      int v11 = [v10 textLabel];
      [v11 setLineBreakMode:1];

      float v12 = [v10 textLabel];
      [v12 setNumberOfLines:0];

      [v10 setSelectionStyle:0];
      +[UIFont labelFontSize];
      id v13 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
      v14 = [v10 textLabel];
      [v14 setFont:v13];
    }
    GEOURLStringWithSource();
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v15 length]) {
      CFStringRef v16 = v15;
    }
    else {
      CFStringRef v16 = @"(none)";
    }
    v17 = [v10 textLabel];
    [v17 setText:v16];

    v18 = +[UIColor secondaryLabelColor];
    v19 = [v10 textLabel];
    [v19 setTextColor:v18];
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = 0.0;
  if (((unint64_t)[v5 section] & 0x8000000000000000) == 0)
  {
    id v7 = [v5 section];
    if (v7 < (id)[(NSArray *)self->_urlTypes count])
    {
      id v8 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v5 section]);
      [v8 integerValue];

      GEOURLString();
      double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (![(__CFString *)v9 length])
      {

        double v9 = @"(none)";
      }
      id v10 = +[NSParagraphStyle defaultParagraphStyle];
      id v11 = [v10 mutableCopy];

      [v11 setLineBreakMode:1];
      float v12 = [(CurrentURLsDebugController *)self tableView];
      [v12 bounds];
      double v14 = v13 + -40.0;
      v26[0] = NSFontAttributeName;
      +[UIFont labelFontSize];
      v15 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
      v26[1] = NSParagraphStyleAttributeName;
      v27[0] = v15;
      v27[1] = v11;
      CFStringRef v16 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      -[__CFString boundingRectWithSize:options:attributes:context:](v9, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v14, 1.79769313e308);
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;

      v28.origin.x = v18;
      v28.origin.y = v20;
      v28.size.width = v22;
      v28.size.height = v24;
      double v6 = CGRectGetMaxY(v28) + 20.0;
    }
  }

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (((unint64_t)[v6 section] & 0x8000000000000000) != 0
    || (id v7 = [v6 section], v7 >= (id)-[NSArray count](self->_urlTypes, "count")))
  {
    id v10 = 0;
  }
  else
  {
    id v8 = -[NSArray objectAtIndexedSubscript:](self->_urlTypes, "objectAtIndexedSubscript:", [v6 section]);
    [v8 integerValue];

    GEOURLString();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10088F6E4;
    v12[3] = &unk_1012F1000;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v13;
    id v10 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:&stru_1012FE990 actionProvider:v12];
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end