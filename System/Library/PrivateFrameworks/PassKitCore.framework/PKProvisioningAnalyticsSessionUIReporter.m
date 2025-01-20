@interface PKProvisioningAnalyticsSessionUIReporter
- (NSString)pageTag;
- (PKProvisioningAnalyticsSessionUIReporter)initWithResponder:(id)a3 sessionID:(id)a4 pageTag:(id)a5;
- (void)reportButtonPressed:(unint64_t)a3;
- (void)reportButtonPressed:(unint64_t)a3 context:(id)a4;
- (void)reportEvent:(id)a3;
- (void)reportOtherButtonPressed:(id)a3;
- (void)reportOtherButtonPressed:(id)a3 context:(id)a4;
- (void)reportPageCompleted:(BOOL)a3 context:(id)a4;
- (void)reportViewAppeared;
- (void)reportViewAppearedWithContext:(id)a3;
- (void)setPageTag:(id)a3;
@end

@implementation PKProvisioningAnalyticsSessionUIReporter

- (PKProvisioningAnalyticsSessionUIReporter)initWithResponder:(id)a3 sessionID:(id)a4 pageTag:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningAnalyticsSessionUIReporter;
  v10 = [(PKProvisioningAnalyticsSessionReporter *)&v13 initWithResponder:a3 sessionID:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_pageTag, a5);
  }

  return v11;
}

- (void)reportEvent:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  [v4 setObject:self->_pageTag forKeyedSubscript:@"pageTag"];
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningAnalyticsSessionUIReporter;
  [(PKProvisioningAnalyticsSessionReporter *)&v5 reportEvent:v4];
}

- (void)reportViewAppeared
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"eventType";
  v5[0] = @"viewDidAppear";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v3];
}

- (void)reportViewAppearedWithContext:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [v4 setObject:@"viewDidAppear" forKeyedSubscript:@"eventType"];
  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v4];
}

- (void)reportButtonPressed:(unint64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"buttonTap";
  v6[0] = @"eventType";
  v6[1] = @"buttonTag";
  id v4 = PKProvisioningAnalyticsButtonTagToString(a3);
  v7[1] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v5];
}

- (void)reportButtonPressed:(unint64_t)a3 context:(id)a4
{
  id v7 = (id)[a4 mutableCopy];
  [v7 setObject:@"buttonTap" forKeyedSubscript:@"eventType"];
  v6 = PKProvisioningAnalyticsButtonTagToString(a3);
  [v7 setObject:v6 forKeyedSubscript:@"buttonTag"];

  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v7];
}

- (void)reportOtherButtonPressed:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"eventType";
  v7[1] = @"buttonTag";
  v8[0] = @"buttonTap";
  v8[1] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];

  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v6];
}

- (void)reportOtherButtonPressed:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = (id)[a4 mutableCopy];
  [v7 setObject:@"buttonTap" forKeyedSubscript:@"eventType"];
  [v7 setObject:v6 forKeyedSubscript:@"buttonTag"];

  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v7];
}

- (void)reportPageCompleted:(BOOL)a3 context:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v8) {
    [v6 addEntriesFromDictionary:v8];
  }
  [v6 setObject:@"pageTaskFinished" forKeyedSubscript:@"eventType"];
  id v7 = PKAnalyticsReportResultSuccess;
  if (!v4) {
    id v7 = PKAnalyticsReportResultFailure;
  }
  [v6 setObject:*v7 forKeyedSubscript:@"result"];
  [(PKProvisioningAnalyticsSessionUIReporter *)self reportEvent:v6];
}

- (NSString)pageTag
{
  return self->_pageTag;
}

- (void)setPageTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end