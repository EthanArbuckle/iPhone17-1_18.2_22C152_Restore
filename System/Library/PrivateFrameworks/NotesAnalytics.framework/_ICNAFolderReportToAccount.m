@interface _ICNAFolderReportToAccount
- (_ICNAFolderReportToAccount)init;
- (unint64_t)countOfCustomSmartFolders;
- (unint64_t)countOfFolders;
- (unint64_t)countOfFoldersWithCollaborationStatus:(int64_t)a3 collaborationType:(int64_t)a4;
- (unint64_t)countOfSmartFoldersWithAttachmentsFilter;
- (unint64_t)countOfSmartFoldersWithChecklistsFilter;
- (unint64_t)countOfSmartFoldersWithDateCreatedFilter;
- (unint64_t)countOfSmartFoldersWithDateModifiedFilter;
- (unint64_t)countOfSmartFoldersWithFoldersFilter;
- (unint64_t)countOfSmartFoldersWithLockedNotesFilter;
- (unint64_t)countOfSmartFoldersWithMentionsFilter;
- (unint64_t)countOfSmartFoldersWithPinnedNotesFilter;
- (unint64_t)countOfSmartFoldersWithQuickNotesFilter;
- (unint64_t)countOfSmartFoldersWithSharedFilter;
- (unint64_t)countOfSmartFoldersWithTagsFilter;
- (unint64_t)countOfSmartFoldersWithUnknownFilter;
- (void)setCountOfCustomSmartFolders:(unint64_t)a3;
- (void)setCountOfFolders:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithAttachmentsFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithChecklistsFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithDateCreatedFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithDateModifiedFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithFoldersFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithLockedNotesFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithMentionsFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithPinnedNotesFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithQuickNotesFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithSharedFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithTagsFilter:(unint64_t)a3;
- (void)setCountOfSmartFoldersWithUnknownFilter:(unint64_t)a3;
- (void)updateFolderCollaborationMatrixWithCollaborationStatus:(id)a3 collaborationType:(id)a4;
@end

@implementation _ICNAFolderReportToAccount

- (_ICNAFolderReportToAccount)init
{
  v3.receiver = self;
  v3.super_class = (Class)_ICNAFolderReportToAccount;
  result = [(_ICNAFolderReportToAccount *)&v3 init];
  if (result)
  {
    result->_folderCollaborationMatrix[2][2] = 0;
    *(_OWORD *)&result->_folderCollaborationMatrix[1][1] = 0u;
    *(_OWORD *)&result->_folderCollaborationMatrix[0][0] = 0u;
  }
  return result;
}

- (void)updateFolderCollaborationMatrixWithCollaborationStatus:(id)a3 collaborationType:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 collaborationStatus];
  int v8 = 3;
  if (v7 == 1) {
    int v8 = 0;
  }
  BOOL v9 = v7 != 2 && v7 != 1;
  if (v7 == 2) {
    int v8 = 1;
  }
  BOOL v10 = v7 != 3 && v9;
  if (v7 == 3) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = v8;
  }
  uint64_t v12 = [v6 collaborationType];

  if ((unint64_t)(v12 - 1) <= 2 && !v10)
  {
    v13 = (char *)self + 12 * v11 + 4 * v12 - 4;
    ++*((_DWORD *)v13 + 2);
  }
}

- (unint64_t)countOfFoldersWithCollaborationStatus:(int64_t)a3 collaborationType:(int64_t)a4
{
  return self->_folderCollaborationMatrix[a3][a4];
}

- (unint64_t)countOfFolders
{
  return self->_countOfFolders;
}

- (void)setCountOfFolders:(unint64_t)a3
{
  self->_countOfFolders = a3;
}

- (unint64_t)countOfCustomSmartFolders
{
  return self->_countOfCustomSmartFolders;
}

- (void)setCountOfCustomSmartFolders:(unint64_t)a3
{
  self->_countOfCustomSmartFolders = a3;
}

- (unint64_t)countOfSmartFoldersWithTagsFilter
{
  return self->_countOfSmartFoldersWithTagsFilter;
}

- (void)setCountOfSmartFoldersWithTagsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithTagsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithDateCreatedFilter
{
  return self->_countOfSmartFoldersWithDateCreatedFilter;
}

- (void)setCountOfSmartFoldersWithDateCreatedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithDateCreatedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithDateModifiedFilter
{
  return self->_countOfSmartFoldersWithDateModifiedFilter;
}

- (void)setCountOfSmartFoldersWithDateModifiedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithDateModifiedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithSharedFilter
{
  return self->_countOfSmartFoldersWithSharedFilter;
}

- (void)setCountOfSmartFoldersWithSharedFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithSharedFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithMentionsFilter
{
  return self->_countOfSmartFoldersWithMentionsFilter;
}

- (void)setCountOfSmartFoldersWithMentionsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithMentionsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithChecklistsFilter
{
  return self->_countOfSmartFoldersWithChecklistsFilter;
}

- (void)setCountOfSmartFoldersWithChecklistsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithChecklistsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithAttachmentsFilter
{
  return self->_countOfSmartFoldersWithAttachmentsFilter;
}

- (void)setCountOfSmartFoldersWithAttachmentsFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithAttachmentsFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithFoldersFilter
{
  return self->_countOfSmartFoldersWithFoldersFilter;
}

- (void)setCountOfSmartFoldersWithFoldersFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithFoldersFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithQuickNotesFilter
{
  return self->_countOfSmartFoldersWithQuickNotesFilter;
}

- (void)setCountOfSmartFoldersWithQuickNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithQuickNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithPinnedNotesFilter
{
  return self->_countOfSmartFoldersWithPinnedNotesFilter;
}

- (void)setCountOfSmartFoldersWithPinnedNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithPinnedNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithLockedNotesFilter
{
  return self->_countOfSmartFoldersWithLockedNotesFilter;
}

- (void)setCountOfSmartFoldersWithLockedNotesFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithLockedNotesFilter = a3;
}

- (unint64_t)countOfSmartFoldersWithUnknownFilter
{
  return self->_countOfSmartFoldersWithUnknownFilter;
}

- (void)setCountOfSmartFoldersWithUnknownFilter:(unint64_t)a3
{
  self->_countOfSmartFoldersWithUnknownFilter = a3;
}

@end