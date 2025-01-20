@interface TPSTipStatusController
- (BOOL)isContentNeverVisibleForIdentifier:(id)a3;
- (BOOL)isContentViewedForIdentifier:(id)a3;
- (BOOL)isContextualInfoLifetimeExpiredForIdentifier:(id)a3;
- (BOOL)isDesiredOutcomePerformedForIdentifier:(id)a3;
- (BOOL)isDesiredOutcomeTrackingEligibleForIdentifier:(id)a3;
- (BOOL)isEligibilityTrackingNeedsRestartForIdentifier:(id)a3;
- (BOOL)isExpiredForIdentifier:(id)a3;
- (BOOL)isHintDismissedForIdentifier:(id)a3;
- (BOOL)isHintDisplayedForIdentifier:(id)a3;
- (BOOL)isHintInelgibileForIdentifier:(id)a3;
- (BOOL)isHintInelgibileForReason:(int64_t)a3 identifier:(id)a4;
- (BOOL)isHintMaxDurationExcceededForIdentifier:(id)a3;
- (BOOL)isLockScreenHintDisplayEligibleForIdentifier:(id)a3;
- (BOOL)isOverrideFrequencyControlForIdentifier:(id)a3;
- (BOOL)isOverrideHoldoutForIdentifier:(id)a3;
- (BOOL)isPreconditionMatchedForIdentifier:(id)a3;
- (BOOL)isTipAppDisplayEligibleForIdentifier:(id)a3;
- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3;
- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3 checkForPrecondition:(BOOL)a4 checkForEligibleDate:(BOOL)a5;
- (BOOL)unviewedContentAvailable;
- (NSDictionary)tipStatusMap;
- (NSMutableDictionary)identifierToTipStatusMap;
- (NSUserDefaults)appGroupDefaults;
- (TPSTipStatusController)init;
- (TPSTipStatusController)initWithAppGroupDefaults:(id)a3;
- (id)_tipStatusForIdentifier:(id)a3 addIfMissing:(BOOL)a4;
- (id)clonedFromIdentifierForIdentifier:(id)a3;
- (id)contentViewedDateForIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correlationIdentifierForIdentifier:(id)a3;
- (id)dateForTriggerRestartTrackingForIdentifier:(id)a3;
- (id)debugDescription;
- (id)firstHintDisplayDateForIdentifier:(id)a3;
- (id)hintEligibleDateForIdentifier:(id)a3;
- (id)hintNotDisplayedDueToFrequencyControlDatesForIdentifier:(id)a3;
- (id)hintWouldHaveBeenDisplayedDateForIdentifier:(id)a3;
- (id)lastDisplayContextForIdentifier:(id)a3;
- (id)lastUsedVersionForIdentifier:(id)a3;
- (id)reenrollHoldoutContent;
- (id)reenrollPreconditionChangeContent;
- (id)statusForIdentifier:(id)a3;
- (id)statusesForCorrelationIdentifier:(id)a3;
- (id)userInfoForIdentifier:(id)a3;
- (id)variantIdentifierForIdentifier:(id)a3;
- (int)hintDisplayedCountForIdentifier:(id)a3;
- (int64_t)hintInelgibileReasonForIdentifier:(id)a3;
- (int64_t)tipStatusCount;
- (unint64_t)displayTypeForIdentifier:(id)a3;
- (unint64_t)usageFlagsForIdentifier:(id)a3;
- (void)_reloadCacheData;
- (void)addDesiredOutcomePerformedDateForIdentifier:(id)a3 date:(id)a4;
- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4;
- (void)addHintNotDisplayedDueToFrequencyControlDateForIdentifier:(id)a3;
- (void)addTipStatuses:(id)a3;
- (void)clearSavedDateForIdentifier:(id)a3;
- (void)donateDesiredOutcomePerformedForIdentifier:(id)a3 date:(id)a4;
- (void)removeAllTipStatus;
- (void)removeCacheData;
- (void)removeTipStatusWithIdentifiers:(id)a3;
- (void)removeUserInfoForIdentifier:(id)a3;
- (void)setAppGroupDefaults:(id)a3;
- (void)setIdentifierToTipStatusMap:(id)a3;
- (void)syncWithIdentifiers:(id)a3;
- (void)updateCacheData;
- (void)updateClonedFromIdentifierForIdentifier:(id)a3 value:(id)a4;
- (void)updateContentViewedForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateCorrelationIdentifierForIdentifier:(id)a3 value:(id)a4;
- (void)updateDateForTriggerRestartTrackingForIdentifier:(id)a3 date:(id)a4;
- (void)updateDisplayTypeForIdentifier:(id)a3 value:(unint64_t)a4;
- (void)updateExpiredForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateHintDismissedForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateHintEligibleDateForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateHintInelgibileForIdentifier:(id)a3 value:(int64_t)a4;
- (void)updateHintWouldHaveBeenDisplayedDateForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateLastUsedVersionForIdentifier:(id)a3 value:(id)a4;
- (void)updateOverrideFrequencyControlForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updateOverrideHoldoutForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updatePreconditionMatchedForIdentifier:(id)a3 value:(BOOL)a4;
- (void)updatePreconditionMatchedForIdentifiers:(id)a3 value:(BOOL)a4;
- (void)updateUserInfoForIdentifier:(id)a3 key:(id)a4 value:(id)a5;
- (void)updateVariantIdentifierForIdentifier:(id)a3 value:(id)a4;
@end

@implementation TPSTipStatusController

- (id)_tipStatusForIdentifier:(id)a3 addIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableDictionary *)v7->_identifierToTipStatusMap objectForKeyedSubscript:v6];
  v9 = (TPSTipStatus *)v8;
  if (v4 && !v8)
  {
    if ([v6 length])
    {
      v9 = [[TPSTipStatus alloc] initWithIdentifier:v6];
      if (v9) {
        [(NSMutableDictionary *)v7->_identifierToTipStatusMap setObject:v9 forKeyedSubscript:v6];
      }
    }
    else
    {
      v9 = 0;
    }
  }
  objc_sync_exit(v7);

  return v9;
}

void __59__TPSTipStatusController_statusesForCorrelationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 correlationIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    id v6 = (void *)[v7 copy];
    [v5 addObject:v6];
  }
}

- (id)statusForIdentifier:(id)a3
{
  return [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
}

- (BOOL)isTipAppDisplayEligibleForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  id v7 = v6;
  if (v6
    && [v6 displayType] != 2
    && [v7 isPreconditionMatched]
    && ([v7 isUserKnew] & 1) == 0)
  {
    v10 = [v7 hintEligibleDate];
    if (v10)
    {
      BOOL v8 = 1;
    }
    else
    {
      v11 = [v7 hintDisplayedDates];
      if ([v11 count])
      {
        BOOL v8 = 1;
      }
      else
      {
        v12 = [v7 hintDismissalDate];
        if (v12)
        {
          BOOL v8 = 1;
        }
        else
        {
          v13 = [v7 contentViewedDate];
          BOOL v8 = v13 != 0;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)isContentNeverVisibleForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 hintDisplayedDates];
    if ([v8 count])
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      v10 = [v7 hintDismissalDate];
      if (v10)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        v11 = [v7 contentViewedDate];
        if (v11)
        {
          LOBYTE(v9) = 0;
        }
        else
        {
          v12 = [v7 desiredOutcomePerformedDates];
          if ([v12 count]) {
            LOBYTE(v9) = 0;
          }
          else {
            int v9 = [v7 isExpired] ^ 1;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)syncWithIdentifiers:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([v9 count])
  {
    v5 = (void *)MEMORY[0x1E4F1CA80];
    id v6 = [(NSMutableDictionary *)v4->_identifierToTipStatusMap allKeys];
    id v7 = [v5 setWithArray:v6];

    [v7 minusSet:v9];
    BOOL v8 = [v7 allObjects];
    [(TPSTipStatusController *)v4 updatePreconditionMatchedForIdentifiers:v8 value:0];
  }
  objc_sync_exit(v4);
}

- (void)updatePreconditionMatchedForIdentifiers:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TPSTipStatusController *)self updatePreconditionMatchedForIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * v10++) value:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updateLastUsedVersionForIdentifier:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v11 addIfMissing:1];
  uint64_t v9 = [v8 lastUsedVersion];
  char v10 = [v9 isEqualToString:v6];

  if ((v10 & 1) == 0)
  {
    [v8 setLastUsedVersion:v6];
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (void)updateVariantIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v9 addIfMissing:1];
  [v8 setVariantIdentifier:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (void)updateCorrelationIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v9 addIfMissing:1];
  [v8 setCorrelationIdentifier:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (void)updateClonedFromIdentifierForIdentifier:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v9 addIfMissing:1];
  [v8 setClonedFromIdentifier:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (void)updateDisplayTypeForIdentifier:(id)a3 value:(unint64_t)a4
{
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:a4 != 0];
  [v7 setDisplayType:a4];
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (void)updateOverrideFrequencyControlForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:v4];
  [v7 setOverrideFrequencyControl:v4];
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (void)updateOverrideHoldoutForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:v4];
  [v7 setOverrideHoldout:v4];
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (void)updatePreconditionMatchedForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ([(TPSTipStatusController *)v6 isPreconditionMatchedForIdentifier:v8] != v4)
  {
    uint64_t v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:v4];
    [v7 setPreconditionMatched:v4];
    if (v4 && [v7 hintIneligibleReason] == 15) {
      [v7 setHintIneligibleReason:0];
    }
    if (!v6->_isDirty && v7) {
      v6->_isDirty = 1;
    }
  }
  objc_sync_exit(v6);
}

- (BOOL)isPreconditionMatchedForIdentifier:(id)a3
{
  v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isPreconditionMatched];

  return v4;
}

- (id)statusesForCorrelationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)v6->_identifierToTipStatusMap allValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__TPSTipStatusController_statusesForCorrelationIdentifier___block_invoke;
  v11[3] = &unk_1E5906FF0;
  id v8 = v4;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  [v7 enumerateObjectsUsingBlock:v11];

  objc_sync_exit(v6);
  return v9;
}

- (void)updateCacheData
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isDirty)
  {
    +[TPSSecureArchivingUtilities archivedDataWithRootObject:obj->_identifierToTipStatusMap forKey:@"TipStatusIdentifierToTipStatusMap" userDefaults:obj->_appGroupDefaults];
    [(NSUserDefaults *)obj->_appGroupDefaults synchronize];
    obj->_isDirty = 0;
  }
  objc_sync_exit(obj);
}

- (void)setAppGroupDefaults:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_appGroupDefaults, a3);
  [(TPSTipStatusController *)v5 _reloadCacheData];
  objc_sync_exit(v5);
}

- (void)_reloadCacheData
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  +[TPSSecureArchivingUtilities unarchivedObjectOfClasses:forKey:userDefaults:](TPSSecureArchivingUtilities, "unarchivedObjectOfClasses:forKey:userDefaults:");
  id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  identifierToTipStatusMap = self->_identifierToTipStatusMap;
  self->_identifierToTipStatusMap = v6;

  if (!self->_identifierToTipStatusMap)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = self->_identifierToTipStatusMap;
    self->_identifierToTipStatusMap = v8;
  }
}

- (TPSTipStatusController)initWithAppGroupDefaults:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSTipStatusController;
    uint64_t v5 = [(TPSTipStatusController *)&v9 init];
    id v6 = v5;
    if (v5) {
      [(TPSTipStatusController *)v5 setAppGroupDefaults:v4];
    }
    self = v6;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (TPSTipStatusController)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_identifierToTipStatusMap copy];
  [v4 setIdentifierToTipStatusMap:v5];

  return v4;
}

- (NSDictionary)tipStatusMap
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableDictionary *)v2->_identifierToTipStatusMap count]) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v2->_identifierToTipStatusMap];
  }
  else {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (int64_t)tipStatusCount
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(NSMutableDictionary *)v2->_identifierToTipStatusMap count];
  objc_sync_exit(v2);

  return v3;
}

- (void)addTipStatuses:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__TPSTipStatusController_addTipStatuses___block_invoke;
  v6[3] = &unk_1E5906FC8;
  v6[4] = v5;
  [v4 enumerateObjectsUsingBlock:v6];
  [(TPSTipStatusController *)v5 updateCacheData];
  objc_sync_exit(v5);
}

void __41__TPSTipStatusController_addTipStatuses___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int64_t v3 = [v5 identifier];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v3];

  if (!v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKeyedSubscript:v3];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

- (void)removeTipStatusWithIdentifiers:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_identifierToTipStatusMap removeObjectsForKeys:v5];
  v4->_isDirty = 1;
  objc_sync_exit(v4);
}

- (void)removeAllTipStatus
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_identifierToTipStatusMap removeAllObjects];
  obj->_isDirty = 1;
  objc_sync_exit(obj);
}

- (id)reenrollHoldoutContent
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count"));
  identifierToTipStatusMap = v2->_identifierToTipStatusMap;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  objc_super v9 = __48__TPSTipStatusController_reenrollHoldoutContent__block_invoke;
  id v10 = &unk_1E5907018;
  id v5 = v3;
  id v11 = v5;
  id v12 = v2;
  [(NSMutableDictionary *)identifierToTipStatusMap enumerateKeysAndObjectsUsingBlock:&v7];
  [(TPSTipStatusController *)v2 updateCacheData];

  objc_sync_exit(v2);
  return v5;
}

void __48__TPSTipStatusController_reenrollHoldoutContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 reenrollIfAllowed])
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = +[TPSLogger data];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_19C8DC000, v6, OS_LOG_TYPE_INFO, "Content %@ reenrolled due to experiment change.", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
  }
}

- (id)reenrollPreconditionChangeContent
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableDictionary count](v2->_identifierToTipStatusMap, "count"));
  identifierToTipStatusMap = v2->_identifierToTipStatusMap;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __59__TPSTipStatusController_reenrollPreconditionChangeContent__block_invoke;
  id v10 = &unk_1E5907018;
  id v5 = v3;
  id v11 = v5;
  id v12 = v2;
  [(NSMutableDictionary *)identifierToTipStatusMap enumerateKeysAndObjectsUsingBlock:&v7];
  [(TPSTipStatusController *)v2 updateCacheData];

  objc_sync_exit(v2);
  return v5;
}

void __59__TPSTipStatusController_reenrollPreconditionChangeContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 hintIneligibleReason] == 15 && objc_msgSend(v6, "isPreconditionMatched"))
  {
    [v6 setHintIneligibleReason:0];
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v7 = +[TPSLogger data];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_INFO, "Content %@ eligible for reenrolled due to precondition change.", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
  }
}

- (BOOL)isLockScreenHintDisplayEligibleForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(TPSTipStatusController *)v5 isContentNeverVisibleForIdentifier:v4])
  {
    BOOL v8 = 0;
    goto LABEL_7;
  }
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  uint64_t v7 = [v6 displayType];
  if ([v6 isPreconditionMatched] && !objc_msgSend(v6, "hintIneligibleReason"))
  {
    uint64_t v10 = [v6 contentViewedDate];
    if (!v10)
    {
      if (!v7)
      {
        BOOL v8 = 1;
        goto LABEL_10;
      }
      if (v7 == 1)
      {
        id v11 = [v6 hintEligibleDate];
        if (v11)
        {
          id v12 = [v6 desiredOutcomePerformedDates];
          BOOL v8 = [v12 count] == 0;
        }
        else
        {
          BOOL v8 = 0;
        }

        goto LABEL_10;
      }
    }
    BOOL v8 = 0;
LABEL_10:

    goto LABEL_5;
  }
  BOOL v8 = 0;
LABEL_5:

LABEL_7:
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)isContextualInfoLifetimeExpiredForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  char v7 = [v6 isExpired];
  if (v6) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7;
  }
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
    id v11 = [v6 contentViewedDate];
    if ([v10 isDateExpired:v11 maxTimeInterval:-2160000.0])
    {
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F1C9C8];
      id v13 = [v6 hintDisplayedDates];
      long long v14 = [v13 firstObject];
      LODWORD(v12) = [v12 isDateExpired:v14 maxTimeInterval:-2160000.0];

      if (!v12)
      {
        BOOL v9 = 0;
        goto LABEL_13;
      }
    }
    BOOL v9 = 1;
    [v6 setExpired:1];
    v5->_isDirty = 1;
  }
LABEL_13:

  objc_sync_exit(v5);
  return v9;
}

- (BOOL)isHintMaxDurationExcceededForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  char v7 = [v6 hintDisplayedDates];
  if (v7)
  {
    char v8 = [v6 hintDismissalDate];
    if (v8
      || ([v6 desiredOutcomePerformedDates],
          char v8 = objc_claimAutoreleasedReturnValue(),
          [v8 count])
      || [v6 hintIneligibleReason])
    {
    }
    else
    {
      uint64_t v11 = [v6 displayType];

      if (v11 == 2)
      {
        id v12 = [v7 firstObject];
        +[TPSDefaultsManager hintMaxDurationTimeInterval];
        if (v13 == 0.0) {
          double v13 = -604800.0;
        }
        char v14 = [MEMORY[0x1E4F1C9C8] isDateExpired:v12 maxTimeInterval:v13];

        if (v14)
        {
          BOOL v9 = 1;
          goto LABEL_7;
        }
      }
    }
  }
  BOOL v9 = 0;
LABEL_7:

  objc_sync_exit(v5);
  return v9;
}

- (BOOL)isEligibilityTrackingNeedsRestartForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  char v7 = [v6 hintEligibleDate];
  BOOL v8 = [MEMORY[0x1E4F1C9C8] isDateExpired:v7 maxTimeInterval:-2160000.0]
    && [(TPSTipStatusController *)v5 isTriggerTrackingEligibleForIdentifier:v4 checkForPrecondition:0 checkForEligibleDate:0];

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3
{
  return [(TPSTipStatusController *)self isTriggerTrackingEligibleForIdentifier:a3 checkForPrecondition:1 checkForEligibleDate:1];
}

- (BOOL)isTriggerTrackingEligibleForIdentifier:(id)a3 checkForPrecondition:(BOOL)a4 checkForEligibleDate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  BOOL v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(TPSTipStatusController *)v9 _tipStatusForIdentifier:v8 addIfMissing:0];
  uint64_t v11 = v10;
  if (!v10 || v6 && ![v10 isPreconditionMatched])
  {
    BOOL v13 = 0;
    goto LABEL_24;
  }
  if (v5)
  {
    id v12 = [v11 hintEligibleDate];
    if (v12)
    {
      BOOL v13 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  uint64_t v14 = [v11 hintIneligibleReason];
  if (v14 >= 1)
  {
    uint64_t v6 = [v11 dateForTriggerRestartTracking];
    if (!v6)
    {
      BOOL v13 = 0;
      goto LABEL_21;
    }
  }
  if ([v11 isExpired])
  {
    BOOL v13 = 0;
    if (v14 < 1) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  v15 = [v11 hintDisplayedDates];
  if ([v15 count]) {
    goto LABEL_19;
  }
  uint64_t v16 = [v11 hintDismissalDate];
  if (v16 || ([v11 contentViewedDate], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  v18 = [v11 desiredOutcomePerformedDates];
  BOOL v13 = [v18 count] == 0;

LABEL_20:
  if (v14 <= 0)
  {
LABEL_13:
    if (!v5) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_21:

  if (v5)
  {
LABEL_22:
    id v12 = 0;
    goto LABEL_23;
  }
LABEL_24:

  objc_sync_exit(v9);
  return v13;
}

- (BOOL)isDesiredOutcomeTrackingEligibleForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(TPSTipStatusController *)v5 _tipStatusForIdentifier:v4 addIfMissing:0];
  char v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  id v8 = [v6 hintDisplayedDates];
  if ([v8 count]) {
    goto LABEL_6;
  }
  BOOL v9 = [v7 hintWouldHaveBeenDisplayedDate];
  if (v9 || ([v7 contentViewedDate], (BOOL v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v11 = [v7 desiredOutcomePerformedDates];
  uint64_t v12 = [v11 count];

  if (v12) {
    goto LABEL_10;
  }
LABEL_7:
  if (![v7 isPreconditionMatched])
  {
LABEL_10:
    LOBYTE(v10) = 0;
    goto LABEL_11;
  }
  int v10 = [v7 isExpired] ^ 1;
LABEL_11:

  objc_sync_exit(v5);
  return v10;
}

- (int64_t)hintInelgibileReasonForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  int64_t v4 = [v3 hintIneligibleReason];

  return v4;
}

- (BOOL)isHintInelgibileForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isHintInelgibile];

  return v4;
}

- (BOOL)isHintInelgibileForReason:(int64_t)a3 identifier:(id)a4
{
  BOOL v5 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a4 addIfMissing:0];
  LOBYTE(a3) = [v5 hintIneligibleReason] == a3;

  return a3;
}

- (void)updateHintInelgibileForIdentifier:(id)a3 value:(int64_t)a4
{
  id v8 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  char v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:a4 != 0];
  if ([v7 hintIneligibleReason] != a4)
  {
    [v7 setHintIneligibleReason:a4];
    if (a4)
    {
      [v7 setHintEligibleDate:0];
      if (a4 == 15) {
        [v7 setPreconditionMatched:0];
      }
    }
    if (!v6->_isDirty && v7) {
      v6->_isDirty = 1;
    }
  }

  objc_sync_exit(v6);
}

- (id)dateForTriggerRestartTrackingForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 dateForTriggerRestartTracking];

  return v4;
}

- (void)updateDateForTriggerRestartTrackingForIdentifier:(id)a3 date:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  char v7 = self;
  objc_sync_enter(v7);
  id v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v9 addIfMissing:v6 != 0];
  [v8 setDateForTriggerRestartTracking:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (unint64_t)displayTypeForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 displayType];

  return v4;
}

- (id)variantIdentifierForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 variantIdentifier];

  return v4;
}

- (id)correlationIdentifierForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 correlationIdentifier];

  return v4;
}

- (id)clonedFromIdentifierForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 clonedFromIdentifier];

  return v4;
}

- (id)hintEligibleDateForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 hintEligibleDate];

  return v4;
}

- (void)updateHintEligibleDateForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  char v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v10 addIfMissing:v4];
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    id v8 = 0;
  }
  [v7 setHintEligibleDate:v8];
  if (v4) {

  }
  id v9 = [v7 hintEligibleDate];

  if (v9)
  {
    [(TPSTipStatusController *)v6 updateHintWouldHaveBeenDisplayedDateForIdentifier:v10 value:0];
    [(TPSTipStatusController *)v6 updateHintInelgibileForIdentifier:v10 value:0];
  }
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (id)hintWouldHaveBeenDisplayedDateForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  BOOL v4 = [v3 hintWouldHaveBeenDisplayedDate];

  return v4;
}

- (void)updateHintWouldHaveBeenDisplayedDateForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  char v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v11 addIfMissing:v4];
  id v8 = [v7 hintWouldHaveBeenDisplayedDate];
  BOOL v9 = v8 == 0;

  if (v9 == v4)
  {
    if (v4)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      id v10 = 0;
    }
    [v7 setHintWouldHaveBeenDisplayedDate:v10];
    if (v4) {

    }
    if (!v6->_isDirty && v7) {
      v6->_isDirty = 1;
    }
  }

  objc_sync_exit(v6);
}

- (BOOL)isHintDisplayedForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isHintDisplayed];

  return v4;
}

- (int)hintDisplayedCountForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 hintDisplayedDates];
  int v5 = [v4 count];

  return v5;
}

- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  char v7 = self;
  objc_sync_enter(v7);
  id v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v10 addIfMissing:1];
  BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
  [v8 addHintDisplayedDate:v9];

  [v8 setLastDisplayContext:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (id)firstHintDisplayDateForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 hintDisplayedDates];
  int v5 = [v4 firstObject];

  return v5;
}

- (void)addHintNotDisplayedDueToFrequencyControlDateForIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = self;
  objc_sync_enter(v4);
  int v5 = [(TPSTipStatusController *)v4 _tipStatusForIdentifier:v7 addIfMissing:1];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 addHintNotDisplayedDueToFrequencyControlDate:v6];

  if (!v4->_isDirty && v5) {
    v4->_isDirty = 1;
  }

  objc_sync_exit(v4);
}

- (id)hintNotDisplayedDueToFrequencyControlDatesForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 hintNotDisplayedDueToFrequencyControlDates];

  return v4;
}

- (BOOL)isHintDismissedForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isHintDismissed];

  return v4;
}

- (void)updateHintDismissedForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v9 addIfMissing:v4];
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    id v8 = 0;
  }
  [v7 setHintDismissalDate:v8];
  if (v4) {

  }
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (BOOL)isContentViewedForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isContentViewed];

  return v4;
}

- (void)updateContentViewedForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v10 addIfMissing:v4];
  id v8 = [v7 contentViewedDate];

  if (!v8)
  {
    if (v4)
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      id v9 = 0;
    }
    [v7 setContentViewedDate:v9];
    if (v4) {

    }
    if (!v6->_isDirty && v7) {
      v6->_isDirty = 1;
    }
  }

  objc_sync_exit(v6);
}

- (id)contentViewedDateForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  BOOL v4 = [v3 contentViewedDate];

  return v4;
}

- (BOOL)isDesiredOutcomePerformedForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isDesiredOutcomePerformed];

  return v4;
}

- (void)donateDesiredOutcomePerformedForIdentifier:(id)a3 date:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(TPSTipStatusController *)self _tipStatusForIdentifier:v16 addIfMissing:0];
  id v8 = v7;
  if (v7)
  {
    if ([v7 hintIneligibleReason] == 22)
    {
      id v9 = [v8 hintWouldHaveBeenDisplayedDate];
    }
    else
    {
      id v10 = [v8 hintDisplayedDates];
      id v9 = [v10 lastObject];
    }
    id v11 = +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", [v8 displayType]);
    uint64_t v12 = [v8 correlationIdentifier];
    uint64_t v13 = [v8 overrideHoldout];
    uint64_t v14 = [v8 lastDisplayContext];
    v15 = +[TPSAnalyticsEventDesiredOutcomePerformed eventWithTipID:v16 correlationID:v12 displayType:v11 overrideHoldout:v13 lastDisplayedContext:v14 lastHintDisplayedDate:v9 desiredOutcomePerformedDate:v6];
    [v15 log];
  }
}

- (void)addDesiredOutcomePerformedDateForIdentifier:(id)a3 date:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(TPSTipStatusController *)v7 _tipStatusForIdentifier:v11 addIfMissing:1];
  id v9 = [v8 desiredOutcomePerformedDates];
  uint64_t v10 = [v9 count];

  if (!v10) {
    [(TPSTipStatusController *)v7 donateDesiredOutcomePerformedForIdentifier:v11 date:v6];
  }
  [v8 addDesiredOutcomePerformedDate:v6];
  if (!v7->_isDirty && v8) {
    v7->_isDirty = 1;
  }

  objc_sync_exit(v7);
}

- (BOOL)isExpiredForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 isExpired];

  return v4;
}

- (void)updateExpiredForIdentifier:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(TPSTipStatusController *)v6 _tipStatusForIdentifier:v8 addIfMissing:v4];
  [v7 setExpired:v4];
  if (!v6->_isDirty && v7) {
    v6->_isDirty = 1;
  }

  objc_sync_exit(v6);
}

- (id)lastUsedVersionForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  BOOL v4 = [v3 lastUsedVersion];

  return v4;
}

- (BOOL)isOverrideHoldoutForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 overrideHoldout];

  return v4;
}

- (BOOL)isOverrideFrequencyControlForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  char v4 = [v3 overrideFrequencyControl];

  return v4;
}

- (unint64_t)usageFlagsForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 usageFlags];

  return v4;
}

- (id)lastDisplayContextForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 lastDisplayContext];

  return v4;
}

- (id)userInfoForIdentifier:(id)a3
{
  int64_t v3 = [(TPSTipStatusController *)self _tipStatusForIdentifier:a3 addIfMissing:0];
  unint64_t v4 = [v3 userInfo];

  return v4;
}

- (void)clearSavedDateForIdentifier:(id)a3
{
  id v8 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [(TPSTipStatusController *)v4 _tipStatusForIdentifier:v8 addIfMissing:0];
  id v6 = v5;
  if (!v4->_isDirty && v5 != 0)
  {
    [v5 setSavedDate:0];
    v4->_isDirty = 1;
  }

  objc_sync_exit(v4);
}

- (void)updateUserInfoForIdentifier:(id)a3 key:(id)a4 value:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  id v11 = [(TPSTipStatusController *)v10 _tipStatusForIdentifier:v12 addIfMissing:1];
  [v11 updateUserInfoValue:v9 forKey:v8];
  if (!v10->_isDirty && v11) {
    v10->_isDirty = 1;
  }

  objc_sync_exit(v10);
}

- (void)removeUserInfoForIdentifier:(id)a3
{
  id v6 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [(TPSTipStatusController *)v4 _tipStatusForIdentifier:v6 addIfMissing:1];
  [v5 removeUserInfo];
  if (!v4->_isDirty && v5) {
    v4->_isDirty = 1;
  }

  objc_sync_exit(v4);
}

- (void)removeCacheData
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "Remove all tipStatus cache", v1, 2u);
}

- (id)debugDescription
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", self];
  unint64_t v4 = self;
  objc_sync_enter(v4);
  int v5 = [(NSMutableDictionary *)v4->_identifierToTipStatusMap allValues];
  id v6 = [v5 debugDescription];
  [v3 appendFormat:@"\n %@ = %@\n", @"TipStatusIdentifierToTipStatusMap", v6];

  objc_sync_exit(v4);
  return v3;
}

- (BOOL)unviewedContentAvailable
{
  v2 = self;
  int64_t v3 = [(TPSTipStatusController *)self tipStatusMap];
  unint64_t v4 = [v3 allKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__TPSTipStatusController_unviewedContentAvailable__block_invoke;
  v6[3] = &unk_1E5906B90;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "na_any:", v6);

  return (char)v2;
}

uint64_t __50__TPSTipStatusController_unviewedContentAvailable__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isContentViewedForIdentifier:a2] ^ 1;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

- (NSMutableDictionary)identifierToTipStatusMap
{
  return self->_identifierToTipStatusMap;
}

- (void)setIdentifierToTipStatusMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToTipStatusMap, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
}

@end