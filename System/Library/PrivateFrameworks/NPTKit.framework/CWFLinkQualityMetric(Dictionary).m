@interface CWFLinkQualityMetric(Dictionary)
- (id)dictionary;
@end

@implementation CWFLinkQualityMetric(Dictionary)

- (id)dictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [a1 linkQualityMetricData];
  uint64_t v4 = [v3 bytes];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08790]);
    [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
    v6 = [a1 updatedAt];
    v7 = [v5 stringFromDate:v6];
    [v2 setObject:v7 forKeyedSubscript:@"wifi_updated_at"];

    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "RSSI"));
    [v2 setObject:v8 forKeyedSubscript:@"wifi_rssi"];

    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "noise"));
    [v2 setObject:v9 forKeyedSubscript:@"wifi_noise"];

    v10 = NSNumber;
    [a1 txRate];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v2 setObject:v11 forKeyedSubscript:@"wifi_tx_rate"];

    v12 = NSNumber;
    [a1 rxRate];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [v2 setObject:v13 forKeyedSubscript:@"wifi_rx_rate"];

    if (*(unsigned char *)(v4 + 11))
    {
      v14 = [NSNumber numberWithShort:*(__int16 *)(v4 + 12)];
      [v2 setObject:v14 forKeyedSubscript:@"wifi_snr"];
    }
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 20)];
    [v2 setObject:v15 forKeyedSubscript:@"wifi_tx_fail"];

    v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 24)];
    [v2 setObject:v16 forKeyedSubscript:@"wifi_tx_retrans"];

    v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 28)];
    [v2 setObject:v17 forKeyedSubscript:@"wifi_tx_frames"];

    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 32)];
    [v2 setObject:v18 forKeyedSubscript:@"wifi_rx_retry_frames"];

    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 36)];
    [v2 setObject:v19 forKeyedSubscript:@"wifi_rx_frames"];

    if (*(unsigned char *)(v4 + 48))
    {
      v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 40)];
      [v2 setObject:v20 forKeyedSubscript:@"wifi_beacon_recv"];

      v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 44)];
      [v2 setObject:v21 forKeyedSubscript:@"wifi_beacon_sched"];
    }
    if (*(unsigned char *)(v4 + 49))
    {
      v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 52)];
      [v2 setObject:v22 forKeyedSubscript:@"wifi_tx_fw_fail"];

      v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 56)];
      [v2 setObject:v23 forKeyedSubscript:@"wifi_tx_fw_retrans"];

      v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 60)];
      [v2 setObject:v24 forKeyedSubscript:@"wifi_tx_fw_frames"];
    }
    v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 68)];
    [v2 setObject:v25 forKeyedSubscript:@"wifi_tx_fallback_rate"];

    uint64_t v4 = [NSDictionary dictionaryWithDictionary:v2];
  }

  return (id)v4;
}

@end