@interface WCM_CellularRc1CoexIssueTable
- (BOOL)isCellularInRc1CoexBand:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1ChannelBitmask:(unsigned int)a8;
- (id)createDynamicRc1NbCoexPolicyByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8;
- (id)findAllCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8;
- (id)findCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8;
- (id)initFromPlist:(id)a3;
- (id)initFromPlistV2:(id)a3;
- (unsigned)getTableSize;
- (void)findRc1NbCoexIssueChannelByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8 uwbNbIssueChannelBegin:(int *)a9 uwbNbIssueChannelEnd:(int *)a10;
@end

@implementation WCM_CellularRc1CoexIssueTable

- (BOOL)isCellularInRc1CoexBand:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1ChannelBitmask:(unsigned int)a8
{
  uint64_t v13 = *(void *)&a3;
  unsigned int v15 = 0;
  BOOL v16 = 1;
  int v17 = 1;
  while ((v17 & a8) == 0)
  {
LABEL_6:
    int v17 = 2 << v15;
    BOOL v16 = v15++ < 9;
    if (v15 == 10) {
      return 0;
    }
  }
  v18 = -[WCM_CellularRc1CoexIssueTable findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", v13, a4, a5, a6, a7);
  v19 = v18;
  if (!v18
    || ([v18 uwbCoexIssueFreqRangeForCellDlLowFreq:0 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 uwbIssueFreqRange:a7] & 1) == 0)
  {

    goto LABEL_6;
  }

  return v16;
}

- (id)initFromPlist:(id)a3
{
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)WCM_CellularRc1CoexIssueTable;
  v5 = [(WCM_CellularRc1CoexIssueTable *)&v74 init];
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRc1CoexIssueTable = v5->mCellularRc1CoexIssueTable;
  p_isa = (id *)&v5->super.isa;
  v5->mCellularRc1CoexIssueTable = v6;

  v70 = v4;
  v69 = sub_100095D24((uint64_t)v4, @"plist");
  v8 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:");
  id v68 = 0;
  if (v8)
  {
    +[WCM_Logging logLevel:3 message:@"init Cellular-RC1 Coex Plist File Found"];
    if ([v8 count])
    {
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      p_vtable = &OBJC_METACLASS___WCM_AriCoexCache.vtable;
      CFStringRef v12 = @"issueBand";
      do
      {
        id v13 = objc_alloc_init((Class)(p_vtable + 222));
        v14 = [v8 objectAtIndex:v9];
        unsigned int v15 = [v14 objectForKey:v12];

        +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: issueBand = %@", v15 message];
        if ([v13 setIssueFrequencyRangeByIssueBand:v15])
        {
          v73 = v15;
          CFStringRef v16 = v12;
          int v17 = [v8 objectAtIndex:v9];
          v18 = [v17 objectForKey:@"issueType"];
          [v13 setIssueType:[v18 intValue]];

          v19 = [v8 objectAtIndex:v9];
          v20 = [v19 objectForKey:@"RC1Channel"];

          v21 = [off_10027CAE0 objectForKeyedSubscript:v20];

          if (v21)
          {
            v72 = v20;
            v22 = [off_10027CAE0 objectForKeyedSubscript:v20];
            [v13 setRc1IssueChannel:[v22 intValue]];

            v23 = [v8 objectAtIndex:v9];
            v24 = [v23 objectForKey:@"cellAntenna1"];
            id v25 = [v24 intValue];

            v26 = [v8 objectAtIndex:v9];
            v27 = [v26 objectForKey:@"cellTxPowerLimit1"];

            v28 = [v8 objectAtIndex:v9];
            v29 = [v28 objectForKey:@"cellTxPowerLimit1"];
            [v29 doubleValue];
            double v31 = v30;

            if (v25)
            {
              if ([v27 containsString:@"NA"])
              {
                v32 = [v13 CellAntBlockingList];
                v33 = +[NSNumber numberWithInt:v25];
                [v32 addObject:v33];

                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Block antenna %u", v25, v67, v68 message];
              }
              else
              {
                v34 = [v13 cellTxPowerLimit];
                v35 = +[NSNumber numberWithDouble:v31];
                v36 = +[NSNumber numberWithInt:v25];
                [v34 setObject:v35 forKey:v36];

                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm", v25, v27, v68 message];
              }
            }
            v37 = [v8 objectAtIndex:v9];
            v38 = [v37 objectForKey:@"cellAntenna2"];
            id v39 = [v38 intValue];

            v40 = [v8 objectAtIndex:v9];
            v41 = [v40 objectForKey:@"cellTxPowerLimit2"];

            v42 = [v8 objectAtIndex:v9];
            v43 = [v42 objectForKey:@"cellTxPowerLimit2"];
            [v43 doubleValue];
            double v45 = v44;

            if (v39)
            {
              if ([v41 containsString:@"NA"])
              {
                v46 = [v13 CellAntBlockingList];
                v47 = +[NSNumber numberWithInt:v39];
                [v46 addObject:v47];

                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Block antenna %u", v39 message];
              }
              else
              {
                v48 = [v13 cellTxPowerLimit];
                v49 = +[NSNumber numberWithDouble:v45];
                v50 = +[NSNumber numberWithInt:v39];
                [v48 setObject:v49 forKey:v50];

                v67 = v41;
                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm", v39 message];
              }
            }
            v51 = [v8 objectAtIndex:v9];
            v52 = [v51 objectForKey:@"cellAntenna3"];
            id v53 = [v52 intValue];

            v54 = [v8 objectAtIndex:v9];
            v55 = [v54 objectForKey:@"cellTxPowerLimit3"];

            v56 = [v8 objectAtIndex:v9];
            v57 = [v56 objectForKey:@"cellTxPowerLimit3"];
            [v57 doubleValue];
            double v59 = v58;

            CFStringRef v16 = @"issueBand";
            if (v53)
            {
              if ([v55 containsString:@"NA"])
              {
                v60 = [v13 CellAntBlockingList];
                v61 = +[NSNumber numberWithInt:v53];
                [v60 addObject:v61];

                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Block antenna %u", v53 message];
              }
              else
              {
                v62 = [v13 cellTxPowerLimit];
                v63 = +[NSNumber numberWithDouble:v59];
                v64 = +[NSNumber numberWithInt:v53];
                [v62 setObject:v63 forKey:v64];

                v67 = v55;
                +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: Power cap antenna %u to %@dBm", v53 message];
              }
            }
            [p_isa[1] addObject:v13];

            p_vtable = (void **)(&OBJC_METACLASS___WCM_AriCoexCache + 24);
            v20 = v72;
          }
          else
          {
            +[WCM_Logging logLevel:0, @"RC1 channel type %@ is not defined", v20 message];
          }

          CFStringRef v12 = v16;
          unsigned int v15 = v73;
        }
        else
        {
          +[WCM_Logging logLevel:0, @"issue band %@ is not defined", v15 message];
        }

        uint64_t v9 = v10;
      }
      while ((unint64_t)[v8 count] > v10++);
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"init: No Plist File Found for Cellular-RC1 Coex"];
  }

  return p_isa;
}

- (id)initFromPlistV2:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)WCM_CellularRc1CoexIssueTable;
  v5 = [(WCM_CellularRc1CoexIssueTable *)&v47 init];
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRc1CoexIssueTable = v5->mCellularRc1CoexIssueTable;
  v5->mCellularRc1CoexIssueTable = v6;

  v46 = v4;
  double v45 = sub_100095D24((uint64_t)v4, @"plist");
  v8 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:");
  id v44 = 0;
  if (v8) {
    CFStringRef v9 = @"init: Antenna blocking policy Plist File Found";
  }
  else {
    CFStringRef v9 = @"init: No antenna blocking policy Plist File Found";
  }
  +[WCM_Logging logLevel:3 message:v9];
  v43 = v8;
  v42 = [v8 objectForKey:@"NB_MMS_Client"];
  unsigned int v10 = [v42 objectForKey:@"Policy"];
  if ([v10 count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      id v13 = objc_alloc_init(WCM_CellularRc1CoexIssue);
      v14 = [v10 objectAtIndex:v11];
      unsigned int v15 = [v14 objectForKey:@"Cellular_Band"];
      -[WCM_CellularRc1CoexIssue setCellBand:](v13, "setCellBand:", [v15 intValue]);

      CFStringRef v16 = [v14 objectForKey:@"Coex_Tech"];
      -[WCM_CellularRc1CoexIssue setBandInfoType:](v13, "setBandInfoType:", [v16 intValue]);

      int v17 = [v14 objectForKey:@"Issue_Type"];
      -[WCM_CellularRc1CoexIssue setIssueType:](v13, "setIssueType:", [v17 intValue]);

      v18 = [v14 objectForKey:@"Cellular_Center_Frequency_KHz"];
      [v18 doubleValue];
      double v20 = v19;

      v21 = [v14 objectForKey:@"Cellular_Bandwidth_KHz"];
      [v21 doubleValue];
      double v23 = v22;

      +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: issueBand = %u, Coex_Tech=%u", [(WCM_CellularRc1CoexIssue *)v13 cellBand], [(WCM_CellularRc1CoexIssue *)v13 bandInfoType] message];
      v24 = [v14 objectForKey:@"NB_Antenna_Bitmap"];
      -[WCM_CellularRc1CoexIssue setRc1AntBitmap:](v13, "setRc1AntBitmap:", [v24 intValue]);

      [(WCM_CellularRc1CoexIssue *)v13 setDownlinkLowFreq_Hz:0.0];
      [(WCM_CellularRc1CoexIssue *)v13 setDownlinkHighFreq_Hz:0.0];
      double v25 = v23 * 0.5;
      [(WCM_CellularRc1CoexIssue *)v13 setUplinkLowFreq_Hz:(v20 - v25) * 1000.0];
      [(WCM_CellularRc1CoexIssue *)v13 setUplinkHighFreq_Hz:(v20 + v25) * 1000.0];
      [(WCM_CellularRc1CoexIssue *)v13 uplinkLowFreq_Hz];
      uint64_t v27 = v26;
      [(WCM_CellularRc1CoexIssue *)v13 uplinkHighFreq_Hz];
      +[WCM_Logging logLevel:3, @"Cellular-RC1 Coex Plist: uplinkLowFreq_Hz = %f, uplinkHighFreq_Hz=%f", v27, v28 message];
      v29 = [v14 objectForKey:@"NB_Priority_Bitmap"];
      -[WCM_CellularRc1CoexIssue setRc1PriorityBitmap:](v13, "setRc1PriorityBitmap:", [v29 intValue]);

      double v30 = [v14 objectForKey:@"NB_Channel_Band"];
      double v31 = [off_10027CAE0 objectForKeyedSubscript:v30];

      if (v31)
      {
        v32 = [off_10027CAE0 objectForKeyedSubscript:v30];
        -[WCM_CellularRc1CoexIssue setRc1IssueChannel:](v13, "setRc1IssueChannel:", [v32 intValue]);

        v33 = [v14 objectForKey:@"NB_Channel_Start"];
        -[WCM_CellularRc1CoexIssue setNbChannelToAvoidStart:](v13, "setNbChannelToAvoidStart:", [v33 intValue]);

        v34 = [v14 objectForKey:@"NB_Channel_End"];
        -[WCM_CellularRc1CoexIssue setNbChannelToAvoidEnd:](v13, "setNbChannelToAvoidEnd:", [v34 intValue]);

        v35 = [v14 objectForKey:@"Cellular_Ant_Bitmap"];
        -[WCM_CellularRc1CoexIssue setCellAgressorAntBitmap:](v13, "setCellAgressorAntBitmap:", [v35 intValue]);

        v36 = [v14 objectForKey:@"Cellular_TX_Power_Cap"];
        [v36 doubleValue];
        LODWORD(v38) = vcvtd_n_s64_f64(v37, 4uLL);
        [(WCM_CellularRc1CoexIssue *)v13 setCellTxPowerCap_16th_dBm:v38];

        id v39 = [v14 objectForKey:@"Mitigation_Type"];
        -[WCM_CellularRc1CoexIssue setMitigationType:](v13, "setMitigationType:", [v39 intValue]);

        [(NSMutableArray *)v5->mCellularRc1CoexIssueTable addObject:v13];
      }
      else
      {
        +[WCM_Logging logLevel:0, @"RC1 channel type %@ is not defined", v30 message];
      }

      uint64_t v11 = v12;
    }
    while ((unint64_t)[v10 count] > v12++);
  }

  return v5;
}

- (unsigned)getTableSize
{
  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable) {
    LODWORD(mCellularRc1CoexIssueTable) = [(NSMutableArray *)mCellularRc1CoexIssueTable count];
  }
  return mCellularRc1CoexIssueTable;
}

- (id)findCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable && [(NSMutableArray *)mCellularRc1CoexIssueTable count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = self->mCellularRc1CoexIssueTable;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v18, "bandInfoType", (void)v23) & a3) != 0)
          {
            [v18 uplinkLowFreq_Hz];
            if (v19 <= a6)
            {
              [v18 uplinkHighFreq_Hz];
              if (v20 > a6 && ([v18 Rc1IssueChannel] & a8) != 0)
              {
                id v21 = v18;
                goto LABEL_17;
              }
            }
          }
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    id v21 = 0;
LABEL_17:
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)findAllCellRc1CoexIssueByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  mCellularRc1CoexIssueTable = self->mCellularRc1CoexIssueTable;
  if (mCellularRc1CoexIssueTable && [(NSMutableArray *)mCellularRc1CoexIssueTable count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = self->mCellularRc1CoexIssueTable;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = 0;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v13);
          }
          double v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v19, "bandInfoType", (void)v23) & a3) != 0)
          {
            [v19 uplinkLowFreq_Hz];
            if (v20 <= a6)
            {
              [v19 uplinkHighFreq_Hz];
              if (v21 > a6 && ([v19 Rc1IssueChannel] & a8) != 0)
              {
                if (!v16) {
                  id v16 = objc_alloc_init((Class)NSMutableArray);
                }
                [v16 addObject:v19];
              }
            }
          }
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)findRc1NbCoexIssueChannelByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8 uwbNbIssueChannelBegin:(int *)a9 uwbNbIssueChannelEnd:(int *)a10
{
  if (a9 && a10)
  {
    *a9 = -1;
    *a10 = -1;
    id v16 = -[WCM_CellularRc1CoexIssueTable findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *(void *)&a3, *(void *)&a8);
    if (v16)
    {
      id v17 = v16;
      [v16 uwbNbCoexIssueChannelForCellDlLowFreq:a9 cellDlHighFreq:a10 cellUlLowFreq:a4 cellUlHighFreq:a5 uwbNbIssueChannelBegin:a6 uwbNbIssueChannelEnd:a7];
      id v16 = v17;
    }
  }
}

- (id)createDynamicRc1NbCoexPolicyByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7 RC1Channel:(int)a8
{
  unsigned int v12 = -[WCM_CellularRc1CoexIssueTable findAllCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:](self, "findAllCellRc1CoexIssueByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *(void *)&a3, *(void *)&a8);
  id v13 = v12;
  if (v12
    && (long long v23 = 0u,
        long long v24 = 0u,
        long long v21 = 0u,
        long long v22 = 0u,
        (id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16]) != 0))
  {
    id v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v13);
        }
        double v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) uwbNbDynamicCoexPolicyForCellDlLowFreq:a4 cellDlHighFreq:a5 cellUlLowFreq:a6 cellUlHighFreq:a7];
        if (v19)
        {
          if (!v16) {
            id v16 = objc_alloc_init((Class)NSMutableArray);
          }
          [v16 addObject:v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end