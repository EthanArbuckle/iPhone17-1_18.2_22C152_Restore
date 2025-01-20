@interface NANBrowse_Entity
- (BOOL)isEqual:(id)a3;
- (NANBrowse_Entity)initWithURL:(id)a3 txt:(id)a4 dataSession:(id)a5;
- (id)bonjourName;
- (id)displayName;
- (id)txtRecordDictionary;
- (unint64_t)hash;
- (void)dealloc;
- (void)setTXTRecordValue:(id)a3 forKey:(id)a4;
@end

@implementation NANBrowse_Entity

- (NANBrowse_Entity)initWithURL:(id)a3 txt:(id)a4 dataSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NANBrowse_Entity;
  v11 = [(NANBrowse_Entity *)&v21 init];
  if (v11)
  {
    id v12 = [v9 mutableCopy];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"note"];
    v14 = (void *)v13;
    CFStringRef v15 = @"no location";
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    v16 = +[NSString stringWithFormat:@"FROM NAN BROWSE: %@", v15];
    [v12 setObject:v16 forKeyedSubscript:@"note"];

    v17 = (PKPrinterBonjourEndpoint *)[objc_alloc((Class)PKPrinterBonjourEndpoint) initWithURL:v8 txtRecord:v12 provenance:32 provenanceIdentifier:0];
    bonjourName = v11->_bonjourName;
    v11->_bonjourName = v17;

    objc_storeStrong((id *)&v11->_txt, v12);
    objc_storeStrong((id *)&v11->_dataSession, a5);
    v19 = v11->_dataSession;
    if (qword_1000C8B18 != -1) {
      dispatch_once(&qword_1000C8B18, &stru_1000A2AD8);
    }
    [(id)qword_1000C8B10 addObject:v19];
  }
  return v11;
}

- (void)dealloc
{
  v3 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    dataSession = self->_dataSession;
    *(_DWORD *)buf = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = dataSession;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "NSNBrowse_Entity<%p> being deallocated - ds %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)NANBrowse_Entity;
  [(NANBrowse_Entity *)&v5 dealloc];
}

- (id)displayName
{
  return [(PKPrinterBonjourEndpoint *)self->_bonjourName displayNameForPrintKitUI];
}

- (id)txtRecordDictionary
{
  return self->_txt;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = v4;
    if ([(PKPrinterBonjourEndpoint *)self->_bonjourName isEqual:v5[1]]) {
      BOOL v6 = [(NSDictionary *)self->_txt isEqualToDictionary:v5[2]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(PKPrinterBonjourEndpoint *)self->_bonjourName hash];
  return (unint64_t)[(NSDictionary *)self->_txt hash] ^ v3;
}

- (id)bonjourName
{
  return self->_bonjourName;
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_txt mutableCopy];
  [v7 setObject:v8 forKeyedSubscript:v6];
  objc_storeStrong((id *)&self->_txt, v7);
  [(PKPrinterBonjourEndpoint *)self->_bonjourName setResolvedTXT:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_storeStrong((id *)&self->_txt, 0);

  objc_storeStrong((id *)&self->_bonjourName, 0);
}

@end