@interface TransitPreferencesViewControllerDataSource
- (BOOL)_isCurrentSelectedTransitModeIndividual;
- (TransitMutablePreferences)preferences;
- (TransitPreferencesViewControllerDataSource)initWithPreferences:(id)a3 displayHints:(id)a4;
- (id)_localizedNameForPriorityOption:(int)a3;
- (id)_surchargeForIndexPath:(id)a3;
- (id)titleForFooterInSection:(int64_t)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int)_sortForIndexPath:(id)a3;
- (int)_surchargeOptionValueToDisplayAsSelected;
- (int64_t)normalizedSectionIndex:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)_modeForIndexPath:(id)a3;
- (void)_configureWithDisplayHints:(id)a3;
@end

@implementation TransitPreferencesViewControllerDataSource

- (TransitPreferencesViewControllerDataSource)initWithPreferences:(id)a3 displayHints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitPreferencesViewControllerDataSource;
  v8 = [(TransitPreferencesViewControllerDataSource *)&v12 init];
  if (v8)
  {
    v9 = (TransitMutablePreferences *)[v6 mutableCopy];
    preferences = v8->_preferences;
    v8->_preferences = v9;

    if (v7) {
      [(TransitPreferencesViewControllerDataSource *)v8 _configureWithDisplayHints:v7];
    }
  }

  return v8;
}

- (void)_configureWithDisplayHints:(id)a3
{
  id v16 = a3;
  v4 = [v16 surchargeOptions];
  surchargeOptions = self->_surchargeOptions;
  self->_surchargeOptions = v4;

  self->_showICFareOption = 0;
  id v6 = [v16 availablePaymentTypesCount];
  id v7 = v16;
  if (v6)
  {
    unint64_t v8 = 0;
    while ([v7 availablePaymentTypeAtIndex:v8] != 1)
    {
      ++v8;
      id v9 = [v16 availablePaymentTypesCount];
      id v7 = v16;
      if (v8 >= (unint64_t)v9) {
        goto LABEL_7;
      }
    }
    self->_showICFareOption = 1;
    id v7 = v16;
  }
LABEL_7:
  v10 = [v7 prioritizationOptions];
  v11 = (NSArray *)[v10 copy];
  allTransitPrioritizations = self->_allTransitPrioritizations;
  self->_allTransitPrioritizations = v11;

  v13 = self->_allTransitPrioritizations;
  v14 = +[NSNumber numberWithInt:[(TransitPreferences *)self->_preferences sortOption]];
  LOBYTE(v13) = [(NSArray *)v13 containsObject:v14];

  if ((v13 & 1) == 0)
  {
    v15 = [(NSArray *)self->_allTransitPrioritizations firstObject];
    -[TransitPreferences setSortOption:](self->_preferences, "setSortOption:", [v15 integerValue]);
  }
}

- (int64_t)normalizedSectionIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSArray *)self->_sections count] <= a3) {
    return 0;
  }
  v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (int64_t)numberOfSections
{
  sections = self->_sections;
  if (!sections)
  {
    v4 = +[NSMutableArray arrayWithCapacity:4];
    [v4 addObject:&off_1013A77E0];
    if ([(NSArray *)self->_allTransitPrioritizations count]) {
      [v4 addObject:&off_1013A77F8];
    }
    v5 = [(GEOSurchargeOption *)self->_surchargeOptions surchargeTypes];
    id v6 = [v5 count];

    if (v6) {
      [v4 addObject:&off_1013A7810];
    }
    if (self->_showICFareOption) {
      [v4 addObject:&off_1013A7828];
    }
    id v7 = (NSArray *)[v4 copy];
    unint64_t v8 = self->_sections;
    self->_sections = v7;

    sections = self->_sections;
  }

  return [(NSArray *)sections count];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  int64_t v4 = [(TransitPreferencesViewControllerDataSource *)self normalizedSectionIndex:a3];
  if (v4 == 2)
  {
    id v6 = [(GEOSurchargeOption *)self->_surchargeOptions surchargeTypes];
    id v7 = [v6 count];

    return (int64_t)v7;
  }
  if (v4 == 1)
  {
    allTransitPrioritizations = self->_allTransitPrioritizations;
  }
  else
  {
    if (v4) {
      return 1;
    }
    if (qword_10160F108 != -1) {
      dispatch_once(&qword_10160F108, &stru_1012EF1E0);
    }
    allTransitPrioritizations = (NSArray *)qword_10160F100;
  }

  return [(NSArray *)allTransitPrioritizations count];
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  int64_t v3 = [(TransitPreferencesViewControllerDataSource *)self normalizedSectionIndex:a3];
  if (v3 == 2)
  {
    v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"Surcharge Options";
LABEL_7:
    int64_t v4 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

    goto LABEL_9;
  }
  if (v3 == 1)
  {
    v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"Prefer";
    goto LABEL_7;
  }
  if (v3)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = +[TransitPreferencesText headerTextForDisabledModes];
  }
LABEL_9:

  return v4;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  if ((id)[(TransitPreferencesViewControllerDataSource *)self normalizedSectionIndex:a3] == (id)3)
  {
    int64_t v3 = +[TransitPreferencesText footerTextForICFares];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)_modeForIndexPath:(id)a3
{
  id v3 = a3;
  if (qword_10160F108 != -1) {
    dispatch_once(&qword_10160F108, &stru_1012EF1E0);
  }
  id v4 = (id)qword_10160F100;
  id v5 = [v3 item];
  if (v5 >= [v4 count])
  {
    id v7 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "item"));
    id v7 = [v6 integerValue];
  }
  return (unint64_t)v7;
}

- (int)_sortForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  if (v5 >= (id)[(NSArray *)self->_allTransitPrioritizations count])
  {
    int v7 = 0;
  }
  else
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_allTransitPrioritizations, "objectAtIndexedSubscript:", [v4 item]);
    int v7 = [v6 integerValue];
  }
  return v7;
}

- (id)_surchargeForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 item];
  id v6 = [(GEOSurchargeOption *)self->_surchargeOptions surchargeTypes];
  id v7 = [v6 count];

  if (v5 >= v7)
  {
    id v9 = 0;
  }
  else
  {
    unint64_t v8 = [(GEOSurchargeOption *)self->_surchargeOptions surchargeTypes];
    id v9 = [v8 objectAtIndexedSubscript:[v4 item]];
  }

  return v9;
}

- (id)_localizedNameForPriorityOption:(int)a3
{
  switch(a3)
  {
    case 0:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"TransitOptionsSortOrder_Default";
      goto LABEL_7;
    case 1:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"TransitOptionsSortOrder_Fastest";
      goto LABEL_7;
    case 2:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"TransitOptionsSortOrder_FewestTransfers";
      goto LABEL_7;
    case 3:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"TransitOptionsSortOrder_LeastWalking";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (int)_surchargeOptionValueToDisplayAsSelected
{
  id v3 = [(TransitPreferences *)self->_preferences surchargeOption];

  if (v3)
  {
    id v4 = [(TransitPreferences *)self->_preferences surchargeOption];
    int v5 = [v4 integerValue];
  }
  else
  {
    id v4 = [(GEOSurchargeOption *)self->_surchargeOptions selectedSurchargeType];
    int v5 = [v4 value];
  }

  return v5;
}

- (BOOL)_isCurrentSelectedTransitModeIndividual
{
  unint64_t v2 = ~[(TransitPreferences *)self->_preferences disabledModes] & 0xF;
  return (v2 < 9) & (0x116u >> v2);
}

- (TransitMutablePreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_surchargeOptions, 0);

  objc_storeStrong((id *)&self->_allTransitPrioritizations, 0);
}

@end