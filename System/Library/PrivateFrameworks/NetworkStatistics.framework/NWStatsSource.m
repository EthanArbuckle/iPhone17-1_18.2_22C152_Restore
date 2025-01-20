@interface NWStatsSource
- (BOOL)bundleNameImpliesNonAppInitiated:(id)a3;
- (BOOL)handleDomainUpdate:(nstat_domain_info *)a3;
- (BOOL)handleUnknownExtension:(unsigned int)a3 data:(id)a4;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4 bluetoothCounts:(nstat_interface_counts *)a5;
- (BOOL)removed;
- (BOOL)removing;
- (BOOL)saveOldBTCounts:(nstat_interface_counts *)a3;
- (BOOL)startAppStateIsForeground;
- (BOOL)startScreenStateOn;
- (BOOL)updateAppStateIsForeground;
- (BOOL)updateScreenStateOn;
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NSMutableDictionary)extensions;
- (NSString)attributedEntity;
- (NSString)attributedExtension;
- (NSString)delegateName;
- (NSString)domainAttributedBundleId;
- (NSString)domainName;
- (NSString)domainOwner;
- (NSString)domainTrackerContext;
- (NWStatsSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (double)creationTimestamp;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (int)attributionReason;
- (int)delegateAttributionReason;
- (unint64_t)snapshotRevision;
- (unsigned)flagsForProvider:(unsigned int)a3;
- (unsigned)flagsForProvider:(unsigned int)a3 sockaddr:(sockaddr *)a4;
- (unsigned)flowFlags;
- (update_subset_for_deltas)prevItemsPtr;
- (void)logAddressChangeOn:(unint64_t)a3 procName:(char *)a4 variant:(id)a5 oldAddress:(sockaddr *)a6 newAddress:(sockaddr *)a7;
- (void)logAttributionChangeOn:(unint64_t)a3 oldProcName:(char *)a4 newProcName:(char *)a5 oldPid:(int)a6 newPid:(int)a7 oldEPid:(int)a8 newEPid:(int)a9 oldUUID:(unsigned __int8)a10[16] newUUID:(unsigned __int8)a11[16] oldEUUID:(unsigned __int8)a12[16] newEUUID:(unsigned __int8)a13[16] monitor:(id)a14;
- (void)saveOldValues:(nstat_counts *)a3;
- (void)setAttributedEntity:(id)a3;
- (void)setAttributedExtension:(id)a3;
- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7;
- (void)setAttributionReason:(int)a3;
- (void)setCreationTimestamp:(double)a3;
- (void)setDelegateAttributionReason:(int)a3;
- (void)setDelegateName:(id)a3;
- (void)setDomainAttributedBundleId:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDomainOwner:(id)a3;
- (void)setDomainTrackerContext:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFlowFlags:(unsigned int)a3;
- (void)setIsNonAppInitiated:(BOOL)a3;
- (void)setIsSilent:(BOOL)a3;
- (void)setIsTracker:(BOOL)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setRemoving:(BOOL)a3;
- (void)setSnapshotRevision:(unint64_t)a3;
- (void)setStartAppStateIsForeground:(BOOL)a3;
- (void)setStartScreenStateOn:(BOOL)a3;
- (void)setUpdateAppStateIsForeground:(BOOL)a3;
- (void)setUpdateScreenStateOn:(BOOL)a3;
@end

@implementation NWStatsSource

- (unsigned)flowFlags
{
  return self->_flowFlags;
}

- (NSString)attributedEntity
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)saveOldValues:(nstat_counts *)a3
{
  *(_OWORD *)&self->_prevItems.savedRxPackets = *(_OWORD *)&a3->nstat_rxpackets;
  *(_OWORD *)&self->_prevItems.savedTxPackets = *(_OWORD *)&a3->nstat_txpackets;
  unint64_t nstat_cell_txbytes = a3->nstat_cell_txbytes;
  unint64_t nstat_wifi_rxbytes = a3->nstat_wifi_rxbytes;
  unint64_t nstat_wifi_txbytes = a3->nstat_wifi_txbytes;
  self->_prevItems.savedRxCellularBytes = a3->nstat_cell_rxbytes;
  self->_prevItems.savedRxWiFiBytes = nstat_wifi_rxbytes;
  unint64_t nstat_wired_txbytes = a3->nstat_wired_txbytes;
  self->_prevItems.savedRxWiredBytes = a3->nstat_wired_rxbytes;
  self->_prevItems.savedTxCellularBytes = nstat_cell_txbytes;
  self->_prevItems.savedTxWiFiBytes = nstat_wifi_txbytes;
  self->_prevItems.savedTxWiredBytes = nstat_wired_txbytes;
  *(void *)&self->_prevItems.savedRxDuplicateBytes = *(void *)&a3->nstat_rxduplicatebytes;
  self->_prevItems.savedTxRetransmittedBytes = a3->nstat_txretransmit;
}

- (BOOL)saveOldBTCounts:(nstat_interface_counts *)a3
{
  if (!a3) {
    -[NWStatsSource saveOldBTCounts:]();
  }
  self->_prevItems.savedRxCompanionLinkBluetoothBytes = a3->nstat_rxbytes;
  self->_prevItems.savedTxCompanionLinkBluetoothBytes = a3->nstat_txbytes;
  return 1;
}

- (void)setFlowFlags:(unsigned int)a3
{
  self->_flowFlags = a3;
}

- (BOOL)updateScreenStateOn
{
  return self->_updateScreenStateOn;
}

- (BOOL)updateAppStateIsForeground
{
  return self->_updateAppStateIsForeground;
}

- (BOOL)startScreenStateOn
{
  return self->_startScreenStateOn;
}

- (BOOL)startAppStateIsForeground
{
  return self->_startAppStateIsForeground;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

- (NSString)delegateName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (int)delegateAttributionReason
{
  return self->_delegateAttributionReason;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (int)attributionReason
{
  return self->_attributionReason;
}

- (NSString)attributedExtension
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)handleDomainUpdate:(nstat_domain_info *)a3
{
  if (!a3) {
    -[NWStatsSource handleDomainUpdate:]();
  }
  if (a3->var0[0])
  {
    v5 = (void *)[[NSString alloc] initWithUTF8String:a3];
    [(NWStatsSource *)self setDomainName:v5];
  }
  else
  {
    [(NWStatsSource *)self setDomainName:0];
  }
  if (a3->var1[0])
  {
    v6 = (void *)[[NSString alloc] initWithUTF8String:a3->var1];
    [(NWStatsSource *)self setDomainOwner:v6];
  }
  else
  {
    [(NWStatsSource *)self setDomainOwner:0];
  }
  if (a3->var2[0])
  {
    v7 = (void *)[[NSString alloc] initWithUTF8String:a3->var2];
    [(NWStatsSource *)self setDomainTrackerContext:v7];
  }
  else
  {
    [(NWStatsSource *)self setDomainTrackerContext:0];
  }
  if (a3->var3[0])
  {
    v8 = (void *)[[NSString alloc] initWithUTF8String:a3->var3];
    [(NWStatsSource *)self setDomainAttributedBundleId:v8];
  }
  else
  {
    [(NWStatsSource *)self setDomainAttributedBundleId:0];
  }
  [(NWStatsSource *)self setIsTracker:a3->var5];
  [(NWStatsSource *)self setIsNonAppInitiated:a3->var6];
  [(NWStatsSource *)self setIsSilent:a3->var7];
  [(NWStatsSource *)self isSilent];
  return 1;
}

- (BOOL)isSilent
{
  return self->_isSilent;
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

- (update_subset_for_deltas)prevItemsPtr
{
  return &self->_prevItems;
}

- (BOOL)bundleNameImpliesNonAppInitiated:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (bundleNameImpliesNonAppInitiated__onceToken != -1)
  {
    dispatch_once(&bundleNameImpliesNonAppInitiated__onceToken, &__block_literal_global_2);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  char v5 = [(id)bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs containsObject:v4];
LABEL_6:

  return v5;
}

- (BOOL)removing
{
  return self->_removing;
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

- (void)setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)setAttributionReason:(int)a3
{
  self->_attributionReason = a3;
}

- (void)setAttributedEntity:(id)a3
{
}

- (void)setDelegateAttributionReason:(int)a3
{
  self->_delegateAttributionReason = a3;
}

- (void)setDelegateName:(id)a3
{
}

- (void)setUpdateAppStateIsForeground:(BOOL)a3
{
  self->_updateAppStateIsForeground = a3;
}

- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4 bluetoothCounts:(nstat_interface_counts *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL result = 1;
  if ((unint64_t)a4 >= 8)
  {
    v7 = a3;
    if (a3)
    {
      while (1)
      {
        uint64_t var0 = v7->var0;
        unint64_t var1 = v7->var1;
        unint64_t v11 = a4 - 8;
        if (a4 - 8 < var1)
        {
          v12 = NStatGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v18 = var1;
            *(_WORD *)&v18[8] = 2048;
            *(void *)&v18[10] = v11;
            _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "Parsing extensions, item length %zd > remaining size for extensions %zd", buf, 0x16u);
          }

          unint64_t var1 = v11;
        }
        if (var0 == 6)
        {
          if (var1 <= 0x1F) {
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:].cold.4();
          }
          if (v11 <= 0x1F) {
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]();
          }
          if (a5)
          {
            a5->nstat_txbytes = (unint64_t)v7[4];
            *(_OWORD *)&a5->nstat_rxpackets = *(_OWORD *)&v7[1].var0;
            a5->nstat_txpackets = (unint64_t)v7[3];
          }
        }
        else if (var0 == 1)
        {
          if (var1 <= 0x41F) {
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]();
          }
          if (v11 <= 0x41F) {
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]();
          }
          if (![(NWStatsSource *)self handleDomainUpdate:&v7[1]]) {
            return 0;
          }
        }
        else
        {
          v13 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7[1] length:var1];
          v14 = NStatGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v18 = var0;
            *(_WORD *)&v18[4] = 2048;
            *(void *)&v18[6] = var1;
            *(_WORD *)&v18[14] = 2112;
            *(void *)&v18[16] = v13;
            _os_log_impl(&dword_21C4BC000, v14, OS_LOG_TYPE_ERROR, "Unexpected extended item type: %d, length: %zd contents %@", buf, 0x1Cu);
          }

          BOOL v15 = [(NWStatsSource *)self handleUnknownExtension:var0 data:v13];
          if (!v15) {
            return 0;
          }
        }
        unint64_t v16 = (var1 + 7) & 0xFFFFFFFFFFFFFFF8;
        a4 = v11 - v16;
        v7 = (nstat_msg_src_extended_item_hdr *)((char *)v7 + v16 + 8);
        if (v11 - v16 <= 7) {
          return 1;
        }
      }
    }
  }
  return result;
}

- (void)setStartAppStateIsForeground:(BOOL)a3
{
  self->_startAppStateIsForeground = a3;
}

- (unsigned)flagsForProvider:(unsigned int)a3 sockaddr:(sockaddr *)a4
{
  signed int v4 = a3 - 2;
  if (a3 - 2 >= 9 || ((0x1CFu >> v4) & 1) == 0) {
    -[NWStatsSource flagsForProvider:sockaddr:]();
  }
  unsigned int v5 = dword_21C4F5A78[v4];
  int sa_family = a4->sa_family;
  unsigned int v7 = v5 | 8;
  if (sa_family == 2) {
    v5 |= 4u;
  }
  if (sa_family == 30) {
    return v7;
  }
  else {
    return v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, 0);
  objc_storeStrong((id *)&self->_domainTrackerContext, 0);
  objc_storeStrong((id *)&self->_domainOwner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_delegateName, 0);
  objc_storeStrong((id *)&self->_attributedExtension, 0);
  objc_storeStrong((id *)&self->_attributedEntity, 0);
}

- (unsigned)flagsForProvider:(unsigned int)a3
{
  unsigned int v3 = a3 - 2;
  if (a3 - 2 >= 9 || ((0x1CFu >> v3) & 1) == 0) {
    -[NWStatsSource flagsForProvider:]();
  }
  return dword_21C4F5A78[v3];
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  return 0;
}

- (void)logAttributionChangeOn:(unint64_t)a3 oldProcName:(char *)a4 newProcName:(char *)a5 oldPid:(int)a6 newPid:(int)a7 oldEPid:(int)a8 newEPid:(int)a9 oldUUID:(unsigned __int8)a10[16] newUUID:(unsigned __int8)a11[16] oldEUUID:(unsigned __int8)a12[16] newEUUID:(unsigned __int8)a13[16] monitor:(id)a14
{
  uint64_t v14 = *(void *)&a7;
  uint64_t v58 = *MEMORY[0x263EF8340];
  v17 = (objc_class *)MEMORY[0x263F08C38];
  id v18 = a14;
  uint64_t v19 = (void *)[[v17 alloc] initWithUUIDBytes:a11];
  v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a13];
  v36 = [v18 bestIdentifierForUUID:v19 EUUID:v20 pid:v14 epid:a9 procname:a5 derivation:0];

  v21 = NStatGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a10];
    [v30 UUIDString];
    v22 = v32 = v20;
    v31 = self;
    v23 = v19;
    v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a12];
    v25 = [v24 UUIDString];
    v26 = [v23 UUIDString];
    v27 = [v32 UUIDString];
    *(_DWORD *)buf = 134220546;
    unint64_t v39 = a3;
    __int16 v40 = 2080;
    v41 = a4;
    __int16 v42 = 1024;
    *(_DWORD *)v43 = a6;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = a8;
    __int16 v44 = 2112;
    v45 = v22;
    __int16 v46 = 2112;
    v47 = v25;
    __int16 v48 = 2080;
    v49 = a5;
    __int16 v50 = 1024;
    int v51 = v14;
    __int16 v52 = 1024;
    int v53 = a9;
    __int16 v54 = 2112;
    v55 = v26;
    __int16 v56 = 2112;
    v57 = v27;
    _os_log_impl(&dword_21C4BC000, v21, OS_LOG_TYPE_DEFAULT, "Source %lld attribution change, was procname %s pid %d epid %d uuid %@ euuid %@  now %s %d %d %@ %@", buf, 0x60u);

    uint64_t v19 = v23;
    self = v31;

    v20 = v32;
  }

  v28 = NStatGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [(NWStatsSource *)self attributedEntity];
    *(_DWORD *)buf = 134218498;
    unint64_t v39 = a3;
    __int16 v40 = 2112;
    v41 = v29;
    __int16 v42 = 2112;
    *(void *)v43 = v36;
    _os_log_impl(&dword_21C4BC000, v28, OS_LOG_TYPE_DEFAULT, "Source %lld old attribution %@ new attribution %@", buf, 0x20u);
  }
}

- (void)logAddressChangeOn:(unint64_t)a3 procName:(char *)a4 variant:(id)a5 oldAddress:(sockaddr *)a6 newAddress:(sockaddr *)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a5;
  v13 = NStatGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(NWStatsSource *)self attributedEntity];
    BOOL v15 = sockaddrForLogging(a6);
    unint64_t v16 = sockaddrForLogging(a7);
    int v17 = 138413570;
    id v18 = v12;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2080;
    v22 = a4;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_21C4BC000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected %@ on flow %lld for process %s attributed %@, was %@ now %@", (uint8_t *)&v17, 0x3Eu);
  }
}

- (BOOL)handleUnknownExtension:(unsigned int)a3 data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!v6) {
    -[NWStatsSource handleUnknownExtension:data:]();
  }
  unsigned int v7 = v6;
  v8 = [(NWStatsSource *)self extensions];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(NWStatsSource *)self setExtensions:v9];
  }
  v10 = [(NWStatsSource *)self extensions];
  unint64_t v11 = [NSNumber numberWithUnsignedInt:v4];
  [v10 setObject:v7 forKeyedSubscript:v11];

  return 1;
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  return 0;
}

- (NWStatsSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  return 0;
}

void __50__NWStatsSource_bundleNameImpliesNonAppInitiated___block_invoke()
{
  v0 = (void *)bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs;
  bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs = (uint64_t)&unk_26CCB1D80;
}

- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  id v18 = a5;
  id v12 = a7;
  v13 = (objc_class *)NSString;
  id v14 = a3;
  BOOL v15 = (void *)[[v13 alloc] initWithString:v14];

  [(NWStatsSource *)self setAttributedEntity:v15];
  [(NWStatsSource *)self setAttributionReason:v9];
  [(NWStatsSource *)self setDelegateAttributionReason:v8];
  if (v18)
  {
    unint64_t v16 = (void *)[[NSString alloc] initWithString:v18];
    [(NWStatsSource *)self setDelegateName:v16];
  }
  if (v12)
  {
    int v17 = (void *)[[NSString alloc] initWithString:v12];
    [(NWStatsSource *)self setAttributedExtension:v17];
  }
}

- (unint64_t)snapshotRevision
{
  return self->_snapshotRevision;
}

- (void)setSnapshotRevision:(unint64_t)a3
{
  self->_snapshotRevision = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (void)setAttributedExtension:(id)a3
{
}

- (void)setStartScreenStateOn:(BOOL)a3
{
  self->_startScreenStateOn = a3;
}

- (void)setUpdateScreenStateOn:(BOOL)a3
{
  self->_updateScreenStateOn = a3;
}

- (void)setExtensions:(id)a3
{
}

- (void)flagsForProvider:.cold.1()
{
}

- (void)flagsForProvider:sockaddr:.cold.1()
{
}

- (void)handleDomainUpdate:.cold.1()
{
  __assert_rtn("-[NWStatsSource handleDomainUpdate:]", "NWStatsSource.m", 243, "info != NULL");
}

- (void)saveOldBTCounts:.cold.1()
{
  __assert_rtn("-[NWStatsSource saveOldBTCounts:]", "NWStatsSource.m", 268, "counts != NULL");
}

- (void)handleUnknownExtension:data:.cold.1()
{
  __assert_rtn("-[NWStatsSource handleUnknownExtension:data:]", "NWStatsSource.m", 282, "data != nil");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.1()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 364, "length >= sizeof(nstat_domain_info)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.2()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 363, "itemLength >= sizeof(nstat_domain_info)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.3()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 379, "length >= sizeof(nstat_interface_counts)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.4()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 378, "itemLength >= sizeof(nstat_interface_counts)");
}

@end