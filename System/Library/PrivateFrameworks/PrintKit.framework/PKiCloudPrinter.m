@interface PKiCloudPrinter
+ (id)PKiCloudPrinterWithInfo:(id)a3;
+ (id)PKiCloudPrinterWithPKPrinter:(id)a3 displayName:(id)a4 location:(id)a5;
- (BOOL)isFromMCProfile;
- (NSArray)endPoints;
- (NSArray)printerURLs;
- (NSData)printerImageData;
- (NSDate)lastUsedDate;
- (NSDictionary)iCloudInfo;
- (NSString)displayName;
- (NSString)dnssdName;
- (NSString)location;
- (NSString)uuid;
- (id)userCodableDictionary;
- (int64_t)printerType;
- (void)setICloudInfo:(id)a3;
@end

@implementation PKiCloudPrinter

+ (id)PKiCloudPrinterWithInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKiCloudPrinter);
  [(PKiCloudPrinter *)v4 setICloudInfo:v3];

  return v4;
}

+ (id)PKiCloudPrinterWithPKPrinter:(id)a3 displayName:(id)a4 location:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = [v7 uuid];

  if (v11)
  {
    v12 = [v7 uuid];
    [v10 setObject:v12 forKeyedSubscript:@"printer-uuid"];
  }
  v13 = [v7 name];
  if (v13) {
    [v10 setObject:v13 forKeyedSubscript:@"printer-dns-sd-name"];
  }
  v14 = [v7 browseInfo];
  v15 = [v14 bonjourName];
  v16 = [v15 dataRepresentation];

  if (v16) {
    [v10 setObject:v16 forKeyedSubscript:@"com.apple.printer-endpoint-data"];
  }
  if (!v8)
  {
    id v8 = [v7 displayName];
  }
  if (v9 || ([v7 location], (id v9 = [v10 setObject:v8 forKeyedSubscript:@"com.apple.printkit.printer-display-name"]; {
    [v10 setObject:v9 forKeyedSubscript:@"com.apple.printkit.printer-location"];
  }
  v17 = [v7 printerURL];
  v18 = v17;
  if (v17)
  {
    v19 = [v17 absoluteString];
    [v10 setObject:v19 forKeyedSubscript:@"com.apple.printer-url"];
  }
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "type"));
  [v10 setObject:v20 forKeyedSubscript:@"com.apple.printer-type"];

  if ([v7 isFromMCProfile]) {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"com.apple.mcprofile-added"];
  }
  v21 = [v7 printerImageData];

  if (v21)
  {
    v22 = [v7 printerImageData];
    [v10 setObject:v22 forKeyedSubscript:@"com.apple.printkit.printer-image-data"];
  }
  v23 = +[PKiCloudPrinter PKiCloudPrinterWithInfo:v10];

  return v23;
}

- (NSString)uuid
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"printer-uuid"];

  return (NSString *)v3;
}

- (NSString)dnssdName
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"printer-dns-sd-name"];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.printer-display-name"];

  return (NSString *)v3;
}

- (NSString)location
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.printer-location"];

  return (NSString *)v3;
}

- (NSArray)printerURLs
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.printer-urls"];

  return (NSArray *)v3;
}

- (NSArray)endPoints
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.printer-endpoints"];

  return (NSArray *)v3;
}

- (NSDate)lastUsedDate
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.last-used-date"];

  return (NSDate *)v3;
}

- (int64_t)printerType
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printer-type"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isFromMCProfile
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.mcprofile-added"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSData)printerImageData
{
  v2 = [(PKiCloudPrinter *)self iCloudInfo];
  id v3 = [v2 objectForKeyedSubscript:@"com.apple.printkit.printer-image-data"];

  return (NSData *)v3;
}

- (id)userCodableDictionary
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = NSString;
  uint64_t v4 = [(PKiCloudPrinter *)self uuid];
  v5 = (void *)v4;
  v6 = @"UUID-MISSING";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  uint64_t v7 = [v3 stringWithFormat:@"PKiCloudPrinter{%@}", v6];

  uint64_t v52 = v7;
  v50[0] = @"displayName";
  v38 = (void *)v7;
  uint64_t v8 = [(PKiCloudPrinter *)self displayName];
  id v9 = @"none";
  v39 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"none";
  }
  v51[0] = v10;
  v50[1] = @"dnssdName";
  uint64_t v11 = [(PKiCloudPrinter *)self dnssdName];
  v40 = (void *)v11;
  if (v11) {
    v12 = (__CFString *)v11;
  }
  else {
    v12 = @"none";
  }
  v51[1] = v12;
  v50[2] = @"lastUsedDate";
  v44 = [(PKiCloudPrinter *)self lastUsedDate];
  if (v44)
  {
    v35 = [(PKiCloudPrinter *)self lastUsedDate];
    v13 = [v35 description];
  }
  else
  {
    v13 = @"none";
  }
  v37 = v13;
  v51[2] = v13;
  v50[3] = @"location";
  uint64_t v14 = [(PKiCloudPrinter *)self location];
  v41 = (void *)v14;
  if (v14) {
    v15 = (__CFString *)v14;
  }
  else {
    v15 = @"none";
  }
  v51[3] = v15;
  v50[4] = @"printerType";
  int64_t v16 = [(PKiCloudPrinter *)self printerType];
  if ((unint64_t)(v16 + 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_2649EE480[v16 + 1];
  }
  v42 = v17;
  v51[4] = v17;
  v50[5] = @"isFromMDM";
  BOOL v18 = [(PKiCloudPrinter *)self isFromMCProfile];
  v19 = @"NO";
  if (v18) {
    v19 = @"YES";
  }
  v51[5] = v19;
  v50[6] = @"imageData";
  v45 = [(PKiCloudPrinter *)self printerImageData];
  if (v45)
  {
    v20 = NSString;
    v36 = [(PKiCloudPrinter *)self printerImageData];
    objc_msgSend(v20, "stringWithFormat:", @"%d bytes", objc_msgSend(v36, "length"));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v51[6] = v9;
  v50[7] = @"printerURLs";
  v43 = [(PKiCloudPrinter *)self printerURLs];
  v51[7] = v43;
  v50[8] = @"endPoints";
  id v34 = [(PKiCloudPrinter *)self endPoints];
  v21 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = v34;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v27 = +[PKPrinterBonjourEndpoint endpointWithData:v26];
        v28 = v27;
        if (v27)
        {
          v29 = [v27 userCodableDictionary];
          [v21 addObject:v29];
        }
        else
        {
          v54 = @"ERROR: ";
          v29 = [v26 description];
          v55 = v29;
          v30 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          [v21 addObject:v30];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v23);
  }

  v51[8] = v21;
  v31 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:9];
  v53 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];

  if (v45)
  {
  }
  if (v44)
  {
  }

  return v32;
}

- (NSDictionary)iCloudInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setICloudInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end