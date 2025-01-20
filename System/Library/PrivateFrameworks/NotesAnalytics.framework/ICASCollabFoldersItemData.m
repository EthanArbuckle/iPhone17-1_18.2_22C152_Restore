@interface ICASCollabFoldersItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollabFoldersItemData)initWithTotalFoldersCollabRootReadOnlyCount:(id)a3 totalFoldersCollabSubfolderReadOnlyCount:(id)a4 totalFoldersCollabRootReadWriteJoinedCount:(id)a5 totalFoldersCollabSubfolderReadWriteJoinedCount:(id)a6 totalFoldersNotCollabCount:(id)a7 totalFoldersCollabRootOwnedCount:(id)a8 totalFoldersCollabSubfolderOwnedCount:(id)a9;
- (NSNumber)totalFoldersCollabRootOwnedCount;
- (NSNumber)totalFoldersCollabRootReadOnlyCount;
- (NSNumber)totalFoldersCollabRootReadWriteJoinedCount;
- (NSNumber)totalFoldersCollabSubfolderOwnedCount;
- (NSNumber)totalFoldersCollabSubfolderReadOnlyCount;
- (NSNumber)totalFoldersCollabSubfolderReadWriteJoinedCount;
- (NSNumber)totalFoldersNotCollabCount;
- (id)toDict;
@end

@implementation ICASCollabFoldersItemData

- (ICASCollabFoldersItemData)initWithTotalFoldersCollabRootReadOnlyCount:(id)a3 totalFoldersCollabSubfolderReadOnlyCount:(id)a4 totalFoldersCollabRootReadWriteJoinedCount:(id)a5 totalFoldersCollabSubfolderReadWriteJoinedCount:(id)a6 totalFoldersNotCollabCount:(id)a7 totalFoldersCollabRootOwnedCount:(id)a8 totalFoldersCollabSubfolderOwnedCount:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ICASCollabFoldersItemData;
  v18 = [(ICASCollabFoldersItemData *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_totalFoldersCollabRootReadOnlyCount, a3);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderReadOnlyCount, a4);
    objc_storeStrong((id *)&v19->_totalFoldersCollabRootReadWriteJoinedCount, a5);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderReadWriteJoinedCount, a6);
    objc_storeStrong((id *)&v19->_totalFoldersNotCollabCount, a7);
    objc_storeStrong((id *)&v19->_totalFoldersCollabRootOwnedCount, a8);
    objc_storeStrong((id *)&v19->_totalFoldersCollabSubfolderOwnedCount, a9);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"CollabFoldersItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v27[7] = *MEMORY[0x1E4F143B8];
  v26[0] = @"totalFoldersCollabRootReadOnlyCount";
  id v25 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootReadOnlyCount];
  if (v25)
  {
    uint64_t v3 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootReadOnlyCount];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v24 = (void *)v3;
  v27[0] = v3;
  v26[1] = @"totalFoldersCollabSubfolderReadOnlyCount";
  id v23 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderReadOnlyCount];
  if (v23)
  {
    uint64_t v4 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderReadOnlyCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v22 = (void *)v4;
  v27[1] = v4;
  v26[2] = @"totalFoldersCollabRootReadWriteJoinedCount";
  id v21 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootReadWriteJoinedCount];
  if (v21)
  {
    uint64_t v5 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootReadWriteJoinedCount];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  v27[2] = v5;
  v26[3] = @"totalFoldersCollabSubfolderReadWriteJoinedCount";
  v7 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderReadWriteJoinedCount];
  if (v7)
  {
    uint64_t v8 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderReadWriteJoinedCount];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v27[3] = v8;
  v26[4] = @"totalFoldersNotCollabCount";
  v10 = [(ICASCollabFoldersItemData *)self totalFoldersNotCollabCount];
  if (v10)
  {
    uint64_t v11 = [(ICASCollabFoldersItemData *)self totalFoldersNotCollabCount];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v27[4] = v11;
  v26[5] = @"totalFoldersCollabRootOwnedCount";
  v13 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootOwnedCount];
  if (v13)
  {
    uint64_t v14 = [(ICASCollabFoldersItemData *)self totalFoldersCollabRootOwnedCount];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v27[5] = v14;
  v26[6] = @"totalFoldersCollabSubfolderOwnedCount";
  id v16 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderOwnedCount];
  if (v16)
  {
    uint64_t v17 = [(ICASCollabFoldersItemData *)self totalFoldersCollabSubfolderOwnedCount];
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

- (NSNumber)totalFoldersCollabRootReadOnlyCount
{
  return self->_totalFoldersCollabRootReadOnlyCount;
}

- (NSNumber)totalFoldersCollabSubfolderReadOnlyCount
{
  return self->_totalFoldersCollabSubfolderReadOnlyCount;
}

- (NSNumber)totalFoldersCollabRootReadWriteJoinedCount
{
  return self->_totalFoldersCollabRootReadWriteJoinedCount;
}

- (NSNumber)totalFoldersCollabSubfolderReadWriteJoinedCount
{
  return self->_totalFoldersCollabSubfolderReadWriteJoinedCount;
}

- (NSNumber)totalFoldersNotCollabCount
{
  return self->_totalFoldersNotCollabCount;
}

- (NSNumber)totalFoldersCollabRootOwnedCount
{
  return self->_totalFoldersCollabRootOwnedCount;
}

- (NSNumber)totalFoldersCollabSubfolderOwnedCount
{
  return self->_totalFoldersCollabSubfolderOwnedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootOwnedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersNotCollabCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootReadWriteJoinedCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabSubfolderReadOnlyCount, 0);
  objc_storeStrong((id *)&self->_totalFoldersCollabRootReadOnlyCount, 0);
}

@end