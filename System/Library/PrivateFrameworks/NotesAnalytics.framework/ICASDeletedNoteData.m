@interface ICASDeletedNoteData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDeletedNoteData)initWithDeletedNoteCount:(id)a3;
- (NSNumber)deletedNoteCount;
- (id)toDict;
@end

@implementation ICASDeletedNoteData

- (ICASDeletedNoteData)initWithDeletedNoteCount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASDeletedNoteData;
  v6 = [(ICASDeletedNoteData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deletedNoteCount, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"DeletedNoteData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"deletedNoteCount";
  v3 = [(ICASDeletedNoteData *)self deletedNoteCount];
  if (v3)
  {
    uint64_t v4 = [(ICASDeletedNoteData *)self deletedNoteCount];
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

- (NSNumber)deletedNoteCount
{
  return self->_deletedNoteCount;
}

- (void).cxx_destruct
{
}

@end