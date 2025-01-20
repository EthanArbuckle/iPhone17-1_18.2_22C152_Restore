@interface ATXStackConfigStatistics
+ (id)stackConfigStatisticsWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 withBlock:(id)a7;
- (ATXStackConfigStatistics)initWithBuilder:(id)a3;
- (NSDate)timestamp;
- (NSString)containerBundleIdentifier;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)countOfNonSmartStacksWithWidget;
- (int64_t)countOfSmartStacksWithWidget;
- (int64_t)countOfStandaloneWidgets;
- (int64_t)countOfWidgetsWithUnknownStackKind;
- (int64_t)widgetFamily;
@end

@implementation ATXStackConfigStatistics

- (ATXStackConfigStatistics)initWithBuilder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ATXStackConfigStatistics;
  v5 = [(ATXStackConfigStatistics *)&v22 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 widgetBundleId];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v4 widgetKind];
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = [v4 widgetFamily];

      if (v10)
      {
        uint64_t v11 = [v4 widgetBundleId];
        widgetBundleId = v5->_widgetBundleId;
        v5->_widgetBundleId = (NSString *)v11;

        uint64_t v13 = [v4 widgetKind];
        widgetKind = v5->_widgetKind;
        v5->_widgetKind = (NSString *)v13;

        uint64_t v15 = [v4 containerBundleIdentifier];
        containerBundleIdentifier = v5->_containerBundleIdentifier;
        v5->_containerBundleIdentifier = (NSString *)v15;

        v5->_widgetFamily = [v4 widgetFamily];
        uint64_t v17 = [v4 timestamp];
        timestamp = v5->_timestamp;
        v5->_timestamp = (NSDate *)v17;

        v5->_countOfSmartStacksWithWidget = [v4 countOfSmartStacksWithWidget];
        v5->_countOfNonSmartStacksWithWidget = [v4 countOfNonSmartStacksWithWidget];
        v5->_countOfStandaloneWidgets = [v4 countOfStandaloneWidgets];
        v5->_countOfWidgetsWithUnknownStackKind = [v4 countOfWidgetsWithUnknownStackKind];
LABEL_6:
        v19 = v5;
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  v20 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[ATXStackConfigStatistics initWithBuilder:](v4, v20);
  }

  v19 = 0;
LABEL_11:

  return v19;
}

+ (id)stackConfigStatisticsWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 withBlock:(id)a7
{
  uint64_t v11 = (void (**)(id, ATXStackConfigStatisticsBuilder *))a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [[ATXStackConfigStatisticsBuilder alloc] initWithWidgetBundleId:v14 widgetKind:v13 containerBundleIdentifier:v12 widgetFamily:a6];

  v11[2](v11, v15);
  v16 = [(ATXStackConfigStatisticsBuilder *)v15 build];

  return v16;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_widgetBundleId forKeyedSubscript:@"WidgetBundleId"];
  [v3 setObject:self->_widgetKind forKeyedSubscript:@"WidgetKind"];
  [v3 setObject:self->_containerBundleIdentifier forKeyedSubscript:@"WidgetContainerBundleIdentifier"];
  id v4 = [NSNumber numberWithInteger:self->_widgetFamily];
  [v3 setObject:v4 forKeyedSubscript:@"WidgetFamily"];

  v5 = [NSNumber numberWithInteger:self->_countOfSmartStacksWithWidget];
  [v3 setObject:v5 forKeyedSubscript:@"countOfSmartStacksWithWidget"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_countOfNonSmartStacksWithWidget];
  [v3 setObject:v6 forKeyedSubscript:@"countOfNonSmartStacksWithWidget"];

  v7 = [NSNumber numberWithInteger:self->_countOfStandaloneWidgets];
  [v3 setObject:v7 forKeyedSubscript:@"countOfStandaloneWidgets"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_countOfWidgetsWithUnknownStackKind];
  [v3 setObject:v8 forKeyedSubscript:@"countOfWidgetsWithUnknownStackKind"];

  [v3 setObject:self->_timestamp forKeyedSubscript:@"timestamp"];
  return v3;
}

- (id)description
{
  v2 = [(ATXStackConfigStatistics *)self dictionaryRepresentation];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v2 descriptionWithLocale:v3];

  return v4;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)countOfSmartStacksWithWidget
{
  return self->_countOfSmartStacksWithWidget;
}

- (int64_t)countOfNonSmartStacksWithWidget
{
  return self->_countOfNonSmartStacksWithWidget;
}

- (int64_t)countOfStandaloneWidgets
{
  return self->_countOfStandaloneWidgets;
}

- (int64_t)countOfWidgetsWithUnknownStackKind
{
  return self->_countOfWidgetsWithUnknownStackKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

- (void)initWithBuilder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 widgetBundleId];
  v5 = [a1 widgetKind];
  int v6 = 138412802;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = [a1 widgetFamily];
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Error initializing ATXStackConfigStatistics; %@, %@ and %ld must be non-null",
    (uint8_t *)&v6,
    0x20u);
}

@end