@interface _MFDADeferredModifyMailboxOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (_MFDADeferredModifyMailboxOperation)initWithCoder:(id)a3;
- (_MFDADeferredModifyMailboxOperation)initWithFolderID:(id)a3 newParentFolderID:(id)a4 newDisplayName:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFDADeferredModifyMailboxOperation

- (_MFDADeferredModifyMailboxOperation)initWithFolderID:(id)a3 newParentFolderID:(id)a4 newDisplayName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  v11 = [(_MFDADeferredModifyMailboxOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    folderID = v11->_folderID;
    v11->_folderID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    newParentFolderID = v11->_newParentFolderID;
    v11->_newParentFolderID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    newDisplayName = v11->_newDisplayName;
    v11->_newDisplayName = (NSString *)v16;
  }
  return v11;
}

- (_MFDADeferredModifyMailboxOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  v5 = [(_MFDADeferredModifyMailboxOperation *)&v13 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[_MFDADeferredModifyMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 853, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FolderID"];
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NewParentFolderID"];
    newParentFolderID = v5->_newParentFolderID;
    v5->_newParentFolderID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NewDisplayName"];
    newDisplayName = v5->_newDisplayName;
    v5->_newDisplayName = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[_MFDADeferredModifyMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 864, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_folderID forKey:@"FolderID"];
  [v4 encodeObject:self->_newParentFolderID forKey:@"NewParentFolderID"];
  [v4 encodeObject:self->_newDisplayName forKey:@"NewDisplayName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)translateToLocalActionWithConnection:(id)a3
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_MFDADeferredModifyMailboxOperation;
  id v4 = [(_MFDADeferredModifyMailboxOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ folder-id \"%@\", new-parent-folder-id \"%@\", new-display-name \"%@\"", v4, self->_folderID, self->_newParentFolderID, self->_newDisplayName];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newDisplayName, 0);
  objc_storeStrong((id *)&self->_newParentFolderID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
}

@end