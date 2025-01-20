@interface ICASMiniSnapshotAccountItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASMiniSnapshotAccountItemData)initWithCountofNotes:(id)a3 counfOfFolders:(id)a4 countOfAttachments:(id)a5 privateAccountID:(id)a6;
- (NSNumber)counfOfFolders;
- (NSNumber)countOfAttachments;
- (NSNumber)countofNotes;
- (NSString)privateAccountID;
- (id)toDict;
@end

@implementation ICASMiniSnapshotAccountItemData

- (ICASMiniSnapshotAccountItemData)initWithCountofNotes:(id)a3 counfOfFolders:(id)a4 countOfAttachments:(id)a5 privateAccountID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASMiniSnapshotAccountItemData;
  v15 = [(ICASMiniSnapshotAccountItemData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_countofNotes, a3);
    objc_storeStrong((id *)&v16->_counfOfFolders, a4);
    objc_storeStrong((id *)&v16->_countOfAttachments, a5);
    objc_storeStrong((id *)&v16->_privateAccountID, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"MiniSnapshotAccountItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"countofNotes";
  v3 = [(ICASMiniSnapshotAccountItemData *)self countofNotes];
  if (v3)
  {
    uint64_t v4 = [(ICASMiniSnapshotAccountItemData *)self countofNotes];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"counfOfFolders";
  v6 = [(ICASMiniSnapshotAccountItemData *)self counfOfFolders];
  if (v6)
  {
    uint64_t v7 = [(ICASMiniSnapshotAccountItemData *)self counfOfFolders];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"countOfAttachments";
  v9 = [(ICASMiniSnapshotAccountItemData *)self countOfAttachments];
  if (v9)
  {
    uint64_t v10 = [(ICASMiniSnapshotAccountItemData *)self countOfAttachments];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"privateAccountID";
  id v12 = [(ICASMiniSnapshotAccountItemData *)self privateAccountID];
  if (v12)
  {
    uint64_t v13 = [(ICASMiniSnapshotAccountItemData *)self privateAccountID];
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

- (NSNumber)countofNotes
{
  return self->_countofNotes;
}

- (NSNumber)counfOfFolders
{
  return self->_counfOfFolders;
}

- (NSNumber)countOfAttachments
{
  return self->_countOfAttachments;
}

- (NSString)privateAccountID
{
  return self->_privateAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAccountID, 0);
  objc_storeStrong((id *)&self->_countOfAttachments, 0);
  objc_storeStrong((id *)&self->_counfOfFolders, 0);
  objc_storeStrong((id *)&self->_countofNotes, 0);
}

@end