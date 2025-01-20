@interface UIStatusBar_Base(Snapshots)
- (BOOL)sb_getLocalDataOverrides:()Snapshots;
- (uint64_t)sb_setLocalDataOverrides:()Snapshots;
- (void)sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:()Snapshots;
- (void)sb_setSnapshotOverridesWithTimeEnabled:()Snapshots overriddenDate:;
@end

@implementation UIStatusBar_Base(Snapshots)

- (void)sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:()Snapshots
{
  if (a3 == 0xFFFF)
  {
    [a1 setEnabledPartIdentifiers:0];
  }
  else
  {
    char v4 = a3;
    id v5 = [MEMORY[0x1E4F1CA48] array];
    if (v4) {
      [v5 addObject:*MEMORY[0x1E4F441B8]];
    }
    if ((v4 & 2) != 0) {
      [v5 addObject:*MEMORY[0x1E4F441C8]];
    }
    [a1 setEnabledPartIdentifiers:v5];
  }
}

- (void)sb_setSnapshotOverridesWithTimeEnabled:()Snapshots overriddenDate:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__onceToken != -1) {
    dispatch_once(&sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__onceToken, &__block_literal_global_314);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  memset(v16, 0, sizeof(v16));
  if ((objc_msgSend(a1, "sb_getLocalDataOverrides:", v16) & 1) == 0) {
    bzero((char *)&v16[2] + 8, 0xF40uLL);
  }
  *(void *)&long long v7 = 0x101010101010101;
  *((void *)&v7 + 1) = 0x101010101010101;
  *(_OWORD *)((char *)&v16[1] + 14) = v7;
  v16[0] = v7;
  v16[1] = v7;
  BYTE9(v16[0]) = 0;
  if (a3)
  {
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", 190057260.0, v16[0], v16[1], v16[2]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend((id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter, "stringFromDate:", v8, *(void *)&v16[0]);
    id v10 = objc_claimAutoreleasedReturnValue();
    [v10 cStringUsingEncoding:4];
    __strlcpy_chk();
    *(_DWORD *)((char *)&v16[2] + 14) |= 1u;
    LOBYTE(v17) = 1;
  }
  BYTE4(v16[0]) = 0;
  *(_DWORD *)((char *)&v16[2] + 14) |= 0x10u;
  v11 = objc_msgSend((id)SBApp, "telephonyStateProvider", *(void *)&v16[0]);
  v12 = [v11 subscriptionInfoForSlot:2];
  if (([v12 isProvidingDataConnection] & 1) == 0)
  {
    uint64_t v13 = [v11 subscriptionInfoForSlot:1];

    v12 = (void *)v13;
  }
  DWORD2(v44) = [v12 maxSignalStrengthBars];
  *(_DWORD *)((char *)&v16[2] + 14) |= 0x4000u;
  int v45 = 3;
  int v14 = [v11 isCellularRadioCapabilityActive];
  uint64_t v15 = 6;
  if (v14) {
    uint64_t v15 = 70;
  }
  *((unsigned char *)v16 + v15) = 0;
  uint64_t v46 = 100;
  BYTE12(v17) = 1;
  *(_DWORD *)((char *)&v16[2] + 14) |= 0xC0000u;
  objc_msgSend(a1, "sb_setLocalDataOverrides:", v16);
}

- (uint64_t)sb_setLocalDataOverrides:()Snapshots
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, 512);
  if (objc_msgSend(a1, "sb_getLocalDataOverrides:", v8))
  {
    if (!a3)
    {
      objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, 0, (void *)1);
      [a1 setLocalDataOverrides:0];
      return [a1 forceUpdateData:0];
    }
    BOOL v5 = memcmp(a3, v8, 0xF68uLL) != 0;
  }
  else
  {
    BOOL v5 = a3 != 0;
    if (!a3)
    {
      objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, 0, (void *)1);
      return [a1 setLocalDataOverrides:0];
    }
  }
  objc_getAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides);
  id v6 = (_SBStatusBarLocalDataOverridesWrapper *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(_SBStatusBarLocalDataOverridesWrapper);
    objc_setAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides, v6, (void *)1);
  }
  [(_SBStatusBarLocalDataOverridesWrapper *)v6 setOverrides:a3];

  uint64_t result = [a1 setLocalDataOverrides:a3];
  if (v5) {
    return [a1 forceUpdateData:0];
  }
  return result;
}

- (BOOL)sb_getLocalDataOverrides:()Snapshots
{
  char v4 = objc_getAssociatedObject(a1, (const void *)_SBStatusBarAssociatedValueKeyLocalDataOverrides);
  BOOL v5 = (const void *)[v4 overrides];
  if (a3)
  {
    if (v5) {
      memcpy(a3, v5, 0xF68uLL);
    }
    else {
      bzero(a3, 0xF68uLL);
    }
  }

  return v5 != 0;
}

@end