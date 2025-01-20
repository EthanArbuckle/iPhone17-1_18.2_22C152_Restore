@interface ICASFolderData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationStatus)collaborationStatus;
- (ICASCollaborationType)collaborationType;
- (ICASFolderData)initWithFolderID:(id)a3 folderType:(id)a4 folderLabelType:(id)a5 subFolderLevel:(id)a6 collaborationStatus:(id)a7 collaborationType:(id)a8;
- (ICASFolderLabelType)folderLabelType;
- (ICASFolderType)folderType;
- (NSNumber)subFolderLevel;
- (NSString)folderID;
- (id)toDict;
@end

@implementation ICASFolderData

- (ICASFolderData)initWithFolderID:(id)a3 folderType:(id)a4 folderLabelType:(id)a5 subFolderLevel:(id)a6 collaborationStatus:(id)a7 collaborationType:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASFolderData;
  v18 = [(ICASFolderData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_folderID, a3);
    objc_storeStrong((id *)&v19->_folderType, a4);
    objc_storeStrong((id *)&v19->_folderLabelType, a5);
    objc_storeStrong((id *)&v19->_subFolderLevel, a6);
    objc_storeStrong((id *)&v19->_collaborationStatus, a7);
    objc_storeStrong((id *)&v19->_collaborationType, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"FolderData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"folderID";
  id v23 = [(ICASFolderData *)self folderID];
  if (v23)
  {
    uint64_t v3 = [(ICASFolderData *)self folderID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"folderType";
  uint64_t v20 = [(ICASFolderData *)self folderType];
  if (v20)
  {
    uint64_t v4 = [(ICASFolderData *)self folderType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = @"folderLabelType";
  v6 = [(ICASFolderData *)self folderLabelType];
  if (v6)
  {
    uint64_t v7 = [(ICASFolderData *)self folderLabelType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"subFolderLevel";
  v9 = [(ICASFolderData *)self subFolderLevel];
  if (v9)
  {
    uint64_t v10 = [(ICASFolderData *)self subFolderLevel];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = @"collaborationStatus";
  v12 = [(ICASFolderData *)self collaborationStatus];
  if (v12)
  {
    uint64_t v13 = [(ICASFolderData *)self collaborationStatus];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = @"collaborationType";
  id v15 = [(ICASFolderData *)self collaborationType];
  if (v15)
  {
    uint64_t v16 = [(ICASFolderData *)self collaborationType];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  id v17 = (void *)v16;
  v25[5] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];

  return v18;
}

- (NSString)folderID
{
  return self->_folderID;
}

- (ICASFolderType)folderType
{
  return self->_folderType;
}

- (ICASFolderLabelType)folderLabelType
{
  return self->_folderLabelType;
}

- (NSNumber)subFolderLevel
{
  return self->_subFolderLevel;
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
  objc_storeStrong((id *)&self->_subFolderLevel, 0);
  objc_storeStrong((id *)&self->_folderLabelType, 0);
  objc_storeStrong((id *)&self->_folderType, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end