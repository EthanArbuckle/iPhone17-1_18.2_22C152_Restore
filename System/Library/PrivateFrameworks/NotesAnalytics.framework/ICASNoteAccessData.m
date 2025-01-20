@interface ICASNoteAccessData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationStatus)collaborationStatus;
- (ICASCollaborationType)collaborationType;
- (ICASNoteAccessData)initWithIsPasswordProtected:(id)a3 isPinned:(id)a4 collaborationStatus:(id)a5 collaborationType:(id)a6;
- (NSNumber)isPasswordProtected;
- (NSNumber)isPinned;
- (id)toDict;
@end

@implementation ICASNoteAccessData

- (ICASNoteAccessData)initWithIsPasswordProtected:(id)a3 isPinned:(id)a4 collaborationStatus:(id)a5 collaborationType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASNoteAccessData;
  v15 = [(ICASNoteAccessData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_isPasswordProtected, a3);
    objc_storeStrong((id *)&v16->_isPinned, a4);
    objc_storeStrong((id *)&v16->_collaborationStatus, a5);
    objc_storeStrong((id *)&v16->_collaborationType, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteAccessData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"isPasswordProtected";
  v3 = [(ICASNoteAccessData *)self isPasswordProtected];
  if (v3)
  {
    uint64_t v4 = [(ICASNoteAccessData *)self isPasswordProtected];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"isPinned";
  v6 = [(ICASNoteAccessData *)self isPinned];
  if (v6)
  {
    uint64_t v7 = [(ICASNoteAccessData *)self isPinned];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"collaborationStatus";
  v9 = [(ICASNoteAccessData *)self collaborationStatus];
  if (v9)
  {
    uint64_t v10 = [(ICASNoteAccessData *)self collaborationStatus];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"collaborationType";
  id v12 = [(ICASNoteAccessData *)self collaborationType];
  if (v12)
  {
    uint64_t v13 = [(ICASNoteAccessData *)self collaborationType];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)isPasswordProtected
{
  return self->_isPasswordProtected;
}

- (NSNumber)isPinned
{
  return self->_isPinned;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_isPinned, 0);
  objc_storeStrong((id *)&self->_isPasswordProtected, 0);
}

@end