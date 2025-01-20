@interface WCM_SacManager
+ (__TelephonyBasebandControllerHandle_tag)basebandController;
- (BOOL)isEqualFreqList:(id)a3 List2:(id)a4;
- (BOOL)isTestMode;
- (NSMutableArray)mCacheCellularReportedFullList;
- (NSMutableArray)mCacheCellularReportedReducedList;
- (NSMutableArray)mCacheGnssReportedFullList;
- (NSMutableArray)mCacheGnssReportedReducedList;
- (NSMutableArray)mCacheWifiReportedFullList;
- (NSMutableArray)mCacheWifiReportedReducedList;
- (NSMutableArray)mCellularFreqInclusionList;
- (NSMutableArray)mCellularFreqSet;
- (NSMutableArray)mGnssL1FreqList;
- (NSMutableArray)mGnssL5FreqList;
- (NSMutableArray)mWifiFreqList;
- (WCM_SacManager)initWithPlatformId:(unint64_t)a3;
- (id)getInsertObjIndex:(id)a3 fromOther:(id)a4;
- (id)getQueue;
- (id)getRemoveObjIndex:(id)a3 fromOther:(id)a4;
- (id)printPlistParam;
- (unsigned)sacCreateRawFreqList:(id)a3 bufferSize:(unsigned int)a4 buffer:(__AppleBasebandVictimFreq *)a5;
- (unsigned)sacGetPlatformPlistIdx:(int64_t)a3;
- (void)dealloc;
- (void)freqAscendSort:(id)a3;
- (void)frequencyToolAddCellularFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 freqType:(int)a5;
- (void)frequencyToolAddClientFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5 celluarCarrierType:(int)a6;
- (void)frequencyToolClearFreq:(int)a3;
- (void)frequencyToolGetJasperResult:(id)a3 generalSacResult:(id)a4 client:(int)a5;
- (void)frequencyToolRemoveFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5;
- (void)removeFreqFromArray:(id)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5;
- (void)sacMergeFreqInterval:(id)a3;
- (void)sacProcessCellularMeasFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacProcessCellularPrimaryFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacProcessCellularSecondaryFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacProcessGnssFreqInfo:(id)a3;
- (void)sacProcessWiFiFreqInfo:(id)a3;
- (void)sacRemoveAllCellularFreqOnSubId0:(BOOL)a3 andSubId1:(BOOL)a4;
- (void)sacRemoveAllGnssFreq;
- (void)sacRemoveAllWifiFreq;
- (void)sacReportCellularVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4;
- (void)sacReportGnssVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4;
- (void)sacReportWifiVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4;
- (void)sacScreenAllFreq:(id)a3;
- (void)sacScreenFreq:(id)a3 freqRangeObj:(id)a4;
- (void)sacSetCellularSubActiveState:(BOOL)a3 onSubId:(unsigned int)a4;
- (void)sacSortFreqByPriority:(id)a3;
- (void)sacUpdateCellularDownlinkFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacUpdateCellularHoppingFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacUpdateCellularNeighborFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacUpdateCellularRPLMNFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacUpdateCellularSearchFreqInfo:(id)a3 onSubId:(unsigned int)a4;
- (void)sacUpdateGnssFreqInfo:(id)a3 L5Freq:(id)a4;
- (void)sacUpdateWiFiFreqInfo:(unint64_t)a3 Bandwidth:(unint64_t)a4;
- (void)setBlockReporting:(BOOL)a3;
- (void)setMCacheCellularReportedFullList:(id)a3;
- (void)setMCacheCellularReportedReducedList:(id)a3;
- (void)setMCacheGnssReportedFullList:(id)a3;
- (void)setMCacheGnssReportedReducedList:(id)a3;
- (void)setMCacheWifiReportedFullList:(id)a3;
- (void)setMCacheWifiReportedReducedList:(id)a3;
- (void)setMCellularFreqInclusionList:(id)a3;
- (void)setMCellularFreqSet:(id)a3;
- (void)setMGnssL1FreqList:(id)a3;
- (void)setMGnssL5FreqList:(id)a3;
- (void)setMWifiFreqList:(id)a3;
- (void)setTestMode:(BOOL)a3;
@end

@implementation WCM_SacManager

- (void)sacProcessWiFiFreqInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [(WCM_SacManager *)self mWifiFreqList];
    v6 = [v5 objectAtIndex:0];

    if ((unint64_t)[v6 centerFreq] <= 0x94B6ADC0 && self->mReportWiFi2G
      || (unint64_t)[v6 centerFreq] >= 0x12BCFB580
      && (unint64_t)[v6 centerFreq] < 0x162F216C0
      && self->mReportWiFi5G
      || (unint64_t)[v6 centerFreq] > 0x162F216BFLL && self->mReportWiFiEnh)
    {
      v7 = objc_alloc_init(FreqRangeInfo);
      [(FreqRangeInfo *)v7 setFreqWithObj:v6];
      [(FreqRangeInfo *)v7 applyBwLimitFromCenter:20000000];
      [v8 addObject:v7];
    }
    id v4 = v8;
  }
}

- (void)sacUpdateWiFiFreqInfo:(unint64_t)a3 Bandwidth:(unint64_t)a4
{
  uint64_t v7 = [(WCM_SacManager *)self mWifiFreqList];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(WCM_SacManager *)self mWifiFreqList];
    id v10 = [v9 count];

    if (v10)
    {
      v11 = [(WCM_SacManager *)self mWifiFreqList];
      [v11 removeAllObjects];
    }
  }
  v14 = [[FreqRangeInfo alloc] initWithFreq:a3 Bw:a4];
  v12 = [(FreqRangeInfo *)v14 logPrint];
  +[WCM_Logging logLevel:3, @"SAC Update WiFi Freq:%@", v12 message];

  if (a3 && a4)
  {
    v13 = [(WCM_SacManager *)self mWifiFreqList];
    [v13 addObject:v14];
  }
}

- (void)sacReportWifiVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = +[WCM_SacManager basebandController];
  if (v8)
  {
    v9 = v8;
    if (v5 == 2) {
      [(WCM_SacManager *)self mCacheWifiReportedReducedList];
    }
    else {
    id v10 = [(WCM_SacManager *)self mCacheWifiReportedFullList];
    }
    if (a4 == 1)
    {
      uint64_t v11 = [(WCM_SacManager *)self mWifiFreqList];
      if (v11)
      {
        v12 = (void *)v11;
        v13 = [(WCM_SacManager *)self mWifiFreqList];
        id v14 = [v13 count];

        if (v14)
        {
          if (v5 == 2)
          {
            [(WCM_SacManager *)self sacProcessWiFiFreqInfo:v7];
          }
          else
          {
            v15 = [(WCM_SacManager *)self mWifiFreqList];
            [v7 addObjectsFromArray:v15];
          }
          if ([(WCM_SacManager *)self isEqualFreqList:v7 List2:v10])
          {
            +[WCM_Logging logLevel:3, @"SAC[%d] Action=%d(0:remove, 1:add) : WiFi Frequency has no change. Action skipped:", v5, 1 message];
            goto LABEL_27;
          }
        }
      }
    }
    else if (a4)
    {
      goto LABEL_27;
    }
    v33 = v9;
    if ([v10 count])
    {
      uint64_t v16 = 0;
      unsigned int v17 = 1;
      do
      {
        v18 = [v10 objectAtIndex:v16];
        v19 = [v18 logPrint];
        +[WCM_Logging logLevel:3, @"SAC%d client_wifi : Remove Frequency %@:", v5, v19 message];

        uint64_t v16 = v17;
        BOOL v20 = (unint64_t)[v10 count] > v17++;
      }
      while (v20);
    }
    id v21 = [v10 copy];
    v22 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000642B0;
    block[3] = &unk_10020EAF0;
    block[4] = self;
    id v39 = v21;
    v40 = v33;
    int v41 = v5;
    id v23 = v21;
    dispatch_async(v22, block);

    [v10 removeAllObjects];
    if (a4 == 1)
    {
      uint64_t v24 = [(WCM_SacManager *)self mWifiFreqList];
      if (v24)
      {
        v25 = (void *)v24;
        v26 = [(WCM_SacManager *)self mWifiFreqList];
        id v27 = [v26 count];

        if (v27)
        {
          if ([v7 count])
          {
            [v10 addObjectsFromArray:v7];
            if ([v7 count])
            {
              uint64_t v28 = 0;
              unsigned int v29 = 1;
              do
              {
                v30 = [v7 objectAtIndex:v28];
                v31 = [v30 logPrint];
                +[WCM_Logging logLevel:3, @"SAC%d client_wifi : Add Frequency %@:", v5, v31 message];

                uint64_t v28 = v29;
                BOOL v20 = (unint64_t)[v7 count] > v29++;
              }
              while (v20);
            }
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_100064330;
            v34[3] = &unk_10020EAF0;
            v34[4] = self;
            id v35 = [v7 copy];
            v36 = v33;
            int v37 = v5;
            id v32 = v35;
            dispatch_async(v22, v34);
          }
        }
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@" sacReportWifiVictimFreqListOnTargetSac failed to get baseband controller "];
    id v10 = 0;
  }
LABEL_27:
}

- (NSMutableArray)mWifiFreqList
{
  return self->_mWifiFreqList;
}

- (BOOL)isEqualFreqList:(id)a3 List2:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = (void *)v7;
  if (v6 | v7)
  {
    unsigned __int8 v9 = 0;
    if (v6 && v7)
    {
      id v11 = [(id)v6 count];
      if (v11 == [v8 count])
      {
        id v12 = [objc_alloc((Class)NSMutableArray) initWithArray:v6];
        id v13 = [objc_alloc((Class)NSMutableArray) initWithArray:v8];
        [(WCM_SacManager *)self freqAscendSort:v12];
        [(WCM_SacManager *)self freqAscendSort:v13];
        if ([v12 count])
        {
          uint64_t v14 = 0;
          unsigned int v15 = 1;
          do
          {
            uint64_t v16 = [v12 objectAtIndex:v14];
            unsigned int v17 = [v13 objectAtIndex:v14];
            unsigned __int8 v9 = [v16 isEqual:v17];

            if ((v9 & 1) == 0) {
              break;
            }
            uint64_t v14 = v15;
          }
          while ((unint64_t)[v12 count] > v15++);
        }
        else
        {
          unsigned __int8 v9 = 1;
        }
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)freqAscendSort:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    if ([v3 count]) {
      [v4 sortUsingComparator:&stru_10020EA48];
    }
  }

  _objc_release_x1();
}

- (void)sacUpdateCellularSearchFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v15 = v6;
    unint64_t v7 = [(WCM_SacManager *)self mCellularFreqSet];
    id v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 mCellularSearchFreqList];

    if (v9) {
      [v9 removeAllObjects];
    }
    else {
      id v9 = objc_alloc_init((Class)NSMutableArray);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"SAC update cellular search frequency, count=%lu", [v15 count]);
    if ([v15 count])
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        id v12 = objc_alloc_init(FreqRangeInfo);
        id v13 = [v15 objectAtIndex:v10];
        [(FreqRangeInfo *)v12 setFreqWithObj:v13];

        uint64_t v14 = [(FreqRangeInfo *)v12 logPrint];
        +[WCM_Logging logLevel:3, @"    SAC cellular search_freq[%d] = %@", v11, v14 message];

        [v9 addObject:v12];
        unint64_t v10 = (v11 + 1);
        unint64_t v11 = v10;
      }
      while ((unint64_t)[v15 count] > v10);
    }

    id v6 = v15;
  }
}

- (void)sacUpdateCellularRPLMNFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v15 = v6;
    unint64_t v7 = [(WCM_SacManager *)self mCellularFreqSet];
    id v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 mCellularRPLMNFreqList];

    if (v9) {
      [v9 removeAllObjects];
    }
    else {
      id v9 = objc_alloc_init((Class)NSMutableArray);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"SAC update cellular RPLMN frequency, count=%lu", [v15 count]);
    if ([v15 count])
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        id v12 = objc_alloc_init(FreqRangeInfo);
        id v13 = [v15 objectAtIndex:v10];
        [(FreqRangeInfo *)v12 setFreqWithObj:v13];

        uint64_t v14 = [(FreqRangeInfo *)v12 logPrint];
        +[WCM_Logging logLevel:3, @"    SAC cellular rplmn_freq[%d] = %@", v11, v14 message];

        [v9 addObject:v12];
        unint64_t v10 = (v11 + 1);
        unint64_t v11 = v10;
      }
      while ((unint64_t)[v15 count] > v10);
    }

    id v6 = v15;
  }
}

- (void)sacUpdateCellularHoppingFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v23 = v6;
    unint64_t v7 = [(WCM_SacManager *)self mCellularFreqSet];
    id v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 mCellularHoppingFreq];

    if (v9) {
      [v9 removeAllObjects];
    }
    else {
      id v9 = objc_alloc_init((Class)NSMutableArray);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"SAC update cellular hopping frequency, count=%lu", [v23 count]);
    if ([v23 count])
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      id v12 = 0;
      unint64_t v13 = -1;
      uint64_t v14 = v23;
      do
      {
        id v15 = [v14 objectAtIndex:v10];
        uint64_t v16 = [v15 logPrint];
        +[WCM_Logging logLevel:3, @"    SAC cellular hopping_freq[%d] = %@", v11, v16 message];

        unsigned int v17 = (char *)[v15 centerFreq];
        if (v13 > (unint64_t)&v17[-((unint64_t)[v15 bw] >> 1)])
        {
          id v18 = [v15 centerFreq];
          unint64_t v13 = (unint64_t)v18 - ((unint64_t)[v15 bw] >> 1);
        }
        v19 = (char *)[v15 centerFreq];
        if (v12 < &v19[(unint64_t)[v15 bw] >> 1])
        {
          BOOL v20 = (char *)[v15 centerFreq];
          id v12 = &v20[(unint64_t)[v15 bw] >> 1];
        }

        unint64_t v10 = (v11 + 1);
        unint64_t v11 = v10;
        BOOL v21 = (unint64_t)[v23 count] > v10;
        uint64_t v14 = v23;
      }
      while (v21);
      if ((unint64_t)v12 > v13)
      {
        v22 = [[FreqRangeInfo alloc] initWithStartFreq:v13 EndFreq:v12];
        [v9 addObject:v22];
      }
    }

    id v6 = v23;
  }
}

- (void)sacUpdateCellularDownlinkFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (!v6 || a4 > 1) {
    goto LABEL_15;
  }
  id v20 = v6;
  unint64_t v7 = [(WCM_SacManager *)self mCellularFreqSet];
  uint64_t v8 = a4;
  id v9 = [v7 objectAtIndex:a4];
  id v10 = [v9 mCellularPccFreq];

  unint64_t v11 = [(WCM_SacManager *)self mCellularFreqSet];
  id v12 = [v11 objectAtIndex:v8];
  id v13 = [v12 mCellularSccFreqList];

  if (!v10)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    if (v13) {
      goto LABEL_5;
    }
LABEL_7:
    id v13 = objc_alloc_init((Class)NSMutableArray);
    goto LABEL_8;
  }
  [v10 removeAllObjects];
  if (!v13) {
    goto LABEL_7;
  }
LABEL_5:
  [v13 removeAllObjects];
LABEL_8:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"SAC update cellular downlink frequency, count=%lu", [v20 count]);
  if ([v20 count])
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = objc_alloc_init(FreqRangeInfo);
      unsigned int v17 = [v20 objectAtIndex:v14];
      [(FreqRangeInfo *)v16 setFreqWithObj:v17];

      id v18 = [(FreqRangeInfo *)v16 logPrint];
      +[WCM_Logging logLevel:3, @"    SAC cellular dl_freq[%d] = %@", v15, v18 message];

      if (v15) {
        v19 = v13;
      }
      else {
        v19 = v10;
      }
      [v19 addObject:v16];

      unint64_t v14 = (v15 + 1);
      unint64_t v15 = v14;
    }
    while ((unint64_t)[v20 count] > v14);
  }

  id v6 = v20;
LABEL_15:
}

- (void)sacSetCellularSubActiveState:(BOOL)a3 onSubId:(unsigned int)a4
{
  if (a4 <= 1)
  {
    int v4 = 1 << a4;
    if (!a3) {
      int v4 = self->mActiveSubId_bitmap & ~v4;
    }
    self->mActiveSubId_bitmap = v4;
  }
}

- (void)sacReportCellularVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = +[WCM_SacManager basebandController];
  if (v7)
  {
    uint64_t v8 = v7;
    if (v5 == 2) {
      [(WCM_SacManager *)self mCacheCellularReportedReducedList];
    }
    else {
    id v9 = [(WCM_SacManager *)self mCacheCellularReportedFullList];
    }
    id v10 = v9;
    if (a4 == 1)
    {
      id v19 = objc_alloc_init((Class)NSMutableArray);
      v83 = v8;
      if (v5 == 2)
      {
        if (self->mActiveSubId_bitmap)
        {
          [(WCM_SacManager *)self sacProcessCellularPrimaryFreqInfo:v19 onSubId:1];
          [(WCM_SacManager *)self sacProcessCellularPrimaryFreqInfo:v19 onSubId:0];
          [(WCM_SacManager *)self sacProcessCellularSecondaryFreqInfo:v19 onSubId:1];
          [(WCM_SacManager *)self sacProcessCellularSecondaryFreqInfo:v19 onSubId:0];
          [(WCM_SacManager *)self sacProcessCellularMeasFreqInfo:v19 onSubId:1];
          id v20 = self;
          id v21 = v19;
          uint64_t v22 = 0;
        }
        else
        {
          [(WCM_SacManager *)self sacProcessCellularPrimaryFreqInfo:v19 onSubId:0];
          [(WCM_SacManager *)self sacProcessCellularPrimaryFreqInfo:v19 onSubId:1];
          [(WCM_SacManager *)self sacProcessCellularSecondaryFreqInfo:v19 onSubId:0];
          [(WCM_SacManager *)self sacProcessCellularSecondaryFreqInfo:v19 onSubId:1];
          [(WCM_SacManager *)self sacProcessCellularMeasFreqInfo:v19 onSubId:0];
          id v20 = self;
          id v21 = v19;
          uint64_t v22 = 1;
        }
        [(WCM_SacManager *)v20 sacProcessCellularMeasFreqInfo:v21 onSubId:v22];
      }
      else
      {
        id v23 = [(WCM_SacManager *)self mCellularFreqSet];
        uint64_t v24 = [v23 objectAtIndex:0];
        v25 = [v24 mCellularHoppingFreq];
        id v26 = [v25 count];

        id v27 = [(WCM_SacManager *)self mCellularFreqSet];
        uint64_t v28 = [v27 objectAtIndex:0];
        unsigned int v29 = v28;
        if (v26) {
          [v28 mCellularHoppingFreq];
        }
        else {
        v30 = [v28 mCellularPccFreq];
        }
        [v19 addObjectsFromArray:v30];

        v31 = [(WCM_SacManager *)self mCellularFreqSet];
        id v32 = [v31 objectAtIndex:1];
        v33 = [v32 mCellularHoppingFreq];
        id v34 = [v33 count];

        id v35 = [(WCM_SacManager *)self mCellularFreqSet];
        v36 = [v35 objectAtIndex:1];
        int v37 = v36;
        if (v34) {
          [v36 mCellularHoppingFreq];
        }
        else {
        v38 = [v36 mCellularPccFreq];
        }
        [v19 addObjectsFromArray:v38];

        id v39 = [(WCM_SacManager *)self mCellularFreqSet];
        v40 = [v39 objectAtIndex:0];
        int v41 = [v40 mCellularSccFreqList];
        [v19 addObjectsFromArray:v41];

        v42 = [(WCM_SacManager *)self mCellularFreqSet];
        v43 = [v42 objectAtIndex:1];
        v44 = [v43 mCellularSccFreqList];
        [v19 addObjectsFromArray:v44];

        v45 = [(WCM_SacManager *)self mCellularFreqSet];
        v46 = [v45 objectAtIndex:0];
        v47 = [v46 mCellularSearchFreqList];
        [v19 addObjectsFromArray:v47];

        v48 = [(WCM_SacManager *)self mCellularFreqSet];
        v49 = [v48 objectAtIndex:1];
        v50 = [v49 mCellularSearchFreqList];
        [v19 addObjectsFromArray:v50];

        v51 = [(WCM_SacManager *)self mCellularFreqSet];
        v52 = [v51 objectAtIndex:0];
        v53 = [v52 mCellularNeighborFreqList];
        [v19 addObjectsFromArray:v53];

        v54 = [(WCM_SacManager *)self mCellularFreqSet];
        v55 = [v54 objectAtIndex:1];
        v56 = [v55 mCellularNeighborFreqList];
        [v19 addObjectsFromArray:v56];

        v57 = [(WCM_SacManager *)self mCellularFreqSet];
        v58 = [v57 objectAtIndex:0];
        v59 = [v58 mCellularRPLMNFreqList];
        [v19 addObjectsFromArray:v59];

        v60 = [(WCM_SacManager *)self mCellularFreqSet];
        v61 = [v60 objectAtIndex:1];
        v62 = [v61 mCellularRPLMNFreqList];
        [v19 addObjectsFromArray:v62];
      }
      uint64_t v63 = [(WCM_SacManager *)self getRemoveObjIndex:v19 fromOther:v10];
      uint64_t v64 = [(WCM_SacManager *)self getInsertObjIndex:v19 fromOther:v10];
      v82 = (void *)v63;
      v65 = [v10 objectsAtIndexes:v63];
      v81 = (void *)v64;
      v66 = [v19 objectsAtIndexes:v64];
      [v10 removeAllObjects];
      [v10 setArray:v19];
      v84 = self;
      if ([v65 count])
      {
        if ([v65 count])
        {
          uint64_t v67 = 0;
          unsigned int v68 = 1;
          do
          {
            v69 = [v65 objectAtIndex:v67];
            v70 = [v69 logPrint];
            +[WCM_Logging logLevel:3, @"SAC%d client_cellular : Remove Frequency %@:", v5, v70 message];

            uint64_t v67 = v68;
            BOOL v15 = (unint64_t)[v65 count] > v68++;
          }
          while (v15);
        }
        id v71 = [v65 copy];
        v72 = dispatch_get_global_queue(0, 0);
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_100009AE8;
        v89[3] = &unk_10020EAF0;
        v89[4] = v84;
        id v90 = v71;
        v91 = v83;
        int v92 = v5;
        id v73 = v71;
        dispatch_async(v72, v89);
      }
      if ([v66 count])
      {
        if ([v66 count])
        {
          uint64_t v74 = 0;
          unsigned int v75 = 1;
          do
          {
            v76 = [v66 objectAtIndex:v74];
            v77 = [v76 logPrint];
            +[WCM_Logging logLevel:3, @"SAC%d client_cellular : Add Frequency %@:", v5, v77 message];

            uint64_t v74 = v75;
            BOOL v15 = (unint64_t)[v66 count] > v75++;
          }
          while (v15);
        }
        id v78 = [v66 copy];
        v79 = dispatch_get_global_queue(0, 0);
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_100009A68;
        v85[3] = &unk_10020EAF0;
        v85[4] = v84;
        id v86 = v78;
        v87 = v83;
        int v88 = v5;
        id v80 = v78;
        dispatch_async(v79, v85);
      }
    }
    else if (!a4)
    {
      if ([v9 count])
      {
        uint64_t v11 = 0;
        unsigned int v12 = 1;
        do
        {
          id v13 = [v10 objectAtIndex:v11];
          unint64_t v14 = [v13 logPrint];
          +[WCM_Logging logLevel:3, @"SAC%d client_cellular : Remove Frequency %@:", v5, v14 message];

          uint64_t v11 = v12;
          BOOL v15 = (unint64_t)[v10 count] > v12++;
        }
        while (v15);
      }
      id v16 = [v10 copy];
      unsigned int v17 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100064230;
      block[3] = &unk_10020EAF0;
      block[4] = self;
      id v94 = v16;
      v95 = v8;
      int v96 = v5;
      id v18 = v16;
      dispatch_async(v17, block);

      [v10 removeAllObjects];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@" sacReportCellularVictimFreqListOnTargetSac failed to get baseband controller "];
    id v10 = 0;
  }
}

- (NSMutableArray)mCellularFreqSet
{
  return self->_mCellularFreqSet;
}

+ (__TelephonyBasebandControllerHandle_tag)basebandController
{
  result = (__TelephonyBasebandControllerHandle_tag *)qword_10027D020;
  if (!qword_10027D020)
  {
    result = (__TelephonyBasebandControllerHandle_tag *)TelephonyBasebandCreateController();
    qword_10027D020 = (uint64_t)result;
    if (!result)
    {
      +[WCM_Logging logLevel:0 message:@"SAC Manager: Failed TelephonyBasebandCreateController()"];
      return (__TelephonyBasebandControllerHandle_tag *)qword_10027D020;
    }
  }
  return result;
}

- (void)sacProcessCellularSecondaryFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v31 = v6;
    unint64_t v7 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 mCellularSccFreqList];

    uint64_t v10 = 56;
    if (!self->mGnssState) {
      uint64_t v10 = 80;
    }
    uint64_t v11 = 64;
    if (!self->mGnssState) {
      uint64_t v11 = 88;
    }
    unint64_t v12 = *(unsigned int *)((char *)&self->super.isa + v11);
    uint64_t v13 = *(uint64_t *)((char *)&self->super.isa + v10);
    if ([v31 count])
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      unsigned int v16 = 1;
      do
      {
        unsigned int v17 = [v31 objectAtIndex:v14];
        v15 += (unint64_t)[v17 bw];

        uint64_t v14 = v16;
        BOOL v18 = (unint64_t)[v31 count] > v16++;
      }
      while (v18);
    }
    else
    {
      unint64_t v15 = 0;
    }
    if (v15 < self->mMaxCellAggregateBw)
    {
      id v19 = objc_alloc_init((Class)NSMutableArray);
      if ([v9 count])
      {
        uint64_t v20 = 0;
        unsigned int v21 = 1;
        do
        {
          uint64_t v22 = objc_alloc_init(FreqRangeInfo);
          id v23 = [v9 objectAtIndex:v20];
          [(FreqRangeInfo *)v22 setFreqWithObj:v23];

          [(FreqRangeInfo *)v22 applyBwLimitFromRight:v13];
          [v19 addObject:v22];

          uint64_t v20 = v21;
          BOOL v18 = (unint64_t)[v9 count] > v21++;
        }
        while (v18);
      }
      [(WCM_SacManager *)self sacScreenAllFreq:v19];
      if ([v19 count])
      {
        unint64_t v24 = 0;
        while (1)
        {
          v25 = [v19 objectAtIndex:v24];
          id v26 = [v25 bw];
          unint64_t mMaxCellAggregateBw = self->mMaxCellAggregateBw;
          unint64_t v28 = mMaxCellAggregateBw - v15;
          if (mMaxCellAggregateBw == v15 || v24 >= v12) {
            break;
          }
          unint64_t v30 = (unint64_t)v26;
          if ((unint64_t)v26 > v28)
          {
            [v25 applyBwLimitFromRight:mMaxCellAggregateBw - v15];
            unint64_t v30 = v28;
          }
          [v31 addObject:v25];
          v15 += v30;

          if ((unint64_t)[v19 count] <= ++v24) {
            goto LABEL_27;
          }
        }
      }
LABEL_27:
    }
    id v6 = v31;
  }
}

- (void)sacScreenAllFreq:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v10 = v4;
    if ([v4 count])
    {
      id v5 = objc_alloc_init((Class)NSMutableArray);
      if ([v10 count])
      {
        uint64_t v6 = 0;
        unsigned int v7 = 1;
        do
        {
          uint64_t v8 = [v10 objectAtIndex:v6];
          [(WCM_SacManager *)self sacScreenFreq:v5 freqRangeObj:v8];

          uint64_t v6 = v7;
        }
        while ((unint64_t)[v10 count] > v7++);
      }
      [v10 removeAllObjects];
      [v10 setArray:v5];
      [(WCM_SacManager *)self sacSortFreqByPriority:v10];
    }
  }

  _objc_release_x1();
}

- (void)sacProcessCellularPrimaryFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v22 = v6;
    unsigned int v7 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v8 = a4;
    id v9 = [v7 objectAtIndex:a4];
    uint64_t v10 = [v9 mCellularPccFreq];

    uint64_t v11 = [(WCM_SacManager *)self mCellularFreqSet];
    unint64_t v12 = [v11 objectAtIndex:v8];
    uint64_t v13 = [v12 mCellularHoppingFreq];

    uint64_t v14 = [[FreqRangeInfo alloc] initWithStartFreq:0 EndFreq:0];
    uint64_t v15 = 48;
    if (!self->mGnssState) {
      uint64_t v15 = 72;
    }
    uint64_t v16 = *(uint64_t *)((char *)&self->super.isa + v15);
    if (v13 && (id v17 = [v13 count], v18 = v13, v17)
      || v10 && (v19 = [v10 count], BOOL v18 = v10, v19))
    {
      uint64_t v20 = [v18 objectAtIndex:0];
      [(FreqRangeInfo *)v14 setFreqWithObj:v20];
    }
    if ([(FreqRangeInfo *)v14 FreqStart])
    {
      id v21 = objc_alloc_init((Class)NSMutableArray);
      [(FreqRangeInfo *)v14 applyBwLimitFromRight:v16];
      [v21 addObject:v14];
      [(WCM_SacManager *)self sacScreenAllFreq:v21];
      [v22 addObjectsFromArray:v21];
    }
    id v6 = v22;
  }
}

- (void)sacProcessCellularMeasFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v41 = v6;
    unsigned int v7 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v8 = a4;
    id v9 = [v7 objectAtIndex:a4];
    uint64_t v10 = [v9 mCellularNeighborFreqList];

    uint64_t v11 = [(WCM_SacManager *)self mCellularFreqSet];
    unint64_t v12 = [v11 objectAtIndex:v8];
    uint64_t v13 = [v12 mCellularSearchFreqList];

    uint64_t v14 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v15 = [v14 objectAtIndex:v8];
    uint64_t v16 = [v15 mCellularRPLMNFreqList];

    if (self->mMeasurementFreqIncluded)
    {
      if ([v41 count])
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
        unsigned int v19 = 1;
        do
        {
          uint64_t v20 = [v41 objectAtIndex:v17];
          v18 += (unint64_t)[v20 bw];

          uint64_t v17 = v19;
          BOOL v21 = (unint64_t)[v41 count] > v19++;
        }
        while (v21);
      }
      else
      {
        unint64_t v18 = 0;
      }
      if (v18 < self->mMaxCellAggregateBw)
      {
        id v22 = objc_alloc_init((Class)NSMutableArray);
        if ([v10 count])
        {
          uint64_t v23 = 0;
          unsigned int v24 = 1;
          do
          {
            v25 = [v10 objectAtIndex:v23];
            id v26 = objc_alloc_init(FreqRangeInfo);
            [(FreqRangeInfo *)v26 setFreqWithObj:v25];
            [(FreqRangeInfo *)v26 applyBwLimitFromCenter:5000000];
            [v22 addObject:v26];

            uint64_t v23 = v24;
            BOOL v21 = (unint64_t)[v10 count] > v24++;
          }
          while (v21);
        }
        if ([v13 count])
        {
          uint64_t v27 = 0;
          unsigned int v28 = 1;
          do
          {
            unsigned int v29 = [v13 objectAtIndex:v27];
            unint64_t v30 = objc_alloc_init(FreqRangeInfo);
            [(FreqRangeInfo *)v30 setFreqWithObj:v29];
            [(FreqRangeInfo *)v30 applyBwLimitFromCenter:5000000];
            [v22 addObject:v30];

            uint64_t v27 = v28;
            BOOL v21 = (unint64_t)[v13 count] > v28++;
          }
          while (v21);
        }
        if ([v16 count])
        {
          uint64_t v31 = 0;
          unsigned int v32 = 1;
          do
          {
            v33 = [v16 objectAtIndex:v31];
            id v34 = objc_alloc_init(FreqRangeInfo);
            [(FreqRangeInfo *)v34 setFreqWithObj:v33];
            [(FreqRangeInfo *)v34 applyBwLimitFromCenter:5000000];
            [v22 addObject:v34];

            uint64_t v31 = v32;
            BOOL v21 = (unint64_t)[v16 count] > v32++;
          }
          while (v21);
        }
        [(WCM_SacManager *)self sacScreenAllFreq:v22];
        if ([v22 count])
        {
          uint64_t v35 = 0;
          unsigned int v36 = 1;
          while (1)
          {
            int v37 = [v22 objectAtIndex:v35];
            unint64_t v38 = (unint64_t)[v37 bw];
            unint64_t mMaxCellAggregateBw = self->mMaxCellAggregateBw;
            unint64_t v40 = mMaxCellAggregateBw - v18;
            if (mMaxCellAggregateBw == v18) {
              break;
            }
            if (v38 > v40)
            {
              [v37 applyBwLimitFromCenter:mMaxCellAggregateBw - v18];
              unint64_t v38 = v40;
            }
            v18 += v38;
            [v41 addObject:v37];

            uint64_t v35 = v36;
            BOOL v21 = (unint64_t)[v22 count] > v36++;
            if (!v21) {
              goto LABEL_27;
            }
          }
        }
LABEL_27:
      }
    }

    id v6 = v41;
  }
}

- (id)getRemoveObjIndex:(id)a3 fromOther:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableIndexSet);
  if (v5 && v6)
  {
    id v9 = [v5 differenceFromArray:v6 withOptions:1 usingEquivalenceTest:&stru_10020EAA8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 removals];
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [v7 addIndex:[*(id *)(*((void *)&v16 + 1) + 8 * i) index]];
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }

  return v7;
}

- (id)getInsertObjIndex:(id)a3 fromOther:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableIndexSet);
  if (v5 && v6)
  {
    id v9 = [v5 differenceFromArray:v6 withOptions:2 usingEquivalenceTest:&stru_10020EAC8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 insertions];
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [v7 addIndex:[*(id *)(*((void *)&v16 + 1) + 8 * i) index]];
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }

  return v7;
}

- (void)sacUpdateCellularNeighborFreqInfo:(id)a3 onSubId:(unsigned int)a4
{
  id v6 = a3;
  if (v6 && a4 <= 1)
  {
    id v15 = v6;
    id v7 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 mCellularNeighborFreqList];

    if (v9) {
      [v9 removeAllObjects];
    }
    else {
      id v9 = objc_alloc_init((Class)NSMutableArray);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"SAC update cellular neighbor frequency, count=%lu", [v15 count]);
    if ([v15 count])
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        id v12 = objc_alloc_init(FreqRangeInfo);
        uint64_t v13 = [v15 objectAtIndex:v10];
        [(FreqRangeInfo *)v12 setFreqWithObj:v13];

        uint64_t v14 = [(FreqRangeInfo *)v12 logPrint];
        +[WCM_Logging logLevel:3, @"    SAC cellular neighbor_freq[%d] = %@", v11, v14 message];

        [v9 addObject:v12];
        unint64_t v10 = (v11 + 1);
        unint64_t v11 = v10;
      }
      while ((unint64_t)[v15 count] > v10);
    }

    id v6 = v15;
  }
}

- (unsigned)sacCreateRawFreqList:(id)a3 bufferSize:(unsigned int)a4 buffer:(__AppleBasebandVictimFreq *)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  LODWORD(v9) = 0;
  if (v7 && a5)
  {
    unsigned int v10 = [v7 count];
    if (v10 >= a4) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = v10;
    }
    if (v9)
    {
      uint64_t v11 = 0;
      p_var2 = &a5->var2;
      do
      {
        uint64_t v13 = [v8 objectAtIndex:v11];
        *(void *)(p_var2 - 3) = [v13 centerFreq];
        *(void *)(p_var2 - 1) = ((unint64_t)[v13 bw] >> 1);

        ++v11;
        p_var2 += 4;
      }
      while (v9 != v11);
    }
  }

  return v9;
}

- (void)sacSortFreqByPriority:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    if ([v3 count]) {
      [v4 sortUsingComparator:&stru_10020EA68];
    }
  }

  _objc_release_x1();
}

- (void)sacScreenFreq:(id)a3 freqRangeObj:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if (v31)
  {
    if (v6)
    {
      id v7 = [(WCM_SacManager *)self mCellularFreqInclusionList];
      id v8 = [v7 count];

      if (v8)
      {
        uint64_t v9 = 0;
        unsigned int v10 = 1;
        do
        {
          uint64_t v11 = [(WCM_SacManager *)self mCellularFreqInclusionList];
          id v12 = [v11 objectAtIndex:v9];

          id v13 = [v6 FreqEnd];
          if (v13 > [v12 FreqStart])
          {
            id v14 = [v6 FreqStart];
            if (v14 < [v12 FreqEnd])
            {
              id v15 = [v6 FreqStart];
              if (v15 <= [v12 FreqStart])
              {
                id v16 = [v6 FreqEnd];
                id v17 = [v12 FreqEnd];
                long long v18 = v12;
                long long v19 = v12;
                if (v16 >= v17) {
                  goto LABEL_22;
                }
              }
              id v20 = [v6 FreqStart];
              if (v20 >= [v12 FreqStart])
              {
                id v21 = [v6 FreqEnd];
                id v22 = [v12 FreqEnd];
                long long v18 = v6;
                long long v19 = v6;
                if (v21 <= v22) {
                  goto LABEL_22;
                }
              }
              id v23 = [v6 FreqStart];
              id v24 = [v12 FreqStart];
              long long v18 = v6;
              long long v19 = v12;
              if (v23 >= v24
                || (id v25 = [v6 FreqEnd],
                    id v26 = [v12 FreqEnd],
                    long long v18 = v12,
                    long long v19 = v6,
                    v25 <= v26))
              {
LABEL_22:
                id v27 = [v18 FreqStart];
                id v28 = [v19 FreqEnd];
                if (v27)
                {
                  if (v28)
                  {
                    unsigned int v29 = [[FreqRangeInfo alloc] initWithStartFreq:v27 EndFreq:v28];
                    [(FreqRangeInfo *)v29 setPriority:v10 - 1];
                    [v31 addObject:v29];
                  }
                }
              }
            }
          }

          uint64_t v9 = v10;
        }
        while ((unint64_t)v8 > v10++);
      }
    }
  }
}

- (NSMutableArray)mCellularFreqInclusionList
{
  return self->_mCellularFreqInclusionList;
}

- (NSMutableArray)mCacheCellularReportedReducedList
{
  return self->_mCacheCellularReportedReducedList;
}

- (NSMutableArray)mCacheCellularReportedFullList
{
  return self->_mCacheCellularReportedFullList;
}

- (BOOL)isTestMode
{
  return self->mTestMode;
}

- (id)getQueue
{
  return self->mQueue;
}

- (NSMutableArray)mCacheWifiReportedReducedList
{
  return self->_mCacheWifiReportedReducedList;
}

- (NSMutableArray)mCacheWifiReportedFullList
{
  return self->_mCacheWifiReportedFullList;
}

- (WCM_SacManager)initWithPlatformId:(unint64_t)a3
{
  v101.receiver = self;
  v101.super_class = (Class)WCM_SacManager;
  id v4 = [(WCM_SacManager *)&v101 init];
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.WirelessRadioManager.SacManager", 0);
  mQueue = v4->mQueue;
  v4->mQueue = (OS_dispatch_queue *)v5;

  v4->mTestMode = 0;
  v4->mGnssState = 0;
  v4->mGnssL1StateChanged = 0;
  v4->mActiveSubId_bitmap = 0;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCellularFreqSet:v7];

  id v8 = objc_alloc_init(SacCellularFreqInfoSet);
  uint64_t v9 = objc_alloc_init(SacCellularFreqInfoSet);
  unsigned int v10 = [(WCM_SacManager *)v4 mCellularFreqSet];
  [v10 addObject:v8];

  uint64_t v11 = [(WCM_SacManager *)v4 mCellularFreqSet];
  [v11 addObject:v9];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMWifiFreqList:v12];

  id v13 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMGnssL1FreqList:v13];

  id v14 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMGnssL5FreqList:v14];

  id v15 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheCellularReportedFullList:v15];

  id v16 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheCellularReportedReducedList:v16];

  id v17 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheWifiReportedFullList:v17];

  id v18 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheWifiReportedReducedList:v18];

  id v19 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheGnssReportedFullList:v19];

  id v20 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCacheGnssReportedReducedList:v20];

  id v21 = objc_alloc_init((Class)NSMutableArray);
  [(WCM_SacManager *)v4 setMCellularFreqInclusionList:v21];

  uint64_t v100 = 0;
  id v22 = sub_100095D24(@"coex_sac", @"plist");
  uint64_t v99 = 0;
  id v23 = +[NSPropertyListSerialization propertyListWithData:v22 options:2 format:&v100 error:&v99];
  if (v23)
  {
    v98 = v9;
    +[WCM_Logging logLevel:3 message:@"init SAC Configuration Plist File Found"];
    id v24 = (id)[(WCM_SacManager *)v4 sacGetPlatformPlistIdx:a3];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"Config count = %lu, platformID=%llu, SAC plist index=%d", [v23 count], a3, v24);
    +[WCM_Logging logLevel:3 message:@"SAC Configuration from plist: "];
    uint64_t v25 = v24;
    id v26 = [v23 objectAtIndex:v24];
    id v27 = [v26 objectForKey:@"GNSS_L1"];
    v4->mReportGnssL1 = [v27 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: GNSS_L1 = %d", v4->mReportGnssL1 message];
    id v28 = [v23 objectAtIndex:v25];
    unsigned int v29 = [v28 objectForKey:@"GNSS_L5"];
    v4->mReportGnssL5 = [v29 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: GNSS_L5 = %d", v4->mReportGnssL5 message];
    unint64_t v30 = [v23 objectAtIndex:v25];
    id v31 = [v30 objectForKey:@"WiFi_2p4"];
    v4->mReportWiFi2G = [v31 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: WiFi_2p4 = %d", v4->mReportWiFi2G message];
    unsigned int v32 = [v23 objectAtIndex:v25];
    v33 = [v32 objectForKey:@"WiFi_5p0"];
    v4->mReportWiFi5G = [v33 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: WiFi_5p0 = %d", v4->mReportWiFi5G message];
    id v34 = [v23 objectAtIndex:v25];
    uint64_t v35 = [v34 objectForKey:@"WiFi_enh"];
    v4->mReportWiFiEnh = [v35 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: WiFi_enh = %d", v4->mReportWiFiEnh message];
    unsigned int v36 = [v23 objectAtIndex:v25];
    int v37 = [v36 objectForKey:@"Cell_Include_Measurement"];
    v4->mMeasurementFreqIncluded = [v37 BOOLValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_Include_Measurement = %d", v4->mMeasurementFreqIncluded message];
    unint64_t v38 = [v23 objectAtIndex:v25];
    id v39 = [v38 objectForKey:@"Cell_PCC_BW_L1ON"];
    v4->mPccBwL1On = 1000 * [v39 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_PCC_BW_L1ON = %llu (%lluMHz)", v4->mPccBwL1On, v4->mPccBwL1On / 0xF4240 message];
    unint64_t v40 = [v23 objectAtIndex:v25];
    id v41 = [v40 objectForKey:@"Cell_SCC_BW_L1ON"];
    v4->mSccBwL1On = 1000 * [v41 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_SCC_BW_L1ON = %llu (%lluMHz)", v4->mSccBwL1On, v4->mSccBwL1On / 0xF4240 message];
    v42 = [v23 objectAtIndex:v25];
    v43 = [v42 objectForKey:@"Cell_SCC_Channels_L1ON"];
    v4->mAllowedSccNumL1On = [v43 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_SCC_Channels_L1ON = %d", v4->mAllowedSccNumL1On message];
    v44 = [v23 objectAtIndex:v25];
    v45 = [v44 objectForKey:@"Cell_PCC_BW_L1OFF"];
    v4->mPccBwL1Off = 1000 * [v45 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_PCC_BW_L1OFF = %llu (%lluMHz)", v4->mPccBwL1Off, v4->mPccBwL1Off / 0xF4240 message];
    v46 = [v23 objectAtIndex:v25];
    v47 = [v46 objectForKey:@"Cell_SCC_BW_L1OFF"];
    v4->mSccBwL1Off = 1000 * [v47 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_SCC_BW_L1OFF = %llu (%lluMHz)", v4->mSccBwL1Off, v4->mSccBwL1Off / 0xF4240 message];
    v48 = [v23 objectAtIndex:v25];
    v49 = [v48 objectForKey:@"Cell_SCC_Channels_L1OFF"];
    v4->mAllowedSccNumL1Off = [v49 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_SCC_Channels_L1OFF = %d", v4->mAllowedSccNumL1Off message];
    v50 = [v23 objectAtIndex:v25];
    v51 = [v50 objectForKey:@"Cell_Aggregate_BW"];
    v4->unint64_t mMaxCellAggregateBw = 1000 * [v51 unsignedIntValue];

    +[WCM_Logging logLevel:3, @"SAC Configuration: Cell_Aggregate_BW = %llu (%lluMHz)", v4->mMaxCellAggregateBw, v4->mMaxCellAggregateBw / 0xF4240 message];
    v52 = [v23 objectAtIndex:v25];
    v53 = [v52 objectForKey:@"Cell_priority_1_Fmin"];
    v103[0] = 1000 * [v53 unsignedIntValue];

    v54 = [v23 objectAtIndex:v25];
    v55 = [v54 objectForKey:@"Cell_priority_1_Fmax"];
    v102[0] = 1000 * [v55 unsignedIntValue];

    v56 = [v23 objectAtIndex:v25];
    v57 = [v56 objectForKey:@"Cell_priority_2_Fmin"];
    v103[1] = 1000 * [v57 unsignedIntValue];

    v58 = [v23 objectAtIndex:v25];
    v59 = [v58 objectForKey:@"Cell_priority_2_Fmax"];
    v102[1] = 1000 * [v59 unsignedIntValue];

    v60 = [v23 objectAtIndex:v25];
    v61 = [v60 objectForKey:@"Cell_priority_3_Fmin"];
    v103[2] = 1000 * [v61 unsignedIntValue];

    v62 = [v23 objectAtIndex:v25];
    uint64_t v63 = [v62 objectForKey:@"Cell_priority_3_Fmax"];
    v102[2] = 1000 * [v63 unsignedIntValue];

    uint64_t v64 = [v23 objectAtIndex:v25];
    v65 = [v64 objectForKey:@"Cell_priority_4_Fmin"];
    v103[3] = 1000 * [v65 unsignedIntValue];

    v66 = [v23 objectAtIndex:v25];
    uint64_t v67 = [v66 objectForKey:@"Cell_priority_4_Fmax"];
    v102[3] = 1000 * [v67 unsignedIntValue];

    unsigned int v68 = [v23 objectAtIndex:v25];
    v69 = [v68 objectForKey:@"Cell_priority_5_Fmin"];
    v103[4] = 1000 * [v69 unsignedIntValue];

    v70 = [v23 objectAtIndex:v25];
    id v71 = [v70 objectForKey:@"Cell_priority_5_Fmax"];
    v102[4] = 1000 * [v71 unsignedIntValue];

    v72 = [v23 objectAtIndex:v25];
    id v73 = [v72 objectForKey:@"Cell_priority_6_Fmin"];
    v103[5] = 1000 * [v73 unsignedIntValue];

    uint64_t v74 = [v23 objectAtIndex:v25];
    unsigned int v75 = [v74 objectForKey:@"Cell_priority_6_Fmax"];
    v102[5] = 1000 * [v75 unsignedIntValue];

    v76 = [v23 objectAtIndex:v25];
    v77 = [v76 objectForKey:@"Cell_priority_7_Fmin"];
    v103[6] = 1000 * [v77 unsignedIntValue];

    id v78 = [v23 objectAtIndex:v25];
    v79 = [v78 objectForKey:@"Cell_priority_7_Fmax"];
    v102[6] = 1000 * [v79 unsignedIntValue];

    id v80 = [v23 objectAtIndex:v25];
    v81 = [v80 objectForKey:@"Cell_priority_8_Fmin"];
    v103[7] = 1000 * [v81 unsignedIntValue];

    v82 = [v23 objectAtIndex:v25];
    v83 = [v82 objectForKey:@"Cell_priority_8_Fmax"];
    v102[7] = 1000 * [v83 unsignedIntValue];

    v84 = [v23 objectAtIndex:v25];
    v85 = [v84 objectForKey:@"Cell_priority_9_Fmin"];
    v103[8] = 1000 * [v85 unsignedIntValue];

    id v86 = [v23 objectAtIndex:v25];
    v87 = [v86 objectForKey:@"Cell_priority_9_Fmax"];
    v102[8] = 1000 * [v87 unsignedIntValue];

    int v88 = [v23 objectAtIndex:v25];
    v89 = [v88 objectForKey:@"Cell_priority_10_Fmin"];
    v103[9] = 1000 * [v89 unsignedIntValue];

    id v90 = [v23 objectAtIndex:v25];
    v91 = [v90 objectForKey:@"Cell_priority_10_Fmax"];
    v102[9] = 1000 * [v91 unsignedIntValue];

    for (uint64_t i = 0; i != 10; ++i)
    {
      unint64_t v93 = v103[i];
      +[WCM_Logging logLevel:3, @"SAC Configuration: freq_min[%d] = %llu (%lluMHz)", i, v93, v93 / 0xF4240 message];
      unint64_t v94 = v102[i];
      +[WCM_Logging logLevel:3, @"SAC Configuration: freq_max[%d] = %llu (%lluMHz)", i, v94, v94 / 0xF4240 message];
      v95 = [[FreqRangeInfo alloc] initWithStartFreq:v93 EndFreq:v94];
      [(FreqRangeInfo *)v95 setPriority:i];
      int v96 = [(WCM_SacManager *)v4 mCellularFreqInclusionList];
      [v96 addObject:v95];
    }
    v4->mGnssState = 0;
    uint64_t v9 = v98;
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"init: No SAC Configuration Plist File Found"];
  }

  return v4;
}

- (id)printPlistParam
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"SAC Configuration: GNSS_L1 = %d\n", self->mReportGnssL1];
  [v3 appendFormat:@"SAC Configuration: GNSS_L5 = %d\n", self->mReportGnssL5];
  [v3 appendFormat:@"SAC Configuration: WiFi_2p4 = %d\n", self->mReportWiFi2G];
  [v3 appendFormat:@"SAC Configuration: WiFi_5p0 = %d\n", self->mReportWiFi5G];
  [v3 appendFormat:@"SAC Configuration: WiFi_enh = %d\n", self->mReportWiFiEnh];
  for (uint64_t i = 0; i != 10; ++i)
  {
    dispatch_queue_t v5 = [(WCM_SacManager *)self mCellularFreqInclusionList];
    id v6 = [v5 objectAtIndex:i];

    [v3 appendFormat:@"SAC Configuration: freq_min[%d] = %llu (%lluMHz)\n", i, [v6 FreqStart], (unint64_t)[v6 FreqStart] / 0xF4240];
    [v3 appendFormat:@"SAC Configuration: freq_max[%d] = %llu (%lluMHz)\n", i, [v6 FreqEnd], (unint64_t)[v6 FreqEnd] / 0xF4240];
  }
  [v3 appendFormat:@"SAC Configuration: Cell_Aggregate_BW = %llu (%lluMHz)\n", self->mMaxCellAggregateBw, self->mMaxCellAggregateBw / 0xF4240];
  [v3 appendFormat:@"SAC Configuration: Cell_Include_Measurement = %d\n", self->mMeasurementFreqIncluded];
  [v3 appendFormat:@"SAC Configuration: Cell_PCC_BW_L1ON = %llu (%lluMHz)\n", self->mPccBwL1On, self->mPccBwL1On / 0xF4240];
  [v3 appendFormat:@"SAC Configuration: Cell_SCC_BW_L1ON = %llu (%lluMHz)\n", self->mSccBwL1On, self->mSccBwL1On / 0xF4240];
  [v3 appendFormat:@"SAC Configuration: Cell_SCC_Channels_L1ON = %d\n", self->mAllowedSccNumL1On];
  [v3 appendFormat:@"SAC Configuration: Cell_PCC_BW_L1OFF = %llu (%lluMHz)\n", self->mPccBwL1Off, self->mPccBwL1Off / 0xF4240];
  [v3 appendFormat:@"SAC Configuration: Cell_SCC_BW_L1OFF = %llu (%lluMHz)\n", self->mSccBwL1Off, self->mSccBwL1Off / 0xF4240];
  [v3 appendFormat:@"SAC Configuration: Cell_SCC_Channels_L1OFF = %d\n", self->mAllowedSccNumL1Off];

  return v3;
}

- (unsigned)sacGetPlatformPlistIdx:(int64_t)a3
{
  if (a3 > 153)
  {
    if (a3 > 167)
    {
      if (a3 == 168 || a3 == 170) {
        return 5;
      }
    }
    else
    {
      if (a3 == 154) {
        return 3;
      }
      if (a3 == 157) {
        return 4;
      }
    }
  }
  else if ((unint64_t)a3 <= 0x39)
  {
    if (((1 << a3) & 0x330000000000000) == 0)
    {
      if (a3 == 24) {
        return 1;
      }
      if (a3 == 25) {
        return 2;
      }
      return 0;
    }
    return 5;
  }
  return 0;
}

- (void)setBlockReporting:(BOOL)a3
{
}

- (void)sacMergeFreqInterval:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    if ([v4 count])
    {
      [(WCM_SacManager *)self freqAscendSort:v14];
      id v5 = objc_alloc_init((Class)NSMutableArray);
      if ([v14 count])
      {
        uint64_t v6 = 0;
        unsigned int v7 = 1;
        do
        {
          id v8 = [v14 objectAtIndex:v6];
          if ([v5 count])
          {
            uint64_t v9 = [v5 lastObject];
            id v10 = [v8 FreqStart];
            if (v10 >= [v9 FreqEnd])
            {
              [v5 addObject:v8];
            }
            else
            {
              id v11 = [v8 FreqStart];
              if (v11 < [v9 FreqEnd])
              {
                id v12 = [v8 FreqEnd];
                if (v12 > [v9 FreqEnd]) {
                  [v9 setEndFreqOnly:[v8 FreqEnd]];
                }
              }
            }
          }
          else
          {
            [v5 addObject:v8];
          }

          uint64_t v6 = v7;
        }
        while ((unint64_t)[v14 count] > v7++);
      }
      [v14 removeAllObjects];
      [v14 addObjectsFromArray:v5];
    }
  }

  _objc_release_x1();
}

- (void)sacUpdateGnssFreqInfo:(id)a3 L5Freq:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (v20)
  {
    BOOL v7 = [v20 count] != 0;
    if (v6)
    {
LABEL_3:
      BOOL v8 = [v6 count] != 0;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  BOOL v8 = 0;
LABEL_6:
  uint64_t v9 = [(WCM_SacManager *)self mGnssL1FreqList];
  [v9 removeAllObjects];

  id v10 = [(WCM_SacManager *)self mGnssL5FreqList];
  [v10 removeAllObjects];

  if (!v7)
  {
    unsigned int v15 = 0;
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if ([v20 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v20 objectAtIndex:v11];
      id v13 = [v12 logPrint];
      +[WCM_Logging logLevel:3, @"SAC receive update of GNSS L1 Freq[%d]:%@", v11, v13 message];

      ++v11;
    }
    while ((unint64_t)[v20 count] > v11);
  }
  id v14 = [(WCM_SacManager *)self mGnssL1FreqList];
  [v14 addObjectsFromArray:v20];

  unsigned int v15 = 1;
  if (v8)
  {
LABEL_13:
    if ([v6 count])
    {
      unint64_t v16 = 0;
      do
      {
        id v17 = [v6 objectAtIndex:v16];
        id v18 = [v17 logPrint];
        +[WCM_Logging logLevel:3, @"SAC receive update of GNSS L5 Freq[%d]:%@", v16, v18 message];

        ++v16;
      }
      while ((unint64_t)[v6 count] > v16);
    }
    v15 |= 2u;
    id v19 = [(WCM_SacManager *)self mGnssL5FreqList];
    [v19 addObjectsFromArray:v6];
  }
LABEL_17:
  self->mGnssL1StateChanged = (self->mGnssState ^ v15) & 1;
  self->mGnssState = v15;
}

- (void)sacProcessGnssFreqInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->mGnssState)
    {
      id v7 = v4;
      if (!self->mReportGnssL1
        || ([(WCM_SacManager *)self mGnssL1FreqList],
            id v5 = objc_claimAutoreleasedReturnValue(),
            [v7 addObjectsFromArray:v5],
            v5,
            id v4 = v7,
            (self->mGnssState & 1) != 0))
      {
        if (self->mReportGnssL5)
        {
          id v6 = [(WCM_SacManager *)self mGnssL5FreqList];
          [v7 addObjectsFromArray:v6];

          id v4 = v7;
        }
      }
    }
  }
}

- (void)sacReportGnssVictimFreqListOnTargetSac:(unsigned int)a3 action:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  BOOL v8 = +[WCM_SacManager basebandController];
  if (!v8)
  {
    +[WCM_Logging logLevel:0 message:@" sacReportGnssVictimFreqListOnTargetSac failed to get baseband controller "];
    id v10 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = v8;
  if (v5 == 2)
  {
    id v10 = [(WCM_SacManager *)self mCacheGnssReportedReducedList];
    if (a4 == 1)
    {
      [(WCM_SacManager *)self sacProcessGnssFreqInfo:v7];
LABEL_8:
      if ([(WCM_SacManager *)self isEqualFreqList:v7 List2:v10])
      {
        +[WCM_Logging logLevel:3, @"SAC[%d] Action=%d(0:remove, 1:add) : GNSS Frequency has no change. Action skipped:", v5, 1 message];
        goto LABEL_25;
      }
      unsigned int v29 = v9;
      int v28 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = [(WCM_SacManager *)self mCacheGnssReportedFullList];
    if (a4 == 1)
    {
      unint64_t v11 = [(WCM_SacManager *)self mGnssL1FreqList];
      [v7 addObjectsFromArray:v11];

      id v12 = [(WCM_SacManager *)self mGnssL5FreqList];
      [v7 addObjectsFromArray:v12];

      goto LABEL_8;
    }
  }
  if (a4 <= 1)
  {
    unsigned int v29 = v9;
    int v28 = 0;
LABEL_13:
    if ([v10 count])
    {
      uint64_t v13 = 0;
      unsigned int v14 = 1;
      do
      {
        unsigned int v15 = [v10 objectAtIndex:v13];
        unint64_t v16 = [v15 logPrint];
        +[WCM_Logging logLevel:3, @"SAC%d client_GNSS : Remove Frequency %@:", v5, v16 message];

        uint64_t v13 = v14;
        BOOL v17 = (unint64_t)[v10 count] > v14++;
      }
      while (v17);
    }
    id v18 = [v10 copy];
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000647B4;
    block[3] = &unk_10020EAF0;
    block[4] = self;
    id v35 = v18;
    unsigned int v36 = v29;
    int v37 = v5;
    id v20 = v18;
    dispatch_async(v19, block);

    [v10 removeAllObjects];
    if (v28)
    {
      [v10 addObjectsFromArray:v7];
      if ([v7 count])
      {
        if ([v7 count])
        {
          uint64_t v21 = 0;
          unsigned int v22 = 1;
          do
          {
            id v23 = [v7 objectAtIndex:v21];
            id v24 = [v23 logPrint];
            +[WCM_Logging logLevel:3, @"SAC%d client_GNSS : Add Frequency %@:", v5, v24 message];

            uint64_t v21 = v22;
            BOOL v17 = (unint64_t)[v7 count] > v22++;
          }
          while (v17);
        }
        id v25 = [v7 copy];
        id v26 = dispatch_get_global_queue(0, 0);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100064834;
        v30[3] = &unk_10020EAF0;
        v30[4] = self;
        id v31 = v25;
        unsigned int v32 = v29;
        int v33 = v5;
        id v27 = v25;
        dispatch_async(v26, v30);
      }
    }
  }
  if (v5 == 2 && self->mGnssL1StateChanged)
  {
    +[WCM_Logging logLevel:3 message:@"GNSS L1 state changed, recalculate cellular victim freq list for reduced list"];
    self->mGnssL1StateChanged = 0;
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:2 action:1];
  }
LABEL_25:
}

- (void)sacRemoveAllCellularFreqOnSubId0:(BOOL)a3 andSubId1:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[WCM_Logging logLevel:2, @"SAC Coex Manager removed cellular frequency[subId0=%d, subId1=%d] from SAC and local cache", a3, a4 message];
  if (v5 || v4)
  {
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:1 action:0];
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:2 action:0];
    id v7 = [(WCM_SacManager *)self mCellularFreqSet];
    BOOL v8 = v7;
    if (v5 && v4)
    {
      uint64_t v9 = [v7 objectAtIndex:0];
      [v9 removeAllFreq];

      id v12 = [(WCM_SacManager *)self mCellularFreqSet];
      id v10 = [v12 objectAtIndex:1];
      [v10 removeAllFreq];
    }
    else
    {
      unint64_t v11 = [v7 objectAtIndex:!v5];
      [v11 removeAllFreq];

      [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:1 action:1];
      [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:2 action:1];
    }
  }
}

- (void)sacRemoveAllWifiFreq
{
  +[WCM_Logging logLevel:2 message:@"SAC Coex Manager removed all Wifi frequency from SAC and local cache"];
  [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:1 action:0];
  [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:2 action:0];
  id v3 = [(WCM_SacManager *)self mWifiFreqList];
  [v3 removeAllObjects];
}

- (void)sacRemoveAllGnssFreq
{
  +[WCM_Logging logLevel:2 message:@"SAC Coex Manager removed all GNSS frequency from SAC and local cache"];
  [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:1 action:0];
  [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:2 action:0];
  id v3 = [(WCM_SacManager *)self mGnssL1FreqList];
  id v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(WCM_SacManager *)self mGnssL1FreqList];
    [v5 removeAllObjects];
  }
  id v6 = [(WCM_SacManager *)self mGnssL5FreqList];
  id v7 = [v6 count];

  if (v7)
  {
    BOOL v8 = [(WCM_SacManager *)self mGnssL5FreqList];
    [v8 removeAllObjects];
  }
  self->mGnssState = 0;
}

- (void)setTestMode:(BOOL)a3
{
  +[WCM_Logging logLevel:2, @"Frequency tool set test mode = %d", a3 message];
  [(WCM_SacManager *)self frequencyToolClearFreq:0];
  [(WCM_SacManager *)self frequencyToolClearFreq:1];
  [(WCM_SacManager *)self frequencyToolClearFreq:2];
  self->mTestMode = a3;
}

- (void)frequencyToolClearFreq:(int)a3
{
  +[WCM_Logging logLevel:2, @"Frequency tool clear frequency on client %d", *(void *)&a3 message];
  switch(a3)
  {
    case 0:
      [(WCM_SacManager *)self sacRemoveAllCellularFreqOnSubId0:1 andSubId1:1];
      break;
    case 1:
      [(WCM_SacManager *)self sacRemoveAllWifiFreq];
      break;
    case 2:
      goto LABEL_9;
    case 3:
      [(WCM_SacManager *)self sacRemoveAllCellularFreqOnSubId0:1 andSubId1:1];
      [(WCM_SacManager *)self sacRemoveAllWifiFreq];
LABEL_9:
      [(WCM_SacManager *)self sacRemoveAllGnssFreq];
      break;
    default:
      return;
  }
}

- (void)removeFreqFromArray:(id)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v13 = v6;
    id v7 = [v6 count];
    BOOL v8 = v13;
    if (v7)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      while (1)
      {
        unint64_t v11 = [v8 objectAtIndex:v9];
        if ([v11 centerFreq] == (id)a4) {
          break;
        }

        uint64_t v9 = v10;
        BOOL v12 = (unint64_t)[v13 count] > v10++;
        BOOL v8 = v13;
        if (!v12) {
          goto LABEL_8;
        }
      }
      [v13 removeObjectAtIndex:v9];
    }
  }
LABEL_8:

  _objc_release_x1();
}

- (void)frequencyToolRemoveFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5
{
  if (a3)
  {
    if (a3 == 2)
    {
      +[WCM_Logging logLevel:*(void *)&a3, @"Frequency tool client(GNSS) remove freq=%llu, bw=%llu", a4, a5 message];
      id v18 = objc_alloc((Class)NSMutableArray);
      id v19 = [(WCM_SacManager *)self mGnssL1FreqList];
      id v23 = [v18 initWithArray:v19];

      id v20 = objc_alloc((Class)NSMutableArray);
      uint64_t v21 = [(WCM_SacManager *)self mGnssL5FreqList];
      id v22 = [v20 initWithArray:v21];

      [(WCM_SacManager *)self removeFreqFromArray:v23 centerFreq:a4 bandwidth:a5];
      [(WCM_SacManager *)self removeFreqFromArray:v22 centerFreq:a4 bandwidth:a5];
      [(WCM_SacManager *)self sacUpdateGnssFreqInfo:v23 L5Freq:v22];
      [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:1 action:1];
      [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:2 action:1];
    }
    else if (a3 == 1)
    {
      +[WCM_Logging logLevel:2, @"Frequency tool client(WiFi) remove freq=%llu, bw=%llu", a4, a5 message];
      BOOL v8 = [(WCM_SacManager *)self mWifiFreqList];
      [(WCM_SacManager *)self removeFreqFromArray:v8 centerFreq:a4 bandwidth:a5];

      [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:1 action:1];
      [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:2 action:1];
    }
  }
  else
  {
    +[WCM_Logging logLevel:2, @"Frequency tool client(Cellular) remove freq=%llu, bw=%llu", a4, a5 message];
    uint64_t v9 = [(WCM_SacManager *)self mCellularFreqSet];
    unsigned int v10 = [v9 objectAtIndex:0];
    unint64_t v11 = [v10 mCellularPccFreq];
    [(WCM_SacManager *)self removeFreqFromArray:v11 centerFreq:a4 bandwidth:a5];

    BOOL v12 = [(WCM_SacManager *)self mCellularFreqSet];
    uint64_t v13 = [v12 objectAtIndex:0];
    unsigned int v14 = [v13 mCellularSccFreqList];
    [(WCM_SacManager *)self removeFreqFromArray:v14 centerFreq:a4 bandwidth:a5];

    unsigned int v15 = [(WCM_SacManager *)self mCellularFreqSet];
    unint64_t v16 = [v15 objectAtIndex:0];
    BOOL v17 = [v16 mCellularSearchFreqList];
    [(WCM_SacManager *)self removeFreqFromArray:v17 centerFreq:a4 bandwidth:a5];

    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:1 action:1];
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:2 action:1];
  }
}

- (void)frequencyToolAddClientFreq:(int)a3 centerFreq:(unint64_t)a4 bandwidth:(unint64_t)a5 celluarCarrierType:(int)a6
{
  if (a3)
  {
    if (a3 == 2)
    {
      +[WCM_Logging logLevel:*(void *)&a3, @"Frequency tool client(GNSS) add freq=%llu, bw=%llu", a5, *(void *)&a6, a4, a5 message];
      id v9 = objc_alloc((Class)NSMutableArray);
      unsigned int v10 = [(WCM_SacManager *)self mGnssL1FreqList];
      id v16 = [v9 initWithArray:v10];

      id v11 = objc_alloc((Class)NSMutableArray);
      BOOL v12 = [(WCM_SacManager *)self mGnssL5FreqList];
      id v13 = [v11 initWithArray:v12];

      unsigned int v14 = [[FreqRangeInfo alloc] initWithFreq:a4 Bw:a5];
      unsigned int v15 = v16;
      if (a4 - 1567747500 < 0xEA2569 || (unsigned int v15 = v13, a4 - 1170200000 <= 0xBEBC20)) {
        [v15 addObject:v14];
      }
      [(WCM_SacManager *)self sacUpdateGnssFreqInfo:v16 L5Freq:v13];
      [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:1 action:1];
      [(WCM_SacManager *)self sacReportGnssVictimFreqListOnTargetSac:2 action:1];
    }
    else if (a3 == 1)
    {
      +[WCM_Logging logLevel:2, @"Frequency tool client(WiFi) add freq=%llu, bw=%llu", a5, *(void *)&a6, a4, a5 message];
      [(WCM_SacManager *)self sacUpdateWiFiFreqInfo:a4 Bandwidth:a5];
      [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:1 action:1];
      [(WCM_SacManager *)self sacReportWifiVictimFreqListOnTargetSac:2 action:1];
    }
  }
  else
  {
    [(WCM_SacManager *)self frequencyToolAddCellularFreq:a4 bandwidth:a5 freqType:*(void *)&a6];
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:1 action:1];
    [(WCM_SacManager *)self sacReportCellularVictimFreqListOnTargetSac:2 action:1];
  }
}

- (void)frequencyToolAddCellularFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 freqType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v17 = [[FreqRangeInfo alloc] initWithFreq:a3 Bw:a4];
  +[WCM_Logging logLevel:2, @"Frequency tool client(Cellular) add freq=%llu, bw=%llu, type=%d", a3, a4, v5 message];
  if (v5 == 3)
  {
    id v13 = [(WCM_SacManager *)self mCellularFreqSet];
    unsigned int v14 = [v13 objectAtIndex:0];
    unsigned int v15 = [v14 mCellularSearchFreqList];
  }
  else if (v5 == 2)
  {
    id v13 = [(WCM_SacManager *)self mCellularFreqSet];
    unsigned int v14 = [v13 objectAtIndex:0];
    unsigned int v15 = [v14 mCellularSccFreqList];
  }
  else
  {
    id v9 = v17;
    if (v5 != 1) {
      goto LABEL_8;
    }
    unsigned int v10 = [(WCM_SacManager *)self mCellularFreqSet];
    id v11 = [v10 objectAtIndex:0];
    BOOL v12 = [v11 mCellularPccFreq];
    [v12 removeAllObjects];

    id v13 = [(WCM_SacManager *)self mCellularFreqSet];
    unsigned int v14 = [v13 objectAtIndex:0];
    unsigned int v15 = [v14 mCellularPccFreq];
  }
  id v16 = v15;
  [v15 addObject:v17];

  id v9 = v17;
LABEL_8:
}

- (void)frequencyToolGetJasperResult:(id)a3 generalSacResult:(id)a4 client:(int)a5
{
  id v19 = a3;
  id v8 = a4;
  if (v19 && v8)
  {
    [v19 removeAllObjects];
    [v8 removeAllObjects];
    if (a5)
    {
      if (a5 == 2)
      {
        BOOL v12 = [(WCM_SacManager *)self mCacheGnssReportedReducedList];
        id v13 = v19;
      }
      else
      {
        if (a5 == 1)
        {
          id v9 = [(WCM_SacManager *)self mCacheWifiReportedReducedList];
          [v19 addObjectsFromArray:v9];

          uint64_t v10 = [(WCM_SacManager *)self mCacheWifiReportedFullList];
LABEL_11:
          id v18 = (void *)v10;
          [v8 addObjectsFromArray:v10];

          goto LABEL_12;
        }
        unsigned int v14 = [(WCM_SacManager *)self mCacheCellularReportedReducedList];
        [v19 addObjectsFromArray:v14];

        unsigned int v15 = [(WCM_SacManager *)self mCacheWifiReportedReducedList];
        [v19 addObjectsFromArray:v15];

        id v16 = [(WCM_SacManager *)self mCacheGnssReportedReducedList];
        [v19 addObjectsFromArray:v16];

        BOOL v17 = [(WCM_SacManager *)self mCacheCellularReportedFullList];
        [v8 addObjectsFromArray:v17];

        BOOL v12 = [(WCM_SacManager *)self mCacheWifiReportedFullList];
        id v13 = v8;
      }
      [v13 addObjectsFromArray:v12];

      uint64_t v10 = [(WCM_SacManager *)self mCacheGnssReportedFullList];
      goto LABEL_11;
    }
    id v11 = [(WCM_SacManager *)self mCacheCellularReportedReducedList];
    [v19 addObjectsFromArray:v11];

    uint64_t v10 = [(WCM_SacManager *)self mCacheCellularReportedFullList];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_SacManager;
  [(WCM_SacManager *)&v2 dealloc];
}

- (void)setMCellularFreqInclusionList:(id)a3
{
}

- (void)setMWifiFreqList:(id)a3
{
}

- (NSMutableArray)mGnssL1FreqList
{
  return self->_mGnssL1FreqList;
}

- (void)setMGnssL1FreqList:(id)a3
{
}

- (NSMutableArray)mGnssL5FreqList
{
  return self->_mGnssL5FreqList;
}

- (void)setMGnssL5FreqList:(id)a3
{
}

- (void)setMCellularFreqSet:(id)a3
{
}

- (void)setMCacheCellularReportedFullList:(id)a3
{
}

- (void)setMCacheCellularReportedReducedList:(id)a3
{
}

- (void)setMCacheWifiReportedFullList:(id)a3
{
}

- (void)setMCacheWifiReportedReducedList:(id)a3
{
}

- (NSMutableArray)mCacheGnssReportedFullList
{
  return self->_mCacheGnssReportedFullList;
}

- (void)setMCacheGnssReportedFullList:(id)a3
{
}

- (NSMutableArray)mCacheGnssReportedReducedList
{
  return self->_mCacheGnssReportedReducedList;
}

- (void)setMCacheGnssReportedReducedList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mCacheGnssReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheGnssReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCacheWifiReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheWifiReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCacheCellularReportedReducedList, 0);
  objc_storeStrong((id *)&self->_mCacheCellularReportedFullList, 0);
  objc_storeStrong((id *)&self->_mCellularFreqSet, 0);
  objc_storeStrong((id *)&self->_mGnssL5FreqList, 0);
  objc_storeStrong((id *)&self->_mGnssL1FreqList, 0);
  objc_storeStrong((id *)&self->_mWifiFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularFreqInclusionList, 0);

  objc_storeStrong((id *)&self->mQueue, 0);
}

@end