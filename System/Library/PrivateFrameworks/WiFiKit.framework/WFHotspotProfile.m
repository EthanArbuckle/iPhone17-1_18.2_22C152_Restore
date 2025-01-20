@interface WFHotspotProfile
- (WFHotspotProfile)initWithProfile:(id)a3 anqpResponse:(id)a4;
@end

@implementation WFHotspotProfile

- (WFHotspotProfile)initWithProfile:(id)a3 anqpResponse:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v14)) {
      goto LABEL_20;
    }
    int v20 = 136315138;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    v15 = "%s: nil profile";
LABEL_14:
    v16 = v13;
    os_log_type_t v17 = v14;
    uint32_t v18 = 12;
    goto LABEL_19;
  }
  if (!v7)
  {
    v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v14)) {
      goto LABEL_20;
    }
    int v20 = 136315138;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    v15 = "%s: nil anqp response";
    goto LABEL_14;
  }
  [v6 scanAttributes];
  uint64_t v9 = WiFiNetworkCreate();
  if (!v9)
  {
    v13 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v19)) {
      goto LABEL_20;
    }
    int v20 = 136315394;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    __int16 v22 = 2112;
    id v23 = v6;
    v15 = "%s: failed to create network from profile %@";
    v16 = v13;
    os_log_type_t v17 = v19;
    uint32_t v18 = 22;
LABEL_19:
    _os_log_impl(&dword_226071000, v16, v17, v15, (uint8_t *)&v20, v18);
LABEL_20:

    v11 = 0;
    goto LABEL_5;
  }
  v10 = (const void *)v9;
  WiFiNetworkMerge();
  v11 = [(WFNetworkProfile *)self initWithNetworkRef:v10];
  CFRelease(v10);
LABEL_5:

  return v11;
}

@end