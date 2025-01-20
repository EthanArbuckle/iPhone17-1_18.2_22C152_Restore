@interface ICASNoteEditData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteEditContext)noteEditContext;
- (ICASNoteEditData)initWithNoteEditContext:(id)a3;
- (id)toDict;
@end

@implementation ICASNoteEditData

- (ICASNoteEditData)initWithNoteEditContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASNoteEditData;
  v6 = [(ICASNoteEditData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteEditContext, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteEditData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"noteEditContext";
  v3 = [(ICASNoteEditData *)self noteEditContext];
  if (v3)
  {
    uint64_t v4 = [(ICASNoteEditData *)self noteEditContext];
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

- (ICASNoteEditContext)noteEditContext
{
  return self->_noteEditContext;
}

- (void).cxx_destruct
{
}

@end