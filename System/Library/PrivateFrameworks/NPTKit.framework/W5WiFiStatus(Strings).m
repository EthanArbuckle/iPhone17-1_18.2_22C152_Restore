@interface W5WiFiStatus(Strings)
- (id)chainAckString;
- (id)desenseString;
- (id)dictionary;
- (id)powerString;
@end

@implementation W5WiFiStatus(Strings)

- (id)powerString
{
  v2 = [a1 power];
  if ([v2 length] == 24)
  {
    id v3 = [a1 power];
    [v3 bytes];
    v4 = W5DescriptionForPower();
  }
  else
  {
    v4 = W5DescriptionForPower();
  }

  return v4;
}

- (id)desenseString
{
  id v3 = [a1 desense];
  uint64_t v4 = [v3 length];
  if (v4 == 16)
  {
    id v1 = [a1 desense];
    [v1 bytes];
  }
  v5 = [a1 desenseLevel];
  if ([v5 length] == 8)
  {
    id v6 = [a1 desenseLevel];
    [v6 bytes];
    v7 = W5DescriptionForDesense();
  }
  else
  {
    v7 = W5DescriptionForDesense();
  }

  if (v4 == 16) {

  }
  return v7;
}

- (id)chainAckString
{
  v2 = [a1 chainAck];
  if ([v2 length] == 24)
  {
    id v3 = [a1 chainAck];
    [v3 bytes];
    uint64_t v4 = W5DescriptionForChainAck();
  }
  else
  {
    uint64_t v4 = W5DescriptionForChainAck();
  }

  return v4;
}

- (id)dictionary
{
  v2 = objc_opt_new();
  id v3 = [a1 macAddress];

  if (v3)
  {
    uint64_t v4 = [a1 macAddress];
    [v2 setValue:v4 forKey:@"wifi_mac_address"];
  }
  v5 = [a1 ssid];

  if (v5)
  {
    id v6 = [a1 ssidString];
    [v2 setValue:v6 forKey:@"wifi_ssid"];
  }
  v7 = [a1 bssid];

  if (v7)
  {
    v8 = [a1 bssid];
    [v2 setValue:v8 forKey:@"wifi_bssid"];
  }
  [a1 security];
  v9 = W5DescriptionForSecurity();
  [v2 setValue:v9 forKey:@"wifi_security"];

  v10 = [a1 channel];

  if (v10)
  {
    v11 = NSNumber;
    v12 = [a1 channel];
    v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "channel"));
    [v2 setValue:v13 forKey:@"wifi_channel"];
  }
  v14 = [a1 countryCode];

  if (v14)
  {
    v15 = [a1 countryCode];
    [v2 setValue:v15 forKey:@"wifi_country_code"];
  }
  uint64_t v16 = [a1 chainAckString];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [a1 chainAckString];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = [a1 chainAckString];
      [v2 setValue:v20 forKey:@"wifi_chain_ack"];
    }
  }
  uint64_t v21 = [a1 desenseString];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [a1 desenseString];
    uint64_t v24 = [v23 length];

    if (v24)
    {
      v25 = [a1 desenseString];
      [v2 setValue:v25 forKey:@"wifi_desense"];
    }
  }
  v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "rssi"));
  [v2 setValue:v26 forKey:@"wifi_rssi"];

  v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "noise"));
  [v2 setValue:v27 forKey:@"wifi_noise"];

  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "numberOfSpacialStreams"));
  [v2 setValue:v28 forKey:@"wifi_number_of_spatial_streams"];

  [a1 eapolControlMode];
  v29 = W5DescriptionForEAPOLControlMode();
  [v2 setValue:v29 forKey:@"wifi_eapol_control_mode"];

  [a1 eapolSupplicantState];
  v30 = W5DescriptionForEAPOLSupplicantState();
  [v2 setValue:v30 forKey:@"wifi_eapol_supplicant_state"];

  [a1 opMode];
  v31 = W5DescriptionForOpMode();
  [v2 setValue:v31 forKey:@"wifi_op_mode"];

  [a1 phyMode];
  v32 = W5DescriptionForPHYMode();
  [v2 setValue:v32 forKey:@"wifi_phy_mode"];

  [a1 btcMode];
  v33 = W5DescriptionForBTCMode();
  [v2 setValue:v33 forKey:@"wifi_btc_mode"];

  v34 = NSNumber;
  [a1 txRate];
  v35 = objc_msgSend(v34, "numberWithDouble:");
  [v2 setValue:v35 forKey:@"wifi_tx_rate"];

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "mcsIndex"));
  [v2 setValue:v36 forKey:@"wifi_mcs_index"];

  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "guardInterval"));
  [v2 setValue:v37 forKey:@"wifi_guard_interval"];

  v38 = [NSDictionary dictionaryWithDictionary:v2];

  return v38;
}

@end