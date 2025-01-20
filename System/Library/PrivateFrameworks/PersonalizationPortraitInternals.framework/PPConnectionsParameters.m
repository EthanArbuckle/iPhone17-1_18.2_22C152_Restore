@interface PPConnectionsParameters
+ (PPConnectionsParameters)sharedInstance;
- (BOOL)shouldUseAllowedApps;
- (BOOL)shouldUseAllowedWebsite;
- (PPConnectionsParameters)init;
- (double)calendarEventLocationExpirySeconds;
- (double)calendarEventLocationLookaheadTimeSeconds;
- (double)doubleValueForKey:(uint64_t)a3 default:;
- (double)foundInAppsSourceExpirySeconds;
- (double)foundInAppsSourceLookBackSeconds;
- (double)linguisticTriggerExpirySeconds;
- (double)locationAppLastUseTimeoutSeconds;
- (double)namedEntitySourceExpirySeconds;
- (double)namedEntitySourceLookBackSeconds;
- (double)pasteboardItemExpirySeconds;
- (double)userActivityCandidateScore;
- (double)userActivityExpirySeconds;
- (id)assetValueForKey:(id *)a1;
- (id)donationAllowedApps;
- (id)donationAllowedWebsites;
- (id)donationBlockedApps;
- (id)donationBlockedWebsites;
- (id)locationPredictionBlockedApps;
- (int64_t)appSwitcherPredictionExpiry;
- (int64_t)expirySeconds;
- (int64_t)locationAppPredictionInstallHalflife;
- (int64_t)locationAppPredictionInstallMaxScore;
- (int64_t)locationAppPredictionLaunchTimeOfDayFactor;
- (int64_t)locationAppPredictionOverallLaunchFactor;
- (uint64_t)BOOLValueForKey:(id *)a1 default:(void *)a2;
- (uint64_t)integerValueForKey:(uint64_t)a3 default:;
- (uint64_t)unsignedIntegerValueForKey:(id *)a1 default:(void *)a2;
- (unint64_t)quickTypePredictionLimit;
- (unint64_t)userActivityBatchSize;
@end

@implementation PPConnectionsParameters

- (unint64_t)userActivityBatchSize
{
  return -[PPConnectionsParameters unsignedIntegerValueForKey:default:]((id *)&self->super.isa, @"userActivityBatchSize");
}

- (uint64_t)unsignedIntegerValueForKey:(id *)a1 default:(void *)a2
{
  if (!a1) {
    return 0;
  }
  v2 = -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

+ (PPConnectionsParameters)sharedInstance
{
  if (sharedInstance_once_16773 != -1) {
    dispatch_once(&sharedInstance_once_16773, &__block_literal_global_16774);
  }
  v2 = (void *)sharedInstance_shared_16775;
  return (PPConnectionsParameters *)v2;
}

- (double)doubleValueForKey:(uint64_t)a3 default:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = (double)a3;
  }

  return v7;
}

- (id)assetValueForKey:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    pthread_mutex_lock(&_PPConnectionsParametersAssetMutex);
    v2 = [v2[1] objectForKeyedSubscript:v3];

    pthread_mutex_unlock(&_PPConnectionsParametersAssetMutex);
  }
  return v2;
}

- (double)namedEntitySourceLookBackSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"namedEntitySourceLookBackSeconds", 3600);
}

- (double)userActivityExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"userActivityExpirySeconds", 600);
}

- (double)pasteboardItemExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"pasteboardItemExpirySeconds", 600);
}

- (double)calendarEventLocationLookaheadTimeSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"calendarEventLocationLookaheadTimeSeconds", 5400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (id)donationBlockedApps
{
  v2 = -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, @"donationBlockedApps");
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)donationAllowedApps
{
  v2 = -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, @"donationAllowedApps");
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)donationBlockedWebsites
{
  v2 = -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, @"donationBlockedWebsites");
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)donationAllowedWebsites
{
  v2 = -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, @"donationAllowedWebsites");
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)locationPredictionBlockedApps
{
  v2 = -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, @"locationPredictionBlockedApps");
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)shouldUseAllowedApps
{
  return -[PPConnectionsParameters BOOLValueForKey:default:]((id *)&self->super.isa, @"shouldUseAllowedApps");
}

- (uint64_t)BOOLValueForKey:(id *)a1 default:(void *)a2
{
  if (!a1) {
    return 0;
  }
  v2 = -[PPConnectionsParameters assetValueForKey:](a1, a2);
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)shouldUseAllowedWebsite
{
  return -[PPConnectionsParameters BOOLValueForKey:default:]((id *)&self->super.isa, @"shouldUseAllowedWebsite");
}

- (double)locationAppLastUseTimeoutSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"locationAppLastUseTimeoutSeconds", 7200);
}

- (double)linguisticTriggerExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"linguisticTriggerExpirySeconds", 600);
}

- (int64_t)locationAppPredictionOverallLaunchFactor
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"locationAppPredictionOverallLaunchFactor", 80);
}

- (uint64_t)integerValueForKey:(uint64_t)a3 default:
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v5 = v4;
  if (v4) {
    a3 = [v4 integerValue];
  }

  return a3;
}

- (int64_t)locationAppPredictionLaunchTimeOfDayFactor
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"locationAppPredictionLaunchTimeOfDayFactor", 50);
}

- (int64_t)locationAppPredictionInstallMaxScore
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"locationAppPredictionInstallMaxScore", 65);
}

- (int64_t)locationAppPredictionInstallHalflife
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"locationAppPredictionInstallHalflife", 14000);
}

- (int64_t)appSwitcherPredictionExpiry
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"appSwitcherPredictionExpiry", 30);
}

- (double)userActivityCandidateScore
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"userActivityCandidateScore", 100);
}

- (unint64_t)quickTypePredictionLimit
{
  return -[PPConnectionsParameters unsignedIntegerValueForKey:default:]((id *)&self->super.isa, @"quickTypePredictionLimit");
}

- (double)calendarEventLocationExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"calendarEventLocationExpirySeconds", 600);
}

- (double)foundInAppsSourceExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"foundInAppsSourceExpirySeconds", 4200);
}

- (double)foundInAppsSourceLookBackSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"foundInAppsSourceLookBackSeconds", 3600);
}

- (double)namedEntitySourceExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, @"namedEntitySourceExpirySeconds", 4200);
}

- (int64_t)expirySeconds
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, @"expirySeconds", 0);
}

- (PPConnectionsParameters)init
{
  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsParameters;
  v2 = [(PPConnectionsParameters *)&v12 init];
  if (v2)
  {
    qos_class_t v3 = qos_class_self();
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, v3, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPConnectionsParametersQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id location = 0;
    objc_initWeak(&location, v2);
    double v7 = v2->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__PPConnectionsParameters_init__block_invoke;
    v9[3] = &unk_1E65DC540;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__PPConnectionsParameters_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[PPTrialWrapper sharedInstance];
    qos_class_t v3 = [v2 plistForFactorName:@"PPConnectionsParameters.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_CONNECTIONS"];

    if (v3)
    {
      pthread_mutex_lock(&_PPConnectionsParametersAssetMutex);
      objc_storeStrong(WeakRetained + 1, v3);
      pthread_mutex_unlock(&_PPConnectionsParametersAssetMutex);
    }
    else
    {
      uint64_t v4 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_queue_t v5 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPConnectionsParameters: Could not find asset path for PPConnectionsParameters.plist", v5, 2u);
      }
    }
  }
}

uint64_t __41__PPConnectionsParameters_sharedInstance__block_invoke()
{
  sharedInstance_shared_16775 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end