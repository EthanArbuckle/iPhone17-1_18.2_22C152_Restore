@interface WiFiUsageLQMKernelRollingWindow
+ (BOOL)isOngoing;
+ (id)kernelLQMRollingWindow:(id)a3 withReferenceWindow:(id)a4 andLqmFeatures:(id)a5;
+ (unint64_t)parseKernelBlobInto:(id)a3;
+ (void)addSample:(id)a3 To:(id)a4;
+ (void)advanceReadingPointerOf:(unint64_t)a3;
+ (void)initialize;
@end

@implementation WiFiUsageLQMKernelRollingWindow

+ (void)initialize
{
  v2 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0;

  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)_dateFormatter_0;
  _dateFormatter_0 = (uint64_t)v3;

  v5 = (void *)_dateFormatter_0;

  [v5 setDateFormat:@"HH:mm:ss"];
}

+ (BOOL)isOngoing
{
  return _lqmMetricsBlock != 0;
}

+ (id)kernelLQMRollingWindow:(id)a3 withReferenceWindow:(id)a4 andLqmFeatures:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v50 = a4;
  id v55 = a4;
  id v54 = a5;
  v60 = (void *)MEMORY[0x1E4F1C9E8];
  v58 = objc_opt_new();
  v66 = objc_opt_new();
  v64 = objc_opt_new();
  id v56 = (id)objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = objc_opt_new();
  v14 = objc_opt_new();
  objc_msgSend(v60, "dictionaryWithObjectsAndKeys:", v58, @"WiFiUsageLQMKernelSampleRxAmpdu", v66, @"WiFiUsageLQMKernelSampleInfraTXRX", v64, @"WiFiUsageLQMKernelSamplePerACTxStatsUcast", v56, @"WiFiUsageLQMKernelSamplePerACTxStatsMcast", v7, @"WiFiUsageLQMKernelSampleOfdmDesense", v8, @"WiFiUsageLQMKernelSampleBTCoex", v9, @"WiFiUsageLQMKernelSampleAWDLCoex", v10, @"WiFiUsageLQMKernelSampleRC1Coex", v11,
    @"WiFiUsageLQMKernelSampleRC2Coex",
    v12,
    @"WiFiUsageLQMKernelSampleCCA",
    v13,
    @"WiFiUsageLQMKernelSampleSecurityErrors",
    v14,
    @"WiFiUsageLQMKernelSampleScanSummary",
  v15 = 0);

  v16 = v54;
  v17 = v15;

  objc_storeStrong((id *)&_lqmMetricsBlock, a3);
  if (!v54 || !v55 || !_lqmMetricsBlock) {
    goto LABEL_31;
  }
  objc_storeStrong((id *)&_referenceWindow, v50);
  unint64_t v18 = [a1 parseKernelBlobInto:v15];
  v59 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n"];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v19 = [v15 allKeys];
  obuint64_t j = (id)[v19 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (obj)
  {
    id v57 = v19;
    unint64_t v52 = v18;
    char v20 = 0;
    uint64_t v61 = *(void *)v73;
    do
    {
      for (i = 0; i != obj; i = (char *)i + 1)
      {
        if (*(void *)v73 != v61) {
          objc_enumerationMutation(v57);
        }
        uint64_t v22 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        v23 = [v17 objectForKeyedSubscript:v22];
        uint64_t v24 = [v23 count];

        if (v24)
        {
          v25 = (void *)_dateFormatter_0;
          v67 = [v17 objectForKeyedSubscript:v22];
          v65 = [v67 firstObject];
          v26 = [v65 timestamp];
          v27 = [v25 stringFromDate:v26];
          v28 = (void *)_dateFormatter_0;
          v29 = [v17 objectForKeyedSubscript:v22];
          v30 = [v29 lastObject];
          v31 = [v30 timestamp];
          v32 = [v28 stringFromDate:v31];
          [v17 objectForKeyedSubscript:v22];
          v34 = v33 = v17;
          [v59 appendFormat:@" %@ : window %@ to %@ . samples: %lu\n", v22, v27, v32, objc_msgSend(v34, "count")];

          v17 = v33;
          char v20 = 1;
        }
      }
      obuint64_t j = (id)[v57 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (obj);

    v16 = v54;
    unint64_t v18 = v52;
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    id v19 = [NSString stringWithFormat:@"%s - Parsing results:%@", "+[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:]", v59];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v35 = NSString;
      id v19 = v19;
      objc_msgSend(v35, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
      id v36 = objc_claimAutoreleasedReturnValue();
      uint64_t v37 = [v36 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v78 = v37;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

LABEL_17:
  v38 = [(id)_referenceWindow samples];
  if (v18 >= [v38 count])
  {
  }
  else
  {
    v39 = [(id)_referenceWindow samples];
    unint64_t v40 = [v39 count] - v18;

    if (v40 > 2) {
      goto LABEL_31;
    }
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v41 = [v17 allValues];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v69 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        if ([v46 count])
        {
          v47 = [(id)_referenceWindow label];
          +[WiFiUsageLQMWindowAnalysis computeFeatures:v16 For:v46 WithLogLabel:v47];
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v43);
  }

LABEL_31:
  v48 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0;

  return v16;
}

+ (void)addSample:(id)a3 To:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "addObject:");
  }
}

+ (void)advanceReadingPointerOf:(unint64_t)a3
{
  _readingAt += a3;
  if (_readingAt >= (unint64_t)_endOfBuffer) {
    _readingAt = _buffer + _readingAt - _endOfBuffer;
  }
}

+ (unint64_t)parseKernelBlobInto:(id)a3
{
  v76[22] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  _buffer = [(id)_lqmMetricsBlock bytes];
  _ringheader = 0;
  v6 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  _readingAt = 0;
  v7 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  _endOfBuffer = 0;
  v75[0] = &unk_1F2B94AF8;
  v75[1] = &unk_1F2B94B10;
  v76[0] = @"TAG_CTLQM_RX_AMPDU_STATS";
  v76[1] = @"TAG_CTLQM_INFRA_BAND_TX_RX_STATS";
  v75[2] = &unk_1F2B94B28;
  v75[3] = &unk_1F2B94B40;
  v76[2] = @"TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS";
  v76[3] = @"TAG_CTLQM_SLOW_WIFI_LINK_RECOVERY_INFO";
  v75[4] = &unk_1F2B94B58;
  v75[5] = &unk_1F2B94B70;
  v76[4] = @"TAG_CTLQM_DPS_SYMPTOMS_INPUT";
  v76[5] = @"TAG_CTLQM_TX_DPS";
  v75[6] = &unk_1F2B94B88;
  v75[7] = &unk_1F2B94BA0;
  v76[6] = @"TAG_CTLQM_IPS_TRIGGER_REASON";
  v76[7] = @"TAG_CTLQM_PHY_RX_DESENSE";
  v75[8] = &unk_1F2B94BB8;
  v75[9] = &unk_1F2B94BD0;
  v76[8] = @"TAG_CTLQM_WPS_INFO";
  v76[9] = @"TAG_CTLQM_IP_INFO";
  v75[10] = &unk_1F2B94BE8;
  v75[11] = &unk_1F2B94C00;
  v76[10] = @"TAG_CTLQM_CHIP_INFO";
  v76[11] = @"TAG_CTLQM_BT";
  v75[12] = &unk_1F2B94C18;
  v75[13] = &unk_1F2B94C30;
  v76[12] = @"TAG_CTLQM_RC1";
  v76[13] = @"TAG_CTLQM_RC2";
  v75[14] = &unk_1F2B94C48;
  v75[15] = &unk_1F2B94C60;
  v76[14] = @"TAG_CTLQM_AWDL";
  v76[15] = @"TAG_CTLQM_SCAN";
  v75[16] = &unk_1F2B94C78;
  v75[17] = &unk_1F2B94C90;
  v76[16] = @"TAG_CTLQM_NOISE";
  v76[17] = @"TAG_CTLQM_RX_SECURITY";
  v75[18] = &unk_1F2B94CA8;
  v75[19] = &unk_1F2B94CC0;
  v76[18] = @"TAG_CTLQM_CCA";
  v76[19] = @"TAG_CTLQM_WEIGHT_AVG_LQM";
  v75[20] = &unk_1F2B94CD8;
  v75[21] = &unk_1F2B94CF0;
  v76[20] = @"TAG_CTLQM_INFRA_CHAN_INFO";
  v76[21] = @"TAG_CTLQM_RSSI_CHANGE_LQM_INFO";
  long long v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:22];
  uint64_t v8 = _buffer;
  _ringheader = _buffer;
  uint64_t v9 = *(unsigned int *)(_buffer + 40);
  if (v9 == 1)
  {
    v65 = v4;
    _buffer += 56;
    _endOfBuffer = v8 + 56 + *(unsigned int *)(v8 + 44);
    _readingAt = v8 + 56 + *(unsigned int *)(v8 + 48);
    v67 = [MEMORY[0x1E4F1C9C8] now];
    __uint64_t v66 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v10 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
    id v69 = a1;
    while (1)
    {
      superclass = v6[35].superclass;
      isa = v5[31].isa;
      if (superclass >= (__objc2_class *)((char *)isa + *(unsigned int *)(_ringheader + 52))
        && (*(_DWORD *)(_ringheader + 48) < *(_DWORD *)(_ringheader + 52)
         || superclass < (__objc2_class *)((char *)isa + *(unsigned int *)(_ringheader + 48))))
      {
        break;
      }
      [a1 advanceReadingPointerOf:24];
      unint64_t v13 = (unint64_t)v7[33].superclass;
      if ((unint64_t)&superclass->vtable > v13)
      {
        NSLog(&cfstr_SErrorWhilePar.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", (char *)v5[31].isa + *(unsigned int *)(_ringheader + 48), (char *)v5[31].isa + *(unsigned int *)(_ringheader + 52), v13, v6[35].superclass, &superclass->vtable);
        break;
      }
      v14 = v6[35].superclass;
      if ((unint64_t)v14 + LODWORD(superclass->cache) <= v13)
      {
        v21 = v6;
        id v19 = +[WiFiUsageLQMTransformations dateWithMachContinuousTime:*(__objc2_class **)((char *)&superclass->isa + 4) WithRef:v67 asNS:v66];
        [v10[35].cache samples];
        v23 = uint64_t v22 = v10;
        uint64_t v24 = [v23 firstObject];
        v25 = [v24 timestamp];
        if ([v19 compare:v25] == 1)
        {
          v26 = [v22[35].cache samples];
          v27 = [v26 lastObject];
          v28 = [v27 timestamp];
          uint64_t v29 = [v19 compare:v28];

          if (v29 == -1)
          {
            v6 = v21;
            a1 = v69;
            v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
            v10 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
            switch(HIDWORD(superclass->superclass))
            {
              case 0:
                if (LODWORD(superclass->cache) == 64)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRxAmpdu sampleWithStruct:v21[35].superclass WithReferenceDate:v67 AsNsec:v66];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRxAmpdu";
                  goto LABEL_40;
                }
                v30 = [NSNumber numberWithUnsignedInt:0];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 64;
                goto LABEL_49;
              case 1:
                if (LODWORD(superclass->cache) == 140)
                {
                  v30 = +[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:v21[35].superclass WithReferenceDate:v67 AsNsec:v66];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleInfraTXRX";
                  goto LABEL_40;
                }
                v30 = [NSNumber numberWithUnsignedInt:1];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 140;
                goto LABEL_49;
              case 2:
                v35 = (unsigned int *)v21[35].superclass;
                if (*v35)
                {
                  NSLog(&cfstr_SUnknownVersio_0.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", *v35);
                  break;
                }
                uint64_t v42 = LODWORD(superclass->cache);
                if (v42 >= 0xC)
                {
                  uint64_t v43 = 0;
                  uint64_t v44 = 0;
                  unint64_t v45 = (unint64_t)v35 + v42;
                  v46 = v35 + 3;
                  v47 = v35 + 1;
                  do
                  {
                    uint64_t v48 = v47[1];
                    v49 = (unsigned int *)((char *)v46 + v48);
                    if (v48 >= 8)
                    {
                      id v50 = v46 + 2;
                      do
                      {
                        if (*v47 == 4)
                        {
                          v51 = +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:v19];
                          unint64_t v52 = v43;
                          uint64_t v43 = v51;
                        }
                        else
                        {
                          v51 = +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:v19];
                          unint64_t v52 = v44;
                          uint64_t v44 = v51;
                        }

                        [v51 populateTXStats:*(v50 - 2) With:*(v50 - 1) ForQueue:*v47];
                        v50 += 2;
                      }
                      while (v50 <= v49);
                    }
                    v46 = v49 + 2;
                    v47 = v49;
                  }
                  while ((unint64_t)(v49 + 2) <= v45);
                  if (v44)
                  {
                    [v44 transformTXStats];
                    id v53 = [v65 objectForKeyedSubscript:@"WiFiUsageLQMKernelSamplePerACTxStatsUcast"];
                    a1 = v69;
                    [v69 addSample:v44 To:v53];
                    v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
                    goto LABEL_68;
                  }
                  a1 = v69;
                  v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
                }
                else
                {
                  uint64_t v43 = 0;
                }
                [v43 transformTXStats];
                id v53 = [v65 objectForKeyedSubscript:@"WiFiUsageLQMKernelSamplePerACTxStatsMcast"];
                [a1 addSample:v43 To:v53];
                uint64_t v44 = 0;
LABEL_68:

                v6 = v21;
                goto LABEL_13;
              case 3:
              case 4:
              case 5:
              case 6:
              case 8:
              case 9:
              case 0xA:
              case 0x10:
              case 0x13:
              case 0x14:
              case 0x15:
                break;
              case 7:
                if (LODWORD(superclass->cache) == 16)
                {
                  v30 = +[WiFiUsageLQMKernelSampleOfdmDesense sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleOfdmDesense";
                  goto LABEL_40;
                }
                v30 = [NSNumber numberWithUnsignedInt:7];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 16;
                goto LABEL_49;
              case 0xB:
                if (LODWORD(superclass->cache) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleBTCoex sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleBTCoex";
                  goto LABEL_40;
                }
                unint64_t v40 = NSNumber;
                uint64_t v41 = 11;
                goto LABEL_48;
              case 0xC:
                if (LODWORD(superclass->cache) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRC1Coex sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRC1Coex";
                  goto LABEL_40;
                }
                unint64_t v40 = NSNumber;
                uint64_t v41 = 12;
                goto LABEL_48;
              case 0xD:
                if (LODWORD(superclass->cache) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleRC2Coex sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleRC2Coex";
                  goto LABEL_40;
                }
                unint64_t v40 = NSNumber;
                uint64_t v41 = 13;
                goto LABEL_48;
              case 0xE:
                if (LODWORD(superclass->cache) == 12)
                {
                  v30 = +[WiFiUsageLQMKernelSampleAWDLCoex sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleAWDLCoex";
                  goto LABEL_40;
                }
                unint64_t v40 = NSNumber;
                uint64_t v41 = 14;
LABEL_48:
                v30 = [v40 numberWithUnsignedInt:v41];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 12;
                goto LABEL_49;
              case 0xF:
                if (LODWORD(superclass->cache) == 24)
                {
                  v30 = +[WiFiUsageLQMKernelSampleScanSummary sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleScanSummary";
                  goto LABEL_40;
                }
                v30 = [NSNumber numberWithUnsignedInt:15];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 24;
                goto LABEL_49;
              case 0x11:
                if (LODWORD(superclass->cache) == 20)
                {
                  v30 = +[WiFiUsageLQMKernelSampleSecurityErrors sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleSecurityErrors";
                  goto LABEL_40;
                }
                v30 = [NSNumber numberWithUnsignedInt:17];
                uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                id v36 = (void *)v37;
                uint64_t cache_low = LODWORD(superclass->cache);
                uint64_t v39 = 20;
                goto LABEL_49;
              case 0x12:
                if (LODWORD(superclass->cache) == 28)
                {
                  v30 = +[WiFiUsageLQMKernelSampleCCA sampleWithStruct:v21[35].superclass andTimestamp:v19];
                  v31 = v65;
                  v32 = @"WiFiUsageLQMKernelSampleCCA";
LABEL_40:
                  id v36 = [v31 objectForKeyedSubscript:v32];
                  [v69 addSample:v30 To:v36];
                }
                else
                {
                  v30 = [NSNumber numberWithUnsignedInt:18];
                  uint64_t v37 = [v68 objectForKeyedSubscript:v30];
                  id v36 = (void *)v37;
                  uint64_t cache_low = LODWORD(superclass->cache);
                  uint64_t v39 = 28;
LABEL_49:
                  NSLog(&cfstr_SFailedToParse_14.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v37, cache_low, v39);
                }

                break;
              default:
                v33 = [NSNumber numberWithUnsignedInt:0x1EB7FF000];
                v34 = [v68 objectForKeyedSubscript:v33];
                NSLog(&cfstr_SUnrecognizedH.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", 0x1EB7FF000, v34);

                goto LABEL_12;
            }
          }
          else
          {
            v6 = v21;
            a1 = v69;
LABEL_12:
            v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
LABEL_13:
            v10 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
          }
        }
        else
        {

          v6 = v21;
          v10 = v22;
        }
      }
      else
      {
        v15 = v5[31].isa;
        v16 = (char *)v15 + *(unsigned int *)(_ringheader + 48);
        v17 = (char *)v15 + *(unsigned int *)(_ringheader + 52);
        uint64_t superclass_high = HIDWORD(superclass->superclass);
        id v19 = [NSNumber numberWithUnsignedInt:superclass_high];
        char v20 = [v68 objectForKeyedSubscript:v19];
        uint64_t v64 = superclass_high;
        v10 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
        v62 = v16;
        v63 = v17;
        v5 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
        a1 = v69;
        NSLog(&cfstr_SErrorWhilePar_0.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v62, v63, v13, v14, v64, v20, LODWORD(superclass->cache), (char *)v6[35].superclass + LODWORD(superclass->cache));
      }
      [a1 advanceReadingPointerOf:LODWORD(superclass->cache)];
      [a1 advanceReadingPointerOf:HIDWORD(superclass->cache)];
      v7 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v55 = [v65 allValues];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      unint64_t v54 = 0;
      uint64_t v58 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (v54 <= [v60 count]) {
            unint64_t v54 = [v60 count];
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v57);
    }
    else
    {
      unint64_t v54 = 0;
    }

    id v4 = v65;
  }
  else
  {
    NSLog(&cfstr_SFailedToParse_13.isa, "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v9, 1);
    unint64_t v54 = 0;
  }

  return v54;
}

@end