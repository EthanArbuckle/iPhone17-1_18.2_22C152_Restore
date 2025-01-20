@interface ICASEndDocScanPageData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndDocScanPageData)initWithEndPageCount:(id)a3;
- (NSNumber)endPageCount;
- (id)toDict;
@end

@implementation ICASEndDocScanPageData

- (ICASEndDocScanPageData)initWithEndPageCount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASEndDocScanPageData;
  v6 = [(ICASEndDocScanPageData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endPageCount, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"EndDocScanPageData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"endPageCount";
  v3 = [(ICASEndDocScanPageData *)self endPageCount];
  if (v3)
  {
    uint64_t v4 = [(ICASEndDocScanPageData *)self endPageCount];
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

- (NSNumber)endPageCount
{
  return self->_endPageCount;
}

- (void).cxx_destruct
{
}

@end