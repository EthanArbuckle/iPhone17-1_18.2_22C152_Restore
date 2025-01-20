@interface NWStatsSnapshot
+ (double)_intervalWithContinuousTime:(unint64_t)a3;
+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3;
+ (void)initialize;
- (BOOL)attributedEntityIsBundleName;
- (BOOL)attributedEntityIsProcessName;
- (BOOL)changedEUUID;
- (BOOL)changedEUUIDFromUUID;
- (BOOL)changedEpid;
- (BOOL)changedOwnership;
- (BOOL)changedPid;
- (BOOL)changedProcname;
- (BOOL)changedUUID;
- (BOOL)firstOccurrence;
- (BOOL)isADaemon;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (BOOL)lastOccurrence;
- (BOOL)snapshotAppStateIsForeground;
- (BOOL)snapshotScreenStateOn;
- (BOOL)startAppStateIsForeground;
- (BOOL)startScreenStateOn;
- (NSDictionary)extensions;
- (NSDictionary)lookupResults;
- (NSString)attributedEntity;
- (NSString)attributedExtension;
- (NSString)attributionReasonString;
- (NSString)delegateAttributionReasonString;
- (NSString)delegateName;
- (NSString)domainAttributedBundleId;
- (NSString)domainName;
- (NSString)domainOwner;
- (NSString)domainTrackerContext;
- (NSString)processName;
- (NSString)snapshotReasonString;
- (NSString)snapshotType;
- (NSString)snapshotTypeLowerCase;
- (NSUUID)euuid;
- (NSUUID)uuid;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)extensionDictionaries;
- (int)attributionReason;
- (int)delegateAttributionReason;
- (int)epid;
- (int)processID;
- (int)snapshotReason;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)sourceIdentifier;
- (unint64_t)uniqueProcessID;
- (unsigned)personaID;
- (unsigned)uid;
- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6;
- (void)setAttributedEntity:(id)a3;
- (void)setAttributedExtension:(id)a3;
- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7;
- (void)setAttributionReason:(int)a3;
- (void)setDelegateAttributionReason:(int)a3;
- (void)setDelegateName:(id)a3;
- (void)setDomainAttributedBundleId:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9;
- (void)setDomainOwner:(id)a3;
- (void)setDomainTrackerContext:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFirstOccurrence:(BOOL)a3;
- (void)setIsNonAppInitiated:(BOOL)a3;
- (void)setIsSilent:(BOOL)a3;
- (void)setIsTracker:(BOOL)a3;
- (void)setLookupResults:(id)a3;
- (void)setSnapshotAppStateIsForeground:(BOOL)a3;
- (void)setSnapshotReason:(int)a3;
- (void)setSnapshotScreenStateOn:(BOOL)a3;
- (void)setStartAppStateIsForeground:(BOOL)a3;
- (void)setStartScreenStateOn:(BOOL)a3;
@end

@implementation NWStatsSnapshot

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (NSString)attributedEntity
{
  return self->_attributedEntity;
}

- (NSString)delegateName
{
  return self->_delegateName;
}

- (NSString)attributedExtension
{
  return self->_attributedExtension;
}

- (BOOL)startAppStateIsForeground
{
  return self->_startAppStateIsForeground;
}

- (BOOL)snapshotAppStateIsForeground
{
  return self->_snapshotAppStateIsForeground;
}

- (void)setStartScreenStateOn:(BOOL)a3
{
  self->_startScreenStateOn = a3;
}

- (void)setSnapshotReason:(int)a3
{
  self->_snapshotReason = a3;
}

- (void)setFirstOccurrence:(BOOL)a3
{
  self->_firstOccurrence = a3;
}

- (void)setIsTracker:(BOOL)a3
{
  self->_isTracker = a3;
}

- (void)setIsSilent:(BOOL)a3
{
  self->_isSilent = a3;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (void)setDomainTrackerContext:(id)a3
{
}

- (void)setDomainOwner:(id)a3
{
}

- (void)setDomainName:(id)a3
{
}

- (void)setDomainAttributedBundleId:(id)a3
{
}

- (void)setStartAppStateIsForeground:(BOOL)a3
{
  self->_startAppStateIsForeground = a3;
}

- (void)setSnapshotScreenStateOn:(BOOL)a3
{
  self->_snapshotScreenStateOn = a3;
}

- (void)setSnapshotAppStateIsForeground:(BOOL)a3
{
  self->_snapshotAppStateIsForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, 0);
  objc_storeStrong((id *)&self->_domainTrackerContext, 0);
  objc_storeStrong((id *)&self->_domainOwner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_lookupResults, 0);
  objc_storeStrong((id *)&self->_delegateName, 0);
  objc_storeStrong((id *)&self->_attributedExtension, 0);
  objc_storeStrong((id *)&self->_attributedEntity, 0);
  objc_storeStrong((id *)&self->_snapshotTypeLowerCase, 0);
  objc_storeStrong((id *)&self->_snapshotType, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_extensionDictionaries, 0);
}

- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  id v18 = a5;
  id v12 = a7;
  v13 = (objc_class *)NSString;
  id v14 = a3;
  v15 = (void *)[[v13 alloc] initWithString:v14];

  [(NWStatsSnapshot *)self setAttributedEntity:v15];
  [(NWStatsSnapshot *)self setAttributionReason:v9];
  [(NWStatsSnapshot *)self setDelegateAttributionReason:v8];
  if (v12)
  {
    v16 = (void *)[[NSString alloc] initWithString:v12];
    [(NWStatsSnapshot *)self setAttributedExtension:v16];
  }
  if (v18)
  {
    v17 = (void *)[[NSString alloc] initWithString:v18];
    [(NWStatsSnapshot *)self setDelegateName:v17];
  }
}

- (void)setDelegateAttributionReason:(int)a3
{
  self->_delegateAttributionReason = a3;
}

- (void)setAttributionReason:(int)a3
{
  self->_attributionReason = a3;
}

- (void)setAttributedEntity:(id)a3
{
}

- (void)setDelegateName:(id)a3
{
}

- (int)snapshotReason
{
  return self->_snapshotReason;
}

- (BOOL)isADaemon
{
  if ([(NWStatsSnapshot *)self delegateAttributionReason]) {
    return 1;
  }
  else {
    return attributionReasonImpliesBundleName([(NWStatsSnapshot *)self attributionReason]) ^ 1;
  }
}

- (int)delegateAttributionReason
{
  return self->_delegateAttributionReason;
}

- (int)attributionReason
{
  return self->_attributionReason;
}

- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v22)
  {
    id v18 = (void *)[[NSString alloc] initWithString:v22];
    [(NWStatsSnapshot *)self setDomainName:v18];

    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    [(NWStatsSnapshot *)self setDomainName:0];
    if (v15)
    {
LABEL_3:
      v19 = (void *)[[NSString alloc] initWithString:v15];
      [(NWStatsSnapshot *)self setDomainOwner:v19];

      if (v16) {
        goto LABEL_4;
      }
LABEL_8:
      [(NWStatsSnapshot *)self setDomainTrackerContext:0];
      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  [(NWStatsSnapshot *)self setDomainOwner:0];
  if (!v16) {
    goto LABEL_8;
  }
LABEL_4:
  v20 = (void *)[[NSString alloc] initWithString:v16];
  [(NWStatsSnapshot *)self setDomainTrackerContext:v20];

  if (v17)
  {
LABEL_5:
    v21 = (void *)[[NSString alloc] initWithString:v17];
    [(NWStatsSnapshot *)self setDomainAttributedBundleId:v21];

    goto LABEL_10;
  }
LABEL_9:
  [(NWStatsSnapshot *)self setDomainAttributedBundleId:0];
LABEL_10:
  [(NWStatsSnapshot *)self setIsTracker:v10];
  [(NWStatsSnapshot *)self setIsNonAppInitiated:v9];
  [(NWStatsSnapshot *)self setIsSilent:a9];
}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  [(NWStatsSnapshot *)self setSnapshotAppStateIsForeground:a3];
  [(NWStatsSnapshot *)self setSnapshotScreenStateOn:v8];
  [(NWStatsSnapshot *)self setStartAppStateIsForeground:v7];
  [(NWStatsSnapshot *)self setStartScreenStateOn:v6];
}

- (NSString)snapshotReasonString
{
  int v2 = self->_snapshotReason - 1;
  if (v2 > 3) {
    return (NSString *)@"unknown";
  }
  else {
    return (NSString *)*(&off_2644054F0 + v2);
  }
}

- (BOOL)lastOccurrence
{
  return [(NWStatsSnapshot *)self snapshotReason] == 2;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  if (uuid_is_null(a3)) {
    v4 = 0;
  }
  else {
    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  }
  return v4;
}

- (NSString)attributionReasonString
{
  unsigned int v2 = [(NWStatsSnapshot *)self attributionReason];
  return (NSString *)attributionReasonString(v2);
}

- (NSString)delegateAttributionReasonString
{
  unsigned int v2 = [(NWStatsSnapshot *)self delegateAttributionReason];
  return (NSString *)attributionReasonString(v2);
}

- (BOOL)attributedEntityIsBundleName
{
  unsigned int v2 = [(NWStatsSnapshot *)self attributionReason];
  return attributionReasonImpliesBundleName(v2);
}

- (BOOL)attributedEntityIsProcessName
{
  int v2 = [(NWStatsSnapshot *)self attributionReason];
  return attributionReasonImpliesProcessName(v2);
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  LODWORD(v3) = timebase_info_1;
  LODWORD(v4) = *(_DWORD *)algn_26AB127B4;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5 = 9;
  do
  {
    uint64_t v6 = mach_continuous_time();
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = mach_continuous_time() - v6;
    [a1 _intervalWithContinuousTime:v9];
  }
  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  uint64_t v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    [a1 _intervalWithContinuousTime:a3 - v12];
    return v8 + v15;
  }
  else
  {
    [a1 _intervalWithContinuousTime:v12 - a3];
    return v8 - v13;
  }
}

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_1);
  if (v2)
  {
    unint64_t v3 = v2;
    unint64_t v4 = NStatGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_21C4BC000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v5, 8u);
    }
  }
}

- (id)extensionDictionaries
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  extensionDictionaries = self->_extensionDictionaries;
  if (!extensionDictionaries)
  {
    if (self->_extensions)
    {
      unint64_t v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      int v5 = [(NWStatsSnapshot *)self extensions];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
            v11 = [(NWStatsSnapshot *)self extensions];
            uint64_t v12 = [v11 objectForKeyedSubscript:v10];
            [(NSDictionary *)v4 setObject:v12 forKeyedSubscript:v10];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }

      double v13 = self->_extensionDictionaries;
      self->_extensionDictionaries = v4;

      extensionDictionaries = self->_extensionDictionaries;
    }
    else
    {
      extensionDictionaries = 0;
    }
  }
  return extensionDictionaries;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)firstOccurrence
{
  return self->_firstOccurrence;
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (unint64_t)eupid
{
  return self->_eupid;
}

- (int)epid
{
  return self->_epid;
}

- (int)processID
{
  return self->_processID;
}

- (unsigned)personaID
{
  return self->_personaID;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)uniqueProcessID
{
  return self->_uniqueProcessID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)snapshotType
{
  return self->_snapshotType;
}

- (NSString)snapshotTypeLowerCase
{
  return self->_snapshotTypeLowerCase;
}

- (void)setAttributedExtension:(id)a3
{
}

- (NSDictionary)lookupResults
{
  return self->_lookupResults;
}

- (void)setLookupResults:(id)a3
{
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (BOOL)startScreenStateOn
{
  return self->_startScreenStateOn;
}

- (BOOL)snapshotScreenStateOn
{
  return self->_snapshotScreenStateOn;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

@end