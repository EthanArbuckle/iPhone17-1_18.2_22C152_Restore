@interface ICASFolderContentData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFolderContentData)initWithNoteCount:(id)a3;
- (NSNumber)noteCount;
- (id)toDict;
@end

@implementation ICASFolderContentData

- (ICASFolderContentData)initWithNoteCount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASFolderContentData;
  v6 = [(ICASFolderContentData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteCount, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"FolderContentData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"noteCount";
  v3 = [(ICASFolderContentData *)self noteCount];
  if (v3)
  {
    uint64_t v4 = [(ICASFolderContentData *)self noteCount];
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

- (NSNumber)noteCount
{
  return self->_noteCount;
}

- (void).cxx_destruct
{
}

@end