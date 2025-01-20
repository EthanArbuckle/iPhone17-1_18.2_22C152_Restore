@interface RoutePlanningPreferredNetworksRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (BOOL)shouldUsePreferredNetworks;
- (RoutePlanningPreferredNetworksRefinementModel)initWithDelegate:(id)a3 value:(id)a4;
- (id)_titleForAllNetworks;
- (id)_titleForPreferredNetworks;
- (id)menuProvider;
- (id)titleText;
- (id)vehicle;
- (int)menuPressUsageAction;
- (void)_assertValidValue;
- (void)setShouldUsePreferredNetworks:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation RoutePlanningPreferredNetworksRefinementModel

- (RoutePlanningPreferredNetworksRefinementModel)initWithDelegate:(id)a3 value:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningPreferredNetworksRefinementModel;
  v4 = [(RoutePlanningRefinementModel *)&v8 initWithDelegate:a3 value:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RoutePlanningPreferredNetworksRefinementModel *)v4 vehicle];
    v5->_shouldUsePreferredNetworks = [v6 usesPreferredNetworksForRouting];
  }
  return v5;
}

- (id)titleText
{
  if (self->_shouldUsePreferredNetworks) {
    [(RoutePlanningPreferredNetworksRefinementModel *)self _titleForPreferredNetworks];
  }
  else {
  v2 = [(RoutePlanningPreferredNetworksRefinementModel *)self _titleForAllNetworks];
  }

  return v2;
}

- (id)_titleForAllNetworks
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Preferred Networks Picker] All Networks" value:@"localized string not found" table:0];

  return v3;
}

- (id)_titleForPreferredNetworks
{
  v2 = [(RoutePlanningPreferredNetworksRefinementModel *)self vehicle];
  v3 = [v2 preferredChargingNetworks];

  if ([v3 count])
  {
    if ((unint64_t)[v3 count] < 2)
    {
      v4 = [v3 allObjects];
      v5 = [v4 firstObject];
      [v5 name];
    }
    else
    {
      v4 = +[NSBundle mainBundle];
      v5 = [v4 localizedStringForKey:@"[Preferred Networks Picker] %lu Networks" value:@"localized string not found" table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, [v3 count]);
    v10 = };
  }
  else
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[RoutePlanningPreferredNetworksRefinementModel _titleForPreferredNetworks]";
      __int16 v14 = 2080;
      v15 = "RoutePlanningPreferredNetworksRefinementModel.m";
      __int16 v16 = 1024;
      int v17 = 52;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_super v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[Options] RoutePlanningPreferredNetworksRefinementModel was made without any networks", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldShowHighlighted
{
  return self->_shouldUsePreferredNetworks;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (void)_assertValidValue
{
  uint64_t v3 = [(RoutePlanningRefinementModel *)self value];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(RoutePlanningRefinementModel *)self value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_super v8 = [(RoutePlanningRefinementModel *)self value];
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = +[NSString stringWithFormat:@"Wrong type: %@", v10];
        *(_DWORD *)buf = 136316162;
        v15 = "-[RoutePlanningPreferredNetworksRefinementModel _assertValidValue]";
        __int16 v16 = 2080;
        int v17 = "RoutePlanningPreferredNetworksRefinementModel.m";
        __int16 v18 = 1024;
        int v19 = 76;
        __int16 v20 = 2080;
        v21 = "!self.value || [self.value isKindOfClass:VGVehicle.class]";
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

- (void)setShouldUsePreferredNetworks:(BOOL)a3
{
  if (self->_shouldUsePreferredNetworks != a3)
  {
    self->_shouldUsePreferredNetworks = a3;
    if (a3) {
      int v4 = 450;
    }
    else {
      int v4 = 444;
    }
    self->super._lastUpdateUsageAction = v4;
    v5 = sub_1005768D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_shouldUsePreferredNetworks) {
        v6 = @"YES";
      }
      else {
        v6 = @"NO";
      }
      v7 = v6;
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Options] shouldUsePreferredNetworks changed to: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = [(RoutePlanningRefinementModel *)self delegate];
    [v8 updatedRefinementModel:self];
  }
}

- (id)vehicle
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

- (void)setValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id obj = v5;
  id v6 = v5;
  v7 = [(RoutePlanningPreferredNetworksRefinementModel *)self vehicle];
  int shouldUsePreferredNetworks = self->_shouldUsePreferredNetworks;
  unsigned int v9 = [v6 usesPreferredNetworksForRouting];
  v10 = [v6 preferredChargingNetworks];
  v11 = [v7 preferredChargingNetworks];
  unsigned __int8 v12 = [v10 isEqualToSet:v11];

  if (shouldUsePreferredNetworks != v9 || (v12 & 1) == 0)
  {
    v13 = sub_1005768D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Options] Using updated vehicle for networks picker: %@", buf, 0xCu);
    }

    objc_storeStrong(&self->super._value, obj);
    self->_int shouldUsePreferredNetworks = [v6 usesPreferredNetworksForRouting];
    cachedMenu = self->_cachedMenu;
    self->_cachedMenu = 0;

    v15 = [(RoutePlanningRefinementModel *)self delegate];
    [v15 updatedRefinementModel:self];
  }
}

- (id)menuProvider
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007F1220;
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
  return 454;
}

- (BOOL)shouldUsePreferredNetworks
{
  return self->_shouldUsePreferredNetworks;
}

- (void).cxx_destruct
{
}

@end