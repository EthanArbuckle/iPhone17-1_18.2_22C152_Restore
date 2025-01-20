@interface RoutePlanningVehicleRefinementModel
+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4;
- (BOOL)_shouldDefaultToNoSelection;
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (RoutePlanningVehicleRefinementModel)initWithDelegate:(id)a3 value:(id)a4;
- (VGVehicle)selectedVehicle;
- (id)_attributedTitleForVehicle:(id)a3;
- (id)_subtitleForVehicle:(id)a3;
- (id)_titleForDifferentCar;
- (id)menuProvider;
- (id)titleText;
- (id)virtualGarage;
- (int)menuPressUsageAction;
- (void)_assertValidValue;
- (void)offlineMapsStateChanged;
- (void)setSelectedVehicle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RoutePlanningVehicleRefinementModel

- (RoutePlanningVehicleRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningVehicleRefinementModel;
  v4 = [(RoutePlanningRefinementModel *)&v10 initWithDelegate:a3 value:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RoutePlanningVehicleRefinementModel *)v4 virtualGarage];
    v7 = [v6 selectedVehicle];
    [(RoutePlanningVehicleRefinementModel *)v5 setSelectedVehicle:v7];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"offlineMapsStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v5;
}

- (id)titleText
{
  if ([(RoutePlanningVehicleRefinementModel *)self _shouldDefaultToNoSelection])
  {
    v3 = [(RoutePlanningVehicleRefinementModel *)self _titleForDifferentCar];
  }
  else
  {
    v4 = [(RoutePlanningVehicleRefinementModel *)self selectedVehicle];
    v5 = [v4 combinedDisplayName];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(RoutePlanningVehicleRefinementModel *)self _titleForDifferentCar];
    }
    v3 = v7;
  }

  return v3;
}

- (id)_titleForDifferentCar
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Transport Type Picker] Different Car" value:@"localized string not found" table:0];

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  v3 = [(RoutePlanningVehicleRefinementModel *)self selectedVehicle];
  if (v3) {
    unsigned int v4 = ![(RoutePlanningVehicleRefinementModel *)self _shouldDefaultToNoSelection];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (BOOL)_shouldDefaultToNoSelection
{
  v2 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v3 = [v2 isUsingOfflineMaps];

  return v3;
}

- (void)_assertValidValue
{
  uint64_t v3 = [(RoutePlanningRefinementModel *)self value];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    v5 = [(RoutePlanningRefinementModel *)self value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(RoutePlanningRefinementModel *)self value];
        v9 = (objc_class *)objc_opt_class();
        objc_super v10 = NSStringFromClass(v9);
        v11 = +[NSString stringWithFormat:@"Wrong type: %@", v10];
        *(_DWORD *)buf = 136316162;
        v15 = "-[RoutePlanningVehicleRefinementModel _assertValidValue]";
        __int16 v16 = 2080;
        v17 = "RoutePlanningVehicleRefinementModel.m";
        __int16 v18 = 1024;
        int v19 = 88;
        __int16 v20 = 2080;
        v21 = "!self.value || [self.value isKindOfClass:VGVirtualGarage.class]";
        __int16 v22 = 2112;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)virtualGarage
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setSelectedVehicle:(id)a3
{
  id v5 = a3;
  selectedVehicle = self->_selectedVehicle;
  unint64_t v7 = (unint64_t)v5;
  id v8 = selectedVehicle;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      v11 = sub_1005768D4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_selectedVehicle;
        int v14 = 138412546;
        v15 = v12;
        __int16 v16 = 2112;
        unint64_t v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Options] updating selected vehicle from: %@ to: %@", (uint8_t *)&v14, 0x16u);
      }

      objc_storeStrong((id *)&self->_selectedVehicle, a3);
      v13 = [(RoutePlanningRefinementModel *)self delegate];
      [v13 updatedRefinementModel:self];
    }
  }
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  unint64_t v7 = [(RoutePlanningVehicleRefinementModel *)self virtualGarage];
  unsigned __int8 v8 = [(id)objc_opt_class() _isGarage:v7 significantlyDifferentFromGarage:v6];
  v9 = sub_1005768D4();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[Options] Using updated garage: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_storeStrong(&self->super._value, v5);
    cachedMenu = self->_cachedMenu;
    self->_cachedMenu = 0;

    v9 = [v6 selectedVehicle];
    [(RoutePlanningVehicleRefinementModel *)self setSelectedVehicle:v9];
  }
  else if (v10)
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[Options] Garage has not changed; will not update menu",
      (uint8_t *)&v12,
      2u);
  }
}

- (id)menuProvider
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BF6A04;
  v5[3] = &unk_1012F8250;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  uint64_t v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (int)menuPressUsageAction
{
  return 309;
}

- (id)_attributedTitleForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableAttributedString);
  if (v4) {
    [v4 combinedDisplayName];
  }
  else {
  id v6 = [(RoutePlanningVehicleRefinementModel *)self _titleForDifferentCar];
  }
  id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6];
  [v5 appendAttributedString:v7];

  +[UIFont systemFontSize];
  unsigned __int8 v8 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  v9 = +[NSParagraphStyle defaultParagraphStyle];
  id v10 = [v9 mutableCopy];

  [v10 setLineSpacing:0.0];
  [v10 setParagraphSpacing:0.0];
  [v10 setParagraphSpacingBefore:0.0];
  v35[0] = NSFontAttributeName;
  v35[1] = NSParagraphStyleAttributeName;
  v36[0] = v8;
  v36[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  int v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];

  if (v4)
  {
    if ([(RoutePlanningVehicleRefinementModel *)self _shouldDefaultToNoSelection])
    {
      id v13 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
      [v5 appendAttributedString:v13];

      int v14 = +[NSBundle mainBundle];
      v15 = [v14 localizedStringForKey:@"[Transport Type Picker] Not Available Offline" value:@"localized string not found" table:0];

      id v16 = [objc_alloc((Class)NSAttributedString) initWithString:v15 attributes:v12];
      [v5 appendAttributedString:v16];

      NSAttributedStringKey v33 = NSForegroundColorAttributeName;
      id v17 = +[UIColor placeholderTextColor];
      id v34 = v17;
      __int16 v18 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      objc_msgSend(v5, "addAttributes:range:", v18, 0, objc_msgSend(v5, "length"));
    }
    else
    {
      if (![v4 isPureElectricVehicle]) {
        goto LABEL_13;
      }
      id v19 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
      [v5 appendAttributedString:v19];

      v15 = +[BatteryIconView batteryIconWithLevel:](BatteryIconView, "batteryIconWithLevel:", [v4 displayedBatteryPercentage]);
      id v17 = objc_alloc_init((Class)NSTextAttachment);
      [v17 setImage:v15];
      [v15 size];
      double v21 = v20;
      double v23 = v22;
      [v8 capHeight];
      double v25 = (v24 - v23) * 0.5;
      double v26 = 0.0;
      if (v8) {
        double v26 = v25;
      }
      [v17 setBounds:0.0, v26, v21, v23];
      v27 = +[NSAttributedString attributedStringWithAttachment:v17];
      [v5 appendAttributedString:v27];

      __int16 v18 = [(RoutePlanningVehicleRefinementModel *)self _subtitleForVehicle:v4];
      if ([v18 length])
      {
        id v28 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
        [v5 appendAttributedString:v28];

        v29 = +[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", [v4 displayedBatteryPercentage]);
        [v12 setObject:v29 forKeyedSubscript:NSForegroundColorAttributeName];

        id v30 = [objc_alloc((Class)NSAttributedString) initWithString:v18 attributes:v12];
        [v5 appendAttributedString:v30];
      }
    }
  }
LABEL_13:
  id v31 = [v5 copy];

  return v31;
}

- (id)_subtitleForVehicle:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    double v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[RoutePlanningVehicleRefinementModel _subtitleForVehicle:]";
      __int16 v33 = 2080;
      id v34 = "RoutePlanningVehicleRefinementModel.m";
      __int16 v35 = 1024;
      int v36 = 248;
      __int16 v37 = 2080;
      v38 = "vehicle != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (([v3 isPureElectricVehicle] & 1) == 0)
  {
    id v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[RoutePlanningVehicleRefinementModel _subtitleForVehicle:]";
      __int16 v33 = 2080;
      id v34 = "RoutePlanningVehicleRefinementModel.m";
      __int16 v35 = 1024;
      int v36 = 249;
      __int16 v37 = 2080;
      v38 = "vehicle.isPureElectricVehicle";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v32 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (![v3 isPureElectricVehicle])
  {
    id v6 = 0;
    goto LABEL_25;
  }
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if (GEOConfigGetBOOL())
  {
    if (v3) {
      uint64_t v5 = (uint64_t)[v3 displayedBatteryPercentage];
    }
    else {
      uint64_t v5 = 65;
    }
    id v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"%lu%%" value:@"localized string not found" table:0];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5);
    [v4 addObject:v9];
  }
  if (v3) {
    [v3 lastStateUpdateDate];
  }
  else {
  id v10 = +[NSDate dateWithTimeIntervalSinceNow:-7200.0];
  }
  v11 = +[NSDate date];
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;
  GEOConfigGetDouble();
  if (v13 >= v14)
  {
  }
  else
  {
    char BOOL = GEOConfigGetBOOL();

    if ((BOOL & 1) == 0) {
      goto LABEL_18;
    }
  }
  id v16 = +[NSDate date];
  id v17 = +[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:v10 referenceDate:v16 smallestUnit:128];

  [v4 addObject:v17];
LABEL_18:
  if ([v4 count])
  {
    __int16 v18 = +[UITraitCollection currentTraitCollection];
    id v19 = [v18 layoutDirection];

    double v20 = +[NSBundle mainBundle];
    double v21 = [v20 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

    if (v19 == (id)1)
    {
      double v22 = [v4 reverseObjectEnumerator];
      double v23 = [v22 allObjects];
      id v6 = [v23 componentsJoinedByString:v21];
    }
    else
    {
      id v6 = [v4 componentsJoinedByString:v21];
    }
  }
  else
  {
    id v6 = 0;
  }

LABEL_25:

  return v6;
}

+ (BOOL)_isGarage:(id)a3 significantlyDifferentFromGarage:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = [(id)v5 selectedVehicle];
    unsigned __int8 v8 = [v7 identifier];
    v9 = [(id)v6 selectedVehicle];
    id v10 = [v9 identifier];
    unint64_t v11 = v8;
    unint64_t v12 = v10;
    if (v11 | v12)
    {
      double v14 = (void *)v12;
      unsigned __int8 v15 = [(id)v11 isEqual:v12];

      if ((v15 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v16 = [(id)v5 vehicles];
    id v17 = [v16 count];
    __int16 v18 = [(id)v6 vehicles];
    id v19 = [v18 count];

    if (v17 == v19)
    {
      double v20 = [(id)v5 selectedVehicle];
      double v21 = [v20 currentVehicleState];
      double v22 = [(id)v6 selectedVehicle];
      double v23 = [v22 currentVehicleState];
      unsigned __int8 v13 = [v21 isSignificantlyDifferentFromVehicleState:v23];

      goto LABEL_9;
    }
LABEL_8:
    unsigned __int8 v13 = 1;
    goto LABEL_9;
  }
  unsigned __int8 v13 = 0;
LABEL_9:

  return v13;
}

- (void)offlineMapsStateChanged
{
  cachedMenu = self->_cachedMenu;
  self->_cachedMenu = 0;
}

- (VGVehicle)selectedVehicle
{
  return self->_selectedVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVehicle, 0);

  objc_storeStrong((id *)&self->_cachedMenu, 0);
}

@end