@interface PKTXTRecord
+ (BOOL)supportsSecureCoding;
+ (id)txtRecordDictionaryForTxtRecord:(id)a3;
- (NSArray)pageDescriptions;
- (NSArray)printerKind;
- (NSArray)urfCapabilities;
- (NSString)authInfoRequired;
- (NSString)location;
- (NSString)optionPaperMax;
- (NSString)printerProduct;
- (NSString)printerType;
- (NSString)resourcePath;
- (NSString)versionString;
- (NSURL)adminURL;
- (NSUUID)UUID;
- (PKTXTRecord)initWithCoder:(id)a3;
- (PKTXTRecord)initWithDictionary:(id)a3;
- (PKTXTRecord)initWithNWTXTRecord:(id)a3;
- (PKTXTRecord)initWithTXTRecordData:(id)a3;
- (id)_checkMake:(id)a3 propertyName:(id)a4 maker:(id)a5;
- (id)_checkMakeString:(id)a3 propertyName:(id)a4;
- (id)_checkMakeStringArray:(id)a3 propertyName:(id)a4;
- (id)_checkMakeURL:(id)a3 propertyName:(id)a4;
- (id)_checkMakeUUID:(id)a3 propertyName:(id)a4;
- (id)_initWithLowercasedDictionary:(id)a3;
- (id)_stringValueForKey:(id)a3;
- (id)_wrapProduct:(id)a3;
- (int64_t)_checkMakeInt:(id)a3 propertyName:(id)a4;
- (int64_t)optionPriority;
- (int64_t)optionPunch;
- (int64_t)optionQueueTotal;
- (unint64_t)_checkMakeAvail:(id)a3 propertyName:(id)a4;
- (unint64_t)supportsBind;
- (unint64_t)supportsCollate;
- (unint64_t)supportsColor;
- (unint64_t)supportsCopies;
- (unint64_t)supportsDuplex;
- (unint64_t)supportsFax;
- (unint64_t)supportsScan;
- (unint64_t)supportsSort;
- (unint64_t)supportsStaple;
- (unsigned)_checkMakeTLS:(id)a3 propertyName:(id)a4;
- (unsigned)tlsVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKTXTRecord

+ (id)txtRecordDictionaryForTxtRecord:(id)a3
{
  v3 = a3;
  v4 = objc_opt_new();
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __47__PKTXTRecord_txtRecordDictionaryForTxtRecord___block_invoke;
  applier[3] = &unk_2649EF4A0;
  id v5 = v4;
  id v8 = v5;
  nw_txt_record_apply(v3, applier);

  return v5;
}

uint64_t __47__PKTXTRecord_txtRecordDictionaryForTxtRecord___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = [NSString stringWithUTF8String:a2];
  v9 = [v8 lowercaseString];

  v10 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:4];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];

  return 1;
}

- (id)_initWithLowercasedDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTXTRecord;
  id v5 = [(PKTXTRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringDict = v5->_stringDict;
    v5->_stringDict = (NSDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    seenDict = v5->_seenDict;
    v5->_seenDict = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (PKTXTRecord)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v11 = [v4 objectForKey:v10];
        v12 = [v10 lowercaseString];
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = [(PKTXTRecord *)self _initWithLowercasedDictionary:v5];
  return v13;
}

- (PKTXTRecord)initWithTXTRecordData:(id)a3
{
  id v4 = [MEMORY[0x263EFC5F0] dictionaryFromTXTRecordData:a3];
  id v5 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__PKTXTRecord_initWithTXTRecordData___block_invoke;
  v9[3] = &unk_2649EF4C8;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = [(PKTXTRecord *)self initWithDictionary:v6];

  return v7;
}

void __37__PKTXTRecord_initWithTXTRecordData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [NSString alloc];
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "initWithBytes:length:encoding:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 4);
  [*(id *)(a1 + 32) setObject:v8 forKey:v9];
}

- (PKTXTRecord)initWithNWTXTRecord:(id)a3
{
  id v4 = +[PKTXTRecord txtRecordDictionaryForTxtRecord:a3];
  id v5 = [(PKTXTRecord *)self _initWithLowercasedDictionary:v4];

  return v5;
}

- (PKTXTRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"txtDict"];
  id v7 = [(PKTXTRecord *)self initWithDictionary:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_stringValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lowercaseString];
  if (([v5 isEqualToString:v4] & 1) == 0) {
    __assert_rtn("-[PKTXTRecord _stringValueForKey:]", "PKTXTRecord.m", 89, "[[key lowercaseString] isEqualToString:key]");
  }

  id v6 = [(NSDictionary *)self->_stringDict objectForKey:v4];

  return v6;
}

- (id)_checkMake:(id)a3 propertyName:(id)a4 maker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  objc_super v11 = [(NSMutableDictionary *)self->_seenDict objectForKeyedSubscript:v9];
  if (!v11)
  {
    v12 = [(PKTXTRecord *)self _stringValueForKey:v8];
    if (!v12 || (v10[2](v10, v12), (objc_super v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v11 = [MEMORY[0x263EFF9D0] null];
    }
    [(NSMutableDictionary *)self->_seenDict setObject:v11 forKeyedSubscript:v9];
  }
  v13 = [MEMORY[0x263EFF9D0] null];

  if (v11 == v13) {
    id v14 = 0;
  }
  else {
    id v14 = v11;
  }

  return v14;
}

- (int64_t)_checkMakeInt:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_12];
  uint64_t v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

id __42__PKTXTRecord__checkMakeInt_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "integerValue"));

  return v3;
}

- (id)_checkMakeString:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_13];

  return v4;
}

id __45__PKTXTRecord__checkMakeString_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)_checkMakeStringArray:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_16_0];

  return v4;
}

id __50__PKTXTRecord__checkMakeStringArray_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 componentsSeparatedByString:@","];

  return v2;
}

- (unint64_t)_checkMakeAvail:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_21_0];
  uint64_t v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 BOOLValue];
  }
  else {
    unint64_t v6 = 2;
  }

  return v6;
}

id __44__PKTXTRecord__checkMakeAvail_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  v3 = [a2 lowercaseString];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isEqualToString:", @"t"));

  return v4;
}

- (id)_checkMakeUUID:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_27];

  return v4;
}

id __43__PKTXTRecord__checkMakeUUID_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];

  return v3;
}

- (id)_checkMakeURL:(id)a3 propertyName:(id)a4
{
  id v4 = [(PKTXTRecord *)self _checkMake:a3 propertyName:a4 maker:&__block_literal_global_31];

  return v4;
}

id __42__PKTXTRecord__checkMakeURL_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = PKURLWithString(a2);

  return v2;
}

- (unsigned)_checkMakeTLS:(id)a3 propertyName:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKTXTRecord *)self _checkMakeString:v6 propertyName:v7];
  id v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  if (([v8 isEqualToString:@"1.1"] & 1) == 0)
  {
    if ([v9 isEqualToString:@"1.2"])
    {
      unsigned __int16 v10 = 771;
      goto LABEL_12;
    }
    if ([v9 isEqualToString:@"1.3"])
    {
      unsigned __int16 v10 = 772;
      goto LABEL_12;
    }
    objc_super v11 = _PKLogCategory(PKLogCategoryNetwork[0]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_22EA54000, v11, OS_LOG_TYPE_ERROR, "Unknown tls level '%{public}@', returning 0", (uint8_t *)&v13, 0xCu);
    }

LABEL_11:
    unsigned __int16 v10 = 0;
    goto LABEL_12;
  }
  unsigned __int16 v10 = 770;
LABEL_12:

  return v10;
}

- (id)_wrapProduct:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [(PKTXTRecord *)self printerType];
    if (v5)
    {
      id v4 = [NSString stringWithFormat:@"(%@)", v5];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (unint64_t)supportsColor
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Color" propertyName:@"supportsColor"];
}

- (unint64_t)supportsDuplex
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Duplex" propertyName:@"supportsDuplex"];
}

- (unint64_t)supportsStaple
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Staple" propertyName:@"supportsStaple"];
}

- (unint64_t)supportsCopies
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Copies" propertyName:@"supportsCopies"];
}

- (unint64_t)supportsCollate
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Collate" propertyName:@"supportsCollate"];
}

- (unint64_t)supportsBind
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Bind" propertyName:@"supportsBind"];
}

- (unint64_t)supportsSort
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Sort" propertyName:@"supportsSort"];
}

- (unint64_t)supportsScan
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Scan" propertyName:@"supportsScan"];
}

- (unint64_t)supportsFax
{
  return [(PKTXTRecord *)self _checkMakeAvail:@"Fax" propertyName:@"supportsFax"];
}

- (int64_t)optionPunch
{
  return [(PKTXTRecord *)self _checkMakeInt:@"Punch" propertyName:@"optionPunch"];
}

- (int64_t)optionPriority
{
  return [(PKTXTRecord *)self _checkMakeInt:@"Priority" propertyName:@"optionPriority"];
}

- (int64_t)optionQueueTotal
{
  return [(PKTXTRecord *)self _checkMakeInt:@"qtotal" propertyName:@"optionQueueTotal"];
}

- (NSString)optionPaperMax
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"PaperMax" propertyName:@"optionPaperMax"];
}

- (NSString)versionString
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"vers" propertyName:@"versionString"];
}

- (NSString)resourcePath
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"rp" propertyName:@"resourcePath"];
}

- (NSString)printerType
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"type" propertyName:@"printerType"];
}

- (NSString)location
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"note" propertyName:@"location"];
}

- (unsigned)tlsVersion
{
  return [(PKTXTRecord *)self _checkMakeTLS:@"TLS" propertyName:@"tlsVersion"];
}

- (NSURL)adminURL
{
  return (NSURL *)[(PKTXTRecord *)self _checkMakeURL:@"adminurl" propertyName:@"adminURL"];
}

- (NSString)printerProduct
{
  v3 = [(PKTXTRecord *)self _checkMakeString:@"product" propertyName:@"printerProduct"];
  id v4 = [(PKTXTRecord *)self _wrapProduct:v3];

  return (NSString *)v4;
}

- (NSArray)printerKind
{
  return (NSArray *)[(PKTXTRecord *)self _checkMakeStringArray:@"kind" propertyName:@"printerKind"];
}

- (NSArray)pageDescriptions
{
  return (NSArray *)[(PKTXTRecord *)self _checkMakeStringArray:@"pdl" propertyName:@"pageDescriptions"];
}

- (NSArray)urfCapabilities
{
  return (NSArray *)[(PKTXTRecord *)self _checkMakeStringArray:@"urf" propertyName:@"urfCapabilities"];
}

- (NSUUID)UUID
{
  return (NSUUID *)[(PKTXTRecord *)self _checkMakeUUID:@"uuid" propertyName:@"UUID"];
}

- (NSString)authInfoRequired
{
  return (NSString *)[(PKTXTRecord *)self _checkMakeString:@"air" propertyName:@"authInfoRequired"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenDict, 0);

  objc_storeStrong((id *)&self->_stringDict, 0);
}

@end