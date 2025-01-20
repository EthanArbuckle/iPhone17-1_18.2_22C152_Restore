@interface BonjourBrowse_Entity
- (BOOL)isEqual:(id)a3;
- (BonjourBrowse_Entity)initWithBrowseResult:(id)a3;
- (BonjourBrowse_Entity)initWithEndpoint:(id)a3;
- (id)bonjourName;
- (id)description;
- (id)displayName;
- (id)domain;
- (id)nw_txt_record;
- (id)serviceType;
- (id)txtRecordDictionary;
- (unint64_t)hash;
@end

@implementation BonjourBrowse_Entity

- (BonjourBrowse_Entity)initWithBrowseResult:(id)a3
{
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BonjourBrowse_Entity;
  v6 = [(BonjourBrowse_Entity *)&v10 init];
  if (v6)
  {
    nw_endpoint_t v7 = nw_browse_result_copy_endpoint(v5);
    endpoint = v6->_endpoint;
    v6->_endpoint = (OS_nw_endpoint *)v7;

    objc_storeStrong((id *)&v6->_browseResult, a3);
  }

  return v6;
}

- (BonjourBrowse_Entity)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BonjourBrowse_Entity;
  v6 = [(BonjourBrowse_Entity *)&v10 init];
  nw_endpoint_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    browseResult = v7->_browseResult;
    v7->_browseResult = 0;
  }
  return v7;
}

- (id)description
{
  v3 = [(BonjourBrowse_Entity *)self nw_txt_record];
  v4 = v3;
  if (v3)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%d keys in txt record"), nw_txt_record_get_key_count(v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"(no txt from browse result)";
  }
  bonjour_service_type = nw_endpoint_get_bonjour_service_type((nw_endpoint_t)self->_endpoint);
  bonjour_service_domain = nw_endpoint_get_bonjour_service_domain((nw_endpoint_t)self->_endpoint);
  v12.receiver = self;
  v12.super_class = (Class)BonjourBrowse_Entity;
  v8 = [(BonjourBrowse_Entity *)&v12 description];
  v9 = [(BonjourBrowse_Entity *)self displayName];
  objc_super v10 = +[NSString stringWithFormat:@"%@ { %@ / %s / %s (%@) }", v8, v9, bonjour_service_type, bonjour_service_domain, v5];

  return v10;
}

- (id)serviceType
{
  bonjour_service_type = nw_endpoint_get_bonjour_service_type((nw_endpoint_t)self->_endpoint);

  return +[NSString stringWithUTF8String:bonjour_service_type];
}

- (id)domain
{
  bonjour_service_domain = nw_endpoint_get_bonjour_service_domain((nw_endpoint_t)self->_endpoint);

  return +[NSString stringWithUTF8String:bonjour_service_domain];
}

- (id)nw_txt_record
{
  if (self->_browseResult) {
    nw_txt_record_t v2 = nw_browse_result_copy_txt_record_object((nw_browse_result_t)self->_browseResult);
  }
  else {
    nw_txt_record_t v2 = nw_endpoint_copy_txt_record((nw_endpoint_t)self->_endpoint);
  }

  return v2;
}

- (id)bonjourName
{
  id v3 = objc_alloc((Class)PKPrinterBonjourEndpoint);
  endpoint = self->_endpoint;
  id v5 = [(BonjourBrowse_Entity *)self serviceType];
  id v6 = [v3 initWithEndpoint:endpoint provenance:4 provenanceIdentifier:v5];

  return v6;
}

- (id)displayName
{
  bonjour_service_name = nw_endpoint_get_bonjour_service_name((nw_endpoint_t)self->_endpoint);

  return +[NSString stringWithUTF8String:bonjour_service_name];
}

- (id)txtRecordDictionary
{
  nw_txt_record_t v2 = [(BonjourBrowse_Entity *)self nw_txt_record];
  id v3 = +[PKTXTRecord txtRecordDictionaryForTxtRecord:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BonjourBrowse_Entity *)self bonjourName];
    nw_endpoint_t v7 = [v5 bonjourName];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  nw_txt_record_t v2 = [(BonjourBrowse_Entity *)self bonjourName];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseResult, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end