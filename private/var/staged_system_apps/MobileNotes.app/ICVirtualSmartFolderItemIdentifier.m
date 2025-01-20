@interface ICVirtualSmartFolderItemIdentifier
- (int64_t)enforcedNoteContainerViewMode;
- (int64_t)overrideNoteContainerViewMode;
- (void)setOverrideNoteContainerViewMode:(int64_t)a3;
@end

@implementation ICVirtualSmartFolderItemIdentifier

- (void)setOverrideNoteContainerViewMode:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &unk_100524A30, v4, (void *)1);
}

- (int64_t)overrideNoteContainerViewMode
{
  v2 = objc_getAssociatedObject(self, &unk_100524A30);
  v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (int64_t)enforcedNoteContainerViewMode
{
  if ([(ICVirtualSmartFolderItemIdentifier *)self overrideNoteContainerViewMode] == -1)
  {
    int64_t v4 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    unsigned int v5 = [v4 isEqual:ICVirtualSmartFolderItemIdentifierTypeSystemPaper];

    if (v5) {
      return 1;
    }
    else {
      return -1;
    }
  }
  else
  {
    return [(ICVirtualSmartFolderItemIdentifier *)self overrideNoteContainerViewMode];
  }
}

@end