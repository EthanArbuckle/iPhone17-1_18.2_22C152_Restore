@interface SiriCoreLinkRecommendationInfo
- (BOOL)btPreference;
- (BOOL)wifiPreference;
- (SiriCoreLinkRecommendationInfo)initWithPreferences:(BOOL)a3 wifiPreference:(BOOL)a4 timeTaken:(double)a5 metrics:(id)a6;
- (SiriCoreLinkRecommendationInfo)initWithQueue:(id)a3;
- (double)timeTaken;
- (id)linkMetrics;
- (void)fetchLinkMetrics:(id)a3;
- (void)resetLinkMetrics;
- (void)setBTPreference:(BOOL)a3;
- (void)setLinkMetrics:(id)a3;
- (void)setTimeTaken:(double)a3;
- (void)setWiFiPreference:(BOOL)a3;
@end

@implementation SiriCoreLinkRecommendationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iRATClient, 0);

  objc_storeStrong((id *)&self->_linkRecommendationMetrics, 0);
}

- (void)fetchLinkMetrics:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)resetLinkMetrics
{
  self->_timeTaken = 0.0;
  self->_linkRecommendationMetrics = 0;
  *(_WORD *)&self->_btPreference = 1;
  MEMORY[0x270F9A758]();
}

- (id)linkMetrics
{
  return self->_linkRecommendationMetrics;
}

- (void)setLinkMetrics:(id)a3
{
}

- (void)setTimeTaken:(double)a3
{
  self->_timeTaken = a3;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (void)setWiFiPreference:(BOOL)a3
{
  self->_wifiPreference = a3;
}

- (BOOL)wifiPreference
{
  return self->_wifiPreference;
}

- (void)setBTPreference:(BOOL)a3
{
  self->_btPreference = a3;
}

- (BOOL)btPreference
{
  return self->_btPreference;
}

- (SiriCoreLinkRecommendationInfo)initWithQueue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriCoreLinkRecommendationInfo;
  v5 = [(SiriCoreLinkRecommendationInfo *)&v13 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_btPreference = 0;
    v5->_timeTaken = 0.0;
    WRM_iRATInterfaceClass = (objc_class *)getWRM_iRATInterfaceClass();
    if (WRM_iRATInterfaceClass)
    {
      v8 = (WRM_iRATInterface *)objc_alloc_init(WRM_iRATInterfaceClass);
      iRATClient = v6->_iRATClient;
      v6->_iRATClient = v8;

      [(WRM_iRATInterface *)v6->_iRATClient registerClient:22 queue:v4];
      v10 = *MEMORY[0x263F28390];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SiriCoreLinkRecommendationInfo initWithQueue:]";
        v11 = "%s Using link recommendation";
LABEL_7:
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else
    {
      v10 = *MEMORY[0x263F28390];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SiriCoreLinkRecommendationInfo initWithQueue:]";
        v11 = "%s Unable to use link recommendation";
        goto LABEL_7;
      }
    }
  }

  return v6;
}

- (SiriCoreLinkRecommendationInfo)initWithPreferences:(BOOL)a3 wifiPreference:(BOOL)a4 timeTaken:(double)a5 metrics:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SiriCoreLinkRecommendationInfo;
  v12 = [(SiriCoreLinkRecommendationInfo *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    v12->_btPreference = a3;
    v12->_wifiPreference = a4;
    v12->_timeTaken = a5;
    objc_storeStrong((id *)&v12->_linkRecommendationMetrics, a6);
  }

  return v13;
}

@end