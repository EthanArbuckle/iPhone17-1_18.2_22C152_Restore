@interface WLGroupMessageInfo
+ (id)groupMessageInfoWithSourceThreadID:(id)a3 sortedHandleIDs:(id)a4 handleIDsAreComplete:(BOOL)a5 roomName:(id)a6 groupID:(id)a7;
- (BOOL)handleIDsAreComplete;
- (NSArray)sortedHandleIDs;
- (NSString)groupID;
- (NSString)roomName;
- (NSString)sourceThreadID;
@end

@implementation WLGroupMessageInfo

+ (id)groupMessageInfoWithSourceThreadID:(id)a3 sortedHandleIDs:(id)a4 handleIDsAreComplete:(BOOL)a5 roomName:(id)a6 groupID:(id)a7
{
  v11 = (NSString *)a3;
  v12 = (NSArray *)a4;
  v13 = (NSString *)a6;
  v14 = (NSString *)a7;
  v15 = objc_alloc_init(WLGroupMessageInfo);
  sourceThreadID = v15->_sourceThreadID;
  v15->_sourceThreadID = v11;
  v17 = v11;

  sortedHandleIDs = v15->_sortedHandleIDs;
  v15->_sortedHandleIDs = v12;
  v19 = v12;

  v15->_handleIDsAreComplete = a5;
  roomName = v15->_roomName;
  v15->_roomName = v13;
  v21 = v13;

  groupID = v15->_groupID;
  v15->_groupID = v14;

  return v15;
}

- (NSString)sourceThreadID
{
  return self->_sourceThreadID;
}

- (NSArray)sortedHandleIDs
{
  return self->_sortedHandleIDs;
}

- (BOOL)handleIDsAreComplete
{
  return self->_handleIDsAreComplete;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_sortedHandleIDs, 0);
  objc_storeStrong((id *)&self->_sourceThreadID, 0);
}

@end