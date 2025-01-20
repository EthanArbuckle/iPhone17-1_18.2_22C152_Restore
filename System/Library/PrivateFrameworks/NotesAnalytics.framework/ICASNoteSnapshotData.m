@interface ICASNoteSnapshotData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteSnapshotData)initWithNoteSnapshotSummary:(id)a3;
- (NSArray)noteSnapshotSummary;
- (id)toDict;
@end

@implementation ICASNoteSnapshotData

- (ICASNoteSnapshotData)initWithNoteSnapshotSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASNoteSnapshotData;
  v6 = [(ICASNoteSnapshotData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteSnapshotSummary, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteSnapshotData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"noteSnapshotSummary";
  v3 = [(ICASNoteSnapshotData *)self noteSnapshotSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASNoteSnapshotData *)self noteSnapshotSummary];
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

- (NSArray)noteSnapshotSummary
{
  return self->_noteSnapshotSummary;
}

- (void).cxx_destruct
{
}

@end