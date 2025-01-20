@interface APDiagnosticDaemonMetricHelper
- (APContentData)contentData;
- (APDiagnosticDaemonMetricHelper)initWithContentData:(id)a3;
- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8;
- (void)validationFailed:(int64_t)a3 reason:(id)a4;
@end

@implementation APDiagnosticDaemonMetricHelper

- (APDiagnosticDaemonMetricHelper)initWithContentData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDiagnosticDaemonMetricHelper;
  v6 = [(APDiagnosticDaemonMetricHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentData, a3);
  }

  return v7;
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  id v13 = a6;
  id v14 = a5;
  id v23 = +[MetricsModule storage];
  v15 = +[MetricsModuleClasses metricClass];
  v16 = [(APDiagnosticDaemonMetricHelper *)self contentData];
  v17 = [v16 identifier];
  v18 = [v16 contextIdentifier];
  v19 = [v18 UUIDString];

  v20 = [v16 uniqueIdentifier];
  id v21 = [[v15 alloc] initWithPurpose:a4 metric:a3 contentIdentifier:v17 contextIdentifier:v19 handle:v20 branch:0 properties:v14 internalProperties:v13 relayData:0 environment:0 order:a7 options:a8];

  [v23 receivedMetric:v21];
}

- (void)validationFailed:(int64_t)a3 reason:(id)a4
{
  v9[0] = @"code";
  id v6 = a4;
  v7 = +[NSNumber numberWithInteger:a3];
  v9[1] = @"reason";
  v10[0] = v7;
  v10[1] = v6;
  v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(APDiagnosticDaemonMetricHelper *)self recordMetric:77500 forPurpose:-105 properties:v8 internalProperties:0 order:0 options:0];
}

- (APContentData)contentData
{
  return self->_contentData;
}

- (void).cxx_destruct
{
}

@end