@interface PLInvitationRecordsChangeNotification
+ (id)notificationWithAlbum:(id)a3 snapshot:(id)a4;
- (BOOL)invitationRecordsDidChange;
- (PLGenericAlbum)album;
- (id)name;
- (id)userInfo;
- (void)_calculateDiffs;
@end

@implementation PLInvitationRecordsChangeNotification

+ (id)notificationWithAlbum:(id)a3 snapshot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithObject:v7 snapshot:v6 changedObjects:0];

  return v8;
}

- (void).cxx_destruct
{
}

- (void)_calculateDiffs
{
  self->_invitationRecordsDidChange = 0;
  v3 = [(PLInvitationRecordsChangeNotification *)self album];
  int v4 = [v3 conformsToProtocol:&unk_1EEC33B20];

  if (v4)
  {
    v5 = [(PLContainerChangeNotification *)self snapshot];
    id v6 = v5;
    if (v5 && [v5 hasSnapshotValueForProperty:@"invitationRecords"])
    {
      id v7 = [v6 snapshotValueForProperty:@"invitationRecords"];
      uint64_t v8 = [v7 count];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v9 = [(PLInvitationRecordsChangeNotification *)self album];
    v10 = [v9 invitationRecords];
    uint64_t v11 = [v10 count];

    self->_invitationRecordsDidChange = v8 != v11;
  }
  [(PLContainerChangeNotification *)self _setDidCalculateDiffs:1];
}

- (PLGenericAlbum)album
{
  v3 = [(PLContainerChangeNotification *)self object];
  if ([v3 conformsToProtocol:&unk_1EEC0D4D8])
  {
    int v4 = [(PLContainerChangeNotification *)self object];
  }
  else
  {
    int v4 = 0;
  }

  return (PLGenericAlbum *)v4;
}

- (id)name
{
  v2 = @"PLInvitationRecordsDidChangeNotification";
  return @"PLInvitationRecordsDidChangeNotification";
}

- (BOOL)invitationRecordsDidChange
{
  return self->_invitationRecordsDidChange;
}

- (id)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    int v4 = [MEMORY[0x1E4F1C9E8] dictionary];
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

@end