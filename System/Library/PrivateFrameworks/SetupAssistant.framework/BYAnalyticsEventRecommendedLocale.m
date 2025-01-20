@interface BYAnalyticsEventRecommendedLocale
- (BOOL)userSawRecommendedLocale;
- (BOOL)userVisitedLocalePane;
- (BYAnalyticsEventRecommendedLocale)initWithAnalyticsManager:(id)a3;
- (double)durationOfWiFiScan;
- (id)eventPayload;
- (unint64_t)source;
- (void)setDurationOfWiFiScan:(double)a3;
- (void)setSource:(unint64_t)a3;
- (void)setUserSawRecommendedLocale:(BOOL)a3;
- (void)setUserVisitedLocalePane:(BOOL)a3;
@end

@implementation BYAnalyticsEventRecommendedLocale

- (BYAnalyticsEventRecommendedLocale)initWithAnalyticsManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYAnalyticsEventRecommendedLocale;
  v5 = [(BYAnalyticsEventRecommendedLocale *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__BYAnalyticsEventRecommendedLocale_initWithAnalyticsManager___block_invoke;
    v8[3] = &unk_1E5D2C910;
    v9 = v5;
    [v4 addEvent:@"com.apple.setupassistant.ios.guessedCountry" withPayloadBlock:v8 persist:1];
  }
  return v6;
}

id __62__BYAnalyticsEventRecommendedLocale_initWithAnalyticsManager___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) userVisitedLocalePane])
  {
    v2 = [*(id *)(a1 + 32) eventPayload];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)eventPayload
{
  v11[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(BYAnalyticsEventRecommendedLocale *)self source];
  if (v3 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E5D2CF80[v3];
  }
  v11[0] = v4;
  v10[0] = @"source";
  v10[1] = @"durationOfWiFiScan";
  v5 = NSNumber;
  [(BYAnalyticsEventRecommendedLocale *)self durationOfWiFiScan];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v11[1] = v6;
  v10[2] = @"userSawRecommendedLocale";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BYAnalyticsEventRecommendedLocale userSawRecommendedLocale](self, "userSawRecommendedLocale"));
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (double)durationOfWiFiScan
{
  return self->_durationOfWiFiScan;
}

- (void)setDurationOfWiFiScan:(double)a3
{
  self->_durationOfWiFiScan = a3;
}

- (BOOL)userVisitedLocalePane
{
  return self->_userVisitedLocalePane;
}

- (void)setUserVisitedLocalePane:(BOOL)a3
{
  self->_userVisitedLocalePane = a3;
}

- (BOOL)userSawRecommendedLocale
{
  return self->_userSawRecommendedLocale;
}

- (void)setUserSawRecommendedLocale:(BOOL)a3
{
  self->_userSawRecommendedLocale = a3;
}

@end