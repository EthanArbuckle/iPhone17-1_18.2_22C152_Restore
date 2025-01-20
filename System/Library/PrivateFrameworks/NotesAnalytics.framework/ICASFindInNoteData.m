@interface ICASFindInNoteData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFindInNoteData)initWithWasSearchQueryEntered:(id)a3;
- (NSNumber)wasSearchQueryEntered;
- (id)toDict;
@end

@implementation ICASFindInNoteData

- (ICASFindInNoteData)initWithWasSearchQueryEntered:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASFindInNoteData;
  v6 = [(ICASFindInNoteData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wasSearchQueryEntered, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"FindInNoteData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"wasSearchQueryEntered";
  v3 = [(ICASFindInNoteData *)self wasSearchQueryEntered];
  if (v3)
  {
    uint64_t v4 = [(ICASFindInNoteData *)self wasSearchQueryEntered];
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

- (NSNumber)wasSearchQueryEntered
{
  return self->_wasSearchQueryEntered;
}

- (void).cxx_destruct
{
}

@end