@interface PKProvisioningAnalyticsSessionStepReporter
- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4;
- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4 error:(id)a5;
- (void)setProvisionedPass:(id)a3;
@end

@implementation PKProvisioningAnalyticsSessionStepReporter

- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:@"provisioningStatus" forKeyedSubscript:@"eventType"];
  [v9 setObject:v7 forKeyedSubscript:@"provisioningStep"];

  v8 = PKAnalyticsReportResultSuccess;
  if (!v4) {
    v8 = PKAnalyticsReportResultFailure;
  }
  [v9 setObject:*v8 forKeyedSubscript:@"result"];
  [(PKProvisioningAnalyticsSessionReporter *)self reportEvent:v9];
}

- (void)reportProvisioningStep:(id)a3 finishedWithStatus:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setObject:@"provisioningStatus" forKeyedSubscript:@"eventType"];
  [v12 setObject:v10 forKeyedSubscript:@"provisioningStep"];

  v11 = PKAnalyticsReportResultSuccess;
  if (!v5) {
    v11 = PKAnalyticsReportResultFailure;
  }
  [v12 setObject:*v11 forKeyedSubscript:@"result"];
  [(PKProvisioningAnalyticsSessionReporter *)self _populateDictionary:v12 withError:v9];

  [(PKProvisioningAnalyticsSessionReporter *)self reportEvent:v12];
}

- (void)setProvisionedPass:(id)a3
{
  id v4 = a3;
  id v5 = [(PKProvisioningAnalyticsSessionReporter *)self responder];
  [v5 setPass:v4];
}

@end