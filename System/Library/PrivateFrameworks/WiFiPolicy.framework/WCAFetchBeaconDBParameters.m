@interface WCAFetchBeaconDBParameters
- (BOOL)QBSS_Load;
- (BOOL)UAPSD;
- (BOOL)has_11krm;
- (NSString)antennas11n;
- (NSString)wlanAsel;
- (NSString)wlanFixedCapabilities;
- (NSString)wlanHTAmpduparam;
- (NSString)wlanHTCapabilities;
- (NSString)wlanHtexCapabilities;
- (NSString)wlanTxbf;
- (NSString)wlanVhtCapabilities;
- (NSString)wlanWfaIeWmeQosInfo;
- (float)antennas11c;
- (float)max_rates;
- (float)wlanTimDtimPeriod;
- (int64_t)beaconInterval;
- (void)fetchWithCompletion:(id)a3;
- (void)setAntennas11c:(float)a3;
- (void)setAntennas11n:(id)a3;
- (void)setBeaconInterval:(int64_t)a3;
- (void)setHas_11krm:(BOOL)a3;
- (void)setMax_rates:(float)a3;
- (void)setQBSS_Load:(BOOL)a3;
- (void)setUAPSD:(BOOL)a3;
- (void)setWlanAsel:(id)a3;
- (void)setWlanFixedCapabilities:(id)a3;
- (void)setWlanHTAmpduparam:(id)a3;
- (void)setWlanHTCapabilities:(id)a3;
- (void)setWlanHtexCapabilities:(id)a3;
- (void)setWlanTimDtimPeriod:(float)a3;
- (void)setWlanTxbf:(id)a3;
- (void)setWlanVhtCapabilities:(id)a3;
- (void)setWlanWfaIeWmeQosInfo:(id)a3;
@end

@implementation WCAFetchBeaconDBParameters

- (void)fetchWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WCAFetchSQLiteRequest);
  [(WCAFetchSQLiteRequest *)v5 setTableName:@"prof_clean"];
  [(WCAFetchSQLiteRequest *)v5 setColumnNames:&unk_1F2B95560];
  [(WCAFetchSQLiteRequest *)v5 setLimit:1];
  v6 = objc_opt_new();
  [(WCAFetchBeaconDBParameters *)self wlanTimDtimPeriod];
  if (v7 != 0.0)
  {
    v8 = NSNumber;
    [(WCAFetchBeaconDBParameters *)self wlanTimDtimPeriod];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v6 setValue:v9 forKey:@"wlan-tim-dtim_period"];
  }
  v10 = [(WCAFetchBeaconDBParameters *)self wlanHTCapabilities];

  if (v10)
  {
    v11 = [(WCAFetchBeaconDBParameters *)self wlanHTCapabilities];
    [v6 setValue:v11 forKey:@"wlan-ht-capabilities"];
  }
  v12 = [(WCAFetchBeaconDBParameters *)self wlanWfaIeWmeQosInfo];

  if (v12)
  {
    v13 = [(WCAFetchBeaconDBParameters *)self wlanWfaIeWmeQosInfo];
    [v6 setValue:v13 forKey:@"wlan-wfa-ie-wme-qos_info"];
  }
  v14 = [(WCAFetchBeaconDBParameters *)self wlanHtexCapabilities];

  if (v14)
  {
    v15 = [(WCAFetchBeaconDBParameters *)self wlanHtexCapabilities];
    [v6 setValue:v15 forKey:@"wlan-htex-capabilities"];
  }
  v16 = [(WCAFetchBeaconDBParameters *)self wlanHTAmpduparam];

  if (v16)
  {
    v17 = [(WCAFetchBeaconDBParameters *)self wlanHTAmpduparam];
    [v6 setValue:v17 forKey:@"wlan-ht-ampduparam"];
  }
  v18 = [(WCAFetchBeaconDBParameters *)self wlanVhtCapabilities];

  if (v18)
  {
    v19 = [(WCAFetchBeaconDBParameters *)self wlanVhtCapabilities];
    [v6 setValue:v19 forKey:@"wlan-vht-capabilities"];
  }
  v20 = [(WCAFetchBeaconDBParameters *)self wlanTxbf];

  if (v20)
  {
    v21 = [(WCAFetchBeaconDBParameters *)self wlanTxbf];
    [v6 setValue:v21 forKey:@"wlan-txbf"];
  }
  v22 = [(WCAFetchBeaconDBParameters *)self wlanAsel];

  if (v22)
  {
    v23 = [(WCAFetchBeaconDBParameters *)self wlanAsel];
    [v6 setValue:v23 forKey:@"wlan-asel"];
  }
  v24 = [(WCAFetchBeaconDBParameters *)self wlanFixedCapabilities];

  if (v24)
  {
    v25 = [(WCAFetchBeaconDBParameters *)self wlanFixedCapabilities];
    [v6 setValue:v25 forKey:@"wlan-fixed-capabilities"];
  }
  if ([(WCAFetchBeaconDBParameters *)self beaconInterval])
  {
    v26 = objc_msgSend(NSNumber, "numberWithLong:", -[WCAFetchBeaconDBParameters beaconInterval](self, "beaconInterval"));
    [v6 setValue:v26 forKey:@"beacon_interval"];
  }
  if ([(WCAFetchBeaconDBParameters *)self QBSS_Load])
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", -[WCAFetchBeaconDBParameters QBSS_Load](self, "QBSS_Load"));
    [v6 setValue:v27 forKey:@"QBSS_Load"];
  }
  if ([(WCAFetchBeaconDBParameters *)self has_11krm])
  {
    v28 = objc_msgSend(NSNumber, "numberWithBool:", -[WCAFetchBeaconDBParameters has_11krm](self, "has_11krm"));
    [v6 setValue:v28 forKey:@"has_11krm"];
  }
  if ([(WCAFetchBeaconDBParameters *)self UAPSD])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[WCAFetchBeaconDBParameters UAPSD](self, "UAPSD"));
    [v6 setValue:v29 forKey:@"U-APSD"];
  }
  [(WCAFetchBeaconDBParameters *)self antennas11c];
  if (v30 != 0.0)
  {
    v31 = NSNumber;
    [(WCAFetchBeaconDBParameters *)self antennas11c];
    v32 = objc_msgSend(v31, "numberWithFloat:");
    [v6 setValue:v32 forKey:@"11c_antennas"];
  }
  v33 = [(WCAFetchBeaconDBParameters *)self antennas11n];

  if (v33)
  {
    v34 = [(WCAFetchBeaconDBParameters *)self antennas11n];
    [v6 setValue:v34 forKey:@"11n_antennas"];
  }
  [(WCAFetchBeaconDBParameters *)self max_rates];
  if (v35 != 0.0)
  {
    v36 = NSNumber;
    [(WCAFetchBeaconDBParameters *)self max_rates];
    v37 = objc_msgSend(v36, "numberWithFloat:");
    [v6 setValue:v37 forKey:@"max_rates"];
  }
  [(WCAFetchSQLiteRequest *)v5 setParameters:v6];
  v38 = +[WCAAsset beaconsDataAsset];
  [(WCAFetchRequest *)v5 setAsset:v38];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke;
  v41[3] = &unk_1E69BE318;
  id v42 = v4;
  id v39 = v4;
  [(WCAFetchRequest *)v5 setCompletionHandler:v41];
  v40 = +[WCAClient sharedClient];
  [v40 executeFetchRequest:v5];
}

void __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 records];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [v12 records];
    v6 = [v5 firstObject];

    float v7 = [v6 valueForKey:@"index"];
    uint64_t v8 = (int)[v7 intValue];
  }
  else
  {
    uint64_t v8 = -1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    NSLog(&cfstr_ErrorResponseI.isa, v10);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v8);
  }
}

- (float)wlanTimDtimPeriod
{
  return self->_wlanTimDtimPeriod;
}

- (void)setWlanTimDtimPeriod:(float)a3
{
  self->_wlanTimDtimPeriod = a3;
}

- (NSString)wlanHTCapabilities
{
  return self->_wlanHTCapabilities;
}

- (void)setWlanHTCapabilities:(id)a3
{
}

- (NSString)wlanWfaIeWmeQosInfo
{
  return self->_wlanWfaIeWmeQosInfo;
}

- (void)setWlanWfaIeWmeQosInfo:(id)a3
{
}

- (NSString)wlanHtexCapabilities
{
  return self->_wlanHtexCapabilities;
}

- (void)setWlanHtexCapabilities:(id)a3
{
}

- (NSString)wlanHTAmpduparam
{
  return self->_wlanHTAmpduparam;
}

- (void)setWlanHTAmpduparam:(id)a3
{
}

- (NSString)wlanVhtCapabilities
{
  return self->_wlanVhtCapabilities;
}

- (void)setWlanVhtCapabilities:(id)a3
{
}

- (NSString)wlanTxbf
{
  return self->_wlanTxbf;
}

- (void)setWlanTxbf:(id)a3
{
}

- (NSString)wlanAsel
{
  return self->_wlanAsel;
}

- (void)setWlanAsel:(id)a3
{
}

- (NSString)wlanFixedCapabilities
{
  return self->_wlanFixedCapabilities;
}

- (void)setWlanFixedCapabilities:(id)a3
{
}

- (int64_t)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(int64_t)a3
{
  self->_beaconInterval = a3;
}

- (BOOL)QBSS_Load
{
  return self->_QBSS_Load;
}

- (void)setQBSS_Load:(BOOL)a3
{
  self->_QBSS_Load = a3;
}

- (BOOL)has_11krm
{
  return self->_has_11krm;
}

- (void)setHas_11krm:(BOOL)a3
{
  self->_has_11krm = a3;
}

- (BOOL)UAPSD
{
  return self->_UAPSD;
}

- (void)setUAPSD:(BOOL)a3
{
  self->_UAPSD = a3;
}

- (float)antennas11c
{
  return self->_antennas11c;
}

- (void)setAntennas11c:(float)a3
{
  self->_antennas11c = a3;
}

- (NSString)antennas11n
{
  return self->_antennas11n;
}

- (void)setAntennas11n:(id)a3
{
}

- (float)max_rates
{
  return self->_max_rates;
}

- (void)setMax_rates:(float)a3
{
  self->_max_rates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_antennas11n, 0);
  objc_storeStrong((id *)&self->_wlanFixedCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanAsel, 0);
  objc_storeStrong((id *)&self->_wlanTxbf, 0);
  objc_storeStrong((id *)&self->_wlanVhtCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanHTAmpduparam, 0);
  objc_storeStrong((id *)&self->_wlanHtexCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanWfaIeWmeQosInfo, 0);

  objc_storeStrong((id *)&self->_wlanHTCapabilities, 0);
}

@end