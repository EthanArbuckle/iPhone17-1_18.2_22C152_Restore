@interface GEOConfigKeysDebugController
- (GEOConfigKeysDebugController)initWithName:(id)a3 geoConfigDebugClass:(Class)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9;
- (id)addRowForArray:(id)a3 withName:(id)a4 inSection:(id)a5;
- (id)addRowForDictionary:(id)a3 withName:(id)a4 inSection:(id)a5;
- (id)addRowForSet:(id)a3 withName:(id)a4 inSection:(id)a5;
- (id)addRowNamed:(id)a3 forValue:(id)a4 inSection:(id)a5;
- (id)addSelectionRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7;
- (id)addSliderRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)addGEOConfigRowsInSection:(id)a3;
@end

@implementation GEOConfigKeysDebugController

- (GEOConfigKeysDebugController)initWithName:(id)a3 geoConfigDebugClass:(Class)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOConfigKeysDebugController;
  v7 = [(MapsDebugValuesViewController *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_configClass = a4;
    objc_initWeak(&location, v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1007C5A38;
    v10[3] = &unk_1012F8EA8;
    id v11 = v6;
    objc_copyWeak(&v12, &location);
    [(MapsDebugValuesViewController *)v8 setPrepareContentBlock:v10];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)addGEOConfigRowsInSection:(id)a3
{
  id v4 = a3;
  v5 = [(objc_class *)self->_configClass configKeyInfos];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007C5C18;
  v7[3] = &unk_1012F8EF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)addSelectionRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_1007C6020;
  v27 = &unk_1012F8F70;
  id v14 = v12;
  id v28 = v14;
  id v15 = v11;
  id v29 = v15;
  id v16 = v13;
  id v30 = v16;
  v17 = [a7 addNavigationRowWithTitle:v14 viewControllerContent:&v24];
  [v15 key];
  v18 = _GEOConfigGetDecodedValueWithSource();
  v19 = v18;
  if (a5 == 2)
  {
    unsigned int v20 = [v18 BOOLValue];
    v21 = "NO";
    if (v20) {
      v21 = "YES";
    }
    +[NSString stringWithFormat:@"current: %s", v21, v24, v25, v26, v27];
  }
  else
  {
    +[NSString stringWithFormat:@"current: %@", v18, v24, v25, v26, v27];
  v22 = };
  [v17 setSubtitle:v22];

  return v17;
}

- (id)addSliderRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  id v15 = [v14 key];
  uint64_t v17 = v16;
  v18 = [v14 debugControlOptions];
  v19 = [v18 objectForKeyedSubscript:@"subtitle_format"];

  unsigned int v20 = [v14 debugControlOptions];
  v21 = [v20 objectForKeyedSubscript:@"min"];

  v22 = [v14 debugControlOptions];

  v23 = [v22 objectForKeyedSubscript:@"max"];

  switch(a5)
  {
    case 3uLL:
      if (v19) {
        CFStringRef v24 = v19;
      }
      else {
        CFStringRef v24 = @"%.0f";
      }
      uint64_t v25 = [v13 addSliderRowWithTitle:v11 subtitleStringFormat:v24 min:[v21 integerValue] max:[v23 integerValue] geoConfigKeyInteger:v15 changeHandler:v17];
      goto LABEL_19;
    case 4uLL:
      if (v19) {
        CFStringRef v27 = v19;
      }
      else {
        CFStringRef v27 = @"%.0f";
      }
      uint64_t v25 = [v13 addSliderRowWithTitle:v11 subtitleStringFormat:v27 min:[v21 unsignedIntegerValue] max:[v23 unsignedIntegerValue] geoConfigKeyUInteger:v15 changeHandler:v17];
      goto LABEL_19;
    case 5uLL:
      if (v19) {
        CFStringRef v28 = v19;
      }
      else {
        CFStringRef v28 = @"%.0f";
      }
      uint64_t v25 = [v13 addSliderRowWithTitle:v11 subtitleStringFormat:v28 min:[v21 unsignedLongLongValue] max:[v23 unsignedLongLongValue] geoConfigKeyUint64:v15 changeHandler:0];
      goto LABEL_19;
    case 6uLL:
      if (v19) {
        CFStringRef v29 = v19;
      }
      else {
        CFStringRef v29 = @"%.2f";
      }
      [v21 doubleValue];
      double v31 = v30;
      [v23 doubleValue];
      uint64_t v25 = [v13 addSliderRowWithTitle:v11 subtitleStringFormat:v29 min:v15 max:v17 geoConfigKeyDouble:0 changeHandler:v31 v32];
LABEL_19:
      v26 = (void *)v25;
      break;
    default:
      v26 = 0;
      break;
  }
  v33 = +[NSString stringWithFormat:@"(default: %@)", v12];
  [v26 setSubtitle:v33];

  return v26;
}

- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9
{
  id v13 = a4;
  id v14 = a7;
  id v15 = a9;
  id v16 = [a3 key];
  uint64_t v18 = v17;
  v19 = [v14 description];
  if (v14)
  {
    unsigned int v20 = [v14 description];
  }
  else
  {
    unsigned int v20 = @"(nil)";
  }
  switch(a6)
  {
    case 1uLL:
      uint64_t v21 = [v15 addGEOTextFieldRowWithTitle:v13 placeholderText:v19 inputType:3 geoConfigKeyString:v16];
      goto LABEL_17;
    case 2uLL:
      v22 = [v15 addSwitchRowWithTitle:v13 geoConfigKey:v16];
      unsigned int v23 = [v14 BOOLValue];
      CFStringRef v24 = @"NO";
      if (v23) {
        CFStringRef v24 = @"YES";
      }
      uint64_t v25 = v24;

      unsigned int v20 = v25;
      break;
    case 3uLL:
      uint64_t v21 = [v15 addGEOTextFieldRowWithTitle:v13 placeholderText:v19 inputType:1 geoConfigKeyInteger:v16 v18];
      goto LABEL_17;
    case 4uLL:
      uint64_t v21 = [v15 addGEOTextFieldRowWithTitle:v13 placeholderText:v19 inputType:1 geoConfigKeyUInteger:v16 v18];
      goto LABEL_17;
    case 5uLL:
      uint64_t v21 = [v15 addGEOTextFieldRowWithTitle:v13 placeholderText:v19 inputType:1 geoConfigKeyUint64:v16 v18];
      goto LABEL_17;
    case 6uLL:
      uint64_t v21 = [v15 addGEOTextFieldRowWithTitle:v13 placeholderText:v19 inputType:2 geoConfigKeyDouble:v16];
      goto LABEL_17;
    case 7uLL:
      v26 = GEOConfigGetArray();
      uint64_t v27 = [(GEOConfigKeysDebugController *)self addRowForArray:v26 withName:v13 inSection:v15];
      goto LABEL_19;
    case 8uLL:
      v26 = GEOConfigGetSet();
      uint64_t v27 = [(GEOConfigKeysDebugController *)self addRowForSet:v26 withName:v13 inSection:v15];
      goto LABEL_19;
    case 9uLL:
      v26 = GEOConfigGetDictionary();
      uint64_t v27 = [(GEOConfigKeysDebugController *)self addRowForDictionary:v26 withName:v13 inSection:v15];
LABEL_19:
      v22 = (void *)v27;

      break;
    case 0xAuLL:
      uint64_t v21 = [v15 addGEODateFieldRowWithTitle:v13 placeholderText:v19 geoConfigKeyDate:v16];
LABEL_17:
      v22 = (void *)v21;
      break;
    default:
      v22 = 0;
      break;
  }
  CFStringRef v28 = +[NSString stringWithFormat:@"(default: %@)", v20];
  [v22 setSubtitle:v28];

  return v22;
}

- (id)addRowNamed:(id)a3 forValue:(id)a4 inSection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(GEOConfigKeysDebugController *)self addRowForArray:v9 withName:v8 inSection:v10];
LABEL_7:
    id v12 = (void *)v11;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(GEOConfigKeysDebugController *)self addRowForSet:v9 withName:v8 inSection:v10];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(GEOConfigKeysDebugController *)self addRowForDictionary:v9 withName:v8 inSection:v10];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v9;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
    }
    id v14 = [v9 description];
  }
  id v15 = v14;
  id v12 = [v10 addReadOnlyRowWithTitle:v8 value:v14];

LABEL_8:

  return v12;
}

- (id)addRowForArray:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007C6BCC;
  v13[3] = &unk_1012F8F70;
  id v14 = a4;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  id v10 = v14;
  uint64_t v11 = [a5 addNavigationRowWithTitle:v10 viewControllerContent:v13];

  return v11;
}

- (id)addRowForSet:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007C6E90;
  v13[3] = &unk_1012F8F70;
  id v14 = a4;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  id v10 = v14;
  uint64_t v11 = [a5 addNavigationRowWithTitle:v10 viewControllerContent:v13];

  return v11;
}

- (id)addRowForDictionary:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007C710C;
  v13[3] = &unk_1012F8F70;
  id v14 = a4;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  id v10 = v14;
  uint64_t v11 = [a5 addNavigationRowWithTitle:v10 viewControllerContent:v13];

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOConfigKeysDebugController;
  id v4 = [(GEOConfigKeysDebugController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 textLabel];
  [v5 setNumberOfLines:2];

  id v6 = [v4 textLabel];
  [v6 setLineBreakMode:0];

  return v4;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  Class configClass = self->_configClass;
  id v8 = a4;
  id v9 = [(objc_class *)configClass configKeyInfos];
  id v10 = [v8 row];

  uint64_t v11 = [v9 objectAtIndexedSubscript:v10];

  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  unsigned int v20 = sub_1007C74C8;
  uint64_t v21 = &unk_1012E78A0;
  id v22 = v11;
  id v23 = v6;
  id v12 = v6;
  id v13 = v11;
  id v14 = +[UIContextualAction contextualActionWithStyle:1 title:@"Reset" handler:&v18];
  CFStringRef v24 = v14;
  id v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1, v18, v19, v20, v21);
  id v16 = +[UISwipeActionsConfiguration configurationWithActions:v15];

  return v16;
}

@end