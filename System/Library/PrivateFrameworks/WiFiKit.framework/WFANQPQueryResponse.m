@interface WFANQPQueryResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWFANQPResponse:(id)a3;
- (CWFScanResult)scanResult;
- (NSArray)cellNetworkInfo;
- (NSArray)domains;
- (NSArray)roamingConsortium;
- (NSString)bssid;
- (NSString)operatorName;
- (NSString)ssid;
- (WFANQPQueryResponse)initWithScanResult:(id)a3 ANQPResponse:(id)a4;
- (id)description;
- (int64_t)channel;
- (unint64_t)hash;
- (void)setBssid:(id)a3;
- (void)setCellNetworkInfo:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setDomains:(id)a3;
- (void)setOperatorName:(id)a3;
- (void)setRoamingConsortium:(id)a3;
- (void)setScanResult:(id)a3;
- (void)setSsid:(id)a3;
@end

@implementation WFANQPQueryResponse

- (WFANQPQueryResponse)initWithScanResult:(id)a3 ANQPResponse:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!self)
  {
    v18 = 0;
LABEL_24:

    v26 = 0;
    self = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
    v29 = WFLogForCategory(0);
    os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
    v18 = 0;
    if (!WFCurrentLogLevel() || !v29) {
      goto LABEL_23;
    }
    if (!os_log_type_enabled(v29, v30)) {
      goto LABEL_22;
    }
    int v33 = 136315138;
    v34 = "-[WFANQPQueryResponse initWithScanResult:ANQPResponse:]";
    v31 = "%s: missing scan result";
    goto LABEL_21;
  }
  if (!v8)
  {
    v29 = WFLogForCategory(0);
    os_log_type_t v30 = OSLogForWFLogLevel(1uLL);
    v18 = 0;
    if (!WFCurrentLogLevel() || !v29) {
      goto LABEL_23;
    }
    if (!os_log_type_enabled(v29, v30))
    {
LABEL_22:
      v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    int v33 = 136315138;
    v34 = "-[WFANQPQueryResponse initWithScanResult:ANQPResponse:]";
    v31 = "%s: missing response";
LABEL_21:
    _os_log_impl(&dword_226071000, v29, v30, v31, (uint8_t *)&v33, 0xCu);
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_scanResult, a3);
  v10 = [v7 networkName];
  ssid = self->_ssid;
  self->_ssid = v10;

  v12 = [v9 objectForKey:@"ANQP_CELL_NETWORK_INFO"];
  cellNetworkInfo = self->_cellNetworkInfo;
  self->_cellNetworkInfo = v12;

  v14 = [v9 objectForKey:@"ANQP_ROAMING_CONSORTIUM_OI_LIST"];
  roamingConsortium = self->_roamingConsortium;
  self->_roamingConsortium = v14;

  v16 = [v9 objectForKey:@"ANQP_DOMAIN_NAME_LIST"];
  domains = self->_domains;
  self->_domains = v16;

  v18 = [v9 objectForKey:@"ANQP_OPERATOR_NAMES_LIST"];
  if ([v18 count])
  {
    v19 = [v18 objectAtIndex:0];
    v20 = v19;
    if (v19)
    {
      v21 = [v19 objectForKey:@"ANQP_OPERATOR_NAME"];
      operatorName = self->_operatorName;
      self->_operatorName = v21;
    }
  }
  v23 = [v9 objectForKey:@"BSSID"];
  bssid = self->_bssid;
  self->_bssid = v23;

  if (!self->_bssid)
  {
    v29 = WFLogForCategory(0);
    os_log_type_t v32 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v32))
    {
      int v33 = 138412290;
      v34 = (const char *)v9;
      _os_log_impl(&dword_226071000, v29, v32, "BSSID was nil for ANQP response %@", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_23;
  }
  v25 = [v9 objectForKey:@"CHANNEL"];
  v26 = v25;
  if (v25) {
    self->_channel = [v25 integerValue];
  }
LABEL_11:
  v27 = self;

  return v27;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFANQPQueryResponse *)self bssid];
  id v7 = [(WFANQPQueryResponse *)self operatorName];
  id v8 = [v3 stringWithFormat:@"%@- BSSID %@ | Operator Name %@", v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WFANQPQueryResponse *)self bssid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFANQPQueryResponse *)self isEqualToWFANQPResponse:v4];

  return v5;
}

- (BOOL)isEqualToWFANQPResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFANQPQueryResponse *)self bssid];
  v6 = [v4 bssid];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (NSArray)cellNetworkInfo
{
  return self->_cellNetworkInfo;
}

- (void)setCellNetworkInfo:(id)a3
{
}

- (NSArray)roamingConsortium
{
  return self->_roamingConsortium;
}

- (void)setRoamingConsortium:(id)a3
{
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_roamingConsortium, 0);
  objc_storeStrong((id *)&self->_cellNetworkInfo, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end