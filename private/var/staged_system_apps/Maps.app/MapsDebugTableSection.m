@interface MapsDebugTableSection
- (BOOL)visible;
- (MapsDebugTableSection)init;
- (MapsDebugValuesViewController)displayingViewController;
- (NSArray)rows;
- (NSString)footer;
- (NSString)title;
- (id)addButtonRowWithTitle:(id)a3 action:(id)a4;
- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4;
- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4 get:(id)a5 set:(id)a6 change:(id)a7;
- (id)addCheckmarkRowsGroupWithContent:(id)a3 backingGeoConfigKey:(id)a4 get:(id)a5 set:(id)a6;
- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 changeHandler:(id)a5;
- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 checkedRowValueIfUnset:(id)a5 changeHandler:(id)a6;
- (id)addCheckmarkRowsGroupWithContent:(id)a3 get:(id)a4 set:(id)a5;
- (id)addCheckmarkRowsGroupWithContent:(id)a3 object:(id)a4 key:(id)a5;
- (id)addDateFieldRowWithTitle:(id)a3 get:(id)a4 set:(id)a5;
- (id)addEmptySectionBannerRowWithTitle:(id)a3;
- (id)addGEODateFieldRowWithTitle:(id)a3 placeholderText:(id)a4 geoConfigKeyDate:(id)a5;
- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyDouble:(id)a6;
- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyInteger:(id)a6;
- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyString:(id)a6;
- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUInteger:(id)a6;
- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUint64:(id)a6;
- (id)addIndeterminateProgressIndicator;
- (id)addMenuRowWithTitle:(id)a3 menu:(id)a4;
- (id)addNavigationRowForViewControllerClass:(Class)a3;
- (id)addNavigationRowWithTitle:(id)a3 action:(id)a4;
- (id)addNavigationRowWithTitle:(id)a3 viewControllerContent:(id)a4;
- (id)addReadOnlyRowWithTitle:(id)a3 subtitle:(id)a4;
- (id)addReadOnlyRowWithTitle:(id)a3 value:(id)a4;
- (id)addReadOnlyRowWithTitle:(id)a3 valueFormat:(id)a4;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 defaultsKey:(id)a7 sliderValueIfUnset:(float)a8 changeHandler:(id)a9;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 get:(id)a7 set:(id)a8;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(int64_t)a5 max:(int64_t)a6 geoConfigKeyInteger:(id)a7 changeHandler:(id)a8;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUInteger:(id)a7 changeHandler:(id)a8;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUint64:(id)a7 changeHandler:(id)a8;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 subtitleStringHandler:(id)a5 min:(float)a6 max:(float)a7 get:(id)a8 set:(id)a9;
- (id)addSliderRowWithTitle:(id)a3 subtitleStringHandler:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8;
- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4;
- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6;
- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 userDefaults:(id)a5 switchOnStateIfUnset:(BOOL)a6 changeHandler:(id)a7;
- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4;
- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6;
- (id)addSwitchRowWithTitle:(id)a3 get:(id)a4 set:(id)a5;
- (id)addSwitchRowWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5;
- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 defaultsKey:(id)a6;
- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 get:(id)a6 set:(id)a7;
- (void)addRow:(id)a3;
- (void)commit;
- (void)dealloc;
- (void)setDisplayingViewController:(id)a3;
- (void)setFooter:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation MapsDebugTableSection

- (id)addCheckmarkRowsGroupWithContent:(id)a3 object:(id)a4 key:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100859D4C;
  v17[3] = &unk_1012FAD30;
  id v18 = v8;
  id v19 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100859D58;
  v14[3] = &unk_1012FAD58;
  id v15 = v18;
  id v16 = v19;
  id v10 = v19;
  id v11 = v18;
  v12 = [(MapsDebugTableSection *)self addCheckmarkRowsGroupWithContent:a3 get:v17 set:v14];

  return v12;
}

- (MapsDebugTableSection)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableSection;
  result = [(MapsDebugTableSection *)&v3 init];
  if (result) {
    result->_visible = 1;
  }
  return result;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = self->_rows;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setSection:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugTableSection;
  [(MapsDebugTableSection *)&v8 dealloc];
}

- (void)addRow:(id)a3
{
  id v4 = a3;
  if (!self->_mutableRows)
  {
    rows = self->_rows;
    if (rows)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = rows;
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          long long v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) setSection:0 v14];
            long long v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      long long v11 = self->_rows;
      self->_rows = 0;
    }
    long long v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableRows = self->_mutableRows;
    self->_mutableRows = v12;
  }
  [v4 setSection:self v14];
  [(NSMutableArray *)self->_mutableRows addObject:v4];
}

- (void)commit
{
  mutableRows = self->_mutableRows;
  if (mutableRows)
  {
    id v4 = (NSArray *)[(NSMutableArray *)mutableRows copy];
    rows = self->_rows;
    self->_rows = v4;

    uint64_t v6 = self->_mutableRows;
    self->_mutableRows = 0;
  }
}

- (id)addButtonRowWithTitle:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugActionTableRow);
  [(MapsDebugTableRow *)v8 setTitle:v7];

  [(MapsDebugActionTableRow *)v8 setSelectionAction:v6];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (id)addEmptySectionBannerRowWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MapsDebugEmptySectionBannerRow);
  [(MapsDebugTableRow *)v5 setTitle:v4];

  [(MapsDebugTableSection *)self addRow:v5];

  return v5;
}

- (id)addNavigationRowWithTitle:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugNavigationTableRow);
  [(MapsDebugTableRow *)v8 setTitle:v7];

  [(MapsDebugTableRow *)v8 setSelectionAction:v6];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (id)addNavigationRowForViewControllerClass:(Class)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(MapsDebugNavigationTableRow);
    [(MapsDebugNavigationTableRow *)v5 setViewControllerClass:a3];
    [(MapsDebugTableSection *)self addRow:v5];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)addNavigationRowWithTitle:(id)a3 viewControllerContent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugNavigationTableRow);
  [(MapsDebugTableRow *)v8 setPrepareContentBlock:v6];

  [(MapsDebugTableRow *)v8 setTitle:v7];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSUserDefaults standardUserDefaults];
  uint64_t v9 = [(MapsDebugTableSection *)self addSwitchRowWithTitle:v7 userDefaults:v8 defaultsKey:v6];

  return v9;
}

- (id)addSwitchRowWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5
{
  return [(MapsDebugTableSection *)self addSwitchRowWithTitle:a3 defaultsKey:a5 userDefaults:a4 switchOnStateIfUnset:0 changeHandler:0];
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = +[NSUserDefaults standardUserDefaults];
  long long v14 = [(MapsDebugTableSection *)self addSwitchRowWithTitle:v12 defaultsKey:v11 userDefaults:v13 switchOnStateIfUnset:v6 changeHandler:v10];

  return v14;
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 userDefaults:(id)a5 switchOnStateIfUnset:(BOOL)a6 changeHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100B76DF8;
  v24[3] = &unk_1013199D8;
  id v25 = v13;
  id v26 = v12;
  BOOL v27 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100B76E58;
  v20[3] = &unk_1012F8968;
  id v21 = v25;
  id v22 = v26;
  id v23 = v14;
  id v15 = v14;
  id v16 = v26;
  id v17 = v25;
  id v18 = [(MapsDebugTableSection *)self addSwitchRowWithTitle:a3 get:v24 set:v20];

  return v18;
}

- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B76F88;
  v8[3] = &unk_1012F8FB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B76F94;
  v6[3] = &unk_1012F8FD8;
  $6E15C01CA1BE37A4936191A84F7075E2 v7 = a4;
  id v4 = [(MapsDebugTableSection *)self addSwitchRowWithTitle:a3 get:v8 set:v6];

  return v4;
}

- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B770C4;
  v14[3] = &unk_1013199F8;
  $6E15C01CA1BE37A4936191A84F7075E2 v15 = a4;
  BOOL v16 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B77118;
  v11[3] = &unk_101319A20;
  $6E15C01CA1BE37A4936191A84F7075E2 v13 = a4;
  id v12 = a6;
  id v8 = v12;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = [(MapsDebugTableSection *)self addSwitchRowWithTitle:a3 get:v14 set:v11];

  return v9;
}

- (id)addSwitchRowWithTitle:(id)a3 get:(id)a4 set:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(MapsDebugSwitchTableRow);
  [(MapsDebugTableRow *)v11 setTitle:v10];

  [(MapsDebugSwitchTableRow *)v11 setGet:v9];
  [(MapsDebugSwitchTableRow *)v11 setSet:v8];

  [(MapsDebugTableSection *)self addRow:v11];

  return v11;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 get:(id)a7 set:(id)a8
{
  return -[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:", a3, a4, 0, a7, a8);
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 subtitleStringHandler:(id)a5 min:(float)a6 max:(float)a7 get:(id)a8 set:(id)a9
{
  id v16 = a4;
  id v17 = (void (**)(void))a5;
  id v18 = (void (**)(void))a8;
  id v19 = a9;
  id v20 = a3;
  id v21 = objc_alloc_init(MapsDebugSliderTableRow);
  [(MapsDebugTableRow *)v21 setTitle:v20];

  *(float *)&double v22 = a6;
  [(MapsDebugSliderTableRow *)v21 setMinimum:v22];
  *(float *)&double v23 = a7;
  [(MapsDebugSliderTableRow *)v21 setMaximum:v23];
  [(MapsDebugSliderTableRow *)v21 setGet:v18];
  [(MapsDebugSliderTableRow *)v21 setSet:v19];

  [(MapsDebugSliderTableRow *)v21 setSubtitleFormatString:v16];
  [(MapsDebugSliderTableRow *)v21 setSubtitleHandler:v17];
  if (v18)
  {
    if (v17)
    {
      v18[2](v18);
      v24 = v17[2](v17);
      [(MapsDebugTableRow *)v21 setSubtitle:v24];
    }
    else if (v16)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100B7744C;
      v28[3] = &unk_101319A48;
      id v29 = v16;
      id v25 = objc_retainBlock(v28);
      v18[2](v18);
      id v26 = ((void (*)(void *))v25[2])(v25);
      [(MapsDebugTableRow *)v21 setSubtitle:v26];

      [(MapsDebugSliderTableRow *)v21 setSubtitleHandler:v25];
    }
  }
  [(MapsDebugTableSection *)self addRow:v21];

  return v21;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 defaultsKey:(id)a7 sliderValueIfUnset:(float)a8 changeHandler:(id)a9
{
  id v16 = a7;
  id v17 = a9;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100B7761C;
  v27[3] = &unk_101319A70;
  id v28 = v16;
  float v29 = a8;
  float v30 = a6;
  float v31 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100B776A8;
  v24[3] = &unk_101319A98;
  id v25 = v28;
  id v26 = v17;
  id v18 = v17;
  id v19 = v28;
  *(float *)&double v20 = a5;
  *(float *)&double v21 = a6;
  double v22 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:a4 min:v27 max:v24 get:v20 set:v21];

  return v22;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(int64_t)a5 max:(int64_t)a6 geoConfigKeyInteger:(id)a7 changeHandler:(id)a8
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B778A0;
  v21[3] = &unk_101319AB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v22 = a7;
  int64_t v23 = a5;
  int64_t v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B778E4;
  v16[3] = &unk_101319AE0;
  int64_t v19 = a6;
  $6E15C01CA1BE37A4936191A84F7075E2 v20 = a7;
  id v17 = a8;
  int64_t v18 = v23;
  id v11 = v17;
  *(float *)&double v12 = (float)v23;
  *(float *)&double v13 = (float)v24;
  id v14 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:a4 min:v21 max:v16 get:v12 set:v13];
  [v14 setValidate:&stru_101319B20];

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUInteger:(id)a7 changeHandler:(id)a8
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B77AC4;
  v21[3] = &unk_101319AB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v22 = a7;
  unint64_t v23 = a5;
  unint64_t v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B77B08;
  v16[3] = &unk_101319AE0;
  unint64_t v19 = a6;
  $6E15C01CA1BE37A4936191A84F7075E2 v20 = a7;
  id v17 = a8;
  unint64_t v18 = v23;
  id v11 = v17;
  *(float *)&double v12 = (float)v23;
  *(float *)&double v13 = (float)v24;
  id v14 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:a4 min:v21 max:v16 get:v12 set:v13];
  [v14 setValidate:&stru_101319B40];

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUint64:(id)a7 changeHandler:(id)a8
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B77CE8;
  v21[3] = &unk_101319AB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v22 = a7;
  unint64_t v23 = a5;
  unint64_t v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B77D2C;
  v16[3] = &unk_101319AE0;
  unint64_t v19 = a6;
  $6E15C01CA1BE37A4936191A84F7075E2 v20 = a7;
  id v17 = a8;
  unint64_t v18 = v23;
  id v11 = v17;
  *(float *)&double v12 = (float)v23;
  *(float *)&double v13 = (float)v24;
  id v14 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:a4 min:v21 max:v16 get:v12 set:v13];
  [v14 setValidate:&stru_101319B60];

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100B77EFC;
  v23[3] = &unk_101319AB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v24 = a7;
  double v25 = a5;
  double v26 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B77F40;
  v18[3] = &unk_101319AE0;
  double v20 = a5;
  double v21 = a6;
  $6E15C01CA1BE37A4936191A84F7075E2 v22 = a7;
  id v19 = a8;
  id v13 = v19;
  float v11 = v25;
  *(float *)&double v14 = v11;
  float v12 = v26;
  *(float *)&double v15 = v12;
  id v16 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:a4 min:v23 max:v18 get:v14 set:v15];

  return v16;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringHandler:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100B78118;
  v23[3] = &unk_101319AB8;
  $6E15C01CA1BE37A4936191A84F7075E2 v24 = a7;
  double v25 = a5;
  double v26 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B7815C;
  v18[3] = &unk_101319AE0;
  double v20 = a5;
  double v21 = a6;
  $6E15C01CA1BE37A4936191A84F7075E2 v22 = a7;
  id v19 = a8;
  id v13 = v19;
  float v11 = v25;
  *(float *)&double v14 = v11;
  float v12 = v26;
  *(float *)&double v15 = v12;
  id v16 = [(MapsDebugTableSection *)self addSliderRowWithTitle:a3 subtitleStringFormat:0 subtitleStringHandler:a4 min:v23 max:v18 get:v14 set:v15];

  return v16;
}

- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 get:(id)a6 set:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(MapsDebugTextFieldTableRow);
  [(MapsDebugTableRow *)v16 setTitle:v15];

  [(MapsDebugTextFieldTableRow *)v16 setPlaceholderText:v14];
  [(MapsDebugTextFieldTableRow *)v16 setInputType:a5];
  [(MapsDebugTextFieldTableRow *)v16 setGet:v13];

  [(MapsDebugTextFieldTableRow *)v16 setSet:v12];
  [(MapsDebugTableSection *)self addRow:v16];

  return v16;
}

- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 defaultsKey:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100B783F4;
  v15[3] = &unk_1012EE360;
  id v16 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B7847C;
  v13[3] = &unk_1012E78C8;
  id v14 = v16;
  id v10 = v16;
  float v11 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v15 set:v13];

  return v11;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyString:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B785CC;
  v10[3] = &unk_101319B80;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = a6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B785D8;
  v8[3] = &unk_101319BA0;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a6;
  BOOL v6 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v10 set:v8];

  return v6;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyInteger:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B786AC;
  v10[3] = &unk_101319B80;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = a6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B78714;
  v8[3] = &unk_101319BA0;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a6;
  BOOL v6 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v10 set:v8];

  return v6;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUInteger:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B78818;
  v10[3] = &unk_101319B80;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = a6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B78880;
  v8[3] = &unk_101319BA0;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a6;
  BOOL v6 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v10 set:v8];

  return v6;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUint64:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B78984;
  v10[3] = &unk_101319B80;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = a6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B789EC;
  v8[3] = &unk_101319BA0;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a6;
  BOOL v6 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v10 set:v8];

  return v6;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyDouble:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B78AF0;
  v10[3] = &unk_101319B80;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = a6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B78B54;
  v8[3] = &unk_101319BA0;
  $6E15C01CA1BE37A4936191A84F7075E2 v9 = a6;
  BOOL v6 = [(MapsDebugTableSection *)self addTextFieldRowWithTitle:a3 placeholderText:a4 inputType:a5 get:v10 set:v8];

  return v6;
}

- (id)addGEODateFieldRowWithTitle:(id)a3 placeholderText:(id)a4 geoConfigKeyDate:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B78C54;
  v9[3] = &unk_101319BC0;
  $6E15C01CA1BE37A4936191A84F7075E2 v10 = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B78C60;
  v7[3] = &unk_101319BE0;
  $6E15C01CA1BE37A4936191A84F7075E2 v8 = a5;
  id v5 = [(MapsDebugTableSection *)self addDateFieldRowWithTitle:a3 get:v9 set:v7];

  return v5;
}

- (id)addDateFieldRowWithTitle:(id)a3 get:(id)a4 set:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  $6E15C01CA1BE37A4936191A84F7075E2 v11 = objc_alloc_init(MapsDebugDateFieldTableRow);
  [(MapsDebugTableRow *)v11 setTitle:v10];

  [(MapsDebugDateFieldTableRow *)v11 setGet:v9];
  [(MapsDebugDateFieldTableRow *)v11 setSet:v8];

  [(MapsDebugTableSection *)self addRow:v11];

  return v11;
}

- (id)addReadOnlyRowWithTitle:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugReadOnlyValueRow);
  [(MapsDebugTableRow *)v8 setTitle:v7];

  [(MapsDebugTableRow *)v8 setSubtitle:v6];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (id)addReadOnlyRowWithTitle:(id)a3 valueFormat:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v12];

  id v9 = [(MapsDebugTableSection *)self addReadOnlyRowWithTitle:v7 value:v8];

  return v9;
}

- (id)addReadOnlyRowWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugReadOnlySubtitleRow);
  [(MapsDebugTableRow *)v8 setTitle:v7];

  [(MapsDebugTableRow *)v8 setSubtitle:v6];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 get:(id)a4 set:(id)a5
{
  return -[MapsDebugTableSection addCheckmarkRowsGroupWithContent:backingGeoConfigKey:get:set:](self, "addCheckmarkRowsGroupWithContent:backingGeoConfigKey:get:set:", a3, GEOConfigKey_Invalid[0], GEOConfigKey_Invalid[1], a4, a5);
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 backingGeoConfigKey:(id)a4 get:(id)a5 set:(id)a6
{
  id v18 = 0;
  id v7 = +[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:withContent:backingGeoConfigKey:get:set:](MapsDebugCheckmarkRowsGroup, "rowsGroupContainingRows:withContent:backingGeoConfigKey:get:set:", &v18, a3, *(void *)&a4.var0, a4.var1, a5, a6);
  id v8 = v18;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [(MapsDebugTableSection *)self addRow:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 checkedRowValueIfUnset:(id)a5 changeHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B7919C;
  v21[3] = &unk_1012FAD30;
  id v22 = v10;
  id v23 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B79208;
  v18[3] = &unk_101319C08;
  id v19 = v22;
  id v20 = v12;
  id v13 = v12;
  id v14 = v22;
  id v15 = v11;
  long long v16 = [(MapsDebugTableSection *)self addCheckmarkRowsGroupWithContent:a3 get:v21 set:v18];

  return v16;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 changeHandler:(id)a5
{
  return [(MapsDebugTableSection *)self addCheckmarkRowsGroupWithContent:a3 defaultsKey:a4 checkedRowValueIfUnset:0 changeHandler:a5];
}

- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4
{
  return -[MapsDebugTableSection addCheckmarkRowsGroupForConfigKey:content:get:set:change:](self, "addCheckmarkRowsGroupForConfigKey:content:get:set:change:", *(void *)&a3.var0, a3.var1, a4, 0, 0, 0);
}

- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4 get:(id)a5 set:(id)a6 change:(id)a7
{
  var1 = a3.var1;
  uint64_t v11 = *(void *)&a3.var0;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v27 = a7;
  id v44 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100B7964C;
  v40[3] = &unk_101319C30;
  id v16 = v14;
  id v41 = v16;
  uint64_t v42 = v11;
  v43 = var1;
  double v26 = v13;
  long long v17 = +[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:&v44 withContent:v13 get:v40 set:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v44;
  id v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v37;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v18);
        }
        [(MapsDebugTableSection *)self addRow:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      id v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v19);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100B796A4;
  v32[3] = &unk_101319C58;
  id v22 = v15;
  id v33 = v22;
  uint64_t v34 = v11;
  v35 = var1;
  [v17 setSelectionChanged:v32];
  objc_initWeak(&location, v17);
  id v23 = &_dispatch_main_q;
  id v28 = v27;
  id v29 = v16;
  objc_copyWeak(&v30, &location);
  $6E15C01CA1BE37A4936191A84F7075E2 v24 = _GEOConfigAddBlockListenerForKey();

  objc_setAssociatedObject(v17, &unk_1016108F8, v24, (void *)0x301);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);

  return v17;
}

- (id)addIndeterminateProgressIndicator
{
  objc_super v3 = objc_alloc_init(MapsDebugActivityIndicatorRow);
  [(MapsDebugTableSection *)self addRow:v3];

  return v3;
}

- (id)addMenuRowWithTitle:(id)a3 menu:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MapsDebugMenuRow);
  [(MapsDebugTableRow *)v8 setTitle:v7];

  [(MapsDebugMenuRow *)v8 setMenu:v6];
  [(MapsDebugTableRow *)v8 setSelectionAction:0];
  [(MapsDebugTableSection *)self addRow:v8];

  return v8;
}

- (MapsDebugValuesViewController)displayingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayingViewController);

  return (MapsDebugValuesViewController *)WeakRetained;
}

- (void)setDisplayingViewController:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSArray)rows
{
  return self->_rows;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_displayingViewController);
  objc_storeStrong((id *)&self->_rows, 0);

  objc_storeStrong((id *)&self->_mutableRows, 0);
}

@end