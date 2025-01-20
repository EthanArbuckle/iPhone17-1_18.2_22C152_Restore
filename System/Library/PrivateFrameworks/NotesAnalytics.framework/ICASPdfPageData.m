@interface ICASPdfPageData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPdfPageData)initWithStartPageCount:(id)a3 endPageCount:(id)a4;
- (NSNumber)endPageCount;
- (NSNumber)startPageCount;
- (id)toDict;
@end

@implementation ICASPdfPageData

- (ICASPdfPageData)initWithStartPageCount:(id)a3 endPageCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPdfPageData;
  v9 = [(ICASPdfPageData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startPageCount, a3);
    objc_storeStrong((id *)&v10->_endPageCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PdfPageData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"startPageCount";
  v3 = [(ICASPdfPageData *)self startPageCount];
  if (v3)
  {
    uint64_t v4 = [(ICASPdfPageData *)self startPageCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"endPageCount";
  v12[0] = v4;
  v6 = [(ICASPdfPageData *)self endPageCount];
  if (v6)
  {
    uint64_t v7 = [(ICASPdfPageData *)self endPageCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)startPageCount
{
  return self->_startPageCount;
}

- (NSNumber)endPageCount
{
  return self->_endPageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPageCount, 0);
  objc_storeStrong((id *)&self->_startPageCount, 0);
}

@end