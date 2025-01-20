@interface FRAnalyticsReferral
- (BOOL)appOpenedByUserActivity;
- (FRAnalyticsReferral)initWithAppSessionStartFromNotificationType:(int64_t)a3;
- (FRAnalyticsReferral)initWithAppSessionStartMethod:(int64_t)a3;
- (FRAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 appOpenedByUserActivity:(BOOL)a9 widgetModeGroupID:(id)a10 widgetEngagement:(id)a11 appSessionStartMethod:(int64_t)a12 appSessionStartNotificationType:(int64_t)a13;
- (NSString)campaignID;
- (NSString)campaignType;
- (NSString)creativeID;
- (NSString)referringApplication;
- (NSString)referringURL;
- (NSString)userActivityType;
- (NSString)widgetModeGroupID;
- (NTPBWidgetEngagement)widgetEngagement;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)appSessionNotificationType;
- (int64_t)appSessionStartMethod;
- (void)setAppOpenedByUserActivity:(BOOL)a3;
- (void)setAppSessionNotificationType:(int64_t)a3;
- (void)setAppSessionStartMethod:(int64_t)a3;
- (void)setCampaignID:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeID:(id)a3;
- (void)setReferringApplication:(id)a3;
- (void)setReferringURL:(id)a3;
- (void)setUserActivityType:(id)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)setWidgetModeGroupID:(id)a3;
@end

@implementation FRAnalyticsReferral

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_widgetModeGroupID, 0);
  objc_storeStrong((id *)&self->_referringURL, 0);
  objc_storeStrong((id *)&self->_referringApplication, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
  objc_storeStrong((id *)&self->_creativeID, 0);

  objc_storeStrong((id *)&self->_userActivityType, 0);
}

- (FRAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 appOpenedByUserActivity:(BOOL)a9 widgetModeGroupID:(id)a10 widgetEngagement:(id)a11 appSessionStartMethod:(int64_t)a12 appSessionStartNotificationType:(int64_t)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  id v26 = a11;
  v45.receiver = self;
  v45.super_class = (Class)FRAnalyticsReferral;
  v27 = [(FRAnalyticsReferral *)&v45 init];
  if (v27)
  {
    v28 = (NSString *)[v19 copy];
    userActivityType = v27->_userActivityType;
    v27->_userActivityType = v28;

    v30 = (NSString *)[v20 copy];
    creativeID = v27->_creativeID;
    v27->_creativeID = v30;

    v32 = (NSString *)[v21 copy];
    campaignID = v27->_campaignID;
    v27->_campaignID = v32;

    v34 = (NSString *)[v22 copy];
    campaignType = v27->_campaignType;
    v27->_campaignType = v34;

    v36 = (NSString *)[v23 copy];
    referringApplication = v27->_referringApplication;
    v27->_referringApplication = v36;

    v38 = (NSString *)[v24 copy];
    referringURL = v27->_referringURL;
    v27->_referringURL = v38;

    v27->_appOpenedByUserActivity = a9;
    v40 = (NSString *)[v25 copy];
    widgetModeGroupID = v27->_widgetModeGroupID;
    v27->_widgetModeGroupID = v40;

    v42 = (NTPBWidgetEngagement *)[v26 copy];
    widgetEngagement = v27->_widgetEngagement;
    v27->_widgetEngagement = v42;

    v27->_appSessionStartMethod = a12;
    v27->_appSessionNotificationType = a13;
  }

  return v27;
}

- (NSString)referringURL
{
  return self->_referringURL;
}

- (NSString)referringApplication
{
  return self->_referringApplication;
}

- (FRAnalyticsReferral)initWithAppSessionStartFromNotificationType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FRAnalyticsReferral;
  result = [(FRAnalyticsReferral *)&v5 init];
  if (result)
  {
    result->_appSessionStartMethod = 3;
    result->_appSessionNotificationType = a3;
  }
  return result;
}

- (FRAnalyticsReferral)initWithAppSessionStartMethod:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FRAnalyticsReferral;
  v4 = [(FRAnalyticsReferral *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(FRAnalyticsReferral *)v4 setAppSessionStartMethod:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[FRAnalyticsReferral allocWithZone:a3] init];
  objc_super v5 = [(FRAnalyticsReferral *)self userActivityType];
  [(FRAnalyticsReferral *)v4 setUserActivityType:v5];

  v6 = [(FRAnalyticsReferral *)self creativeID];
  [(FRAnalyticsReferral *)v4 setCreativeID:v6];

  objc_super v7 = [(FRAnalyticsReferral *)self campaignID];
  [(FRAnalyticsReferral *)v4 setCampaignID:v7];

  v8 = [(FRAnalyticsReferral *)self campaignType];
  [(FRAnalyticsReferral *)v4 setCampaignType:v8];

  v9 = [(FRAnalyticsReferral *)self referringApplication];
  [(FRAnalyticsReferral *)v4 setReferringApplication:v9];

  v10 = [(FRAnalyticsReferral *)self referringURL];
  [(FRAnalyticsReferral *)v4 setReferringURL:v10];

  [(FRAnalyticsReferral *)v4 setAppOpenedByUserActivity:[(FRAnalyticsReferral *)self appOpenedByUserActivity]];
  v11 = [(FRAnalyticsReferral *)self widgetModeGroupID];
  [(FRAnalyticsReferral *)v4 setWidgetModeGroupID:v11];

  v12 = [(FRAnalyticsReferral *)self widgetEngagement];
  [(FRAnalyticsReferral *)v4 setWidgetEngagement:v12];

  [(FRAnalyticsReferral *)v4 setAppSessionStartMethod:[(FRAnalyticsReferral *)self appSessionStartMethod]];
  return v4;
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
}

- (NSString)creativeID
{
  return self->_creativeID;
}

- (void)setCreativeID:(id)a3
{
}

- (NSString)campaignID
{
  return self->_campaignID;
}

- (void)setCampaignID:(id)a3
{
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
}

- (void)setReferringApplication:(id)a3
{
}

- (void)setReferringURL:(id)a3
{
}

- (NSString)widgetModeGroupID
{
  return self->_widgetModeGroupID;
}

- (void)setWidgetModeGroupID:(id)a3
{
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
}

- (BOOL)appOpenedByUserActivity
{
  return self->_appOpenedByUserActivity;
}

- (void)setAppOpenedByUserActivity:(BOOL)a3
{
  self->_appOpenedByUserActivity = a3;
}

- (int64_t)appSessionStartMethod
{
  return self->_appSessionStartMethod;
}

- (void)setAppSessionStartMethod:(int64_t)a3
{
  self->_appSessionStartMethod = a3;
}

- (int64_t)appSessionNotificationType
{
  return self->_appSessionNotificationType;
}

- (void)setAppSessionNotificationType:(int64_t)a3
{
  self->_appSessionNotificationType = a3;
}

@end