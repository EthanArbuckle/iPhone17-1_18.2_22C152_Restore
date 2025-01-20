@interface TPSAnalyticsEventAppLaunched
+ (BOOL)supportsSecureCoding;
+ (id)_currentSessionEvents;
+ (id)_initialSessionEvent;
+ (id)_latestSessionEvent;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6;
+ (id)firstLaunchEvent;
+ (id)lastRecordedLaunchType;
+ (void)appSessionEndedWithType:(id)a3;
+ (void)resetLaunchNumber;
- (NSNumber)launchNumber;
- (NSString)collectionID;
- (NSString)contentID;
- (NSString)correlationID;
- (NSString)launchType;
- (NSString)userType;
- (TPSAnalyticsEventAppLaunched)initWithCoder:(id)a3;
- (id)_initFirstLaunchEvent;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (id)userTypeString;
- (void)_aggregateLog;
- (void)_updateLaunchCount;
- (void)encodeWithCoder:(id)a3;
- (void)log;
- (void)persistKeys;
- (void)setCollectionID:(id)a3;
- (void)setContentID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setLaunchType:(id)a3;
@end

@implementation TPSAnalyticsEventAppLaunched

+ (id)_initialSessionEvent
{
  v2 = [a1 _currentSessionEvents];
  v3 = [v2 firstObject];

  return v3;
}

- (void)log
{
  id v4 = [(id)objc_opt_class() _currentSessionEvents];
  [v4 addObject:self];
  v3 = [(id)objc_opt_class() _initialSessionEvent];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v3 selector:sel__aggregateLog object:0];
  [v3 performSelector:sel__aggregateLog withObject:0 afterDelay:1.0];
}

+ (id)_currentSessionEvents
{
  if (_currentSessionEvents_predicate != -1) {
    dispatch_once(&_currentSessionEvents_predicate, &__block_literal_global_0);
  }
  v2 = (void *)_currentSessionEvents_gCurrentSessionEvents;
  return v2;
}

uint64_t __53__TPSAnalyticsEventAppLaunched__currentSessionEvents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v1 = _currentSessionEvents_gCurrentSessionEvents;
  _currentSessionEvents_gCurrentSessionEvents = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithContentID:v13 collectionID:v12 correlationID:v11 launchType:v10];

  return v14;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = (__CFString *)a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v14 = [(TPSAnalyticsEvent *)&v19 initWithDate:0];
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = [(TPSAnalyticsEventAppLaunched *)v14 userTypeString];
    userType = v15->_userType;
    v15->_userType = (NSString *)v16;

    objc_storeStrong((id *)&v15->_launchType, a6);
    if (v10)
    {
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      id v10 = @"landing_page";
      if (v11)
      {
LABEL_4:
        if (v12)
        {
LABEL_5:
          objc_storeStrong((id *)&v15->_contentID, v10);
          objc_storeStrong((id *)&v15->_collectionID, v11);
          objc_storeStrong((id *)&v15->_correlationID, v12);
          goto LABEL_6;
        }
LABEL_9:
        id v12 = @"landing_page";
        goto LABEL_5;
      }
    }
    id v11 = @"landing_page";
    if (v12) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v15;
}

- (id)userTypeString
{
  v2 = +[TPSCommonDefines sharedInstance];
  unint64_t v3 = [v2 userType];

  if (v3 > 2) {
    return @"undefined";
  }
  else {
    return off_1E5906720[v3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAppLaunched)initWithCoder:(id)a3
{
  v23[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v5 = [(TPSAnalyticsEvent *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user_type"];
    userType = v5->_userType;
    v5->_userType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launch_src"];
    launchType = v5->_launchType;
    v5->_launchType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seq_num"];
    launchNumber = v5->_launchNumber;
    v5->_launchNumber = (NSNumber *)v16;

    v23[0] = @"quick_action";
    v23[1] = @"universal_link";
    v23[2] = @"springboard";
    v23[3] = @"foreground";
    v23[4] = @"background";
    v23[5] = @"terminated";
    v23[6] = @"carousel";
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:7];
    objc_super v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session_reset"];
    if ([v19 BOOLValue])
    {
      int v20 = [v18 containsObject:v5->_launchType];

      if (v20) {
        +[TPSAnalyticsEventContentViewed resetSessionViewNumber];
      }
    }
    else
    {
    }
  }

  return v5;
}

+ (void)resetLaunchNumber
{
}

- (id)_initFirstLaunchEvent
{
  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v2 = [(TPSAnalyticsEvent *)&v8 initWithDate:0];
  if (v2)
  {
    [(id)objc_opt_class() resetLaunchNumber];
    uint64_t v3 = [(TPSAnalyticsEventAppLaunched *)v2 userType];
    userType = v2->_userType;
    v2->_userType = (NSString *)v3;

    launchType = v2->_launchType;
    v2->_launchType = (NSString *)@"first_launch";

    objc_storeStrong((id *)&v2->_contentID, @"landing_page");
    objc_storeStrong((id *)&v2->_collectionID, @"landing_page");
    objc_storeStrong((id *)&v2->_correlationID, @"landing_page");
    launchNumber = v2->_launchNumber;
    v2->_launchNumber = (NSNumber *)&unk_1EED9AC48;
  }
  return v2;
}

+ (id)firstLaunchEvent
{
  v2 = (void *)[objc_alloc((Class)a1) _initFirstLaunchEvent];
  return v2;
}

- (void)_updateLaunchCount
{
  uint64_t v3 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSAppLaunchCount"];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "intValue") + 1);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (NSNumber *)&unk_1EED9AC48;
  }
  +[TPSAnalyticsPersistenceController persistObject:v5 forKey:@"TPSAppLaunchCount"];
  launchNumber = self->_launchNumber;
  self->_launchNumber = v5;
  v7 = v5;

  BOOL v8 = +[TPSAnalyticsEventContentViewed updateSessionViewNumber];
  self->_needsSessionReset = v8;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsEventAppLaunched;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v6 encodeWithCoder:v4];
  [(TPSAnalyticsEventAppLaunched *)self _updateLaunchCount];
  [v4 encodeObject:self->_userType forKey:@"user_type"];
  [v4 encodeObject:self->_launchType forKey:@"launch_src"];
  [v4 encodeObject:self->_contentID forKey:@"tip_ID"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_launchNumber forKey:@"seq_num"];
  v5 = [NSNumber numberWithBool:self->_needsSessionReset];
  [v4 encodeObject:v5 forKey:@"session_reset"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"app_launch"];
}

- (id)mutableAnalyticsEventRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_userType forKeyedSubscript:@"user_type"];
  [v3 setObject:self->_launchNumber forKeyedSubscript:@"seq_num"];
  [v3 setObject:self->_launchType forKeyedSubscript:@"launch_src"];
  [v3 setObject:self->_contentID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (void)persistKeys
{
}

+ (id)_latestSessionEvent
{
  v2 = [a1 _currentSessionEvents];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

+ (void)appSessionEndedWithType:(id)a3
{
  id v5 = +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:0 correlationID:0 launchType:a3];
  uint64_t v3 = [(id)objc_opt_class() _currentSessionEvents];
  [v3 addObject:v5];
  id v4 = [(id)objc_opt_class() _initialSessionEvent];
  [v4 _aggregateLog];
}

- (void)_aggregateLog
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__aggregateLog object:0];
  v2 = [(id)objc_opt_class() _currentSessionEvents];
  id v6 = [v2 lastObject];

  uint64_t v3 = [v6 launchType];
  id v4 = [(id)objc_opt_class() _currentSessionEvents];
  [v4 removeAllObjects];

  if (v3 != @"background" && v3 != @"terminated")
  {
    id v5 = +[TPSAnalyticsEventController sharedInstance];
    [v5 logAnalyticsEvent:v6];
  }
}

+ (id)lastRecordedLaunchType
{
  v2 = [a1 _latestSessionEvent];
  uint64_t v3 = [v2 launchType];

  return v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSNumber)launchNumber
{
  return self->_launchNumber;
}

- (NSString)userType
{
  return self->_userType;
}

- (NSString)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchType, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_launchNumber, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end