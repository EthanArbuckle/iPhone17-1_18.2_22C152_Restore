@interface RoutePlanningDisplayHintsRefinementModel
+ (id)requirementFieldsForDisplayHints:(id)a3;
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (RoutePlanningDisplayHintsRefinementModel)initWithDelegate:(id)a3 transitPreferences:(id)a4 displayHints:(id)a5 refinementField:(unint64_t)a6;
- (TransitMutablePreferences)preferences;
- (id)_localizedCashFaresLabel;
- (id)_localizedICFaresLabel;
- (id)_localizedNameForPrioritizationOption:(int)a3;
- (id)menu;
- (id)titleText;
- (id)value;
- (int)menuPressUsageAction;
- (void)_assertValidValue;
- (void)setValue:(id)a3;
@end

@implementation RoutePlanningDisplayHintsRefinementModel

+ (id)requirementFieldsForDisplayHints:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v5 = [v3 surchargeOptions];
  v6 = [v5 surchargeTypes];
  id v7 = [v6 count];

  if (v7) {
    [v4 addIndex:2];
  }
  if ([v3 availablePaymentTypesCount] && objc_msgSend(v3, "availablePaymentTypesCount"))
  {
    uint64_t v8 = 0;
    while ([v3 availablePaymentTypeAtIndex:v8] != 1)
    {
      if (++v8 >= (unint64_t)[v3 availablePaymentTypesCount]) {
        goto LABEL_10;
      }
    }
    [v4 addIndex:1];
  }
LABEL_10:
  if ([v3 availablePrioritizationsCount]) {
    [v4 addIndex:0];
  }
  id v9 = [v4 copy];

  return v9;
}

- (RoutePlanningDisplayHintsRefinementModel)initWithDelegate:(id)a3 transitPreferences:(id)a4 displayHints:(id)a5 refinementField:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [a4 mutableCopy];
  v26.receiver = self;
  v26.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  v13 = [(RoutePlanningRefinementModel *)&v26 initWithDelegate:v10 value:v12];

  if (!v13) {
    goto LABEL_17;
  }
  v13->_refinementField = a6;
  objc_storeStrong((id *)&v13->_displayHints, a5);
  if (!a6)
  {
    v19 = [v11 prioritizationOptions];
    v20 = [(RoutePlanningDisplayHintsRefinementModel *)v13 preferences];
    v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v20 sortOption]);
    unsigned __int8 v22 = [v19 containsObject:v21];

    if (v22) {
      goto LABEL_17;
    }
    v17 = [v11 prioritizationOptions];
    v18 = [v17 firstObject];
    id v23 = [v18 integerValue];
    v24 = [(RoutePlanningDisplayHintsRefinementModel *)v13 preferences];
    [v24 setSortOption:v23];

    goto LABEL_15;
  }
  if (a6 != 1) {
    goto LABEL_17;
  }
  if (![v11 availablePaymentTypesCount])
  {
LABEL_8:
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = +[NSString stringWithFormat:@"Trying to display IC Fares refinement but no such option in display hints"];
      *(_DWORD *)buf = 136316162;
      v28 = "-[RoutePlanningDisplayHintsRefinementModel initWithDelegate:transitPreferences:displayHints:refinementField:]";
      __int16 v29 = 2080;
      v30 = "RoutePlanningDisplayHintsRefinementModel.m";
      __int16 v31 = 1024;
      int v32 = 82;
      __int16 v33 = 2080;
      v34 = "foundICFareOption";
      __int16 v35 = 2112;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (!sub_100BB36BC()) {
      goto LABEL_17;
    }
    v17 = sub_1005762E4();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

      goto LABEL_17;
    }
    v18 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    v28 = (const char *)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = 0;
  while ([v11 availablePaymentTypeAtIndex:v14] != 1)
  {
    if (++v14 >= (unint64_t)[v11 availablePaymentTypesCount]) {
      goto LABEL_8;
    }
  }
LABEL_17:

  return v13;
}

- (id)titleText
{
  unint64_t refinementField = self->_refinementField;
  switch(refinementField)
  {
    case 2uLL:
      id v4 = [(GEORouteDisplayHints *)self->_displayHints surchargeOptions];
      v6 = [v4 selectedSurchargeType];
      unsigned int v7 = [v6 value];

      uint64_t v8 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      id v9 = [v8 surchargeOption];

      if (v9)
      {
        id v10 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
        id v11 = [v10 surchargeOption];
        unsigned int v7 = [v11 intValue];
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = [v4 surchargeTypes];
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ([v17 value] == v7)
            {
              id v23 = [v17 formattedName];
              v5 = +[NSString _navigation_stringForServerFormattedString:v23];

              goto LABEL_26;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      id v12 = +[NSBundle mainBundle];
      v5 = [v12 localizedStringForKey:@"[Transit Filter Picker] Surcharge" value:@"localized string not found" table:0];
LABEL_26:

      goto LABEL_27;
    case 1uLL:
      v18 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      unsigned int v19 = [v18 showICFares];

      if (v19) {
        [(RoutePlanningDisplayHintsRefinementModel *)self _localizedICFaresLabel];
      }
      else {
      v5 = [(RoutePlanningDisplayHintsRefinementModel *)self _localizedCashFaresLabel];
      }
      goto LABEL_30;
    case 0uLL:
      id v4 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      v5 = -[RoutePlanningDisplayHintsRefinementModel _localizedNameForPrioritizationOption:](self, "_localizedNameForPrioritizationOption:", [v4 sortOption]);
LABEL_27:

      goto LABEL_30;
  }
  v20 = sub_1005762E4();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[RoutePlanningDisplayHintsRefinementModel titleText]";
    __int16 v31 = 2080;
    int v32 = "RoutePlanningDisplayHintsRefinementModel.m";
    __int16 v33 = 1024;
    int v34 = 118;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v22 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  v5 = 0;
LABEL_30:

  return v5;
}

- (void)_assertValidValue
{
  id v3 = [(RoutePlanningDisplayHintsRefinementModel *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(RoutePlanningDisplayHintsRefinementModel *)self value];
      unsigned int v7 = +[NSString stringWithFormat:@"Tried to set bad object for value: %@", objc_opt_class()];
      *(_DWORD *)buf = 136316162;
      id v11 = "-[RoutePlanningDisplayHintsRefinementModel _assertValidValue]";
      __int16 v12 = 2080;
      id v13 = "RoutePlanningDisplayHintsRefinementModel.m";
      __int16 v14 = 1024;
      int v15 = 124;
      __int16 v16 = 2080;
      v17 = "[self.value isKindOfClass:TransitPreferences.class]";
      __int16 v18 = 2112;
      unsigned int v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
}

- (id)value
{
  id v2 = [self->super._value copy];

  return v2;
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
  id v6 = v5;

  id v7 = [v6 mutableCopy];
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  [(RoutePlanningRefinementModel *)&v8 setValue:v7];
}

- (TransitMutablePreferences)preferences
{
  return (TransitMutablePreferences *)self->super._value;
}

- (BOOL)shouldShowHighlighted
{
  unint64_t refinementField = self->_refinementField;
  if (refinementField == 2)
  {
    id v3 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
    v5 = [v3 surchargeOption];
    LOBYTE(v4) = v5 != 0;
  }
  else if (refinementField == 1)
  {
    id v3 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
    unsigned int v4 = [v3 showICFares] ^ 1;
  }
  else
  {
    if (refinementField)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    id v3 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
    LOBYTE(v4) = [v3 sortOption] != 0;
  }

  return v4;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (id)menu
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = v3;
  unint64_t refinementField = self->_refinementField;
  if (refinementField)
  {
    if (refinementField == 1)
    {
      v24 = [(RoutePlanningDisplayHintsRefinementModel *)self _localizedICFaresLabel];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100A8D488;
      v53[3] = &unk_1012E8CD0;
      objc_copyWeak(&v54, &location);
      long long v25 = +[UIAction actionWithTitle:v24 image:0 identifier:0 handler:v53];

      long long v26 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      [v25 setState:[v26 showICFares]];

      [v4 addObject:v25];
      long long v27 = [(RoutePlanningDisplayHintsRefinementModel *)self _localizedCashFaresLabel];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100A8D510;
      v51[3] = &unk_1012E8CD0;
      objc_copyWeak(&v52, &location);
      long long v28 = +[UIAction actionWithTitle:v27 image:0 identifier:0 handler:v51];

      __int16 v29 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      [v28 setState:[v29 showICFares] ^ 1];

      [v4 addObject:v28];
      objc_destroyWeak(&v52);

      objc_destroyWeak(&v54);
    }
    else if (refinementField == 2)
    {
      id obj = v3;
      id v6 = [(GEORouteDisplayHints *)self->_displayHints surchargeOptions];
      id v7 = [v6 selectedSurchargeType];
      unsigned int v45 = [v7 value];

      objc_super v8 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
      id v9 = [v8 surchargeOption];
      BOOL v10 = v9 == 0;

      if (!v10)
      {
        id v11 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
        __int16 v12 = [v11 surchargeOption];
        unsigned int v45 = [v12 intValue];
      }
      id v13 = [v6 surchargeTypes];
      __int16 v14 = (char *)[v13 count];

      if (v14)
      {
        for (i = 0; i != v14; ++i)
        {
          __int16 v16 = [v6 surchargeTypes];
          v17 = [v16 objectAtIndexedSubscript:i];

          id v18 = [v17 value];
          unsigned int v19 = +[NSNumber numberWithInt:v18];
          v20 = [v17 formattedName];
          v21 = +[NSString _navigation_stringForServerFormattedString:v20];

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100A8D598;
          v48[3] = &unk_1012E6368;
          objc_copyWeak(&v50, &location);
          id v22 = v19;
          id v49 = v22;
          id v23 = +[UIAction actionWithTitle:v21 image:0 identifier:0 handler:v48];
          [v23 setState:v18 == v45];
          [obj addObject:v23];

          objc_destroyWeak(&v50);
        }
      }

      unsigned int v4 = obj;
    }
  }
  else
  {
    v30 = [(GEORouteDisplayHints *)self->_displayHints prioritizationOptions];
    if (![v30 count])
    {
      v41 = sub_1005762E4();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = +[NSString stringWithFormat:@"Should not be trying to display prioritization options if there are none."];
        *(_DWORD *)buf = 136316162;
        v65 = "-[RoutePlanningDisplayHintsRefinementModel menu]";
        __int16 v66 = 2080;
        v67 = "RoutePlanningDisplayHintsRefinementModel.m";
        __int16 v68 = 1024;
        int v69 = 170;
        __int16 v70 = 2080;
        v71 = "prioritizationOptions.count > 0";
        __int16 v72 = 2112;
        v73 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v43 = sub_1005762E4();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v65 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    __int16 v31 = v4;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obja = v30;
    id v32 = [obja countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v59;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v59 != v33) {
            objc_enumerationMutation(obja);
          }
          id v35 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) intValue];
          v36 = [(RoutePlanningDisplayHintsRefinementModel *)self _localizedNameForPrioritizationOption:v35];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100A8D404;
          v55[3] = &unk_101315E88;
          objc_copyWeak(&v56, &location);
          int v57 = (int)v35;
          v37 = +[UIAction actionWithTitle:v36 image:0 identifier:0 handler:v55];

          v38 = [(RoutePlanningDisplayHintsRefinementModel *)self preferences];
          [v37 setState:[v38 sortOption] == v35];

          [v31 addObject:v37];
          objc_destroyWeak(&v56);
        }
        id v32 = [obja countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v32);
    }

    unsigned int v4 = v31;
  }
  v39 = +[UIMenu menuWithChildren:v4];

  objc_destroyWeak(&location);

  return v39;
}

- (int)menuPressUsageAction
{
  unint64_t refinementField = self->_refinementField;
  if (refinementField < 3) {
    return dword_100F73400[refinementField];
  }
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  return [(RoutePlanningRefinementModel *)&v4 menuPressUsageAction];
}

- (id)_localizedNameForPrioritizationOption:(int)a3
{
  switch(a3)
  {
    case 0:
      id v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"[Transit Filter Picker, Prioritization] Recommended Routes";
      goto LABEL_7;
    case 1:
      id v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"[Transit Filter Picker, Prioritization] Faster Trips";
      goto LABEL_7;
    case 2:
      id v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"[Transit Filter Picker, Prioritization] Fewer Transfers";
      goto LABEL_7;
    case 3:
      id v3 = +[NSBundle mainBundle];
      objc_super v4 = v3;
      CFStringRef v5 = @"[Transit Filter Picker, Prioritization] Less Walking";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)_localizedICFaresLabel
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[Transit Filter Picker, Fares] Transit Card Fares", @"localized string not found", 0 value table];

  return v3;
}

- (id)_localizedCashFaresLabel
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[Transit Filter Picker, Fares] Cash Fares", @"localized string not found", 0 value table];

  return v3;
}

- (void).cxx_destruct
{
}

@end