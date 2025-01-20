@interface ICASFolderSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationStatus)collaborationStatus;
- (ICASCollaborationType)collaborationType;
- (ICASFolderLabelType)folderLabelType;
- (ICASFolderSnapshotItemData)initWithFolderID:(id)a3 collaborationStatus:(id)a4 collaborationType:(id)a5 countOfInvitees:(id)a6 countOfAcceptances:(id)a7 directNoteCount:(id)a8 totalNoteCount:(id)a9 folderType:(id)a10 folderLabelType:(id)a11;
- (ICASFolderType)folderType;
- (NSNumber)countOfAcceptances;
- (NSNumber)countOfInvitees;
- (NSNumber)directNoteCount;
- (NSNumber)totalNoteCount;
- (NSString)folderID;
- (id)toDict;
@end

@implementation ICASFolderSnapshotItemData

- (ICASFolderSnapshotItemData)initWithFolderID:(id)a3 collaborationStatus:(id)a4 collaborationType:(id)a5 countOfInvitees:(id)a6 countOfAcceptances:(id)a7 directNoteCount:(id)a8 totalNoteCount:(id)a9 folderType:(id)a10 folderLabelType:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)ICASFolderSnapshotItemData;
  v19 = [(ICASFolderSnapshotItemData *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_folderID, a3);
    objc_storeStrong((id *)&v20->_collaborationStatus, a4);
    objc_storeStrong((id *)&v20->_collaborationType, a5);
    objc_storeStrong((id *)&v20->_countOfInvitees, a6);
    objc_storeStrong((id *)&v20->_countOfAcceptances, a7);
    objc_storeStrong((id *)&v20->_directNoteCount, a8);
    objc_storeStrong((id *)&v20->_totalNoteCount, a9);
    objc_storeStrong((id *)&v20->_folderType, a10);
    objc_storeStrong((id *)&v20->_folderLabelType, a11);
  }

  return v20;
}

+ (NSString)dataName
{
  return (NSString *)@"FolderSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v33[9] = *MEMORY[0x1E4F143B8];
  v32[0] = @"folderID";
  v31 = [(ICASFolderSnapshotItemData *)self folderID];
  if (v31)
  {
    uint64_t v3 = [(ICASFolderSnapshotItemData *)self folderID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  objc_super v30 = (void *)v3;
  v33[0] = v3;
  v32[1] = @"collaborationStatus";
  id v29 = [(ICASFolderSnapshotItemData *)self collaborationStatus];
  if (v29)
  {
    uint64_t v4 = [(ICASFolderSnapshotItemData *)self collaborationStatus];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v28 = (void *)v4;
  v33[1] = v4;
  v32[2] = @"collaborationType";
  id v27 = [(ICASFolderSnapshotItemData *)self collaborationType];
  if (v27)
  {
    uint64_t v5 = [(ICASFolderSnapshotItemData *)self collaborationType];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v26 = (void *)v5;
  v33[2] = v5;
  v32[3] = @"countOfInvitees";
  id v25 = [(ICASFolderSnapshotItemData *)self countOfInvitees];
  if (v25)
  {
    uint64_t v6 = [(ICASFolderSnapshotItemData *)self countOfInvitees];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v24 = (void *)v6;
  v33[3] = v6;
  v32[4] = @"countOfAcceptances";
  id v23 = [(ICASFolderSnapshotItemData *)self countOfAcceptances];
  if (v23)
  {
    uint64_t v7 = [(ICASFolderSnapshotItemData *)self countOfAcceptances];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v33[4] = v7;
  v32[5] = @"directNoteCount";
  v9 = [(ICASFolderSnapshotItemData *)self directNoteCount];
  if (v9)
  {
    uint64_t v10 = [(ICASFolderSnapshotItemData *)self directNoteCount];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v33[5] = v10;
  v32[6] = @"totalNoteCount";
  v12 = [(ICASFolderSnapshotItemData *)self totalNoteCount];
  if (v12)
  {
    uint64_t v13 = [(ICASFolderSnapshotItemData *)self totalNoteCount];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v33[6] = v13;
  v32[7] = @"folderType";
  v15 = [(ICASFolderSnapshotItemData *)self folderType];
  if (v15)
  {
    uint64_t v16 = [(ICASFolderSnapshotItemData *)self folderType];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v33[7] = v16;
  v32[8] = @"folderLabelType";
  id v18 = [(ICASFolderSnapshotItemData *)self folderLabelType];
  if (v18)
  {
    uint64_t v19 = [(ICASFolderSnapshotItemData *)self folderLabelType];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v33[8] = v19;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:9];

  return v21;
}

- (NSString)folderID
{
  return self->_folderID;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (NSNumber)countOfInvitees
{
  return self->_countOfInvitees;
}

- (NSNumber)countOfAcceptances
{
  return self->_countOfAcceptances;
}

- (NSNumber)directNoteCount
{
  return self->_directNoteCount;
}

- (NSNumber)totalNoteCount
{
  return self->_totalNoteCount;
}

- (ICASFolderType)folderType
{
  return self->_folderType;
}

- (ICASFolderLabelType)folderLabelType
{
  return self->_folderLabelType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelType, 0);
  objc_storeStrong((id *)&self->_folderType, 0);
  objc_storeStrong((id *)&self->_totalNoteCount, 0);
  objc_storeStrong((id *)&self->_directNoteCount, 0);
  objc_storeStrong((id *)&self->_countOfAcceptances, 0);
  objc_storeStrong((id *)&self->_countOfInvitees, 0);
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end