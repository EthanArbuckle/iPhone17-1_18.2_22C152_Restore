@interface MSASConnection
+ (id)sharedConnection;
- (MSASConnection)init;
- (NSMutableDictionary)focusAlbumGUIDByPersonID;
- (NSMutableDictionary)focusAlbumTimerByPersonID;
- (NSMutableDictionary)foregroundPingTimerContextByPersonID;
- (NSMutableDictionary)serverSideConfigurationDictionaryByPersonID;
- (OS_dispatch_queue)memberQueue;
- (XPCNSClientConnection)connection;
- (id)_cloneArray:(id)a3;
- (id)_communicationFailureError;
- (void)XPCNSClientConnection:(id)a3 didReceiveRequest:(id)a4;
- (void)_sendMessageReliably:(id)a3;
- (void)_sendMessageReliably:(id)a3 data:(id)a4 successHandler:(id)a5 failureHandler:(id)a6;
- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4;
- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)accessControlGUIDsForAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)accessControlWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)activityIsThrottledByLackOfDiskSpacePersonID:(id)a3 completionBlock:(id)a4;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)addAlbum:(id)a3 personID:(id)a4;
- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)albumGUIDsForPersonID:(id)a3 completionBlock:(id)a4;
- (void)albumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)assetCollectionGUIDsInAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)assetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)cancelActivitiesForPersonID:(id)a3;
- (void)clientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 ownerUserID:(id)a5 personID:(id)a6 completionBlock:(id)a7;
- (void)commentGUIDsForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)commentWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4;
- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4;
- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4;
- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)forgetEverythingAboutPersonID:(id)a3;
- (void)handlePushNotificationForPersonID:(id)a3;
- (void)invitationGUIDsForPersonID:(id)a3 completionBlock:(id)a4;
- (void)invitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)isAssetCollectionWithGUID:(id)a3 markedAsUnviewedPersonID:(id)a4 completionBlock:(id)a5;
- (void)isInRetryStateHandler:(id)a3;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6;
- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6;
- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4;
- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5;
- (void)nextActivityDateHandler:(id)a3;
- (void)pingForeground;
- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6;
- (void)refreshResetSync:(BOOL)a3 personID:(id)a4;
- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5;
- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4;
- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4;
- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5;
- (void)retryOutstandingActivities;
- (void)retryOutstandingActivitiesForPersonID:(id)a3;
- (void)serverSideConfigurationDictionaryForPersonID:(id)a3 completionBlock:(id)a4;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)setConnection:(id)a3;
- (void)setFocusAlbum:(id)a3 forPersonID:(id)a4;
- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4;
- (void)setFocusAlbumGUIDByPersonID:(id)a3;
- (void)setFocusAlbumTimerByPersonID:(id)a3;
- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4;
- (void)setForegroundPingTimerContextByPersonID:(id)a3;
- (void)setIsUIForeground:(BOOL)a3 forPersonID:(id)a4;
- (void)setMemberQueue:(id)a3;
- (void)setMigrationMarker:(id)a3 personID:(id)a4;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)setServerSideConfigurationDictionaryByPersonID:(id)a3;
- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)timerPingQueueForegroundPingTimerExpiredContext:(id)a3 personID:(id)a4;
- (void)timerPingQueueSendSetUIForeground:(BOOL)a3 personID:(id)a4;
- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)videoURLForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 personID:(id)a5 completionBlock:(id)a6;
@end

@implementation MSASConnection

- (void)timerPingQueueForegroundPingTimerExpiredContext:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 enabled])
  {
    [(MSASConnection *)self timerPingQueueSendSetUIForeground:1 personID:v7];
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    v9 = _timerPingQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MSASConnection_timerPingQueueForegroundPingTimerExpiredContext_personID___block_invoke;
    block[3] = &unk_1E6CFCAC8;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_after(v8, v9, block);
  }
  else
  {
    v10 = [(MSASConnection *)self foregroundPingTimerContextByPersonID];
    [v10 removeObjectForKey:v7];
  }
}

- (void)timerPingQueueSendSetUIForeground:(BOOL)a3 personID:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = *MEMORY[0x1E4F5C6C0];
  uint64_t v8 = *MEMORY[0x1E4F5C490];
  v9 = [NSNumber numberWithBool:v4];
  v10 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, v8, v9, *MEMORY[0x1E4F5C4C0], 0);

  if (v11) {
    [v10 setObject:v11 forKey:*MEMORY[0x1E4F5C670]];
  }
  [(MSASConnection *)self _sendMessageReliably:v10];
}

- (void)_sendMessageReliably:(id)a3 data:(id)a4 successHandler:(id)a5 failureHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v14 = [(MSASConnection *)self connection];

  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v19 = [v10 objectForKey:*MEMORY[0x1E4F5C490]];
    *(_DWORD *)buf = 138543362;
    v25 = v19;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "XPCNSClientConnection is nil. Failed to send XPC command: %{public}@", buf, 0xCu);
  }
  v15 = [(MSASConnection *)self connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke;
  v20[3] = &unk_1E6CFCA28;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  [v15 sendMessageReliably:v17 data:v13 maxRetryCount:5 withHandler:v20];
}

- (XPCNSClientConnection)connection
{
  return self->_connection;
}

- (void)_sendMessageReliably:(id)a3
{
}

- (NSMutableDictionary)foregroundPingTimerContextByPersonID
{
  foregroundPingTimerContextByPersonID = self->_foregroundPingTimerContextByPersonID;
  if (!foregroundPingTimerContextByPersonID)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = self->_foregroundPingTimerContextByPersonID;
    self->_foregroundPingTimerContextByPersonID = v4;

    foregroundPingTimerContextByPersonID = self->_foregroundPingTimerContextByPersonID;
  }

  return foregroundPingTimerContextByPersonID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfigurationDictionaryByPersonID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUIDByPersonID, 0);
  objc_storeStrong((id *)&self->_focusAlbumTimerByPersonID, 0);
  objc_storeStrong((id *)&self->_foregroundPingTimerContextByPersonID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setServerSideConfigurationDictionaryByPersonID:(id)a3
{
}

- (void)setFocusAlbumGUIDByPersonID:(id)a3
{
}

- (void)setFocusAlbumTimerByPersonID:(id)a3
{
}

- (void)setForegroundPingTimerContextByPersonID:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)XPCNSClientConnection:(id)a3 didReceiveRequest:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MSASConnection received an unexpected request. Ignoring.", v4, 2u);
  }
}

- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v9 = *MEMORY[0x1E4F5C5F0];
  uint64_t v10 = *MEMORY[0x1E4F5C490];
  uint64_t v11 = *MEMORY[0x1E4F5C670];
  uint64_t v12 = *MEMORY[0x1E4F5C3E8];
  id v13 = NSNumber;
  id v14 = a5;
  id v15 = a3;
  id v17 = [v13 numberWithInt:v5];
  id v16 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v14, v11, v15, v12, v17, *MEMORY[0x1E4F5C440], 0);

  [(MSASConnection *)self _sendMessageReliably:v16];
}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5F8], *MEMORY[0x1E4F5C490], a5, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C448], a4, *MEMORY[0x1E4F5C3A0], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)forgetEverythingAboutPersonID:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C570], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C670], 0);
  [(MSASConnection *)self _sendMessageReliably:v4];
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C560], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C460], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C510], *MEMORY[0x1E4F5C490], a5, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C468], a4, *MEMORY[0x1E4F5C3E0], a6, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v7];
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5
{
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5B0], *MEMORY[0x1E4F5C490], a5, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], a4, *MEMORY[0x1E4F5C4C8], a6, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v7];
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5
{
}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C558], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E8], 0);
  [(MSASConnection *)self _sendMessageReliably:v5];
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C550], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C508], *MEMORY[0x1E4F5C490], a5, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C438], a4, *MEMORY[0x1E4F5C3A0], a6, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v7];
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5E8], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C6C8], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4F8], *MEMORY[0x1E4F5C490], a5, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C6D0], a4, *MEMORY[0x1E4F5C3A0], a6, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v7];
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5E0], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C4A8], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4
{
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4D0], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C4A8], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4
{
}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4D8], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C4B0], v10, *MEMORY[0x1E4F5C498], 0);
  id v13 = [(MSASConnection *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MSASConnection_acceptInvitationWithToken_personID_info_completionBlock___block_invoke;
  v16[3] = &unk_1E6CFCB90;
  id v18 = self;
  id v19 = v11;
  id v17 = v10;
  id v14 = v10;
  id v15 = v11;
  [v13 sendMessageReliably:v12 data:0 maxRetryCount:5 withHandler:v16];
}

void __74__MSASConnection_acceptInvitationWithToken_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (a2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v10 = v5;
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F5C498]];
    uint64_t v8 = [v10 objectForKey:*MEMORY[0x1E4F5C478]];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v10 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _communicationFailureError];
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
  }

  id v5 = v10;
LABEL_7:
}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__MSASConnection_acceptInvitationWithToken_personID_completionBlock___block_invoke;
  v10[3] = &unk_1E6CFCB68;
  id v11 = v8;
  id v9 = v8;
  [(MSASConnection *)self acceptInvitationWithToken:a3 personID:a4 info:0 completionBlock:v10];
}

uint64_t __69__MSASConnection_acceptInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F5C598];
  uint64_t v10 = *MEMORY[0x1E4F5C670];
  v19[0] = *MEMORY[0x1E4F5C490];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E4F5C3A0];
  v20[2] = a3;
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v15 = [(MSASConnection *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__MSASConnection_markAsSpamAlbumWithGUID_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E6CFCBB8;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v15 sendMessageReliably:v14 data:0 maxRetryCount:5 withHandler:v17];
}

void __67__MSASConnection_markAsSpamAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (a2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    uint64_t v7 = [*(id *)(a1 + 32) _communicationFailureError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  id v5 = v8;
LABEL_7:
}

- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F5C5A0];
  uint64_t v10 = *MEMORY[0x1E4F5C670];
  v19[0] = *MEMORY[0x1E4F5C490];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E4F5C4A8];
  v20[2] = a3;
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v15 = [(MSASConnection *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__MSASConnection_markAsSpamInvitationWithGUID_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E6CFCBB8;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v15 sendMessageReliably:v14 data:0 maxRetryCount:5 withHandler:v17];
}

void __72__MSASConnection_markAsSpamInvitationWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (a2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    uint64_t v7 = [*(id *)(a1 + 32) _communicationFailureError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  id v5 = v8;
LABEL_7:
}

- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F5C5A8];
  uint64_t v10 = *MEMORY[0x1E4F5C670];
  v19[0] = *MEMORY[0x1E4F5C490];
  v19[1] = v10;
  v20[0] = v9;
  v20[1] = a4;
  v19[2] = *MEMORY[0x1E4F5C4B0];
  v20[2] = a3;
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v15 = [(MSASConnection *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__MSASConnection_markAsSpamInvitationWithToken_personID_completionBlock___block_invoke;
  v17[3] = &unk_1E6CFCBB8;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v15 sendMessageReliably:v14 data:0 maxRetryCount:5 withHandler:v17];
}

void __73__MSASConnection_markAsSpamInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (a2)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v5;
    uint64_t v7 = [*(id *)(a1 + 32) _communicationFailureError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  id v5 = v8;
LABEL_7:
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C638], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C630], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a3;
  id v11 = a6;
  id v26 = a7;
  v24 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v12 = *MEMORY[0x1E4F5C620];
  uint64_t v13 = *MEMORY[0x1E4F5C490];
  uint64_t v14 = *MEMORY[0x1E4F5C670];
  uint64_t v15 = *MEMORY[0x1E4F5C3A0];
  id v16 = NSNumber;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v16 numberWithBool:v10];
  v20 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v12, v13, v17, v14, v18, v15, v19, *MEMORY[0x1E4F5C470], v11, *MEMORY[0x1E4F5C498], 0);

  id v21 = [(MSASConnection *)self connection];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __96__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v27[3] = &unk_1E6CFCB90;
  v29 = self;
  id v30 = v26;
  id v28 = v11;
  id v22 = v11;
  id v23 = v26;
  [v21 sendMessageReliably:v20 data:0 maxRetryCount:5 withHandler:v27];
}

void __96__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  if (a2)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F5C498]];
    id v8 = [v10 objectForKey:*MEMORY[0x1E4F5C478]];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _communicationFailureError];
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
  }
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E6CFCB68;
  id v13 = v10;
  id v11 = v10;
  [(MSASConnection *)self setMultipleContributorsEnabled:v8 forAlbumWithGUID:a4 personID:a5 info:0 completionBlock:v12];
}

uint64_t __91__MSASConnection_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  BOOL v10 = a3;
  id v11 = a6;
  id v26 = a7;
  v24 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v12 = *MEMORY[0x1E4F5C628];
  uint64_t v13 = *MEMORY[0x1E4F5C490];
  uint64_t v14 = *MEMORY[0x1E4F5C670];
  uint64_t v15 = *MEMORY[0x1E4F5C3A0];
  id v16 = NSNumber;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v16 numberWithBool:v10];
  v20 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v12, v13, v17, v14, v18, v15, v19, *MEMORY[0x1E4F5C470], v11, *MEMORY[0x1E4F5C498], 0);

  id v21 = [(MSASConnection *)self connection];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v27[3] = &unk_1E6CFCB90;
  v29 = self;
  id v30 = v26;
  id v28 = v11;
  id v22 = v11;
  id v23 = v26;
  [v21 sendMessageReliably:v20 data:0 maxRetryCount:5 withHandler:v27];
}

void __88__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  if (a2)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F5C498]];
    BOOL v8 = [v10 objectForKey:*MEMORY[0x1E4F5C478]];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _communicationFailureError];
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v9, v7);
  }
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E6CFCB68;
  id v13 = v10;
  id v11 = v10;
  [(MSASConnection *)self setPublicAccessEnabled:v8 forAlbumWithGUID:a4 personID:a5 info:0 completionBlock:v12];
}

uint64_t __83__MSASConnection_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6
{
  BOOL v6 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = *MEMORY[0x1E4F5C590];
  uint64_t v11 = *MEMORY[0x1E4F5C490];
  uint64_t v12 = *MEMORY[0x1E4F5C670];
  uint64_t v13 = *MEMORY[0x1E4F5C3A0];
  uint64_t v14 = NSNumber;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v19 = [v14 numberWithBool:v6];
  id v18 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v16, v12, v17, v13, v19, *MEMORY[0x1E4F5C650], v15, *MEMORY[0x1E4F5C498], 0);

  [(MSASConnection *)self _sendMessageReliably:v18];
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5
{
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4
{
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C548], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)setMigrationMarker:(id)a3 personID:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C618], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C668], a4, *MEMORY[0x1E4F5C670], 0);
  [(MSASConnection *)self _sendMessageReliably:v5];
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F5C608];
  uint64_t v9 = *MEMORY[0x1E4F5C490];
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, v9, a3, *MEMORY[0x1E4F5C458], a5, *MEMORY[0x1E4F5C670], a4, *MEMORY[0x1E4F5C3A0], a6, *MEMORY[0x1E4F5C498], 0);
  }
  else {
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, v9, a5, *MEMORY[0x1E4F5C670], a4, *MEMORY[0x1E4F5C3A0], a6, *MEMORY[0x1E4F5C498], 0, v10, v11);
  }
  [(MSASConnection *)self _sendMessageReliably:v12];
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5B8], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A8], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4
{
}

- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C500], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A8], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)addAlbum:(id)a3 personID:(id)a4
{
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  BOOL v7 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = *MEMORY[0x1E4F5C5C8];
  uint64_t v11 = *MEMORY[0x1E4F5C490];
  uint64_t v12 = *MEMORY[0x1E4F5C670];
  uint64_t v13 = *MEMORY[0x1E4F5C3E0];
  uint64_t v14 = NSNumber;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v19 = [v14 numberWithBool:v7];
  id v18 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v16, v12, v17, v13, v19, *MEMORY[0x1E4F5C688], v15, *MEMORY[0x1E4F5C498], 0);

  [(MSASConnection *)self _sendMessageReliably:v18];
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C5C0], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], a5, *MEMORY[0x1E4F5C498], 0);
  [(MSASConnection *)self _sendMessageReliably:v6];
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  BOOL v7 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = *MEMORY[0x1E4F5C5D0];
  uint64_t v12 = *MEMORY[0x1E4F5C490];
  uint64_t v13 = *MEMORY[0x1E4F5C670];
  uint64_t v14 = NSNumber;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v19 = [v14 numberWithBool:v7];
  id v18 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v16, v13, v19, *MEMORY[0x1E4F5C688], v17, *MEMORY[0x1E4F5C3A0], v15, *MEMORY[0x1E4F5C498], 0);

  [(MSASConnection *)self _sendMessageReliably:v18];
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v9 = *MEMORY[0x1E4F5C5D8];
  uint64_t v10 = *MEMORY[0x1E4F5C490];
  uint64_t v11 = NSNumber;
  id v12 = a5;
  id v13 = a4;
  id v15 = [v11 numberWithBool:v6];
  uint64_t v14 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, v10, v15, *MEMORY[0x1E4F5C688], v13, *MEMORY[0x1E4F5C670], v12, *MEMORY[0x1E4F5C498], 0);

  [(MSASConnection *)self _sendMessageReliably:v14];
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4
{
}

- (void)clientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 ownerUserID:(id)a5 personID:(id)a6 completionBlock:(id)a7
{
  id v12 = a7;
  uint64_t v13 = *MEMORY[0x1E4F5C568];
  uint64_t v14 = *MEMORY[0x1E4F5C490];
  uint64_t v15 = *MEMORY[0x1E4F5C680];
  uint64_t v16 = *MEMORY[0x1E4F5C6E0];
  if (a5)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v13, v14, a3, v15, a4, v16, a5, *MEMORY[0x1E4F5C660], a6, *MEMORY[0x1E4F5C670], 0);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke;
    v28[3] = &unk_1E6CFCA78;
    id v18 = &v29;
    id v29 = v12;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_2;
    v26[3] = &unk_1E6CFCA00;
    id v19 = &v27;
    id v27 = v29;
    v20 = v28;
    id v21 = v26;
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v13, v14, a3, v15, a4, v16, a6, *MEMORY[0x1E4F5C670], 0);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_3;
    v24[3] = &unk_1E6CFCA78;
    id v18 = &v25;
    id v25 = v12;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_4;
    v22[3] = &unk_1E6CFCA00;
    id v19 = &v23;
    id v23 = v25;
    v20 = v24;
    id v21 = v22;
  }
  [(MSASConnection *)self _sendMessageReliably:v17 data:0 successHandler:v20 failureHandler:v21];
}

void __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __88__MSASConnection_clientOrgKeyForRecordID_zoneName_ownerUserID_personID_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)serverSideConfigurationDictionaryForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(MSASConnection *)self serverSideConfigurationDictionaryByPersonID];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    v7[2](v7, v9);
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C600], *MEMORY[0x1E4F5C490], v6, *MEMORY[0x1E4F5C670], 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke;
    v14[3] = &unk_1E6CFCB40;
    v14[4] = self;
    id v15 = v6;
    uint64_t v16 = v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke_31;
    v11[3] = &unk_1E6CFCDC8;
    v11[4] = self;
    id v12 = v15;
    uint64_t v13 = v16;
    [(MSASConnection *)self _sendMessageReliably:v10 data:0 successHandler:v14 failureHandler:v11];
  }
}

void __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved server side config for personID %@: %{public}@", (uint8_t *)&v7, 0x20u);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    BOOL v4 = [*(id *)(a1 + 32) serverSideConfigurationDictionaryByPersonID];
    [v4 setObject:v3 forKey:*(void *)(a1 + 40)];
  }
LABEL_4:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __79__MSASConnection_serverSideConfigurationDictionaryForPersonID_completionBlock___block_invoke_31(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve server side config for person ID %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)commentWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C540], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C460], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __59__MSASConnection_commentWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)commentGUIDsForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C538], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __82__MSASConnection_commentGUIDsForAssetCollectionWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isAssetCollectionWithGUID:(id)a3 markedAsUnviewedPersonID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C588], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLValue]);
}

uint64_t __85__MSASConnection_isAssetCollectionWithGUID_markedAsUnviewedPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 personID:(id)a5 completionBlock:(id)a6
{
  id v22 = a6;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = *MEMORY[0x1E4F5C648];
  uint64_t v11 = *MEMORY[0x1E4F5C490];
  uint64_t v12 = *MEMORY[0x1E4F5C670];
  uint64_t v13 = *MEMORY[0x1E4F5C3E0];
  id v14 = NSNumber;
  id v15 = a5;
  id v16 = a3;
  id v17 = [v14 numberWithUnsignedInteger:a4];
  id v18 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v15, v12, v16, v13, v17, *MEMORY[0x1E4F5C6E8], 0);

  id v19 = [(MSASConnection *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__MSASConnection_videoURLsForAssetCollectionWithGUID_forMediaAssetType_personID_completionBlock___block_invoke;
  v23[3] = &unk_1E6CFCB18;
  id v24 = v22;
  id v20 = v22;
  [v19 sendMessageReliably:v18 data:0 maxRetryCount:5 withHandler:v23];
}

void __97__MSASConnection_videoURLsForAssetCollectionWithGUID_forMediaAssetType_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  if (a2)
  {
    __int16 v7 = [v5 objectForKey:*MEMORY[0x1E4F5C478]];
    id v8 = [v10 objectForKey:*MEMORY[0x1E4F5C6A0]];
    uint64_t v9 = [v10 objectForKey:*MEMORY[0x1E4F5C6D8]];
    (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void))(v6 + 16))(v6, 0, 0, 0);
  }
}

- (void)videoURLForAssetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C640], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], 0);
  id v10 = [(MSASConnection *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__MSASConnection_videoURLForAssetCollectionWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E6CFCB18;
  id v13 = v8;
  id v11 = v8;
  [v10 sendMessageReliably:v9 data:0 maxRetryCount:5 withHandler:v12];
}

void __78__MSASConnection_videoURLForAssetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  if (a2)
  {
    __int16 v7 = [v5 objectForKey:*MEMORY[0x1E4F5C478]];
    id v8 = [v10 objectForKey:*MEMORY[0x1E4F5C6A0]];
    uint64_t v9 = [v10 objectForKey:*MEMORY[0x1E4F5C6D8]];
    (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void))(v6 + 16))(v6, 0, 0, 0);
  }
}

- (void)assetCollectionWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C530], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3E0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __67__MSASConnection_assetCollectionWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)assetCollectionGUIDsInAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C528], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __79__MSASConnection_assetCollectionGUIDsInAlbumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invitationWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C580], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C4A8], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __62__MSASConnection_invitationWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invitationGUIDsForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  __int16 v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C578], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C670], 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke;
  v11[3] = &unk_1E6CFCA78;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke_2;
  v9[3] = &unk_1E6CFCA00;
  id v10 = v12;
  id v8 = v12;
  [(MSASConnection *)self _sendMessageReliably:v7 data:0 successHandler:v11 failureHandler:v9];
}

void __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __61__MSASConnection_invitationGUIDsForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accessControlWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4E8], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C398], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __65__MSASConnection_accessControlWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accessControlGUIDsForAlbumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4E0], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __78__MSASConnection_accessControlGUIDsForAlbumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)albumWithGUID:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C520], *MEMORY[0x1E4F5C490], a4, *MEMORY[0x1E4F5C670], a3, *MEMORY[0x1E4F5C3A0], 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke;
  v13[3] = &unk_1E6CFCA78;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E6CFCA00;
  id v12 = v14;
  id v10 = v14;
  [(MSASConnection *)self _sendMessageReliably:v9 data:0 successHandler:v13 failureHandler:v11];
}

void __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __57__MSASConnection_albumWithGUID_personID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)albumGUIDsForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  __int16 v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C518], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C670], 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke;
  v11[3] = &unk_1E6CFCA78;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke_2;
  v9[3] = &unk_1E6CFCA00;
  id v10 = v12;
  id v8 = v12;
  [(MSASConnection *)self _sendMessageReliably:v7 data:0 successHandler:v11 failureHandler:v9];
}

void __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __56__MSASConnection_albumGUIDsForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _timerPingQueue();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __58__MSASConnection_setFocusAssetCollectionGUID_forPersonID___block_invoke;
  id v14 = &unk_1E6CFCE40;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  dispatch_async(v8, &block);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting focus asset collection GUID to %{public}@", buf, 0x16u);
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C610], *MEMORY[0x1E4F5C490], v9, *MEMORY[0x1E4F5C670], v6, *MEMORY[0x1E4F5C3E0], 0, block, v12, v13, v14, v15);
  [(MSASConnection *)self _sendMessageReliably:v10];
}

uint64_t __58__MSASConnection_setFocusAssetCollectionGUID_forPersonID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerPingQueueSendSetUIForeground:1 personID:*(void *)(a1 + 40)];
}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _timerPingQueue();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __48__MSASConnection_setFocusAlbumGUID_forPersonID___block_invoke;
  id v14 = &unk_1E6CFCE40;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  dispatch_async(v8, &block);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting focus album GUID to %{public}@", buf, 0x16u);
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C6B8], *MEMORY[0x1E4F5C490], v9, *MEMORY[0x1E4F5C670], v6, *MEMORY[0x1E4F5C3A0], 0, block, v12, v13, v14, v15);
  [(MSASConnection *)self _sendMessageReliably:v10];
}

uint64_t __48__MSASConnection_setFocusAlbumGUID_forPersonID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerPingQueueSendSetUIForeground:1 personID:*(void *)(a1 + 40)];
}

- (void)setFocusAlbum:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = [a3 GUID];
  [(MSASConnection *)self setFocusAlbumGUID:v7 forPersonID:v6];
}

- (void)setIsUIForeground:(BOOL)a3 forPersonID:(id)a4
{
  id v6 = (__CFString *)a4;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_1F39420B0;
  }
  id v8 = _timerPingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke;
  block[3] = &unk_1E6CFCAF0;
  BOOL v12 = a3;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) foregroundPingTimerContextByPersonID];
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  id v5 = v4;
  if (v2)
  {

    if (v5)
    {
      [v5 enable];
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F5C390]);
      id v7 = [*(id *)(a1 + 32) foregroundPingTimerContextByPersonID];
      [v7 setObject:v6 forKey:*(void *)(a1 + 40)];

      dispatch_time_t v8 = dispatch_time(0, 5000000000);
      id v9 = _timerPingQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke_2;
      block[3] = &unk_1E6CFCAC8;
      id v10 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      id v14 = v6;
      id v15 = v10;
      id v11 = v6;
      dispatch_after(v8, v9, block);

      [*(id *)(a1 + 32) timerPingQueueSendSetUIForeground:1 personID:*(void *)(a1 + 40)];
    }
  }
  else
  {
    [v4 disable];

    id v12 = [*(id *)(a1 + 32) foregroundPingTimerContextByPersonID];
    [v12 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

uint64_t __48__MSASConnection_setIsUIForeground_forPersonID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerPingQueueForegroundPingTimerExpiredContext:*(void *)(a1 + 40) personID:*(void *)(a1 + 48)];
}

uint64_t __75__MSASConnection_timerPingQueueForegroundPingTimerExpiredContext_personID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerPingQueueForegroundPingTimerExpiredContext:*(void *)(a1 + 40) personID:*(void *)(a1 + 48)];
}

- (void)pingForeground
{
  id v3 = _timerPingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MSASConnection_pingForeground__block_invoke;
  block[3] = &unk_1E6CFCBF0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__MSASConnection_pingForeground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerPingQueueSendSetUIForeground:1 personID:&stru_1F39420B0];
}

- (void)activityIsThrottledByLackOfDiskSpacePersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C4F0], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C670], 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke;
  v11[3] = &unk_1E6CFCA78;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke_2;
  v9[3] = &unk_1E6CFCA00;
  id v10 = v12;
  id v8 = v12;
  [(MSASConnection *)self _sendMessageReliably:v7 data:0 successHandler:v11 failureHandler:v9];
}

void __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, [v3 intValue] != 0);
}

uint64_t __79__MSASConnection_activityIsThrottledByLackOfDiskSpacePersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handlePushNotificationForPersonID:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F5C678];
    uint64_t v7 = *MEMORY[0x1E4F5C670];
    v11[0] = *MEMORY[0x1E4F5C490];
    v11[1] = v7;
    v12[0] = v6;
    v12[1] = v4;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(MSASConnection *)self _sendMessageReliably:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = self;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Missing person ID for push notification, ignoring.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cancelActivitiesForPersonID:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F5C450], *MEMORY[0x1E4F5C490], a3, *MEMORY[0x1E4F5C670], 0);
  [(MSASConnection *)self _sendMessageReliably:v4];
}

- (void)retryOutstandingActivitiesForPersonID:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5C698];
  uint64_t v6 = *MEMORY[0x1E4F5C670];
  v11[0] = *MEMORY[0x1E4F5C490];
  v11[1] = v6;
  v12[0] = v5;
  v12[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke;
  v9[3] = &unk_1E6CFCAA0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(MSASConnection *)self _sendMessageReliably:v7 data:0 successHandler:v9 failureHandler:&__block_literal_global_25];
}

void __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C478]];
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543874;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to send message to retry outstanding activities for personID %@. Error: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

void __56__MSASConnection_retryOutstandingActivitiesForPersonID___block_invoke_23()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v0 = 0;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to send message to retry outstanding activities.", v0, 2u);
  }
}

- (void)retryOutstandingActivities
{
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F5C690] forKey:*MEMORY[0x1E4F5C490]];
  [(MSASConnection *)self _sendMessageReliably:v3];
}

- (void)isInRetryStateHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F5C4B8] forKey:*MEMORY[0x1E4F5C490]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MSASConnection_isInRetryStateHandler___block_invoke;
  v9[3] = &unk_1E6CFCA78;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MSASConnection_isInRetryStateHandler___block_invoke_2;
  v7[3] = &unk_1E6CFCA00;
  id v8 = v10;
  id v6 = v10;
  [(MSASConnection *)self _sendMessageReliably:v5 data:0 successHandler:v9 failureHandler:v7];
}

void __40__MSASConnection_isInRetryStateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLValue]);
}

uint64_t __40__MSASConnection_isInRetryStateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)nextActivityDateHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F5C658] forKey:*MEMORY[0x1E4F5C490]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MSASConnection_nextActivityDateHandler___block_invoke;
  v9[3] = &unk_1E6CFCA78;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MSASConnection_nextActivityDateHandler___block_invoke_2;
  v7[3] = &unk_1E6CFCA00;
  id v8 = v10;
  id v6 = v10;
  [(MSASConnection *)self _sendMessageReliably:v5 data:0 successHandler:v9 failureHandler:v7];
}

void __42__MSASConnection_nextActivityDateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 objectForKey:*MEMORY[0x1E4F5C6A0]];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __42__MSASConnection_nextActivityDateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_cloneArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v5 = [v3 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      uint64_t v7 = __30__MSASConnection__cloneArray___block_invoke;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v12;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        uint64_t v7 = __30__MSASConnection__cloneArray___block_invoke_2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v11;
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          uint64_t v7 = __30__MSASConnection__cloneArray___block_invoke_3;
        }
        else
        {
          id v6 = v10;
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          uint64_t v7 = __30__MSASConnection__cloneArray___block_invoke_4;
        }
      }
    }
    v6[2] = v7;
    v6[3] = &unk_1E6CFCA50;
    id v8 = v4;
    v6[4] = v8;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

void __30__MSASConnection__cloneArray___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F5C360] albumWithAlbum:a2];
  [v2 addObject:v3];
}

void __30__MSASConnection__cloneArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F5C368] assetCollectionWithAssetCollection:a2];
  [v2 addObject:v3];
}

void __30__MSASConnection__cloneArray___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F5C380] assetWithAsset:a2];
  [v2 addObject:v3];
}

void __30__MSASConnection__cloneArray___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  [v2 addObject:v3];
}

- (id)_communicationFailureError
{
  if (_communicationFailureError_onceToken != -1) {
    dispatch_once(&_communicationFailureError_onceToken, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)_communicationFailureError_error;

  return v2;
}

void __44__MSASConnection__communicationFailureError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  MSMSLocalizedString(@"ERROR_CONNECTION_FAILED");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASConnectionErrorDomain" code:0 description:v3];
  uint64_t v2 = (void *)_communicationFailureError_error;
  _communicationFailureError_error = v1;
}

void __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_2;
      block[3] = &unk_1E6CFCD50;
      uint64_t v7 = &v14;
      id v14 = v6;
      id v13 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_8:
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F5C490]];
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to send XPC command: %{public}@", buf, 0xCu);
    }
    id v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_8;
      v10[3] = &unk_1E6CFCA00;
      uint64_t v7 = &v11;
      id v11 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v10);
      goto LABEL_8;
    }
  }
}

uint64_t __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__MSASConnection__sendMessageReliably_data_successHandler_failureHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSMutableDictionary)serverSideConfigurationDictionaryByPersonID
{
  serverSideConfigurationDictionaryByPersonID = self->_serverSideConfigurationDictionaryByPersonID;
  if (!serverSideConfigurationDictionaryByPersonID)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_serverSideConfigurationDictionaryByPersonID;
    self->_serverSideConfigurationDictionaryByPersonID = v4;

    serverSideConfigurationDictionaryByPersonID = self->_serverSideConfigurationDictionaryByPersonID;
  }

  return serverSideConfigurationDictionaryByPersonID;
}

- (NSMutableDictionary)focusAlbumGUIDByPersonID
{
  focusAlbumGUIDByPersonID = self->_focusAlbumGUIDByPersonID;
  if (!focusAlbumGUIDByPersonID)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_focusAlbumGUIDByPersonID;
    self->_focusAlbumGUIDByPersonID = v4;

    focusAlbumGUIDByPersonID = self->_focusAlbumGUIDByPersonID;
  }

  return focusAlbumGUIDByPersonID;
}

- (NSMutableDictionary)focusAlbumTimerByPersonID
{
  focusAlbumTimerByPersonID = self->_focusAlbumTimerByPersonID;
  if (!focusAlbumTimerByPersonID)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_focusAlbumTimerByPersonID;
    self->_focusAlbumTimerByPersonID = v4;

    focusAlbumTimerByPersonID = self->_focusAlbumTimerByPersonID;
  }

  return focusAlbumTimerByPersonID;
}

- (MSASConnection)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MSASConnection;
  uint64_t v2 = [(MSASConnection *)&v13 init];
  if (v2)
  {
    if (_initializePlatform_onceToken != -1) {
      dispatch_once(&_initializePlatform_onceToken, &__block_literal_global_224);
    }
    id v3 = [[XPCNSClientConnection alloc] initWithServiceName:@"com.apple.mediastream.sharing" delegate:v2];
    [(MSASConnection *)v2 setConnection:v3];

    dispatch_queue_t v4 = dispatch_queue_create("MSASConnection member queue", MEMORY[0x1E4F14430]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;

    int out_token = 0;
    id v6 = (const char *)[(id)*MEMORY[0x1E4F5C6B0] UTF8String];
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __22__MSASConnection_init__block_invoke;
    v10[3] = &unk_1E6CFC9D8;
    id v8 = v2;
    id v11 = v8;
    LODWORD(v6) = notify_register_dispatch(v6, &out_token, v7, v10);

    if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not register for server-side configuration change notification.", buf, 0xCu);
    }
  }
  return v2;
}

void __22__MSASConnection_init__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v2;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@: Server side configuration changed. Purging local cache.", buf, 0xCu);
  }
  id v3 = *(void **)(a1 + 32);
  dispatch_queue_t v4 = v3[6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MSASConnection_init__block_invoke_4;
  block[3] = &unk_1E6CFCBF0;
  uint64_t v7 = v3;
  dispatch_barrier_sync(v4, block);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F5C6B0] object:*(void *)(a1 + 32)];
}

void __22__MSASConnection_init__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_478);
  }
  uint64_t v2 = (void *)sharedConnection_connection;

  return v2;
}

uint64_t __34__MSASConnection_sharedConnection__block_invoke()
{
  sharedConnection_connection = objc_alloc_init(MSASConnection);

  return MEMORY[0x1F41817F8]();
}

@end