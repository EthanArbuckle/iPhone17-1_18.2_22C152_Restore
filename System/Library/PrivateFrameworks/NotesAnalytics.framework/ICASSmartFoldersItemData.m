@interface ICASSmartFoldersItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSmartFoldersItemData)initWithTotalCountOfSmartFoldersWithTagsFilter:(id)a3 totalCountOfSmartFoldersWithDateCreatedFilter:(id)a4 totalCountOfSmartFoldersWithDateModifiedFilter:(id)a5 totalCountOfSmartFoldersWithSharedFilter:(id)a6 totalCountOfSmartFoldersWithMentionsFilter:(id)a7 totalCountOfSmartFoldersWithChecklistsFilter:(id)a8 totalCountOfSmartFoldersWithAttachmentsFilter:(id)a9 totalCountOfSmartFoldersWithFoldersFilter:(id)a10 totalCountOfSmartFoldersWithQuickNotesFilter:(id)a11 totalCountOfSmartFoldersWithPinnedNotesFilter:(id)a12 totalCountOfSmartFoldersWithLockedNotesFilter:(id)a13 totalCountOfSmartFoldersWithUnknownFilter:(id)a14;
- (NSNumber)totalCountOfSmartFoldersWithAttachmentsFilter;
- (NSNumber)totalCountOfSmartFoldersWithChecklistsFilter;
- (NSNumber)totalCountOfSmartFoldersWithDateCreatedFilter;
- (NSNumber)totalCountOfSmartFoldersWithDateModifiedFilter;
- (NSNumber)totalCountOfSmartFoldersWithFoldersFilter;
- (NSNumber)totalCountOfSmartFoldersWithLockedNotesFilter;
- (NSNumber)totalCountOfSmartFoldersWithMentionsFilter;
- (NSNumber)totalCountOfSmartFoldersWithPinnedNotesFilter;
- (NSNumber)totalCountOfSmartFoldersWithQuickNotesFilter;
- (NSNumber)totalCountOfSmartFoldersWithSharedFilter;
- (NSNumber)totalCountOfSmartFoldersWithTagsFilter;
- (NSNumber)totalCountOfSmartFoldersWithUnknownFilter;
- (id)toDict;
@end

@implementation ICASSmartFoldersItemData

- (ICASSmartFoldersItemData)initWithTotalCountOfSmartFoldersWithTagsFilter:(id)a3 totalCountOfSmartFoldersWithDateCreatedFilter:(id)a4 totalCountOfSmartFoldersWithDateModifiedFilter:(id)a5 totalCountOfSmartFoldersWithSharedFilter:(id)a6 totalCountOfSmartFoldersWithMentionsFilter:(id)a7 totalCountOfSmartFoldersWithChecklistsFilter:(id)a8 totalCountOfSmartFoldersWithAttachmentsFilter:(id)a9 totalCountOfSmartFoldersWithFoldersFilter:(id)a10 totalCountOfSmartFoldersWithQuickNotesFilter:(id)a11 totalCountOfSmartFoldersWithPinnedNotesFilter:(id)a12 totalCountOfSmartFoldersWithLockedNotesFilter:(id)a13 totalCountOfSmartFoldersWithUnknownFilter:(id)a14
{
  id v38 = a3;
  id v28 = a4;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v29 = a7;
  id v34 = a7;
  id v30 = a8;
  id v33 = a8;
  id v32 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v39.receiver = self;
  v39.super_class = (Class)ICASSmartFoldersItemData;
  v24 = [(ICASSmartFoldersItemData *)&v39 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_totalCountOfSmartFoldersWithTagsFilter, a3);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithDateCreatedFilter, v28);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithDateModifiedFilter, a5);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithSharedFilter, a6);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithMentionsFilter, v29);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithChecklistsFilter, v30);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithAttachmentsFilter, a9);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithFoldersFilter, a10);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithQuickNotesFilter, a11);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithPinnedNotesFilter, a12);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithLockedNotesFilter, a13);
    objc_storeStrong((id *)&v25->_totalCountOfSmartFoldersWithUnknownFilter, a14);
  }

  return v25;
}

+ (NSString)dataName
{
  return (NSString *)@"SmartFoldersItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v42[12] = *MEMORY[0x1E4F143B8];
  v41[0] = @"totalCountOfSmartFoldersWithTagsFilter";
  v40 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithTagsFilter];
  if (v40)
  {
    uint64_t v3 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithTagsFilter];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  objc_super v39 = (void *)v3;
  v42[0] = v3;
  v41[1] = @"totalCountOfSmartFoldersWithDateCreatedFilter";
  id v38 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithDateCreatedFilter];
  if (v38)
  {
    uint64_t v4 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithDateCreatedFilter];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v37 = (void *)v4;
  v42[1] = v4;
  v41[2] = @"totalCountOfSmartFoldersWithDateModifiedFilter";
  id v36 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithDateModifiedFilter];
  if (v36)
  {
    uint64_t v5 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithDateModifiedFilter];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v35 = (void *)v5;
  v42[2] = v5;
  v41[3] = @"totalCountOfSmartFoldersWithSharedFilter";
  id v34 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithSharedFilter];
  if (v34)
  {
    uint64_t v6 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithSharedFilter];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v33 = (void *)v6;
  v42[3] = v6;
  v41[4] = @"totalCountOfSmartFoldersWithMentionsFilter";
  id v32 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithMentionsFilter];
  if (v32)
  {
    uint64_t v7 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithMentionsFilter];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v31 = (void *)v7;
  v42[4] = v7;
  v41[5] = @"totalCountOfSmartFoldersWithChecklistsFilter";
  id v30 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithChecklistsFilter];
  if (v30)
  {
    uint64_t v8 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithChecklistsFilter];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  id v29 = (void *)v8;
  v42[5] = v8;
  v41[6] = @"totalCountOfSmartFoldersWithAttachmentsFilter";
  id v28 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithAttachmentsFilter];
  if (v28)
  {
    uint64_t v9 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithAttachmentsFilter];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v27 = (void *)v9;
  v42[6] = v9;
  v41[7] = @"totalCountOfSmartFoldersWithFoldersFilter";
  v26 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithFoldersFilter];
  if (v26)
  {
    uint64_t v10 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithFoldersFilter];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v42[7] = v10;
  v41[8] = @"totalCountOfSmartFoldersWithQuickNotesFilter";
  v12 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithQuickNotesFilter];
  if (v12)
  {
    uint64_t v13 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithQuickNotesFilter];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v42[8] = v13;
  v41[9] = @"totalCountOfSmartFoldersWithPinnedNotesFilter";
  v15 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithPinnedNotesFilter];
  if (v15)
  {
    uint64_t v16 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithPinnedNotesFilter];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v42[9] = v16;
  v41[10] = @"totalCountOfSmartFoldersWithLockedNotesFilter";
  v18 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithLockedNotesFilter];
  if (v18)
  {
    uint64_t v19 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithLockedNotesFilter];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  id v20 = (void *)v19;
  v42[10] = v19;
  v41[11] = @"totalCountOfSmartFoldersWithUnknownFilter";
  id v21 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithUnknownFilter];
  if (v21)
  {
    uint64_t v22 = [(ICASSmartFoldersItemData *)self totalCountOfSmartFoldersWithUnknownFilter];
  }
  else
  {
    uint64_t v22 = objc_opt_new();
  }
  id v23 = (void *)v22;
  v42[11] = v22;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:12];

  return v24;
}

- (NSNumber)totalCountOfSmartFoldersWithTagsFilter
{
  return self->_totalCountOfSmartFoldersWithTagsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithDateCreatedFilter
{
  return self->_totalCountOfSmartFoldersWithDateCreatedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithDateModifiedFilter
{
  return self->_totalCountOfSmartFoldersWithDateModifiedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithSharedFilter
{
  return self->_totalCountOfSmartFoldersWithSharedFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithMentionsFilter
{
  return self->_totalCountOfSmartFoldersWithMentionsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithChecklistsFilter
{
  return self->_totalCountOfSmartFoldersWithChecklistsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithAttachmentsFilter
{
  return self->_totalCountOfSmartFoldersWithAttachmentsFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithFoldersFilter
{
  return self->_totalCountOfSmartFoldersWithFoldersFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithQuickNotesFilter
{
  return self->_totalCountOfSmartFoldersWithQuickNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithPinnedNotesFilter
{
  return self->_totalCountOfSmartFoldersWithPinnedNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithLockedNotesFilter
{
  return self->_totalCountOfSmartFoldersWithLockedNotesFilter;
}

- (NSNumber)totalCountOfSmartFoldersWithUnknownFilter
{
  return self->_totalCountOfSmartFoldersWithUnknownFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithUnknownFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithLockedNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithPinnedNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithQuickNotesFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithFoldersFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithAttachmentsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithChecklistsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithMentionsFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithSharedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithDateModifiedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithDateCreatedFilter, 0);
  objc_storeStrong((id *)&self->_totalCountOfSmartFoldersWithTagsFilter, 0);
}

@end