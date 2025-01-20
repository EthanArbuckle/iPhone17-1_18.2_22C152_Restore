@interface ICASSearchData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSearchData)initWithSearchSessionID:(id)a3;
- (NSString)searchSessionID;
- (id)toDict;
@end

@implementation ICASSearchData

- (ICASSearchData)initWithSearchSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSearchData;
  v6 = [(ICASSearchData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchSessionID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"searchSessionID";
  v3 = [(ICASSearchData *)self searchSessionID];
  if (v3)
  {
    uint64_t v4 = [(ICASSearchData *)self searchSessionID];
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

- (NSString)searchSessionID
{
  return self->_searchSessionID;
}

- (void).cxx_destruct
{
}

@end