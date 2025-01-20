@interface PKPrinterBonjourEndpoint
+ (BOOL)supportsSecureCoding;
+ (id)endpointWithBonjourString:(id)a3;
+ (id)endpointWithData:(id)a3;
+ (id)endpointWithURL:(id)a3;
+ (id)serviceFromEndpoint:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIPPS;
- (NSDictionary)resolvedTXT;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayNameForPrintKitUI;
- (NSString)persistentNameRepresentationForPrintKitUI;
- (NSString)provenanceIdentifier;
- (NSURL)resolvedURL;
- (NWEndpoint)nwEndpoint;
- (PKPrinterBonjourEndpoint)initWithBonjourString:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5;
- (PKPrinterBonjourEndpoint)initWithCoder:(id)a3;
- (PKPrinterBonjourEndpoint)initWithEndpoint:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5;
- (PKPrinterBonjourEndpoint)initWithURL:(id)a3 txtRecord:(id)a4 provenance:(int)a5 provenanceIdentifier:(id)a6;
- (id)dataRepresentation;
- (id)userCodableDictionary;
- (int)provenance;
- (unint64_t)hash;
- (void)_resolveEndpoint:(id)a3;
- (void)_resolve_finish_resolvedURL:(id)a3 resolvedTXT:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setNwEndpoint:(id)a3;
- (void)setResolvedTXT:(id)a3;
- (void)setResolvedURL:(id)a3;
- (void)withResolvedTXT:(id)a3;
- (void)withResolvedURL:(id)a3;
@end

@implementation PKPrinterBonjourEndpoint

+ (id)endpointWithURL:(id)a3
{
  id v3 = a3;
  v4 = [[PKPrinterBonjourEndpoint alloc] initWithURL:v3 txtRecord:0 provenance:0 provenanceIdentifier:0];

  return v4;
}

+ (id)endpointWithBonjourString:(id)a3
{
  id v3 = a3;
  v4 = [[PKPrinterBonjourEndpoint alloc] initWithBonjourString:v3 provenance:0 provenanceIdentifier:0];

  return v4;
}

- (PKPrinterBonjourEndpoint)initWithEndpoint:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5
{
  v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBonjourEndpoint;
  v10 = [(PKPrinterBonjourEndpoint *)&v21 init];
  v11 = v10;
  if (v10)
  {
    v10->_provenance = a4;
    objc_storeStrong((id *)&v10->_provenanceIdentifier, a5);
    uint64_t v12 = [MEMORY[0x263F143F8] endpointWithCEndpoint:v8];
    nwEndpoint = v11->_nwEndpoint;
    v11->_nwEndpoint = (NWEndpoint *)v12;

    if (nw_endpoint_get_type(v8) == nw_endpoint_type_url)
    {
      url = nw_endpoint_get_url(v8);
      if (url)
      {
        uint64_t v15 = PKURLWithUTF8String((uint64_t)url);
        resolvedURL = v11->_resolvedURL;
        v11->_resolvedURL = (NSURL *)v15;
      }
    }
    nw_txt_record_t v17 = nw_endpoint_copy_txt_record(v8);
    if (v17)
    {
      uint64_t v18 = +[PKTXTRecord txtRecordDictionaryForTxtRecord:v17];
      resolvedTXT = v11->_resolvedTXT;
      v11->_resolvedTXT = (NSDictionary *)v18;
    }
  }

  return v11;
}

- (PKPrinterBonjourEndpoint)initWithURL:(id)a3 txtRecord:(id)a4 provenance:(int)a5 provenanceIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKPrinterBonjourEndpoint;
  v13 = [(PKPrinterBonjourEndpoint *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_provenance = a5;
    objc_storeStrong((id *)&v13->_provenanceIdentifier, a6);
    id v15 = [v10 absoluteString];
    url = nw_endpoint_create_url((const char *)[v15 UTF8String]);

    uint64_t v17 = [MEMORY[0x263F143F8] endpointWithCEndpoint:url];
    nwEndpoint = v14->_nwEndpoint;
    v14->_nwEndpoint = (NWEndpoint *)v17;

    v19 = nw_endpoint_get_url(url);
    uint64_t v20 = PKURLWithUTF8String((uint64_t)v19);
    resolvedURL = v14->_resolvedURL;
    v14->_resolvedURL = (NSURL *)v20;

    objc_storeStrong((id *)&v14->_resolvedTXT, a4);
  }

  return v14;
}

- (PKPrinterBonjourEndpoint)initWithBonjourString:(id)a3 provenance:(int)a4 provenanceIdentifier:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PKPrinterBonjourEndpoint;
  id v10 = [(PKPrinterBonjourEndpoint *)&v35 init];
  id v11 = v10;
  if (!v10)
  {
LABEL_18:
    v32 = v11;
    goto LABEL_21;
  }
  v10->_provenance = a4;
  objc_storeStrong((id *)&v10->_provenanceIdentifier, a5);
  id v12 = [v8 componentsSeparatedByString:@"."];
  if ((unint64_t)[v12 count] <= 3)
  {
    v13 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v8;
      _os_log_impl(&dword_22EA54000, v13, OS_LOG_TYPE_ERROR, "Invalid Bonjour service: %@{public}", buf, 0xCu);
    }

    goto LABEL_20;
  }
  id v34 = [v12 objectAtIndexedSubscript:0];
  v14 = NSString;
  id v15 = [v12 objectAtIndexedSubscript:1];
  v16 = [v12 objectAtIndexedSubscript:2];
  uint64_t v17 = [v14 stringWithFormat:@"%@.%@", v15, v16];

  uint64_t v18 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v34, "length") + objc_msgSend(v17, "length") + 2);
  id v19 = v34;
  uint64_t v20 = [v19 UTF8String];
  if (strlen((const char *)v20) > 0xFF) {
    __assert_rtn("unescape", "PKPrinterBonjourEndpoint.mm", 72, "strlen(src) < dstLen");
  }
  objc_super v21 = buf;
  for (i = (char *)v20; ; uint64_t v20 = (uint64_t)i)
  {
    int v24 = *i++;
    int v23 = v24;
    if (v24 == 92)
    {
      i = (char *)(v20 + 2);
      int v23 = *(unsigned __int8 *)(v20 + 1);
      if (v23 == 48) {
        break;
      }
    }
    if (!v23) {
      goto LABEL_16;
    }
LABEL_15:
    *v21++ = v23;
  }
  char v25 = *i;
  if (*i && *(unsigned char *)(v20 + 3))
  {
    i = (char *)(v20 + 4);
    LOBYTE(v23) = *(unsigned char *)(v20 + 3) + 10 * v25 - 16;
    goto LABEL_15;
  }
LABEL_16:
  *objc_super v21 = 0;
  id v26 = v17;
  v27 = (const char *)[v26 UTF8String];
  id v28 = v18;
  nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service((const char *)buf, v27, (const char *)[v28 UTF8String]);
  if (bonjour_service)
  {
    uint64_t v30 = [MEMORY[0x263F143F8] endpointWithCEndpoint:bonjour_service];
    nwEndpoint = v11->_nwEndpoint;
    v11->_nwEndpoint = (NWEndpoint *)v30;

    goto LABEL_18;
  }

LABEL_20:
  v32 = 0;
LABEL_21:

  return v32;
}

- (PKPrinterBonjourEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPrinterBonjourEndpoint;
  v5 = [(PKPrinterBonjourEndpoint *)&v26 init];
  if (v5)
  {
    v5->_provenance = [v4 decodeIntegerForKey:@"provenance"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provenanceIdentifier"];
    provenanceIdentifier = v5->_provenanceIdentifier;
    v5->_provenanceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    nwEndpoint = v5->_nwEndpoint;
    v5->_nwEndpoint = (NWEndpoint *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    resolvedURL = v5->_resolvedURL;
    v5->_resolvedURL = (NSURL *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeDictionaryWithKeysOfClass:v12 objectsOfClass:objc_opt_class() forKey:@"txt"];
    resolvedTXT = v5->_resolvedTXT;
    v5->_resolvedTXT = (NSDictionary *)v13;

    if (!v5->_resolvedTXT)
    {
      id v15 = [(NWEndpoint *)v5->_nwEndpoint copyCEndpoint];
      nw_txt_record_t v16 = nw_endpoint_copy_txt_record(v15);

      if (v16)
      {
        uint64_t v17 = +[PKTXTRecord txtRecordDictionaryForTxtRecord:v16];
        uint64_t v18 = v5->_resolvedTXT;
        v5->_resolvedTXT = (NSDictionary *)v17;
      }
    }
    if (!v5->_resolvedURL)
    {
      id v19 = [(NWEndpoint *)v5->_nwEndpoint copyCEndpoint];
      nw_endpoint_type_t type = nw_endpoint_get_type(v19);

      if (type == nw_endpoint_type_url)
      {
        objc_super v21 = [(NWEndpoint *)v5->_nwEndpoint copyCEndpoint];
        url = nw_endpoint_get_url(v21);

        if (url)
        {
          uint64_t v23 = PKURLWithUTF8String((uint64_t)url);
          int v24 = v5->_resolvedURL;
          v5->_resolvedURL = (NSURL *)v23;
        }
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_provenance forKey:@"provenance"];
  provenanceIdentifier = self->_provenanceIdentifier;
  if (provenanceIdentifier) {
    [v7 encodeObject:provenanceIdentifier forKey:@"provenanceIdentifier"];
  }
  [v7 encodeObject:self->_nwEndpoint forKey:@"endpoint"];
  resolvedURL = self->_resolvedURL;
  if (resolvedURL) {
    [v7 encodeObject:resolvedURL forKey:@"url"];
  }
  resolvedTXT = self->_resolvedTXT;
  if (resolvedTXT) {
    [v7 encodeObject:resolvedTXT forKey:@"txt"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    uint64_t v6 = self->_resolvedURL;
    id v7 = v5[3];
    uint64_t v8 = v7;
    if ((v6 != 0) != (v7 != 0))
    {
      BOOL v9 = 0;
    }
    else
    {
      if (v6 && v7) {
        char v10 = [(NSURL *)v6 isEqual:v7];
      }
      else {
        char v10 = [(NWEndpoint *)self->_nwEndpoint isEqual:v5[2]];
      }
      BOOL v9 = v10;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  resolvedURL = self->_resolvedURL;
  if (!resolvedURL) {
    resolvedURL = self->_nwEndpoint;
  }
  return [resolvedURL hash];
}

- (id)dataRepresentation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_22EA54000, v4, OS_LOG_TYPE_ERROR, "endpoint serialization error %{public}@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

+ (id)endpointWithData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = 0;
  id v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a1 fromData:a3 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_22EA54000, v5, OS_LOG_TYPE_ERROR, "endpoint deserialization error %{public}@", buf, 0xCu);
    }

    id v3 = 0;
  }

  return v3;
}

- (NSString)persistentNameRepresentationForPrintKitUI
{
  id v3 = [(NWEndpoint *)self->_nwEndpoint copyCEndpoint];
  nw_endpoint_type_t type = nw_endpoint_get_type(v3);
  if (type == nw_endpoint_type_bonjour_service)
  {
    uint64_t bonjour_fullname = nw_endpoint_get_bonjour_fullname();
    if (bonjour_fullname) {
      goto LABEL_7;
    }
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v3);
  }
  else
  {
    if (type != nw_endpoint_type_url) {
      goto LABEL_9;
    }
    bonjour_service_name = nw_endpoint_get_url(v3);
  }
  uint64_t bonjour_fullname = (uint64_t)bonjour_service_name;
  if (bonjour_service_name)
  {
LABEL_7:
    id v7 = [NSString stringWithUTF8String:bonjour_fullname];

    if (v7) {
      goto LABEL_22;
    }
    goto LABEL_10;
  }
LABEL_9:

LABEL_10:
  resolvedURL = self->_resolvedURL;
  if (!resolvedURL
    || ([(NSURL *)resolvedURL absoluteString], (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    resolvedTXT = self->_resolvedTXT;
    if (!resolvedTXT) {
      goto LABEL_18;
    }
    uint64_t v10 = [(NSDictionary *)resolvedTXT objectForKeyedSubscript:@"display-name"];
    if (!v10) {
      goto LABEL_18;
    }
    id v11 = (void *)v10;
    uint64_t v12 = NSString;
    uint64_t v13 = [(PKPrinterBonjourEndpoint *)self isIPPS] ? @"ipps" : @"ipp";
    id v7 = [v12 stringWithFormat:@"%@.%@._tcp.local.", v11, v13];

    if (!v7)
    {
LABEL_18:
      v14 = NSString;
      nwEndpoint = self->_nwEndpoint;
      if ([(PKPrinterBonjourEndpoint *)self isIPPS]) {
        nw_txt_record_t v16 = @"ipps";
      }
      else {
        nw_txt_record_t v16 = @"ipp";
      }
      id v7 = [v14 stringWithFormat:@"Printer_%@._%@._tcp.local.", nwEndpoint, v16];
    }
  }
LABEL_22:

  return (NSString *)v7;
}

- (NSString)displayNameForPrintKitUI
{
  resolvedTXT = self->_resolvedTXT;
  if (!resolvedTXT
    || ([(NSDictionary *)resolvedTXT objectForKeyedSubscript:@"display-name"],
        (id v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [(NWEndpoint *)self->_nwEndpoint copyCEndpoint];
    nw_endpoint_type_t type = nw_endpoint_get_type(v5);
    if (type == nw_endpoint_type_bonjour_service)
    {
      bonjour_service_name = nw_endpoint_get_bonjour_service_name(v5);
      if (bonjour_service_name) {
        goto LABEL_9;
      }
      uint64_t bonjour_fullname = nw_endpoint_get_bonjour_fullname();
    }
    else
    {
      if (type != nw_endpoint_type_url) {
        goto LABEL_11;
      }
      uint64_t bonjour_fullname = (uint64_t)nw_endpoint_get_url(v5);
    }
    bonjour_service_name = (const char *)bonjour_fullname;
    if (bonjour_fullname)
    {
LABEL_9:
      id v4 = [NSString stringWithUTF8String:bonjour_service_name];

      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_11:

LABEL_12:
    id v4 = &stru_26E251B90;
  }
LABEL_13:

  return (NSString *)v4;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKPrinterBonjourEndpoint;
  id v4 = [(PKPrinterBonjourEndpoint *)&v8 description];
  v5 = [(PKPrinterBonjourEndpoint *)self persistentNameRepresentationForPrintKitUI];
  id v6 = [v3 stringWithFormat:@"%@ { \"%@\" }", v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = (void *)[(NWEndpoint *)self->_nwEndpoint copyCEndpoint];
  id v4 = v3;
  v5 = @"NO";
  if (self->_resolvedURL)
  {
    id v6 = @"YES(R)";
  }
  else
  {
    id v7 = v3;
    if (nw_endpoint_get_type(v7) == nw_endpoint_type_url)
    {
      url = nw_endpoint_get_url(v7);

      id v6 = @"YES(E)";
      if (!url) {
        id v6 = @"NO";
      }
    }
    else
    {

      id v6 = @"NO";
    }
  }
  id v9 = v6;
  if (self->_resolvedTXT)
  {
    uint64_t v10 = @"YES(R)";
  }
  else
  {
    id v11 = v4;
    if (nw_endpoint_get_type(v11) == nw_endpoint_type_bonjour_service)
    {
      nw_txt_record_t v12 = nw_endpoint_copy_txt_record(v11);

      uint64_t v10 = @"YES(E)";
      if (!v12) {
        uint64_t v10 = @"NO";
      }
    }
    else
    {

      uint64_t v10 = @"NO";
    }
  }
  uint64_t v13 = v10;
  v14 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBonjourEndpoint;
  id v15 = [(PKPrinterBonjourEndpoint *)&v21 description];
  nw_txt_record_t v16 = [(PKPrinterBonjourEndpoint *)self persistentNameRepresentationForPrintKitUI];
  if ([(NSArray *)self->_resolvedCallouts count]) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  if ([(PKPrinterBonjourEndpoint *)self isIPPS]) {
    v5 = @"YES";
  }
  uint64_t v18 = toString([(PKPrinterBonjourEndpoint *)self provenance]);
  id v19 = [v14 stringWithFormat:@"%@ { \"%@\"(hasURL? %@, hasTXT? %@, resolving? %@, secure? %@, from? %@) }", v15, v16, v9, v13, v17, v5, v18];

  return (NSString *)v19;
}

+ (id)serviceFromEndpoint:(id)a3
{
  id v3 = a3;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_bonjour_service)
  {
    bonjour_service_nw_endpoint_type_t type = nw_endpoint_get_bonjour_service_type(v3);
    if (bonjour_service_type) {
      goto LABEL_6;
    }
  }
  v5 = nw_endpoint_copy_parent_endpoint();
  id v6 = v5;
  if (v5 && nw_endpoint_get_type(v5) == nw_endpoint_type_bonjour_service)
  {
    bonjour_service_nw_endpoint_type_t type = nw_endpoint_get_bonjour_service_type(v6);

    if (bonjour_service_type)
    {
LABEL_6:
      id v7 = [NSString stringWithUTF8String:bonjour_service_type];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)isIPPS
{
  resolvedURL = self->_resolvedURL;
  if (resolvedURL)
  {
    id v4 = [(NSURL *)resolvedURL scheme];
    if (([v4 isEqualToString:@"ipps"] & 1) == 0)
    {
      char v5 = [v4 isEqualToString:@"https"];
      goto LABEL_14;
    }
LABEL_3:
    char v5 = 1;
    goto LABEL_14;
  }
  id v4 = [(NWEndpoint *)self->_nwEndpoint copyCEndpoint];
  if (nw_endpoint_get_type(v4) == nw_endpoint_type_url)
  {
    url = nw_endpoint_get_url(v4);
    if (strncmp(url, "ipps:", 5uLL))
    {
      char v5 = strncmp(url, "https:", 6uLL) == 0;
      goto LABEL_14;
    }
    goto LABEL_3;
  }
  id v7 = +[PKPrinterBonjourEndpoint serviceFromEndpoint:v4];
  objc_super v8 = v7;
  if (v7)
  {
    if ([v7 hasPrefix:@"_ipps."]) {
      char v5 = 1;
    }
    else {
      char v5 = [v8 hasPrefix:@"_https."];
    }
  }
  else
  {
    char v5 = 0;
  }

LABEL_14:
  return v5;
}

- (void)withResolvedTXT:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = v4;
  if (self->_resolvedTXT)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__PKPrinterBonjourEndpoint_withResolvedTXT___block_invoke;
    v6[3] = &unk_2649EDD58;
    v6[4] = self;
    id v7 = v4;
    [(PKPrinterBonjourEndpoint *)self _resolveEndpoint:v6];
  }
}

uint64_t __44__PKPrinterBonjourEndpoint_withResolvedTXT___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32));
}

- (void)withResolvedURL:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = v4;
  if (self->_resolvedURL)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__PKPrinterBonjourEndpoint_withResolvedURL___block_invoke;
    v6[3] = &unk_2649EDD58;
    v6[4] = self;
    id v7 = v4;
    [(PKPrinterBonjourEndpoint *)self _resolveEndpoint:v6];
  }
}

uint64_t __44__PKPrinterBonjourEndpoint_withResolvedURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24));
}

- (void)_resolveEndpoint:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  resolvedCallouts = obj->_resolvedCallouts;
  id v6 = (void *)MEMORY[0x230FA9020](v4);

  if (resolvedCallouts)
  {
    uint64_t v7 = [(NSArray *)resolvedCallouts arrayByAddingObject:v6];
    objc_super v8 = obj->_resolvedCallouts;
    obj->_resolvedCallouts = (NSArray *)v7;

    objc_sync_exit(obj);
  }
  else
  {
    v16[0] = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v10 = obj->_resolvedCallouts;
    obj->_resolvedCallouts = (NSArray *)v9;

    objc_sync_exit(obj);
    if (objc_opt_respondsToSelector())
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke;
      v15[3] = &unk_2649EDD80;
      v15[4] = obj;
      [(PKPrinterBonjourEndpoint *)obj resolveWithinPrinterToolWithTimeout:v15 completionHandler:30.0];
    }
    else
    {
      id v11 = +[PKPrinterTool_Client sharedClient];
      nwEndpoint = obj->_nwEndpoint;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke_2;
      v14[3] = &unk_2649EDDA8;
      v14[4] = obj;
      [v11 endpointResolve:nwEndpoint timeout:v14 completionHandler:30.0];
    }
  }
}

void __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  char v5 = [v3 resolvedURL];
  id v6 = [v7 resolvedTXT];
  objc_msgSend(v4, "_resolve_finish_resolvedURL:resolvedTXT:", v5, v6);
}

uint64_t __45__PKPrinterBonjourEndpoint__resolveEndpoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolve_finish_resolvedURL:resolvedTXT:", a2, a3);
}

- (void)_resolve_finish_resolvedURL:(id)a3 resolvedTXT:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_resolvedURL, a3);
  objc_storeStrong((id *)&v9->_resolvedTXT, a4);
  if (!v9->_resolvedURL || !v9->_resolvedTXT)
  {
    uint64_t v10 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      nwEndpoint = v9->_nwEndpoint;
      int v14 = 138477827;
      id v15 = nwEndpoint;
      _os_log_impl(&dword_22EA54000, v10, OS_LOG_TYPE_ERROR, "Endpoint %{private}@ not completely resolved", (uint8_t *)&v14, 0xCu);
    }
  }
  resolvedCallouts = v9->_resolvedCallouts;
  v9->_resolvedCallouts = 0;
  uint64_t v13 = resolvedCallouts;

  objc_sync_exit(v9);
  [(NSArray *)v13 enumerateObjectsUsingBlock:&__block_literal_global_4];
}

void __68__PKPrinterBonjourEndpoint__resolve_finish_resolvedURL_resolvedTXT___block_invoke(uint64_t a1, void *a2)
{
  id v3 = dispatch_get_global_queue(0, 0);
  dispatch_async(v3, a2);
}

- (id)userCodableDictionary
{
  id v3 = objc_opt_new();
  id v4 = [(PKPrinterBonjourEndpoint *)self persistentNameRepresentationForPrintKitUI];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  char v5 = [(PKPrinterBonjourEndpoint *)self displayNameForPrintKitUI];
  [v3 setObject:v5 forKeyedSubscript:@"display-name"];

  if ([(PKPrinterBonjourEndpoint *)self isIPPS]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v3 setObject:v6 forKeyedSubscript:@"secure"];
  id v7 = toString([(PKPrinterBonjourEndpoint *)self provenance]);
  [v3 setObject:v7 forKeyedSubscript:@"source"];

  uint64_t v8 = [(PKPrinterBonjourEndpoint *)self provenanceIdentifier];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"nil";
  }
  [v3 setObject:v10 forKeyedSubscript:@"source-ident"];

  return v3;
}

- (int)provenance
{
  return self->_provenance;
}

- (NSString)provenanceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NWEndpoint)nwEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNwEndpoint:(id)a3
{
}

- (NSURL)resolvedURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResolvedURL:(id)a3
{
}

- (NSDictionary)resolvedTXT
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResolvedTXT:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenanceIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedTXT, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_nwEndpoint, 0);

  objc_storeStrong((id *)&self->_resolvedCallouts, 0);
}

@end