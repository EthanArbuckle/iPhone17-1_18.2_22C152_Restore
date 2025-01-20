@interface BTAVRCP_ItemsFolder
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (id)targetApp;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_ItemsFolder

- (id)targetApp
{
  return 0;
}

- (unint64_t)childrenCount
{
  v2 = [(BTAVRCP_VFSFolder *)self query];
  v3 = [v2 items];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  v5 = [(BTAVRCP_VFSFolder *)self query];
  v6 = [v5 itemWithUid:a3];

  if (v6) {
    return 8;
  }
  else {
    return 9;
  }
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  v7 = [(BTAVRCP_VFSFolder *)self query];
  v8 = [v7 itemAtIndex:a3];

  v9 = [v8 replyItemWithAttributeIDs:v6];

  return v9;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  v7 = [(BTAVRCP_VFSFolder *)self query];
  v8 = [v7 itemWithUid:a3];

  v9 = [v8 replyAttributesForIDs:v6];

  return v9;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  v5 = [(BTAVRCP_VFSFolder *)self query];
  id v6 = [v5 itemWithUid:a3];

  if (v6)
  {
    v7 = [(BTAVRCP_ItemsFolder *)self targetApp];
    if ([v7 isEqualToString:off_10001F048])
    {
      v8 = +[MPMusicPlayerController systemMusicPlayer];
      v9 = [(BTAVRCP_VFSFolder *)self query];
      [v8 setQueueWithQuery:v9 firstItem:v6];

      [v8 play];
    }
    else
    {
      MRSystemAppPlaybackQueueCreate();
      v11 = [(BTAVRCP_VFSFolder *)self query];
      +[NSKeyedArchiver archivedDataWithRootObject:v11];
      MRSystemAppPlaybackQueueSetLocalQueryData();

      [v6 persistentID];
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
      MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
      MRMediaRemoteSetAppPlaybackQueue();
      MRSystemAppPlaybackQueueDestroy();
    }

    unsigned __int8 v10 = 4;
  }
  else
  {
    unsigned __int8 v10 = 9;
  }

  return v10;
}

@end