@interface RoutePlanningVehicleCheckmarkRow
+ (void)registerCellsInCollectionView:(id)a3;
- (RoutePlanningVehicleCheckmarkRow)initWithVehicle:(id)a3;
- (id)cellForTableView:(id)a3;
- (id)value;
- (void)_configureCell:(id)a3;
@end

@implementation RoutePlanningVehicleCheckmarkRow

- (RoutePlanningVehicleCheckmarkRow)initWithVehicle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningVehicleCheckmarkRow;
  v6 = [(MapsDebugCheckmarkRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_vehicle, a3);
  }

  return v7;
}

- (id)value
{
  return self->_vehicle;
}

- (void)_configureCell:(id)a3
{
  id v4 = a3;
  id v5 = &off_1013A1000;
  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___RoutePlanningVehicleSelectionCell] & 1) == 0)
  {
    objc_super v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      v13 = "-[RoutePlanningVehicleCheckmarkRow _configureCell:]";
      __int16 v14 = 2080;
      v15 = "RoutePlanningVehicleCheckmarkRow.m";
      __int16 v16 = 1024;
      int v17 = 45;
      __int16 v18 = 2080;
      v19 = "[cell conformsToProtocol:@protocol(RoutePlanningVehicleSelectionCell)]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

        id v5 = &off_1013A1000;
      }
    }
  }
  if ([v4 conformsToProtocol:v5[440]])
  {
    [v4 setupWithVehicle:self->_vehicle];
  }
  else
  {
    v6 = sub_1005768D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "RoutePlanningVehicleCheckmarkRow can't configure a cell of class: %@.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)cellForTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() reuseIdentifier];
  v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  if (!v6) {
    v6 = [[RoutePlanningVehicleSelectionTableViewCell alloc] initWithStyle:[(MapsDebugTableRow *)self cellStyle] reuseIdentifier:v5];
  }
  [(RoutePlanningVehicleCheckmarkRow *)self configureCell:v6];

  return v6;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [(id)objc_opt_class() reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];
}

- (void).cxx_destruct
{
}

@end