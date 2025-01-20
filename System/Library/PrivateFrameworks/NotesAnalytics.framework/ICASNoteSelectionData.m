@interface ICASNoteSelectionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteSelectionData)initWithNoteIDs:(id)a3;
- (NSArray)noteIDs;
- (id)toDict;
@end

@implementation ICASNoteSelectionData

- (ICASNoteSelectionData)initWithNoteIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASNoteSelectionData;
  v6 = [(ICASNoteSelectionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteIDs, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteSelectionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"noteIDs";
  v3 = [(ICASNoteSelectionData *)self noteIDs];
  if (v3)
  {
    uint64_t v4 = [(ICASNoteSelectionData *)self noteIDs];
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

- (NSArray)noteIDs
{
  return self->_noteIDs;
}

- (void).cxx_destruct
{
}

@end