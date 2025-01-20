@interface MCSArchive
- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5;
- (BOOL)willFlag;
- (BOOL)willMarkRead;
- (BOOL)willMarkUnread;
- (BOOL)willUnflag;
- (MCSArchive)initWithStore:(id)a3;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3;
- (id)localizedErrorTitleForMessageCount:(unint64_t)a3;
- (id)localizedShortOperationDescription;
@end

@implementation MCSArchive

- (MCSArchive)initWithStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCSArchive;
  v5 = [(MCSArchive *)&v17 init];
  if (v5)
  {
    id v6 = [v4 archiveDestination];
    if (v6 == (id)-500)
    {
      v7 = [MCSFlagChange alloc];
      v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsRead, 0);
      v9 = [(MCSFlagChange *)v7 initWithFlagsToSet:v8 flagsToClear:0 reason:4];

      objc_storeStrong((id *)&v5->_seenOrTransferOperation, v9);
      v10 = [MCSFlagChange alloc];
      v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MessageIsDeleted, 0);
      v12 = [(MCSFlagChange *)v10 initWithFlagsToSet:v11 flagsToClear:0 reason:4];

      [(MCSFlagChange *)v12 setIsDeletion:1];
      deleteOperation = v5->_deleteOperation;
      v5->_deleteOperation = &v12->super;

      v5->_isDeleteInPlace = 1;
    }
    else
    {
      v14 = [[MCSTransfer alloc] initWithSpecialDestination:v6 markAsRead:1 deleteIfSame:1];
      [(MCSTransfer *)v14 setIsDeletion:0];
      seenOrTransferOperation = v5->_seenOrTransferOperation;
      v5->_seenOrTransferOperation = &v14->super;

      v5->_isDeleteInPlace = 0;
    }
  }

  return v5;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v6 = [(MCSOperation *)self->_seenOrTransferOperation applyPendingChangeToObjects:v4];
  [v5 addEntriesFromDictionary:v6];

  v7 = [(MCSOperation *)self->_deleteOperation applyPendingChangeToObjects:v4];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[MFActivityMonitor currentMonitor];
  [(id)v11 addReason:MonitoredActivityReasonArchiving];

  LOBYTE(v11) = [(MCSMessageOperation *)self->_seenOrTransferOperation commitToMessages:v8 failures:v9 newMessages:v10];
  LOBYTE(self) = v11 | [(MCSMessageOperation *)self->_deleteOperation commitToMessages:v8 failures:v9 newMessages:v10];

  return (char)self;
}

- (BOOL)willMarkRead
{
  unsigned int v3 = [(MCSMessageOperation *)self->_seenOrTransferOperation willMarkRead];
  if (self->_isDeleteInPlace) {
    v3 |= [(MCSMessageOperation *)self->_deleteOperation willMarkRead];
  }
  return v3;
}

- (BOOL)willMarkUnread
{
  unsigned int v3 = [(MCSMessageOperation *)self->_seenOrTransferOperation willMarkUnread];
  if (self->_isDeleteInPlace) {
    v3 |= [(MCSMessageOperation *)self->_deleteOperation willMarkUnread];
  }
  return v3;
}

- (BOOL)willUnflag
{
  unsigned int v3 = [(MCSMessageOperation *)self->_seenOrTransferOperation willUnflag];
  if (self->_isDeleteInPlace) {
    v3 |= [(MCSMessageOperation *)self->_deleteOperation willUnflag];
  }
  return v3;
}

- (BOOL)willFlag
{
  unsigned int v3 = [(MCSMessageOperation *)self->_seenOrTransferOperation willFlag];
  if (self->_isDeleteInPlace) {
    v3 |= [(MCSMessageOperation *)self->_deleteOperation willFlag];
  }
  return v3;
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return [(MCSMessageOperation *)self->_seenOrTransferOperation localizedErrorDescriptionForMessageCount:a3];
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return [(MCSMessageOperation *)self->_seenOrTransferOperation localizedErrorTitleForMessageCount:a3];
}

- (id)localizedShortOperationDescription
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"OPERATION_ARCHIVE_DESC" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteOperation, 0);

  objc_storeStrong((id *)&self->_seenOrTransferOperation, 0);
}

@end