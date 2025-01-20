@interface TAMetricsInterVisit
- (NSString)description;
- (TAInterVisitMetricPerDevice)currentInterVisitMetric;
- (TAInterVisitMetricPerDevice)totalInterVisitMetric;
- (TAMetricsInterVisit)init;
- (TASPAdvertisement)latestAdvertisement;
- (id)descriptionDictionary;
- (unint64_t)getMetricsCollectionType;
- (void)latestAdvertisement;
@end

@implementation TAMetricsInterVisit

- (TAMetricsInterVisit)init
{
  v8.receiver = self;
  v8.super_class = (Class)TAMetricsInterVisit;
  v2 = [(TAMetricsInterVisit *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(TAInterVisitMetricPerDevice);
    currentInterVisitMetric = v2->_currentInterVisitMetric;
    v2->_currentInterVisitMetric = v3;

    v5 = objc_alloc_init(TAInterVisitMetricPerDevice);
    totalInterVisitMetric = v2->_totalInterVisitMetric;
    v2->_totalInterVisitMetric = v5;
  }
  return v2;
}

- (unint64_t)getMetricsCollectionType
{
  return 1;
}

- (TASPAdvertisement)latestAdvertisement
{
  currentInterVisitMetric = self->_currentInterVisitMetric;
  if (currentInterVisitMetric)
  {
    if (!self->_totalInterVisitMetric)
    {
LABEL_5:
      currentInterVisitMetric = [currentInterVisitMetric latestAdvertisement];
      goto LABEL_9;
    }
    v4 = [currentInterVisitMetric latestAdvertisement];
    v5 = [v4 address];
    v6 = [(TAInterVisitMetricPerDevice *)self->_totalInterVisitMetric latestAdvertisement];
    v7 = [v6 address];
    int v8 = [v5 isEqualToData:v7];

    if (v8)
    {
      currentInterVisitMetric = self->_currentInterVisitMetric;
      goto LABEL_5;
    }
    v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
      -[TAMetricsInterVisit latestAdvertisement](v9);
    }
    currentInterVisitMetric = 0;
  }
LABEL_9:
  return (TASPAdvertisement *)currentInterVisitMetric;
}

- (id)descriptionDictionary
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"MetricsType";
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v11[1] = @"CurrentInterVisitMetric";
  v5 = [(TAMetricsInterVisit *)self currentInterVisitMetric];
  v6 = [v5 descriptionDictionary];
  v12[1] = v6;
  v11[2] = @"TotalInterVisitMetric";
  v7 = [(TAMetricsInterVisit *)self totalInterVisitMetric];
  int v8 = [v7 descriptionDictionary];
  v12[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (NSString)description
{
  v2 = [(TAMetricsInterVisit *)self descriptionDictionary];
  id v9 = 0;
  v3 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAInterVisitMetricPerDevice description](v5);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (TAInterVisitMetricPerDevice)currentInterVisitMetric
{
  return self->_currentInterVisitMetric;
}

- (TAInterVisitMetricPerDevice)totalInterVisitMetric
{
  return self->_totalInterVisitMetric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalInterVisitMetric, 0);
  objc_storeStrong((id *)&self->_currentInterVisitMetric, 0);
}

- (void)latestAdvertisement
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22345C000, log, OS_LOG_TYPE_FAULT, "#TAMetricsInterVisit current and total address in disagreement", v1, 2u);
}

@end