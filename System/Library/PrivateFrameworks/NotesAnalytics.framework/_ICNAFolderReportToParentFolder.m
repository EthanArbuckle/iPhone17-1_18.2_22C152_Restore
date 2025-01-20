@interface _ICNAFolderReportToParentFolder
- (unint64_t)totalNoteCountIncludingSubFolders;
- (void)setTotalNoteCountIncludingSubFolders:(unint64_t)a3;
@end

@implementation _ICNAFolderReportToParentFolder

- (unint64_t)totalNoteCountIncludingSubFolders
{
  return self->_totalNoteCountIncludingSubFolders;
}

- (void)setTotalNoteCountIncludingSubFolders:(unint64_t)a3
{
  self->_totalNoteCountIncludingSubFolders = a3;
}

@end