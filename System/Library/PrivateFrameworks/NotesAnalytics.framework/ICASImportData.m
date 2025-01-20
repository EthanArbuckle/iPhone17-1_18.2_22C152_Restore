@interface ICASImportData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASImportData)initWithImportSummary:(id)a3;
- (NSArray)importSummary;
- (id)toDict;
@end

@implementation ICASImportData

- (ICASImportData)initWithImportSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASImportData;
  v6 = [(ICASImportData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_importSummary, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"ImportData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"importSummary";
  v3 = [(ICASImportData *)self importSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASImportData *)self importSummary];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (NSArray)importSummary
{
  return self->_importSummary;
}

- (void).cxx_destruct
{
}

@end