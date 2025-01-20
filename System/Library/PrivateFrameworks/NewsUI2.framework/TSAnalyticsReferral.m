@interface TSAnalyticsReferral
- (BOOL)appOpenedByUserActivity;
- (NSString)campaignID;
- (NSString)campaignType;
- (NSString)creativeID;
- (NSString)referringApplication;
- (NSString)referringURL;
- (NSString)userActivityType;
- (NSString)widgetModeGroupID;
- (NTPBWidgetEngagement)widgetEngagement;
- (TSAnalyticsReferral)init;
- (TSAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 widgetModeGroupID:(id)a9 widgetEngagement:(id)a10 appOpenedByUserActivity:(BOOL)a11 appSessionStartMethod:(int)a12 appSessionStartNotificationType:(int)a13;
- (int)appSessionStartMethod;
- (int)appSessionStartNotificationType;
@end

@implementation TSAnalyticsReferral

- (NSString)userActivityType
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_userActivityType);
}

- (NSString)creativeID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_creativeID);
}

- (NSString)campaignID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_campaignID);
}

- (NSString)campaignType
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_campaignType);
}

- (NSString)referringApplication
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_referringApplication);
}

- (NSString)referringURL
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_referringURL);
}

- (NSString)widgetModeGroupID
{
  return (NSString *)sub_1DF2629FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_widgetModeGroupID);
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return (NTPBWidgetEngagement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___TSAnalyticsReferral_widgetEngagement));
}

- (BOOL)appOpenedByUserActivity
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appOpenedByUserActivity);
}

- (int)appSessionStartMethod
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appSessionStartMethod);
}

- (int)appSessionStartNotificationType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appSessionStartNotificationType);
}

- (TSAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 widgetModeGroupID:(id)a9 widgetEngagement:(id)a10 appOpenedByUserActivity:(BOOL)a11 appSessionStartMethod:(int)a12 appSessionStartNotificationType:(int)a13
{
  if (a3)
  {
    uint64_t v18 = sub_1DFDFDD20();
    uint64_t v48 = v19;
    uint64_t v49 = v18;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v20 = sub_1DFDFDD20();
      uint64_t v46 = v21;
      uint64_t v47 = v20;
      id v22 = a9;
      id v23 = a10;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  id v22 = a9;
  id v23 = a10;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v24 = sub_1DFDFDD20();
  uint64_t v44 = v25;
  uint64_t v45 = v24;
  if (a6)
  {
LABEL_5:
    uint64_t v26 = sub_1DFDFDD20();
    uint64_t v42 = v27;
    uint64_t v43 = v26;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v42 = 0;
  uint64_t v43 = 0;
LABEL_10:
  id v28 = a7;
  id v29 = a8;
  id v30 = v22;
  id v41 = v23;
  if (v28)
  {
    uint64_t v31 = sub_1DFDFDD20();
    uint64_t v33 = v32;

    if (v29)
    {
LABEL_12:
      uint64_t v34 = sub_1DFDFDD20();
      uint64_t v36 = v35;

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
    if (v29) {
      goto LABEL_12;
    }
  }
  uint64_t v34 = 0;
  uint64_t v36 = 0;
LABEL_15:
  if (v30)
  {
    uint64_t v37 = sub_1DFDFDD20();
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  return (TSAnalyticsReferral *)AnalyticsReferral.init(userActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:widgetModeGroupID:widgetEngagement:appOpenedByUserActivity:appSessionStartMethod:appSessionStartNotificationType:)(v49, v48, v47, v46, v45, v44, v43, v42, v31, v33, v34, v36, v37, v39, (uint64_t)v41, a11, a12, a13);
}

- (TSAnalyticsReferral)init
{
  result = (TSAnalyticsReferral *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_widgetEngagement);
}

@end