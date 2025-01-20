@interface _MFDADeferredSelectMailboxOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)translateToLocalActionWithConnection:(id)a3;
- (_MFDADeferredSelectMailboxOperation)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFDADeferredSelectMailboxOperation

- (_MFDADeferredSelectMailboxOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDADeferredSelectMailboxOperation;
  v5 = [(_MFDADeferredSelectMailboxOperation *)&v9 init];
  if (v5)
  {
    if (([v4 allowsKeyedCoding] & 1) == 0) {
      __assert_rtn("-[_MFDADeferredSelectMailboxOperation initWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 894, "[aDecoder allowsKeyedCoding] && \"aDecoder must allow keyed coding\"");
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FolderID"];
    folderID = v5->_folderID;
    v5->_folderID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[_MFDADeferredSelectMailboxOperation encodeWithCoder:]", "MFMailMessageLibraryLocalActionsTablesMigrationStep.m", 902, "[aCoder allowsKeyedCoding] && \"aCoder must allow keyed coding\"");
  }
  [v4 encodeObject:self->_folderID forKey:@"FolderID"];
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
  v7.super_class = (Class)_MFDADeferredSelectMailboxOperation;
  id v4 = [(_MFDADeferredSelectMailboxOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ folder-id \"%@\"", v4, self->_folderID];

  return v5;
}

- (void).cxx_destruct
{
}

@end