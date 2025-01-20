@interface ICASCollabNotesItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollabNotesItemData)initWithTotalNotesCollabRootReadOnlyCount:(id)a3 totalNotesCollabThruFolderReadOnlyCount:(id)a4 totalNotesCollabRootReadWriteJoinedCount:(id)a5 totalNotesCollabThruFolderReadWriteJoinedCount:(id)a6 totalNotesNotCollabCount:(id)a7 totalNotesCollabRootOwnedCount:(id)a8 totalNotesCollabThruFolderOwnedCount:(id)a9;
- (NSNumber)totalNotesCollabRootOwnedCount;
- (NSNumber)totalNotesCollabRootReadOnlyCount;
- (NSNumber)totalNotesCollabRootReadWriteJoinedCount;
- (NSNumber)totalNotesCollabThruFolderOwnedCount;
- (NSNumber)totalNotesCollabThruFolderReadOnlyCount;
- (NSNumber)totalNotesCollabThruFolderReadWriteJoinedCount;
- (NSNumber)totalNotesNotCollabCount;
- (id)toDict;
@end

@implementation ICASCollabNotesItemData

- (ICASCollabNotesItemData)initWithTotalNotesCollabRootReadOnlyCount:(id)a3 totalNotesCollabThruFolderReadOnlyCount:(id)a4 totalNotesCollabRootReadWriteJoinedCount:(id)a5 totalNotesCollabThruFolderReadWriteJoinedCount:(id)a6 totalNotesNotCollabCount:(id)a7 totalNotesCollabRootOwnedCount:(id)a8 totalNotesCollabThruFolderOwnedCount:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ICASCollabNotesItemData;
  v18 = [(ICASCollabNotesItemData *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_totalNotesCollabRootReadOnlyCount, a3);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderReadOnlyCount, a4);
    objc_storeStrong((id *)&v19->_totalNotesCollabRootReadWriteJoinedCount, a5);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderReadWriteJoinedCount, a6);
    objc_storeStrong((id *)&v19->_totalNotesNotCollabCount, a7);
    objc_storeStrong((id *)&v19->_totalNotesCollabRootOwnedCount, a8);
    objc_storeStrong((id *)&v19->_totalNotesCollabThruFolderOwnedCount, a9);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"CollabNotesItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v27[7] = *MEMORY[0x1E4F143B8];
  v26[0] = @"totalNotesCollabRootReadOnlyCount";
  id v25 = [(ICASCollabNotesItemData *)self totalNotesCollabRootReadOnlyCount];
  if (v25)
  {
    uint64_t v3 = [(ICASCollabNotesItemData *)self totalNotesCollabRootReadOnlyCount];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v24 = (void *)v3;
  v27[0] = v3;
  v26[1] = @"totalNotesCollabThruFolderReadOnlyCount";
  id v23 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderReadOnlyCount];
  if (v23)
  {
    uint64_t v4 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderReadOnlyCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v22 = (void *)v4;
  v27[1] = v4;
  v26[2] = @"totalNotesCollabRootReadWriteJoinedCount";
  id v21 = [(ICASCollabNotesItemData *)self totalNotesCollabRootReadWriteJoinedCount];
  if (v21)
  {
    uint64_t v5 = [(ICASCollabNotesItemData *)self totalNotesCollabRootReadWriteJoinedCount];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v27[2] = v5;
  v26[3] = @"totalNotesCollabThruFolderReadWriteJoinedCount";
  v7 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderReadWriteJoinedCount];
  if (v7)
  {
    uint64_t v8 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderReadWriteJoinedCount];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v27[3] = v8;
  v26[4] = @"totalNotesNotCollabCount";
  v10 = [(ICASCollabNotesItemData *)self totalNotesNotCollabCount];
  if (v10)
  {
    uint64_t v11 = [(ICASCollabNotesItemData *)self totalNotesNotCollabCount];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v27[4] = v11;
  v26[5] = @"totalNotesCollabRootOwnedCount";
  v13 = [(ICASCollabNotesItemData *)self totalNotesCollabRootOwnedCount];
  if (v13)
  {
    uint64_t v14 = [(ICASCollabNotesItemData *)self totalNotesCollabRootOwnedCount];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v27[5] = v14;
  v26[6] = @"totalNotesCollabThruFolderOwnedCount";
  id v16 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderOwnedCount];
  if (v16)
  {
    uint64_t v17 = [(ICASCollabNotesItemData *)self totalNotesCollabThruFolderOwnedCount];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v27[6] = v17;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:7];

  return v19;
}

- (NSNumber)totalNotesCollabRootReadOnlyCount
{
  return self->_totalNotesCollabRootReadOnlyCount;
}

- (NSNumber)totalNotesCollabThruFolderReadOnlyCount
{
  return self->_totalNotesCollabThruFolderReadOnlyCount;
}

- (NSNumber)totalNotesCollabRootReadWriteJoinedCount
{
  return self->_totalNotesCollabRootReadWriteJoinedCount;
}

- (NSNumber)totalNotesCollabThruFolderReadWriteJoinedCount
{
  return self->_totalNotesCollabThruFolderReadWriteJoinedCount;
}

- (NSNumber)totalNotesNotCollabCount
{
  return self->_totalNotesNotCollabCount;
}

- (NSNumber)totalNotesCollabRootOwnedCount
{
  return self->_totalNotesCollabRootOwnedCount;
}

- (NSNumber)totalNotesCollabThruFolderOwnedCount
{
  return self->_totalNotesCollabThruFolderOwnedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesNotCollabCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabThruFolderReadOnlyCount, 0);
  objc_storeStrong((id *)&self->_totalNotesCollabRootReadOnlyCount, 0);
}

@end