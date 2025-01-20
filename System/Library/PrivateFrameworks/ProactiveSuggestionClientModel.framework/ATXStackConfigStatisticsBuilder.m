@interface ATXStackConfigStatisticsBuilder
- (ATXStackConfigStatisticsBuilder)initWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6;
- (NSDate)timestamp;
- (NSString)containerBundleIdentifier;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (id)build;
- (int64_t)countOfNonSmartStacksWithWidget;
- (int64_t)countOfSmartStacksWithWidget;
- (int64_t)countOfStandaloneWidgets;
- (int64_t)countOfWidgetsWithUnknownStackKind;
- (int64_t)widgetFamily;
- (void)setCountOfNonSmartStacksWithWidget:(int64_t)a3;
- (void)setCountOfSmartStacksWithWidget:(int64_t)a3;
- (void)setCountOfStandaloneWidgets:(int64_t)a3;
- (void)setCountOfWidgetsWithUnknownStackKind:(int64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation ATXStackConfigStatisticsBuilder

- (ATXStackConfigStatisticsBuilder)initWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_widgetBundleId, a3);
    objc_storeStrong((id *)&self->_widgetKind, a4);
    objc_storeStrong((id *)&self->_containerBundleIdentifier, a5);
    self->_widgetFamily = a6;
    v14 = [MEMORY[0x1E4F1C9C8] now];
    timestamp = self->_timestamp;
    self->_timestamp = v14;

    *(_OWORD *)&self->_countOfSmartStacksWithWidget = 0u;
    *(_OWORD *)&self->_countOfStandaloneWidgets = 0u;
  }

  return self;
}

- (id)build
{
  v2 = [[ATXStackConfigStatistics alloc] initWithBuilder:self];
  return v2;
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

- (void)setTimestamp:(id)a3
{
}

- (int64_t)countOfSmartStacksWithWidget
{
  return self->_countOfSmartStacksWithWidget;
}

- (void)setCountOfSmartStacksWithWidget:(int64_t)a3
{
  self->_countOfSmartStacksWithWidget = a3;
}

- (int64_t)countOfNonSmartStacksWithWidget
{
  return self->_countOfNonSmartStacksWithWidget;
}

- (void)setCountOfNonSmartStacksWithWidget:(int64_t)a3
{
  self->_countOfNonSmartStacksWithWidget = a3;
}

- (int64_t)countOfStandaloneWidgets
{
  return self->_countOfStandaloneWidgets;
}

- (void)setCountOfStandaloneWidgets:(int64_t)a3
{
  self->_countOfStandaloneWidgets = a3;
}

- (int64_t)countOfWidgetsWithUnknownStackKind
{
  return self->_countOfWidgetsWithUnknownStackKind;
}

- (void)setCountOfWidgetsWithUnknownStackKind:(int64_t)a3
{
  self->_countOfWidgetsWithUnknownStackKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

@end