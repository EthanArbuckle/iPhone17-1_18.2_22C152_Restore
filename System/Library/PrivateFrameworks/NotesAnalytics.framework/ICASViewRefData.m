@interface ICASViewRefData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASViewRefData)initWithLinkedNoteId:(id)a3;
- (NSString)linkedNoteId;
- (id)toDict;
@end

@implementation ICASViewRefData

- (ICASViewRefData)initWithLinkedNoteId:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASViewRefData;
  v6 = [(ICASViewRefData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_linkedNoteId, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"ViewRefData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"linkedNoteId";
  v3 = [(ICASViewRefData *)self linkedNoteId];
  if (v3)
  {
    uint64_t v4 = [(ICASViewRefData *)self linkedNoteId];
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

- (NSString)linkedNoteId
{
  return self->_linkedNoteId;
}

- (void).cxx_destruct
{
}

@end