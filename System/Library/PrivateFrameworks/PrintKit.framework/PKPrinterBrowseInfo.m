@interface PKPrinterBrowseInfo
+ (BOOL)supportsSecureCoding;
+ (int)rollCacheGeneration;
+ (void)findPrinterWithBonjourEndpoint:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5;
- (BOOL)isEphemeral;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBrowseInfo:(id)a3;
- (BOOL)isIPPS;
- (NSDictionary)txtRecord;
- (NSString)debugDescription;
- (NSString)location;
- (NSString)makeAndModel;
- (NSURL)printerURL;
- (NSUUID)btleUUID;
- (NSUUID)uuid;
- (PKPrinterBonjourEndpoint)bonjourName;
- (PKPrinterBrowseInfo)initWithBonjourName:(id)a3 txtRecord:(id)a4;
- (PKPrinterBrowseInfo)initWithCoder:(id)a3;
- (PKPrinterBrowseInfo)initWithResolvedBonjourName:(id)a3;
- (id)txtRecordObjectForKey:(id)a3;
- (id)userCodableDictionary;
- (int64_t)btleMeasuredPower;
- (int64_t)compare:(id)a3;
- (int64_t)proximity;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)resolveOnMainQueue:(id)a3;
- (void)setBtleMeasuredPower:(int64_t)a3;
- (void)setBtleUUID:(id)a3;
- (void)setProximity:(int64_t)a3;
@end

@implementation PKPrinterBrowseInfo

- (PKPrinterBrowseInfo)initWithBonjourName:(id)a3 txtRecord:(id)a4
{
  id v7 = a3;
  v8 = (NSDictionary *)a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPrinterBrowseInfo;
  v9 = [(PKPrinterBrowseInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bonjourName, a3);
    uint64_t v11 = dictionaryWithLowercasedKeys(v8);
    txtRecord = v10->_txtRecord;
    v10->_txtRecord = (NSDictionary *)v11;
  }
  return v10;
}

- (PKPrinterBrowseInfo)initWithResolvedBonjourName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPrinterBrowseInfo;
  v6 = [(PKPrinterBrowseInfo *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bonjourName, a3);
    uint64_t v8 = [v5 resolvedTXT];
    txtRecord = v7->_txtRecord;
    v7->_txtRecord = (NSDictionary *)v8;
  }
  return v7;
}

- (NSURL)printerURL
{
  v3 = self->_bonjourName;
  v4 = self;
  if (object_isClass(v4)) {
    [NSString stringWithUTF8String:"-[PKPrinterBrowseInfo printerURL]"];
  }
  else {
  id v5 = [NSString stringWithFormat:@"%@<%p>: %s", objc_opt_class(), v4, "-[PKPrinterBrowseInfo printerURL]"];
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__PKPrinterBrowseInfo_printerURL__block_invoke;
  v9[3] = &unk_2649EDEC0;
  v6 = v3;
  v10 = v6;
  id v7 = withDebuggableSemaphore<NSURL * {__strong}>(v5, v9, 10.0);

  return (NSURL *)v7;
}

uint64_t __33__PKPrinterBrowseInfo_printerURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) withResolvedURL:a2];
}

- (PKPrinterBrowseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPrinterBrowseInfo;
  id v5 = [(PKPrinterBrowseInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bonjourName"];
    bonjourName = v5->_bonjourName;
    v5->_bonjourName = (PKPrinterBonjourEndpoint *)v6;

    if ([v4 containsValueForKey:@"txt"])
    {
      uint64_t v8 = objc_opt_class();
      v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"txt"];
      uint64_t v10 = dictionaryWithLowercasedKeys(v9);
      txtRecord = v5->_txtRecord;
      v5->_txtRecord = (NSDictionary *)v10;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_bonjourName forKey:@"bonjourName"];
  txtRecord = self->_txtRecord;
  if (txtRecord) {
    [v5 encodeObject:txtRecord forKey:@"txt"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PKPrinterBrowseInfo *)self isEqualToBrowseInfo:v4];

  return v5;
}

- (BOOL)isEphemeral
{
  v2 = [(PKPrinterBrowseInfo *)self bonjourName];
  int v3 = [v2 provenance];

  return ((v3 - 16) & 0xFFFFFFEF) == 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  while (2)
  {
    switch(v5)
    {
      case 0:
        uint64_t v6 = [(PKPrinterBrowseInfo *)self bonjourName];
        id v7 = [(NSDictionary *)v6 displayNameForPrintKitUI];
        uint64_t v8 = [v4 bonjourName];
        v9 = [v8 displayNameForPrintKitUI];
        uint64_t v10 = [v7 compare:v9];
        goto LABEL_16;
      case 1:
        int v11 = [(PKPrinterBrowseInfo *)self isIPPS];
        int v12 = [v4 isIPPS];
        if ((v11 & (v12 ^ 1)) != 0) {
          uint64_t v13 = -1;
        }
        else {
          uint64_t v13 = 1;
        }
        if (v11 != v12) {
          int64_t v14 = v13;
        }
        else {
          int64_t v14 = 0;
        }
        goto LABEL_55;
      case 2:
        v15 = [(PKPrinterBrowseInfo *)self bonjourName];
        int v16 = [v15 provenance];
        v17 = [v4 bonjourName];
        int v18 = [v17 provenance];
        int v19 = v16 - 1;
        if (v16 - 1) < 8 && ((0x8Bu >> v19)) {
          unint64_t v20 = qword_22EAA1BE0[v19];
        }
        else {
          unint64_t v20 = (10 * v16 + 100);
        }
        int v31 = v18 - 1;
        if (v18 - 1) < 8 && ((0x8Bu >> v31)) {
          unint64_t v32 = qword_22EAA1BE0[v31];
        }
        else {
          unint64_t v32 = (10 * v18 + 100);
        }

        if (v20 == v32)
        {
          v33 = [(PKPrinterBrowseInfo *)self bonjourName];
          v34 = [v33 provenanceIdentifier];
          v35 = [v4 bonjourName];
          v36 = [v35 provenanceIdentifier];
          id v37 = v34;
          id v38 = v36;
          v39 = v38;
          if (v37 && v38)
          {
            int64_t v14 = [v37 compare:v38];
          }
          else if (!v37 || v38)
          {
            if (v37) {
              BOOL v40 = 1;
            }
            else {
              BOOL v40 = v38 == 0;
            }
            int64_t v14 = !v40;
          }
          else
          {
            int64_t v14 = -1;
          }

LABEL_55:
          ++v5;
          if (v14) {
            goto LABEL_56;
          }
          continue;
        }
        if (v20 < v32) {
          int64_t v14 = -1;
        }
        else {
          int64_t v14 = 1;
        }
LABEL_56:

        return v14;
      case 3:
        unint64_t v21 = [(PKPrinterBrowseInfo *)self type];
        unint64_t v22 = [v4 type];
        if (v21 > 3) {
          unint64_t v23 = 100;
        }
        else {
          unint64_t v23 = qword_22EAA1C20[v21];
        }
        if (v22 > 3) {
          unint64_t v28 = 100;
        }
        else {
          unint64_t v28 = qword_22EAA1C20[v22];
        }
        BOOL v29 = v23 == v28;
        if (v23 < v28) {
          uint64_t v30 = -1;
        }
        else {
          uint64_t v30 = 1;
        }
        if (v29) {
          int64_t v14 = 0;
        }
        else {
          int64_t v14 = v30;
        }
        goto LABEL_55;
      case 4:
        uint64_t v6 = [(PKPrinterBrowseInfo *)self bonjourName];
        id v7 = [(NSDictionary *)v6 persistentNameRepresentationForPrintKitUI];
        uint64_t v8 = [v4 bonjourName];
        v9 = [v8 persistentNameRepresentationForPrintKitUI];
        uint64_t v10 = [v7 compare:v9 options:1];
LABEL_16:
        int64_t v14 = v10;

        goto LABEL_25;
      case 5:
        v24 = (void *)v4[3];
        uint64_t v6 = self->_txtRecord;
        id v7 = v24;
        if ([(NSDictionary *)v6 isEqualToDictionary:v7])
        {
          int64_t v14 = 0;
        }
        else
        {
          unint64_t v25 = [(NSDictionary *)v6 hash];
          unint64_t v26 = [v7 hash];
          if (v25 < v26) {
            uint64_t v27 = -1;
          }
          else {
            uint64_t v27 = 1;
          }
          if (v25 == v26) {
            int64_t v14 = 0;
          }
          else {
            int64_t v14 = v27;
          }
        }
LABEL_25:

        goto LABEL_55;
      default:
        int64_t v14 = 0;
        goto LABEL_56;
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3 = 0;
  uint64_t v4 = 65537;
  while (1)
  {
    unint64_t v5 = v4 << v3;
    switch(v3)
    {
      case 0:
        uint64_t v6 = [(PKPrinterBrowseInfo *)self bonjourName];
        id v7 = [v6 displayNameForPrintKitUI];
        uint64_t v8 = [v7 hash];
        goto LABEL_8;
      case 1:
        uint64_t v4 = v5 + [(PKPrinterBrowseInfo *)self isIPPS];
        break;
      case 2:
        v9 = [(PKPrinterBrowseInfo *)self bonjourName];
        int v10 = [v9 provenance];
        int v11 = v10 - 1;
        if (v10 - 1) < 8 && ((0x8Bu >> v11)) {
          uint64_t v12 = qword_22EAA1BE0[v11];
        }
        else {
          uint64_t v12 = (10 * v10 + 100);
        }

        uint64_t v6 = [(PKPrinterBrowseInfo *)self bonjourName];
        id v7 = [v6 provenanceIdentifier];
        uint64_t v4 = v12 + v5 + [v7 hash];
        goto LABEL_17;
      case 3:
        unint64_t v13 = [(PKPrinterBrowseInfo *)self type];
        if (v13 > 3) {
          uint64_t v14 = 100;
        }
        else {
          uint64_t v14 = qword_22EAA1C20[v13];
        }
        uint64_t v4 = v14 + v5;
        break;
      case 4:
        uint64_t v6 = [(PKPrinterBrowseInfo *)self bonjourName];
        id v7 = [v6 persistentNameRepresentationForPrintKitUI];
        uint64_t v8 = [v7 hash];
LABEL_8:
        uint64_t v4 = v8 + v5;
LABEL_17:

        break;
      case 5:
        uint64_t v4 = [(NSDictionary *)self->_txtRecord hash] + v5;
        break;
      default:
        return v5;
    }
    ++v3;
  }
}

- (BOOL)isEqualToBrowseInfo:(id)a3
{
  return [(PKPrinterBrowseInfo *)self compare:a3] == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)txtRecordObjectForKey:(id)a3
{
  txtRecord = self->_txtRecord;
  uint64_t v4 = [a3 lowercaseString];
  unint64_t v5 = [(NSDictionary *)txtRecord objectForKeyedSubscript:v4];

  return v5;
}

- (int64_t)type
{
  if (self->_txtRecord)
  {
    uint64_t v3 = [(PKPrinterBrowseInfo *)self txtRecordObjectForKey:@"Color"];
    uint64_t v4 = [(PKPrinterBrowseInfo *)self txtRecordObjectForKey:@"Duplex"];
    unint64_t v5 = [(PKPrinterBrowseInfo *)self txtRecordObjectForKey:@"product"];
    if (v3 && ([v3 isEqual:@"T"] & 1) != 0)
    {
      int64_t v6 = 1;
      if (!v4) {
        goto LABEL_13;
      }
    }
    else if (v5)
    {
      int64_t v6 = [v5 rangeOfString:@"Color"] != 0x7FFFFFFFFFFFFFFFLL;
      if (!v4) {
        goto LABEL_13;
      }
    }
    else
    {
      int64_t v6 = 0;
      if (!v4)
      {
LABEL_13:

        return v6;
      }
    }
    if ([v4 isEqual:@"T"]) {
      v6 |= 2uLL;
    }
    goto LABEL_13;
  }
  return -1;
}

- (NSUUID)uuid
{
  cachedUUID = self->_cachedUUID;
  if (!cachedUUID)
  {
    uint64_t v4 = [(PKPrinterBrowseInfo *)self txtRecordObjectForKey:@"UUID"];
    if (!v4 || (unint64_t v5 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4]) == 0)
    {
      int64_t v6 = [(PKPrinterBrowseInfo *)self btleUUID];

      if (!v6
        || ([(PKPrinterBrowseInfo *)self btleUUID],
            (unint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        unint64_t v5 = [MEMORY[0x263F08C38] UUID];
      }
    }
    id v7 = self->_cachedUUID;
    self->_cachedUUID = v5;

    cachedUUID = self->_cachedUUID;
  }

  return cachedUUID;
}

- (BOOL)isIPPS
{
  v2 = [(PKPrinterBrowseInfo *)self bonjourName];
  char v3 = [v2 isIPPS];

  return v3;
}

- (NSString)makeAndModel
{
  v2 = [(NSDictionary *)self->_txtRecord objectForKey:@"product"];
  char v3 = v2;
  if (v2
    && objc_msgSend(v2, "hasPrefix:", @"(")
    && [v3 hasSuffix:@""]))
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);

    char v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (NSString)location
{
  return (NSString *)[(NSDictionary *)self->_txtRecord objectForKey:@"note"];
}

- (NSString)debugDescription
{
  char v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PKPrinterBrowseInfo;
  uint64_t v4 = [(PKPrinterBrowseInfo *)&v9 description];
  unint64_t v5 = [(PKPrinterBrowseInfo *)self bonjourName];
  int64_t v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"%@ { %@ }", v4, v6];

  return (NSString *)v7;
}

- (id)userCodableDictionary
{
  char v3 = objc_opt_new();
  uint64_t v4 = [(PKPrinterBrowseInfo *)self txtRecord];
  [v3 setObject:v4 forKeyedSubscript:@"txt"];

  return v3;
}

- (PKPrinterBonjourEndpoint)bonjourName
{
  return (PKPrinterBonjourEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)txtRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)btleUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBtleUUID:(id)a3
{
}

- (int64_t)btleMeasuredPower
{
  return self->_btleMeasuredPower;
}

- (void)setBtleMeasuredPower:(int64_t)a3
{
  self->_btleMeasuredPower = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btleUUID, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);

  objc_storeStrong((id *)&self->_cachedUUID, 0);
}

+ (int)rollCacheGeneration
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  int v3 = gPrinterCacheGeneration++;
  objc_sync_exit(v2);

  return v3;
}

- (void)resolveOnMainQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(PKPrinterBrowseInfo *)self bonjourName];
  if (!v5) {
    __assert_rtn("-[PKPrinterBrowseInfo(PrintKit) resolveOnMainQueue:]", "PKPrinterBrowseInfo.mm", 434, "self.bonjourName != nil");
  }

  if (!self->_txtRecord) {
    __assert_rtn("-[PKPrinterBrowseInfo(PrintKit) resolveOnMainQueue:]", "PKPrinterBrowseInfo.mm", 435, "_txtRecord != nil");
  }
  int64_t v6 = findOrMakePrinter(self);
  id v7 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(PKPrinterBrowseInfo *)self bonjourName];
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_22EA54000, v7, OS_LOG_TYPE_DEFAULT, "existing info %@ resolved as %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__PKPrinterBrowseInfo_PrintKit__resolveOnMainQueue___block_invoke;
  v11[3] = &unk_2649EDD58;
  id v12 = v6;
  id v13 = v4;
  id v9 = v6;
  id v10 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __52__PKPrinterBrowseInfo_PrintKit__resolveOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)findPrinterWithBonjourEndpoint:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[PKPrinterTool_Client sharedClient];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__PKPrinterBrowseInfo_PrintKit__findPrinterWithBonjourEndpoint_withTimeout_completionHandler___block_invoke;
  v12[3] = &unk_2649EF538;
  id v10 = v8;
  id v14 = v10;
  id v11 = v7;
  id v13 = v11;
  [v9 browseInfoForPrinter:v11 timeout:v12 completionHandler:a4];
}

void __94__PKPrinterBrowseInfo_PrintKit__findPrinterWithBonjourEndpoint_withTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = findOrMakePrinter(v3);
    int64_t v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_DEFAULT, "%@ resolved as %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end