@interface VUIActionOpenWebLink
- (NSDictionary)contextData;
- (NSDictionary)metrics;
- (NSString)webUrl;
- (VUIActionAppPunchout)actionPunchout;
- (VUIActionOpenWebLink)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setActionPunchout:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setContextData:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setWebUrl:(id)a3;
@end

@implementation VUIActionOpenWebLink

- (VUIActionOpenWebLink)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VUIActionOpenWebLink;
  v9 = [(VUIActionOpenWebLink *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
    uint64_t v11 = objc_msgSend(v7, "vui_stringForKey:", @"webUrl");
    webUrl = v10->_webUrl;
    v10->_webUrl = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v7, "vui_dictionaryForKey:", @"metrics");
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v13;
  }
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9 = WeakRetained;
  webUrl = self->_webUrl;
  if (webUrl) {
    BOOL v11 = WeakRetained == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v23[0] = @"openUrl";
    v23[1] = @"metrics";
    metrics = self->_metrics;
    if (!metrics) {
      metrics = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    v24[0] = webUrl;
    v24[1] = metrics;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = webUrl;
    v15 = [v13 dictionaryWithObjects:v24 forKeys:v23 count:2];

    objc_super v16 = [[VUIActionAppPunchout alloc] initWithContextData:v15 appContext:v9];
    actionPunchout = self->_actionPunchout;
    self->_actionPunchout = v16;

    if (self->_actionPunchout)
    {
      objc_initWeak(&location, self);
      v18 = self->_actionPunchout;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__VUIActionOpenWebLink_performWithTargetResponder_completionHandler___block_invoke;
      v19[3] = &unk_1E6DF4428;
      objc_copyWeak(&v21, &location);
      id v20 = v7;
      [(VUIActionAppPunchout *)v18 performWithTargetResponder:v6 completionHandler:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __69__VUIActionOpenWebLink_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setActionPunchout:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (NSString)webUrl
{
  return self->_webUrl;
}

- (void)setWebUrl:(id)a3
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (VUIActionAppPunchout)actionPunchout
{
  return self->_actionPunchout;
}

- (void)setActionPunchout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPunchout, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_webUrl, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end