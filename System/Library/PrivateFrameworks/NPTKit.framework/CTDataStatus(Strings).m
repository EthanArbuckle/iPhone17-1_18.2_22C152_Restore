@interface CTDataStatus(Strings)
- (__CFString)dataBearerTechnologyString;
- (__CFString)indicatorOverrideString;
- (__CFString)indicatorString;
- (__CFString)radioCoverageString;
- (__CFString)radioFrequencyString;
- (__CFString)radioTechnologyString;
- (id)dictionary;
@end

@implementation CTDataStatus(Strings)

- (__CFString)radioTechnologyString
{
  unsigned int v1 = [a1 radioTechnology];
  if (v1 > 0xA) {
    return @"unknown";
  }
  else {
    return off_2643A1928[v1];
  }
}

- (__CFString)dataBearerTechnologyString
{
  unsigned int v1 = [a1 dataBearerTechnology] - 1;
  if (v1 > 5) {
    return @"unknown";
  }
  else {
    return off_2643A1980[v1];
  }
}

- (__CFString)indicatorString
{
  unsigned int v1 = [a1 indicator];

  return indicatorToString(v1);
}

- (__CFString)indicatorOverrideString
{
  unsigned int v1 = [a1 indicatorOverride];

  return indicatorToString(v1);
}

- (__CFString)radioFrequencyString
{
  if (objc_opt_respondsToSelector())
  {
    if ([a1 newRadioSub6DataBearer]) {
      v2 = @"FR1";
    }
    else {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a1 newRadioMmWaveDataBearer]) {
    return @"FR2";
  }
  return v2;
}

- (__CFString)radioCoverageString
{
  if (objc_opt_respondsToSelector())
  {
    if ([a1 newRadioCoverage]) {
      v2 = @"NR";
    }
    else {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a1 newRadioSaCoverage]) {
    v2 = @"NRSA";
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a1 newRadioNsaCoverage]) {
    return @"NRNSA";
  }
  return v2;
}

- (id)dictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "attached"));
  [v2 setObject:v3 forKeyedSubscript:@"cellular_attached"];

  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "roamAllowed"));
  [v2 setObject:v4 forKeyedSubscript:@"cellular_roam_allowed"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "dataPlanSignalingReductionOverride"));
  [v2 setObject:v5 forKeyedSubscript:@"cellular_data_plan_signaling_reduction_override"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "cellularDataPossible"));
  [v2 setObject:v6 forKeyedSubscript:@"cellular_data_possible"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "inHomeCountry"));
  [v2 setObject:v7 forKeyedSubscript:@"cellular_in_home_country"];

  v8 = [a1 indicatorString];
  [v2 setObject:v8 forKeyedSubscript:@"cellular_indicator"];

  v9 = [a1 indicatorOverrideString];
  [v2 setObject:v9 forKeyedSubscript:@"cellular_indicator_override"];

  v10 = [a1 radioTechnologyString];
  [v2 setObject:v10 forKeyedSubscript:@"cellular_radio_access_technology_ct_data_status"];

  v11 = [a1 dataBearerTechnologyString];
  [v2 setObject:v11 forKeyedSubscript:@"cellular_data_bearer_technology"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "dataBearerSoMask"));
  [v2 setObject:v12 forKeyedSubscript:@"cellular_data_bearer_so_mask"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "activeContexts"));
  [v2 setObject:v13 forKeyedSubscript:@"cellular_active_contexts"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "totalActiveContexts"));
  [v2 setObject:v14 forKeyedSubscript:@"cellular_total_active_contexts"];

  v15 = [a1 radioFrequencyString];
  [v2 setObject:v15 forKeyedSubscript:@"cellular_radio_frequency"];

  if (objc_opt_respondsToSelector())
  {
    unsigned int v16 = [a1 reason] - 1;
    if (v16 > 0xA) {
      v17 = @"Unknown";
    }
    else {
      v17 = off_2643A19B0[v16];
    }
    [v2 setObject:v17 forKeyedSubscript:@"cellular_event_change_reason"];
  }
  if (objc_opt_respondsToSelector())
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioCoverage"));
    [v2 setObject:v18 forKeyedSubscript:@"cellular_new_radio_coverage"];
  }
  if (objc_opt_respondsToSelector())
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioSaCoverage"));
    [v2 setObject:v19 forKeyedSubscript:@"cellular_new_radio_sa_coverage"];
  }
  if (objc_opt_respondsToSelector())
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioNsaCoverage"));
    [v2 setObject:v20 forKeyedSubscript:@"cellular_new_radio_nsa_coverage"];
  }
  if (objc_opt_respondsToSelector())
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioDataBearer"));
    [v2 setObject:v21 forKeyedSubscript:@"cellular_new_radio_data_bearer"];
  }
  if (objc_opt_respondsToSelector())
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioSaDataBearer"));
    [v2 setObject:v22 forKeyedSubscript:@"cellular_new_radio_sa_data_bearer"];
  }
  if (objc_opt_respondsToSelector())
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioNsaDataBearer"));
    [v2 setObject:v23 forKeyedSubscript:@"cellular_new_radio_nsa_data_bearer"];
  }
  if (objc_opt_respondsToSelector())
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioMmWaveDataBearer"));
    [v2 setObject:v24 forKeyedSubscript:@"cellular_new_radio_mmwave_data_bearer"];
  }
  if (objc_opt_respondsToSelector())
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "newRadioSub6DataBearer"));
    [v2 setObject:v25 forKeyedSubscript:@"cellular_new_radio_sub6_data_bearer"];
  }
  v26 = [NSDictionary dictionaryWithDictionary:v2];

  return v26;
}

@end