@interface WFTimeZonePickerParameter
+ (id)sensitiveCities;
- (ALCityManager)cityManager;
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (NSArray)calendarStates;
- (OS_dispatch_queue)stateQueue;
- (WFTimeZonePickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setCalendarStates:(id)a3;
- (void)setCityManager:(id)a3;
@end

@implementation WFTimeZonePickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityManager, 0);
  objc_storeStrong((id *)&self->_calendarStates, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)setCityManager:(id)a3
{
}

- (ALCityManager)cityManager
{
  return self->_cityManager;
}

- (void)setCalendarStates:(id)a3
{
}

- (NSArray)calendarStates
{
  return self->_calendarStates;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 value];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v6 alCityIdentifier];
    if (!v7) {
      goto LABEL_8;
    }
    v8 = (void *)v7;
    v9 = [(WFTimeZonePickerParameter *)self cityManager];
    v10 = [v6 alCityIdentifier];
    v11 = [v10 stringValue];
    v22[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v13 = [v9 citiesWithIdentifiers:v12];
    v14 = [v13 firstObject];

    if (v14)
    {
      v15 = [MEMORY[0x1E4FB46B8] currentDevice];
      if ([v15 isChineseRegionDevice])
      {
        v16 = +[WFTimeZonePickerParameter sensitiveCities];
        v17 = [v6 alCityIdentifier];
        uint64_t v18 = [v16 containsObject:v17];
      }
      else
      {
        uint64_t v18 = 0;
      }

      uint64_t v20 = [v14 displayNameIncludingCountry:v18];
    }
    else
    {
LABEL_8:
      v14 = [v5 value];
      uint64_t v20 = [v14 localizedCityName];
    }
    v19 = (void *)v20;
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(WFTimeZonePickerParameter *)self stateQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E65572A0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cityManager];
  v3 = [v2 allCities];
  v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_22862);

  id v7 = [v4 sortedArrayUsingComparator:&__block_literal_global_176];

  id v5 = objc_msgSend(v7, "if_map:", &__block_literal_global_179_22863);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:v5];
  [v6 setUsesIndexedCollation:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

WFTimeZonePickerParameterState *__91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFTimeZonePickerParameterState alloc] initWithValue:v2];

  return v3;
}

uint64_t __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedCityName];
  id v6 = [v4 localizedCityName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

WFTimeZoneDescriptor *__91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFTimeZoneDescriptor alloc] initWithALCity:v2];

  return v3;
}

- (WFTimeZonePickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFTimeZonePickerParameter;
  id v5 = [(WFEnumerationParameter *)&v18 initWithDefinition:v4];
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    id v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v11;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v13 = (void *)getALCityManagerClass_softClass;
    uint64_t v23 = getALCityManagerClass_softClass;
    if (!getALCityManagerClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getALCityManagerClass_block_invoke;
      v19[3] = &unk_1E6558B78;
      v19[4] = &v20;
      __getALCityManagerClass_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v20, 8);
    v15 = [v14 sharedManager];
    [(WFTimeZonePickerParameter *)v5 setCityManager:v15];

    [(WFDynamicEnumerationParameter *)v5 setDataSource:v5];
    v16 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)sensitiveCities
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2317940];
}

@end