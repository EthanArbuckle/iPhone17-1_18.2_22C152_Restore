@interface KCSharingOutgoingChangeset
- (BOOL)isEmpty;
- (KCSharingOutgoingChangeset)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 cursor:(id)a5;
- (KCSharingOutgoingChangesetCursor)cursor;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
@end

@implementation KCSharingOutgoingChangeset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

- (KCSharingOutgoingChangesetCursor)cursor
{
  return self->_cursor;
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (BOOL)isEmpty
{
  return ![(NSArray *)self->_recordsToSave count] && [(NSArray *)self->_recordIDsToDelete count] == 0;
}

- (KCSharingOutgoingChangeset)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 cursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingOutgoingChangeset;
  v11 = [(KCSharingOutgoingChangeset *)&v17 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    recordsToSave = v11->_recordsToSave;
    v11->_recordsToSave = v12;

    v14 = (NSArray *)[v9 copy];
    recordIDsToDelete = v11->_recordIDsToDelete;
    v11->_recordIDsToDelete = v14;

    objc_storeStrong((id *)&v11->_cursor, a5);
  }

  return v11;
}

@end