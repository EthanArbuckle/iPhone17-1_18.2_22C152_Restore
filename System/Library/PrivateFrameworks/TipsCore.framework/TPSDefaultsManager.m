@interface TPSDefaultsManager
+ (BOOL)debugActiveIAPs;
+ (BOOL)displayAllFeaturedTopics;
+ (BOOL)ignoreCloud;
+ (BOOL)ignoreTargetingValidator;
+ (BOOL)isInternalDevice;
+ (BOOL)resetDaemonData;
+ (BOOL)resetDataCache;
+ (BOOL)showAllCollections;
+ (BOOL)showCollectionIntro;
+ (BOOL)showPagingLabelOnLongPress;
+ (BOOL)suppressNotifications;
+ (BOOL)suppressTipKitContent;
+ (NSArray)matchedClientConditionTargeting;
+ (NSArray)matchedClientConditions;
+ (NSDate)lastMajorVersionUpdateDate;
+ (NSNumber)contentUpdatedDarwinNotificationInSeconds;
+ (NSNumber)contextualEventDaysSinceLastMajorUpdateInSeconds;
+ (NSNumber)hintCustomizationID;
+ (NSNumber)holdoutGroup;
+ (NSNumber)requestInterval;
+ (NSNumber)standardNotificationInterval;
+ (NSNumber)userType;
+ (NSString)assetRatioIdentifier;
+ (NSString)assetRequestHostURL;
+ (NSString)assetURL;
+ (NSString)deviceModel;
+ (NSString)displayContentForContext;
+ (NSString)featuredCollection;
+ (NSString)hintActionText;
+ (NSString)hintActionURL;
+ (NSString)hintBody;
+ (NSString)hintMonitoringEvents;
+ (NSString)hintTitle;
+ (NSString)minVersionForSpatialAudio;
+ (NSString)notificationDocument;
+ (NSString)platform;
+ (NSString)releaseType;
+ (NSString)requestHostURL;
+ (NSString)requestLanguage;
+ (NSString)requestModel;
+ (NSString)requestPlatform;
+ (NSString)requestURL;
+ (NSString)requestVersion;
+ (NSString)widgetDocument;
+ (double)contextualEventLookBackDaysInSeconds;
+ (double)discoverabilitySuppressionInterval;
+ (double)featuredDocumentInterval;
+ (double)hintMaxDurationTimeInterval;
+ (double)sessionTimeoutIntervalInSeconds;
+ (double)welcomeNotificationDelay;
+ (double)welcomeNotificationGracePeriod;
+ (int64_t)crunchingIntervalInDays;
+ (int64_t)discoverabilityOverrideMaxDisplayCount;
+ (int64_t)triggerMinObservationCount;
+ (void)setIsInternalDevice:(BOOL)a3;
- (TPSDefaultsManager)init;
@end

@implementation TPSDefaultsManager

+ (BOOL)isInternalDevice
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return byte_1EB516E20;
}

+ (BOOL)resetDataCache
{
  return sub_19C954068() & 1;
}

+ (NSString)requestURL
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 39);
}

+ (NSString)assetURL
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 2);
}

+ (NSString)assetRequestHostURL
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 1);
}

+ (BOOL)showCollectionIntro
{
  return sub_19C954684() & 1;
}

+ (BOOL)ignoreTargetingValidator
{
  return sub_19C953A48() & 1;
}

+ (double)sessionTimeoutIntervalInSeconds
{
  sub_19C8F54D8(43, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (NSArray)matchedClientConditionTargeting
{
  return (NSArray *)sub_19C8F31D8((uint64_t)a1, (uint64_t)a2, 28);
}

+ (NSNumber)standardNotificationInterval
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(47);
  return (NSNumber *)v2;
}

+ (NSDate)lastMajorVersionUpdateDate
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  MEMORY[0x1F4188790]();
  double v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C8F54D8(26, &v10);
  if (v11)
  {
    uint64_t v4 = sub_19C976560();
    int v5 = swift_dynamicCast();
    uint64_t v6 = *(void *)(v4 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v3, v5 ^ 1u, 1, v4);
    v7 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4) != 1)
    {
      v7 = (void *)sub_19C976510();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v3, v4);
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v10);
    uint64_t v8 = sub_19C976560();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    v7 = 0;
  }
  return (NSDate *)v7;
}

+ (NSArray)matchedClientConditions
{
  return (NSArray *)sub_19C8F31D8((uint64_t)a1, (uint64_t)a2, 29);
}

+ (BOOL)suppressTipKitContent
{
  return sub_19C954FB4() & 1;
}

+ (NSString)notificationDocument
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 31);
}

+ (NSString)assetRatioIdentifier
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 0);
}

+ (BOOL)showAllCollections
{
  return sub_19C954378() & 1;
}

+ (NSString)featuredCollection
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 13);
}

+ (NSString)requestLanguage
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 36);
}

+ (NSString)deviceModel
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 8);
}

+ (int64_t)crunchingIntervalInDays
{
  sub_19C8F54D8(6, &v4);
  uint64_t v2 = v5;
  sub_19C8F58A0((uint64_t)&v4);
  if (v2) {
    return sub_19C952E04(6);
  }
  else {
    return sub_19C9761B0();
  }
}

+ (int64_t)discoverabilityOverrideMaxDisplayCount
{
  return sub_19C952E04(9);
}

+ (int64_t)triggerMinObservationCount
{
  return sub_19C952E04(50);
}

+ (BOOL)debugActiveIAPs
{
  return sub_19C953114() & 1;
}

+ (BOOL)displayAllFeaturedTopics
{
  return sub_19C953424() & 1;
}

+ (BOOL)ignoreCloud
{
  return sub_19C953734() & 1;
}

+ (void)setIsInternalDevice:(BOOL)a3
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  byte_1EB516E20 = a3;
}

+ (BOOL)resetDaemonData
{
  return sub_19C953D58() & 1;
}

+ (BOOL)showPagingLabelOnLongPress
{
  return sub_19C954994() & 1;
}

+ (BOOL)suppressNotifications
{
  return sub_19C954CA4() & 1;
}

+ (NSString)displayContentForContext
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 12);
}

+ (NSString)hintActionText
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 15);
}

+ (NSString)hintActionURL
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 16);
}

+ (NSString)hintBody
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 17);
}

+ (NSString)hintMonitoringEvents
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 20);
}

+ (NSString)hintTitle
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 21);
}

+ (NSString)minVersionForSpatialAudio
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 30);
}

+ (NSString)platform
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 32);
}

+ (NSString)requestHostURL
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 34);
}

+ (NSString)requestModel
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 37);
}

+ (NSString)requestPlatform
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 38);
}

+ (NSString)releaseType
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 33);
}

+ (NSString)requestVersion
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 40);
}

+ (NSString)widgetDocument
{
  return (NSString *)sub_19C8F543C((uint64_t)a1, (uint64_t)a2, 54);
}

+ (NSNumber)contentUpdatedDarwinNotificationInSeconds
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(3);
  return (NSNumber *)v2;
}

+ (NSNumber)contextualEventDaysSinceLastMajorUpdateInSeconds
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(4);
  return (NSNumber *)v2;
}

+ (NSNumber)hintCustomizationID
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(18);
  return (NSNumber *)v2;
}

+ (NSNumber)holdoutGroup
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(22);
  return (NSNumber *)v2;
}

+ (NSNumber)requestInterval
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(35);
  return (NSNumber *)v2;
}

+ (NSNumber)userType
{
  swift_getObjCClassMetadata();
  id v2 = sub_19C8FECB8(51);
  return (NSNumber *)v2;
}

+ (double)contextualEventLookBackDaysInSeconds
{
  sub_19C8F54D8(5, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)discoverabilitySuppressionInterval
{
  sub_19C8F54D8(10, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)featuredDocumentInterval
{
  sub_19C8F54D8(14, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)hintMaxDurationTimeInterval
{
  sub_19C8F54D8(19, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)welcomeNotificationDelay
{
  sub_19C8F54D8(52, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)welcomeNotificationGracePeriod
{
  sub_19C8F54D8(53, &v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v4);
  }
  return 0.0;
}

- (TPSDefaultsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return [(TPSDefaultsManager *)&v3 init];
}

@end