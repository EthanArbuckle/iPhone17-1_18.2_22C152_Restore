@interface PKProvisioningAnalyticsSessionReporter
- (NSString)sessionID;
- (PKProvisioningAnalyticsSessionReporter)initWithResponder:(id)a3 sessionID:(id)a4;
- (PKProvisioningAnalyticsSessionReportingResponder)responder;
- (void)_populateDictionary:(id)a3 withError:(id)a4;
- (void)reportError:(id)a3 context:(id)a4;
- (void)reportEvent:(id)a3;
- (void)reportOtherError:(id)a3 context:(id)a4;
- (void)resetProductTypes;
- (void)setProductType:(id)a3 subtype:(id)a4;
- (void)setResponder:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSetupProduct:(id)a3;
@end

@implementation PKProvisioningAnalyticsSessionReporter

- (PKProvisioningAnalyticsSessionReporter)initWithResponder:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningAnalyticsSessionReporter;
  v7 = [(PKProvisioningAnalyticsSessionReporter *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_responder, v6);
    v8->_sessionID = (NSString *)a4;
  }

  return v8;
}

- (void)_populateDictionary:(id)a3 withError:(id)a4
{
  if (a4) {
    [a3 setObject:@"other" forKeyedSubscript:@"errorType"];
  }
}

- (void)reportEvent:(id)a3
{
  p_responder = &self->_responder;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_responder);
  [WeakRetained didReceiveEvent:v4];
}

- (void)reportError:(id)a3 context:(id)a4
{
  id v10 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  if (v10) {
    [v8 addEntriesFromDictionary:v10];
  }
  [v8 setObject:@"pageError" forKeyedSubscript:@"eventType"];
  [(PKProvisioningAnalyticsSessionReporter *)self _populateDictionary:v8 withError:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  [WeakRetained didReceiveEvent:v8];
}

- (void)reportOtherError:(id)a3 context:(id)a4
{
  id v10 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  if (v10) {
    [v8 addEntriesFromDictionary:v10];
  }
  [v8 setObject:@"pageError" forKeyedSubscript:@"eventType"];
  [v8 setObject:v7 forKeyedSubscript:@"errorText"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  [WeakRetained didReceiveEvent:v8];
}

- (void)setProductType:(id)a3 subtype:(id)a4
{
  p_responder = &self->_responder;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_responder);
  [WeakRetained setProductType:v7 subtype:v6];
}

- (void)resetProductTypes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  [WeakRetained resetProductTypes];
}

- (void)setSetupProduct:(id)a3
{
  p_responder = &self->_responder;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_responder);
  [WeakRetained setSetupProduct:v4];
}

- (PKProvisioningAnalyticsSessionReportingResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (PKProvisioningAnalyticsSessionReportingResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  self->_sessionID = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end