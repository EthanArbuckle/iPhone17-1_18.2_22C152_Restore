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
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = objc_alloc_init((Class)WCAFetchSQLiteRequest);
  [v40 setTableName:@"prof_clean"];
  [v40 setColumnNames:&off_1000128A8];
  [v40 setLimit:1];
  id v39 = (id)objc_opt_new();
  [(WCAFetchBeaconDBParameters *)v42 wlanTimDtimPeriod];
  if (v3 != 0.0)
  {
    [(WCAFetchBeaconDBParameters *)v42 wlanTimDtimPeriod];
    v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    objc_msgSend(v39, "setValue:forKey:");
  }
  v31 = [(WCAFetchBeaconDBParameters *)v42 wlanHTCapabilities];

  if (v31)
  {
    v30 = [(WCAFetchBeaconDBParameters *)v42 wlanHTCapabilities];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v29 = [(WCAFetchBeaconDBParameters *)v42 wlanWfaIeWmeQosInfo];

  if (v29)
  {
    v28 = [(WCAFetchBeaconDBParameters *)v42 wlanWfaIeWmeQosInfo];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v27 = [(WCAFetchBeaconDBParameters *)v42 wlanHtexCapabilities];

  if (v27)
  {
    v26 = [(WCAFetchBeaconDBParameters *)v42 wlanHtexCapabilities];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v25 = [(WCAFetchBeaconDBParameters *)v42 wlanHTAmpduparam];

  if (v25)
  {
    v24 = [(WCAFetchBeaconDBParameters *)v42 wlanHTAmpduparam];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v23 = [(WCAFetchBeaconDBParameters *)v42 wlanVhtCapabilities];

  if (v23)
  {
    v22 = [(WCAFetchBeaconDBParameters *)v42 wlanVhtCapabilities];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v21 = [(WCAFetchBeaconDBParameters *)v42 wlanTxbf];

  if (v21)
  {
    v20 = [(WCAFetchBeaconDBParameters *)v42 wlanTxbf];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v19 = [(WCAFetchBeaconDBParameters *)v42 wlanAsel];

  if (v19)
  {
    v18 = [(WCAFetchBeaconDBParameters *)v42 wlanAsel];
    objc_msgSend(v39, "setValue:forKey:");
  }
  v17 = [(WCAFetchBeaconDBParameters *)v42 wlanFixedCapabilities];

  if (v17)
  {
    v16 = [(WCAFetchBeaconDBParameters *)v42 wlanFixedCapabilities];
    objc_msgSend(v39, "setValue:forKey:");
  }
  if ([(WCAFetchBeaconDBParameters *)v42 beaconInterval])
  {
    v15 = +[NSNumber numberWithLong:[(WCAFetchBeaconDBParameters *)v42 beaconInterval]];
    objc_msgSend(v39, "setValue:forKey:");
  }
  if ([(WCAFetchBeaconDBParameters *)v42 QBSS_Load])
  {
    v14 = +[NSNumber numberWithBool:[(WCAFetchBeaconDBParameters *)v42 QBSS_Load]];
    objc_msgSend(v39, "setValue:forKey:");
  }
  if ([(WCAFetchBeaconDBParameters *)v42 has_11krm])
  {
    v13 = +[NSNumber numberWithBool:[(WCAFetchBeaconDBParameters *)v42 has_11krm]];
    objc_msgSend(v39, "setValue:forKey:");
  }
  if ([(WCAFetchBeaconDBParameters *)v42 UAPSD])
  {
    v12 = +[NSNumber numberWithBool:[(WCAFetchBeaconDBParameters *)v42 UAPSD]];
    objc_msgSend(v39, "setValue:forKey:");
  }
  [(WCAFetchBeaconDBParameters *)v42 antennas11c];
  if (v4 != 0.0)
  {
    [(WCAFetchBeaconDBParameters *)v42 antennas11c];
    v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    objc_msgSend(v39, "setValue:forKey:");
  }
  v10 = [(WCAFetchBeaconDBParameters *)v42 antennas11n];

  if (v10)
  {
    v9 = [(WCAFetchBeaconDBParameters *)v42 antennas11n];
    objc_msgSend(v39, "setValue:forKey:");
  }
  [(WCAFetchBeaconDBParameters *)v42 max_rates];
  if (v5 != 0.0)
  {
    [(WCAFetchBeaconDBParameters *)v42 max_rates];
    v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    objc_msgSend(v39, "setValue:forKey:");
  }
  [v40 setParameters:v39];
  id v6 = +[WCAAsset beaconsDataAsset];
  objc_msgSend(v40, "setAsset:");

  v33 = _NSConcreteStackBlock;
  int v34 = -1073741824;
  int v35 = 0;
  v36 = sub_1000055AC;
  v37 = &unk_100010610;
  id v38 = location[0];
  [v40 setCompletionHandler:&v33];
  id v7 = +[WCAClient sharedClient];
  [v7 executeFetchRequest:v40];

  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
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
}

@end