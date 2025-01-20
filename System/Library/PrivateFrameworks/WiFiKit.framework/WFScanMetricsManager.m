@interface WFScanMetricsManager
- (BOOL)submited;
- (NSDate)timestamp;
- (NSMutableDictionary)sectionCounts;
- (WFScanMetricsManager)init;
- (id)sectionNameForRecord:(id)a3;
- (void)ingestScanResults:(id)a3;
- (void)reset;
- (void)setSectionCounts:(id)a3;
- (void)setSubmited:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)submit;
@end

@implementation WFScanMetricsManager

- (WFScanMetricsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFScanMetricsManager;
  v2 = [(WFScanMetricsManager *)&v6 init];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  sectionCounts = v2->_sectionCounts;
  v2->_sectionCounts = (NSMutableDictionary *)v3;

  [(WFScanMetricsManager *)v2 reset];
  return v2;
}

- (void)reset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    int v14 = 136315138;
    v15 = "-[WFScanMetricsManager reset]";
    _os_log_impl(&dword_226071000, v3, v4, "%s", (uint8_t *)&v14, 0xCu);
  }

  [(WFScanMetricsManager *)self setSubmited:0];
  v5 = [(WFScanMetricsManager *)self sectionCounts];
  [v5 removeAllObjects];

  objc_super v6 = [(WFScanMetricsManager *)self sectionCounts];
  [v6 setObject:&unk_26D9E1FF0 forKey:@"known"];

  v7 = [(WFScanMetricsManager *)self sectionCounts];
  [v7 setObject:&unk_26D9E1FF0 forKey:@"hotspot"];

  v8 = [(WFScanMetricsManager *)self sectionCounts];
  [v8 setObject:&unk_26D9E1FF0 forKey:@"public"];

  v9 = [(WFScanMetricsManager *)self sectionCounts];
  [v9 setObject:&unk_26D9E1FF0 forKey:@"infra"];

  v10 = [(WFScanMetricsManager *)self sectionCounts];
  [v10 setObject:&unk_26D9E1FF0 forKey:@"adhoc"];

  v11 = [(WFScanMetricsManager *)self sectionCounts];
  [v11 setObject:&unk_26D9E1FF0 forKey:@"accessory"];

  v12 = [MEMORY[0x263EFF910] date];
  timestamp = self->_timestamp;
  self->_timestamp = v12;
}

- (void)submit
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (![(WFScanMetricsManager *)self submited])
  {
    uint64_t v3 = [(WFScanMetricsManager *)self timestamp];
    [v3 timeIntervalSinceNow];
    double v5 = v4;

    objc_super v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        v9 = [(WFScanMetricsManager *)self timestamp];
        [v9 timeIntervalSinceNow];
        int v19 = 134217984;
        double v20 = -v10;
        _os_log_impl(&dword_226071000, v8, v7, "scan metrics session duration %f", (uint8_t *)&v19, 0xCu);
      }
    }
    double v11 = -v5;

    v12 = WFLogForCategory(0);
    os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v12)
    {
      int v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        double v15 = [(WFScanMetricsManager *)self sectionCounts];
        int v19 = 138412290;
        double v20 = v15;
        _os_log_impl(&dword_226071000, v14, v13, "scan metrics section counts %@", (uint8_t *)&v19, 0xCu);
      }
    }

    uint64_t v16 = +[WFMetricsManager sharedManager];
    v17 = [(WFScanMetricsManager *)self sectionCounts];
    v18 = +[WFScanSessionEvent scanSessionEventWithSectionCounts:v17 duration:v11];
    [v16 processEvent:v18];

    [(WFScanMetricsManager *)self setSubmited:1];
  }
}

- (void)ingestScanResults:(id)a3
{
  id v46 = a3;
  double v4 = [v46 knownNetworks];
  unint64_t v5 = [v4 count];

  objc_super v6 = [(WFScanMetricsManager *)self sectionCounts];
  os_log_type_t v7 = [v6 objectForKeyedSubscript:@"known"];
  unint64_t v8 = [v7 unsignedIntegerValue];

  if (v5 > v8)
  {
    v9 = [NSNumber numberWithUnsignedInteger:v5];
    double v10 = [(WFScanMetricsManager *)self sectionCounts];
    [v10 setObject:v9 forKeyedSubscript:@"known"];
  }
  double v11 = [v46 infrastructureNetworks];
  unint64_t v12 = [v11 count];

  os_log_type_t v13 = [(WFScanMetricsManager *)self sectionCounts];
  int v14 = [v13 objectForKeyedSubscript:@"infra"];
  unint64_t v15 = [v14 unsignedIntegerValue];

  if (v12 > v15)
  {
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v12];
    v17 = [(WFScanMetricsManager *)self sectionCounts];
    [v17 setObject:v16 forKeyedSubscript:@"infra"];
  }
  v18 = [v46 instantHotspotNetworks];
  unint64_t v19 = [v18 count];

  double v20 = [(WFScanMetricsManager *)self sectionCounts];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"hotspot"];
  unint64_t v22 = [v21 unsignedIntegerValue];

  if (v19 > v22)
  {
    v23 = [NSNumber numberWithUnsignedInteger:v19];
    v24 = [(WFScanMetricsManager *)self sectionCounts];
    [v24 setObject:v23 forKeyedSubscript:@"hotspot"];
  }
  v25 = [v46 popularNetworks];
  unint64_t v26 = [v25 count];

  v27 = [(WFScanMetricsManager *)self sectionCounts];
  v28 = [v27 objectForKeyedSubscript:@"public"];
  unint64_t v29 = [v28 unsignedIntegerValue];

  if (v26 > v29)
  {
    v30 = [NSNumber numberWithUnsignedInteger:v26];
    v31 = [(WFScanMetricsManager *)self sectionCounts];
    [v31 setObject:v30 forKeyedSubscript:@"public"];
  }
  v32 = [v46 adhocNetworks];
  unint64_t v33 = [v32 count];

  v34 = [(WFScanMetricsManager *)self sectionCounts];
  v35 = [v34 objectForKeyedSubscript:@"adhoc"];
  unint64_t v36 = [v35 unsignedIntegerValue];

  if (v33 > v36)
  {
    v37 = [NSNumber numberWithUnsignedInteger:v33];
    v38 = [(WFScanMetricsManager *)self sectionCounts];
    [v38 setObject:v37 forKeyedSubscript:@"adhoc"];
  }
  v39 = [v46 unconfiguredNetworks];
  unint64_t v40 = [v39 count];

  v41 = [(WFScanMetricsManager *)self sectionCounts];
  v42 = [v41 objectForKeyedSubscript:@"accessory"];
  unint64_t v43 = [v42 unsignedIntegerValue];

  if (v40 > v43)
  {
    v44 = [NSNumber numberWithUnsignedInteger:v40];
    v45 = [(WFScanMetricsManager *)self sectionCounts];
    [v45 setObject:v44 forKeyedSubscript:@"accessory"];
  }
}

- (id)sectionNameForRecord:(id)a3
{
  id v3 = a3;
  if ([v3 isKnown])
  {
    double v4 = @"known";
  }
  else if ([v3 isInstantHotspot])
  {
    double v4 = @"hotspot";
  }
  else if ([v3 isPopular])
  {
    double v4 = @"public";
  }
  else if ([v3 isAdhoc])
  {
    double v4 = @"adhoc";
  }
  else if ([v3 isUnconfiguredAccessory])
  {
    double v4 = @"accessory";
  }
  else
  {
    double v4 = @"infra";
  }

  return v4;
}

- (NSMutableDictionary)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)submited
{
  return self->_submited;
}

- (void)setSubmited:(BOOL)a3
{
  self->_submited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sectionCounts, 0);
}

@end