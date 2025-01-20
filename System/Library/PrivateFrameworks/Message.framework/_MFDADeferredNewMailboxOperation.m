@interface _MFDADeferredNewMailboxOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (_MFDADeferredNewMailboxOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFDADeferredNewMailboxOperation

- (_MFDADeferredNewMailboxOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MFDADeferredNewMailboxOperation;
  v5 = [(_MFDADeferredNewMailboxOperation *)&v13 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[_MFDADeferredNewMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 762, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ParentFolderID"];
    parentFolderID = v5->_parentFolderID;
    v5->_parentFolderID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TemporaryFolderID"];
    temporaryFolderID = v5->_temporaryFolderID;
    v5->_temporaryFolderID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[_MFDADeferredNewMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 773, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_displayName forKey:@"DisplayName"];
  [v4 encodeObject:self->_parentFolderID forKey:@"ParentFolderID"];
  [v4 encodeObject:self->_temporaryFolderID forKey:@"TemporaryFolderID"];
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
  v7.super_class = (Class)_MFDADeferredNewMailboxOperation;
  id v4 = [(_MFDADeferredNewMailboxOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ display-name \"%@\", parent-folder-id \"%@\", temporary-folder-id \"%@\"", v4, self->_displayName, self->_parentFolderID, self->_temporaryFolderID];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFolderID, 0);
  objc_storeStrong((id *)&self->_parentFolderID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end