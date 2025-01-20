@interface WPBrowse_Entity
- (BOOL)parseData:(id)a3;
- (WPBrowse_Entity)initWithPuckID:(id)a3 airPrintData:(id)a4 rssi:(id)a5;
- (id)bonjourName;
- (id)displayName;
- (id)txtRecordDictionary;
- (void)_ingestPrinterAttributes:(id)a3;
- (void)resolveOnQueue:(id)a3 completionHandler:(id)a4;
- (void)updateWithPuckID:(id)a3 rssi:(id)a4;
@end

@implementation WPBrowse_Entity

- (WPBrowse_Entity)initWithPuckID:(id)a3 airPrintData:(id)a4 rssi:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WPBrowse_Entity;
  v12 = [(WPBrowse_Entity *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_puckID, a3);
    objc_storeStrong((id *)&v13->_rssi, a5);
    if (![(WPBrowse_Entity *)v13 parseData:v10])
    {
      v14 = _PKLogCategory(PKLogCategoryDiscovery[0]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [v10 length];
        *(_DWORD *)buf = 67109378;
        unsigned int v19 = v15;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Couldn't parse data of length %d for beacon id %@", buf, 0x12u);
      }

      v13 = 0;
    }
  }

  return v13;
}

- (id)bonjourName
{
  return self->_bonjourName;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)txtRecordDictionary
{
  return self->_txtRecordDictionary;
}

- (void)updateWithPuckID:(id)a3 rssi:(id)a4
{
  id v8 = a3;
  v6 = (NSNumber *)a4;
  if (([(NSUUID *)self->_puckID isEqual:v8] & 1) == 0) {
    __assert_rtn("-[WPBrowse_Entity updateWithPuckID:rssi:]", "Browse_WirelessProximity.mm", 170, "[_puckID isEqual:puckID]");
  }
  rssi = self->_rssi;
  self->_rssi = v6;
}

- (void)resolveOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to resolve %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  printerURL = self->_printerURL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003AB58;
  v12[3] = &unk_1000A2B28;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  +[PKPrinterBonjourEndpoint resolveWithURL:printerURL timeout:v12 completionHandler:30.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_ingestPrinterAttributes:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_txtRecordDictionary, a3);
  id v6 = [v10 objectForKeyedSubscript:@"display-name"];
  id v7 = v6;
  if (!v6)
  {
    v3 = [(NSURL *)self->_printerURL absoluteString];
    id v7 = +[NSString stringWithFormat:@"Beacon %@", v3];
  }
  objc_storeStrong((id *)&self->_displayName, v7);
  if (!v6)
  {
  }
  id v8 = (PKPrinterBonjourEndpoint *)[objc_alloc((Class)PKPrinterBonjourEndpoint) initWithURL:self->_printerURL txtRecord:v10 provenance:8 provenanceIdentifier:0];
  bonjourName = self->_bonjourName;
  self->_bonjourName = v8;
}

- (BOOL)parseData:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] < 0x16)
  {
    BOOL v5 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v4, "getBytes:range:", &v29, 0, 22);
  id v6 = sub_10003B570((uint64_t)&v29);
  if ((v29 & 3) == 1) {
    id v7 = @"ipps";
  }
  else {
    id v7 = @"ipp";
  }
  id v8 = v7;
  id v9 = v8;
  uint64_t v10 = __rev16(v31);
  unsigned int v11 = __rev16(v30);
  if ((v29 & 0xC) == 0)
  {
    id v14 = v8;
    id v15 = v6;
    if (v11 - 1 > 5)
    {
      v16 = @"/ipp/print";
      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      v16 = off_1000A2C00[(__int16)(v11 - 1)];
      if (v10)
      {
LABEL_12:
        objc_super v17 = +[NSNumber numberWithInt:v10];
LABEL_16:
        PKURLWithComponents(v14, v15, v17, v16);
        v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (v10) {

        }
        goto LABEL_23;
      }
    }
    objc_super v17 = 0;
    goto LABEL_16;
  }
  if ((v29 & 0xC) == 4)
  {
    v25 = v8;
    id v12 = v6;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_10003B62C;
    v28[4] = sub_10003B63C;
    v28[5] = 0;
    if (v10)
    {
      id v13 = +[NSNumber numberWithInt:v10];
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v26 = PKURLWithComponents(v25, v12, v13, @"/ipp/print");
    if (v10) {

    }
    unsigned int v19 = [device_http_t alloc];
    __int16 v20 = +[IPPSession globalSession];
    id v21 = [v20 ippURL:v26];
    [(device_http_t *)v19 initWithSessionURL:v21 displayNameForCertTrust:0];

    sub_10003B7EC(v27, 0x4Fu, @"printerURLFromPrintServer");
  }
  v18 = 0;
LABEL_23:

  printerURL = self->_printerURL;
  self->_printerURL = v18;

  v23 = self->_printerURL;
  BOOL v5 = v23 != 0;
  if (v23) {
    self->_measuredPower = v32;
  }
LABEL_25:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecordDictionary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_printerURL, 0);

  objc_storeStrong((id *)&self->_puckID, 0);
}

@end