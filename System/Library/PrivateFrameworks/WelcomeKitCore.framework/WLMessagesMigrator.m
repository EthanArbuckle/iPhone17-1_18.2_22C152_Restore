@interface WLMessagesMigrator
+ (id)_attachmentPersistentPathForGuid:(id)a3 fileName:(id)a4 mimeType:(id)a5 uti:(id)a6;
+ (id)contentType;
- (BOOL)_beginTransaction;
- (BOOL)_commitTransaction;
- (BOOL)_insertChatHandleJoinRowWithChatID:(int64_t)a3 handleID:(int64_t)a4 duplicateMightExist:(BOOL)a5;
- (BOOL)_insertChatMessageJoinRowWithChatID:(int64_t)a3 messageID:(int64_t)a4 date:(int64_t)a5;
- (BOOL)_insertMessage:(id)a3;
- (BOOL)_insertMessageAttachmentJoinRowWithMessageID:(int64_t)a3 attachmentID:(int64_t)a4;
- (BOOL)_messageIsFromMeWithMessage:(id)a3;
- (BOOL)_openDatabase;
- (BOOL)_performSimpleQuery:(id)a3;
- (BOOL)_rollbackTransaction;
- (BOOL)accountBased;
- (BOOL)isValidTableName:(id)a3;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLFeaturePayload)featurePayload;
- (WLMessagesMigrator)initWithSQLController:(id)a3;
- (WLSQLController)sqlController;
- (id)_chatAccountIDWithMessage:(id)a3;
- (id)_chatAccountLoginWithMessage:(id)a3;
- (id)_chatDisplayNameWithMessage:(id)a3;
- (id)_chatGUIDWithGroupRoomName:(id)a3;
- (id)_chatGUIDWithNonGroupMessage:(id)a3;
- (id)_chatGroupIDWithNonGroupMessage:(id)a3;
- (id)_chatPropertiesDataWithMessage:(id)a3;
- (id)_chatServiceWithMessage:(id)a3;
- (id)_databaseFilename;
- (id)_handleIDsForMessage:(id)a3;
- (id)_messageAccountGUIDWithMessage:(id)a3;
- (id)_messageAccountWithMessage:(id)a3;
- (id)_messageAttributedBodyDataWithMessage:(id)a3;
- (id)_messageGroupTitleWithMessage:(id)a3;
- (id)_messageServiceCenterWithMessage:(id)a3;
- (id)_messageServiceWithMessage:(id)a3;
- (id)_messageSubjectWithMessage:(id)a3;
- (id)_otherPartyAddressWithNonGroupMessage:(id)a3;
- (id)_ourAddressWithMessage:(id)a3;
- (id)_serviceStringWithMessage:(id)a3;
- (id)_sortedHandleIDs:(id)a3;
- (id)_uncanonicalizedIDWithMessage:(id)a3;
- (id)_uniqueHandleStringsWithMessage:(id)a3;
- (id)contentType;
- (id)dataType;
- (id)importDidEnd;
- (id)importWillBegin;
- (int64_t)_attachmentDateWithMessage:(id)a3;
- (int64_t)_chatIDForHandleIDs:(id)a3 groupRoomName:(id)a4 groupID:(id)a5 message:(id)a6;
- (int64_t)_chatStateWithMessage:(id)a3;
- (int64_t)_chatStyleWithMessage:(id)a3;
- (int64_t)_handleIDFromNonGroupMessageHandleIDs:(id)a3;
- (int64_t)_insertMessageRowWithMessage:(id)a3 handleIDs:(id)a4 groupRoomName:(id)a5;
- (int64_t)_insertRowWithAttachment:(id)a3 filePath:(id)a4 forMessage:(id)a5;
- (int64_t)_messageDateDeliveredWithMessage:(id)a3;
- (int64_t)_messageDateReadWithMessage:(id)a3;
- (int64_t)_messageDateWithMessage:(id)a3;
- (int64_t)_messageErrorWithMessage:(id)a3;
- (int64_t)_messageVersionWithMessage:(id)a3;
- (int64_t)_senderHandleIDFromReceviedGroupMessageHandleIDs:(id)a3;
- (void)_closeDatabase;
- (void)_updateClient;
- (void)addWorkingTime:(unint64_t)a3;
- (void)deleteData;
- (void)deleteFromTable:(id)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)performPreImportPhaseForSummary:(id)a3 data:(id)a4;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setSqlController:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLMessagesMigrator

- (WLMessagesMigrator)initWithSQLController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLMessagesMigrator;
  v5 = [(WLMessagesMigrator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WLMessagesMigrator *)v5 setSqlController:v4];
  }

  return v6;
}

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"messages";
}

- (id)contentType
{
  return +[WLMessagesMigrator contentType];
}

- (id)dataType
{
  return +[WLMessagesMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:20480];
  }
}

- (void)performPreImportPhaseForSummary:(id)a3 data:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _WLLog();
  objc_super v8 = [(WLMessagesMigrator *)self sqlController];
  v38 = v7;
  uint64_t v9 = +[WLMessage mimeHeadersFromMimeData:v7 sqlController:v8];

  _WLLog();
  v36 = +[WLMessage dateFromMimeHeaders:](WLMessage, "dateFromMimeHeaders:", v9, self, v9);
  objc_msgSend(v6, "setModifiedDate:");
  v10 = [(WLMessagesMigrator *)self sqlController];
  v39 = v6;
  [v10 updateModifiedDateForSummary:v6];

  uint64_t v11 = +[WLMessage senderFromMimeHeaders:v9];
  _WLLog();
  v37 = (void *)v9;
  uint64_t v12 = +[WLMessage recipientsFromMimeHeaders:](WLMessage, "recipientsFromMimeHeaders:", v9, self, v11);
  v30 = self;
  v31 = (void *)v12;
  _WLLog();
  v13 = (void *)MEMORY[0x263EFFA68];
  v34 = (void *)v12;
  if (v12) {
    v13 = (void *)v12;
  }
  id v14 = v13;
  v15 = v14;
  v35 = (void *)v11;
  if (v11)
  {
    uint64_t v16 = objc_msgSend(v14, "arrayByAddingObject:", v11, self, v31);

    v15 = (void *)v16;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isPhoneNumber", v30, v31));
        v33 = [v22 icc];
        v30 = self;
        v31 = v22;
        _WLLog();

        if ([v22 isPhoneNumber])
        {
          v24 = objc_msgSend(v22, "icc", self, v22, v23, v33, v34, v35);
          uint64_t v25 = [v24 length];

          if (v25)
          {
            v26 = [v22 icc];
            [v22 ccAcNumber];
            v32 = v31 = v26;
            v30 = self;
            _WLLog();

            v27 = [(WLMessagesMigrator *)self sqlController];
            v28 = [v22 icc];
            v29 = [v22 ccAcNumber];
            [v27 insertMessagePhoneNumberWithIcc:v28 ccAcNumber:v29];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v19);
  }

  _WLLog();
}

- (id)importWillBegin
{
  v14[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  id v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  accountGuid = self->_accountGuid;
  self->_accountGuid = v5;

  id v7 = 0;
  if (![(WLMessagesMigrator *)self _openDatabase])
  {
    self->_database = 0;
    uint64_t v12 = self;
    _WLLog();
    objc_super v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F86308];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"Messages migrator couldn't open messages database";
    v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v12);
    id v7 = [v8 errorWithDomain:v9 code:1 userInfo:v10];
  }
  return v7;
}

- (id)importDidEnd
{
  [(WLMessagesMigrator *)self _updateClient];
  [(WLMessagesMigrator *)self _closeDatabase];
  v3 = [(WLMessagesMigrator *)self sqlController];
  [v3 deleteGroupMessageInfoForAllDevices];

  id v4 = [(WLMessagesMigrator *)self sqlController];
  [v4 deleteMessagePhoneNumbersForAllDevices];

  _WLLog();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.imdpersistenceagent.notification.mergecompleted", 0, 0, 1u);
  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  id v15 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v15, "setSize:", objc_msgSend(v15, "size") + objc_msgSend(v10, "length"));

  uint64_t v16 = objc_alloc_init(WLMessage);
  uint64_t v17 = [(WLMessage *)v16 setSummary:v11];
  if (!v10)
  {
    _WLLog();
    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  uint64_t v18 = (void *)MEMORY[0x230F5E5D0](v17);
  uint64_t v19 = [(WLMessagesMigrator *)self sqlController];
  [(WLMessage *)v16 parseMIMEData:v10 sqlController:v19];

  BOOL v20 = [(WLMessagesMigrator *)self _insertMessage:v16];
  if (v13)
  {
    if (!v20)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F86308];
      uint64_t v25 = *MEMORY[0x263F08320];
      v26[0] = @"Message import failed";
      v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v24 = [v21 errorWithDomain:v22 code:1 userInfo:v23];
      v13[2](v13, 0, v24);

      goto LABEL_8;
    }
LABEL_4:
    v13[2](v13, 1, 0);
  }
LABEL_8:
}

- (id)_databaseFilename
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/SMS/sms.db"];

  return v3;
}

- (BOOL)_openDatabase
{
  id v3 = [(WLMessagesMigrator *)self _databaseFilename];
  int v4 = sqlite3_open((const char *)[v3 UTF8String], &self->_database);
  if (v4) {
    _WLLog();
  }

  return v4 == 0;
}

- (void)_closeDatabase
{
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
}

- (BOOL)_performSimpleQuery:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  database = self->_database;
  id v6 = v4;
  if (sqlite3_prepare_v2(database, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    BOOL v7 = 0;
  }
  else
  {
    int v8 = sqlite3_errcode(self->_database);
    BOOL v7 = v8 != 101;
    if (v8 == 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

  return v7;
}

- (BOOL)_beginTransaction
{
  return [(WLMessagesMigrator *)self _performSimpleQuery:@"BEGIN TRANSACTION"];
}

- (BOOL)_commitTransaction
{
  return [(WLMessagesMigrator *)self _performSimpleQuery:@"COMMIT TRANSACTION"];
}

- (BOOL)_rollbackTransaction
{
  return [(WLMessagesMigrator *)self _performSimpleQuery:@"ROLLBACK TRANSACTION"];
}

- (id)_ourAddressWithMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 messageDirection];
  if (!v4)
  {
    v5 = [v3 sender];
    BOOL v7 = [v5 address];
LABEL_6:

    if (v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v4 == 1 && ([v3 isGroupMessage] & 1) == 0)
  {
    v5 = [v3 recipients];
    id v6 = [v5 objectAtIndexedSubscript:0];
    BOOL v7 = [v6 address];

    goto LABEL_6;
  }
LABEL_7:
  BOOL v7 = &stru_26DF81F20;
LABEL_8:

  return v7;
}

- (id)_otherPartyAddressWithNonGroupMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 messageDirection];
  if (!v4)
  {
    v5 = [v3 recipients];
    BOOL v7 = [v5 objectAtIndexedSubscript:0];
    id v6 = [v7 address];

    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = [v3 sender];
    id v6 = [v5 address];
LABEL_5:

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)_insertMessage:(id)a3
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WLMessagesMigrator *)self _beginTransaction];
  if (v5)
  {
    id v6 = [(WLMessagesMigrator *)self _handleIDsForMessage:v4];
    if ([v6 count])
    {
      BOOL v7 = 0;
      int v8 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = 0;
  }
  v59 = self;
  id v61 = v4;
  _WLLog();
  int v8 = 0;
  BOOL v7 = v5;
LABEL_6:
  if (objc_msgSend(v4, "isGroupMessage", v59, v61))
  {
    BOOL v9 = [v4 messageDirection] == 1;
    if (!v8)
    {
LABEL_8:
      id v10 = 0;
      id v11 = 0;
      id v12 = 0;
      goto LABEL_55;
    }
  }
  else
  {
    BOOL v9 = 1;
    if (!v8) {
      goto LABEL_8;
    }
  }
  BOOL v75 = v5;
  v83 = self;
  BOOL v77 = v7;
  BOOL v74 = v9;
  if ([v4 isGroupMessage])
  {
    uint64_t v13 = [(WLMessagesMigrator *)self _sortedHandleIDs:v6];
    BOOL v92 = 0;
    id v14 = [v4 threadID];
    uint64_t v15 = [v14 length];

    uint64_t v16 = [(WLMessagesMigrator *)self sqlController];
    uint64_t v17 = v16;
    if (v15)
    {
      uint64_t v18 = [v4 threadID];
      uint64_t v19 = [v17 groupMessageInfoMatchingSourceThreadID:v18];

      BOOL v92 = v19 != 0;
    }
    else
    {
      uint64_t v19 = [v16 groupMessageInfoMatchingSortedHandleIDs:v13 handleIDsAreComplete:v9 didMatchExactly:&v92];
    }
    v76 = v13;
    if (v19)
    {
      uint64_t v80 = [v19 roomName];
      uint64_t v20 = [v19 groupID];
      BOOL v71 = !v92;
      v21 = [v4 threadID];
      v72 = v6;
      uint64_t v22 = [v13 componentsJoinedByString:@","];
      v23 = [NSNumber numberWithBool:v74];
      v24 = [v19 sortedHandleIDs];
      uint64_t v25 = [v24 componentsJoinedByString:@","];
      v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "handleIDsAreComplete"));
      [NSNumber numberWithBool:v92];
      v70 = v69 = v26;
      uint64_t v67 = v20;
      v68 = v25;
      v78 = (void *)v20;
      v65 = v23;
      uint64_t v66 = v80;
      v62 = v21;
      v63 = v22;
      v60 = v83;
      _WLLog();

      id v6 = v72;
      self = v83;
    }
    else
    {
      uint64_t v27 = [NSString generatedRoomNameForGroupChat];
      uint64_t v28 = objc_msgSend(NSString, "wl_uniqueIdentifier");
      v21 = [v4 threadID];
      uint64_t v22 = [v13 componentsJoinedByString:@","];
      v23 = [NSNumber numberWithBool:v74];
      v78 = (void *)v28;
      uint64_t v66 = v27;
      uint64_t v67 = v28;
      uint64_t v80 = v27;
      v63 = v22;
      v65 = v23;
      v60 = self;
      v62 = v21;
      _WLLog();
      BOOL v71 = 1;
    }
  }
  else
  {
    v76 = 0;
    uint64_t v80 = 0;
    v78 = 0;
    BOOL v71 = 0;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v29 = objc_msgSend(v4, "attachments", v60, v62, v63, v65, v66, v67, v68, v69, v70);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v89 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        v35 = objc_msgSend(NSString, "wl_uniqueIdentifier");
        [v34 setGuid:v35];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v31);
  }

  v36 = [v4 subject];
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isGroupMessage"));
  v64 = id v11 = (void *)v80;
  _WLLog();

  int64_t v82 = -[WLMessagesMigrator _insertMessageRowWithMessage:handleIDs:groupRoomName:](self, "_insertMessageRowWithMessage:handleIDs:groupRoomName:", v4, v6, v80, self, v36, v64, v80);
  if (v82 < 0)
  {
    _WLLog();
    BOOL v7 = v77;
    id v10 = v76;
    BOOL v5 = v75;
LABEL_54:
    id v12 = v78;
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = [v4 attachments];
    uint64_t v37 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v81 = *(void *)v85;
      v73 = v6;
      while (2)
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v85 != v81) {
            objc_enumerationMutation(obj);
          }
          long long v40 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          long long v41 = [v40 guid];
          long long v42 = [v40 fileName];
          long long v43 = [v40 mimeType];
          v44 = [v40 uti];
          uint64_t v45 = +[WLMessagesMigrator _attachmentPersistentPathForGuid:v41 fileName:v42 mimeType:v43 uti:v44];

          if (!v45)
          {
            self = v83;
            _WLLog();
LABEL_53:

            id v6 = v73;
            BOOL v7 = v77;
            id v10 = v76;
            BOOL v5 = v75;
            id v11 = (void *)v80;
            goto LABEL_54;
          }
          id v46 = objc_alloc_init(MEMORY[0x263F08850]);
          v47 = [v45 stringByDeletingLastPathComponent];
          self = v83;
          if (([v46 makeDirectoriesInPath:v47 mode:448] & 1) == 0
            || ([v40 data],
                v48 = objc_claimAutoreleasedReturnValue(),
                char v49 = [v48 writeToFile:v45 atomically:1],
                v48,
                (v49 & 1) == 0)
            || (uint64_t v50 = [(WLMessagesMigrator *)v83 _insertRowWithAttachment:v40 filePath:v45 forMessage:v4], v50 < 0)|| ![(WLMessagesMigrator *)v83 _insertMessageAttachmentJoinRowWithMessageID:v82 attachmentID:v50])
          {
            _WLLog();

            goto LABEL_53;
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
        id v6 = v73;
        id v11 = (void *)v80;
        if (v38) {
          continue;
        }
        break;
      }
    }

    id v12 = v78;
    int64_t v51 = [(WLMessagesMigrator *)self _chatIDForHandleIDs:v6 groupRoomName:v11 groupID:v78 message:v4];
    if (v51 < 0)
    {
      _WLLog();
      BOOL v7 = v77;
      id v10 = v76;
      BOOL v5 = v75;
    }
    else
    {
      BOOL v7 = v77;
      id v10 = v76;
      BOOL v5 = v75;
      if ([(WLMessagesMigrator *)self _insertChatMessageJoinRowWithChatID:v51 messageID:v82 date:[(WLMessagesMigrator *)self _messageDateWithMessage:v4]])
      {
        if ([(WLMessagesMigrator *)self _commitTransaction])
        {
          if (v71)
          {
            v52 = [v4 threadID];
            uint64_t v53 = [v52 length];

            v54 = [(WLMessagesMigrator *)self sqlController];
            v55 = v54;
            if (v53)
            {
              v56 = [v4 threadID];
              [v55 insertGroupMessageInfoWithSourceThreadID:v56 roomName:v11 groupID:v78];
            }
            else
            {
              [v54 insertGroupMessageInfoWithSortedHandleIDs:v76 handleIDsAreComplete:v74 roomName:v11 groupID:v78];
            }
          }
        }
        else
        {
          _WLLog();
        }
        BOOL v57 = 1;
        if (v77) {
          goto LABEL_59;
        }
        goto LABEL_60;
      }
      _WLLog();
    }
  }
LABEL_55:
  if (v5 && ![(WLMessagesMigrator *)self _rollbackTransaction]) {
    _WLLog();
  }
  BOOL v57 = 0;
  if (v7)
  {
LABEL_59:
    BOOL v57 = 1;
    _WLLog();
  }
LABEL_60:

  return v57;
}

- (id)_sortedHandleIDs:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_8];
}

uint64_t __39__WLMessagesMigrator__sortedHandleIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_attachmentPersistentPathForGuid:(id)a3 fileName:(id)a4 mimeType:(id)a5 uti:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 pathExtension];
  unsigned __int8 v14 = [v10 hash];
  if (![v13 length])
  {
    uint64_t v15 = [MEMORY[0x263F4A830] defaultHFSFileManager];
    uint64_t v16 = [v15 pathExtensionForUTIType:v12];

    uint64_t v13 = v16;
    if (![v16 length])
    {
      uint64_t v17 = [MEMORY[0x263F4A830] defaultHFSFileManager];
      uint64_t v18 = [v17 pathExtensionForMIMEType:v34];

      uint64_t v13 = (void *)v18;
    }
    if ([v13 length])
    {
      [v11 stringByAppendingPathExtension:v13];
      v20 = uint64_t v19 = v13;

      id v11 = (id)v20;
      uint64_t v13 = v19;
    }
  }
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%02x", v14);
  uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%02d", v14 & 0xF);
  _WLLog();
  if (objc_msgSend(v11, "length", a1, v11) && objc_msgSend(v10, "length"))
  {
    v23 = [@"/var/mobile/Library/SMS/Attachments" stringByResolvingAndStandardizingPath];
    v24 = [v23 stringByAppendingPathComponent:v21];
    [v24 stringByAppendingPathComponent:v22];
    id v33 = v11;
    uint64_t v25 = v22;
    v26 = v21;
    uint64_t v27 = v13;
    v29 = id v28 = v12;
    uint64_t v30 = [v29 stringByAppendingPathComponent:v10];

    id v12 = v28;
    uint64_t v13 = v27;
    v21 = v26;
    uint64_t v22 = v25;
    id v11 = v33;

    uint64_t v31 = [v30 stringByAppendingPathComponent:v33];
  }
  else
  {
    uint64_t v31 = 0;
  }
  _WLLog();

  return v31;
}

- (int64_t)_insertRowWithAttachment:(id)a3 filePath:(id)a4 forMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO attachment (guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, original_guid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    sqlite3_int64 insert_rowid = -1;
  }
  else
  {
    id v12 = ppStmt;
    id v13 = [v8 guid];
    sqlite3_bind_text(v12, 1, (const char *)[v13 UTF8String], -1, 0);

    sqlite3_bind_int64(ppStmt, 2, [(WLMessagesMigrator *)self _attachmentDateWithMessage:v10]);
    sqlite3_bind_int64(ppStmt, 3, [(WLMessagesMigrator *)self _attachmentDateWithMessage:v10]);
    unsigned __int8 v14 = ppStmt;
    id v15 = v9;
    sqlite3_bind_text(v14, 4, (const char *)[v15 UTF8String], -1, 0);
    uint64_t v16 = [v8 uti];

    uint64_t v17 = ppStmt;
    if (v16)
    {
      id v18 = [v8 uti];
      sqlite3_bind_text(v17, 5, (const char *)[v18 UTF8String], -1, 0);
    }
    else
    {
      sqlite3_bind_null(ppStmt, 5);
    }
    uint64_t v19 = ppStmt;
    id v20 = [v8 mimeType];
    sqlite3_bind_text(v19, 6, (const char *)[v20 UTF8String], -1, 0);

    sqlite3_bind_int(ppStmt, 7, 5);
    sqlite3_bind_int(ppStmt, 8, [(WLMessagesMigrator *)self _messageIsFromMeWithMessage:v10]);
    sqlite3_bind_null(ppStmt, 9);
    v21 = ppStmt;
    id v22 = [v15 lastPathComponent];
    sqlite3_bind_text(v21, 10, (const char *)[v22 UTF8String], -1, 0);

    v23 = ppStmt;
    v24 = [v8 data];
    sqlite3_bind_int(v23, 11, [v24 length]);

    uint64_t v25 = ppStmt;
    id v26 = [v8 guid];
    sqlite3_bind_text(v25, 12, (const char *)[v26 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
    }
    else
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
      sqlite3_int64 insert_rowid = -1;
    }
    sqlite3_finalize(ppStmt);
  }

  return insert_rowid;
}

- (BOOL)_insertMessageAttachmentJoinRowWithMessageID:(int64_t)a3 attachmentID:(int64_t)a4
{
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO message_attachment_join (message_id, attachment_id) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    int v8 = sqlite3_step(ppStmt);
    BOOL v7 = v8 == 101;
    if (v8 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v7;
}

- (id)_handleIDsForMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WLMessagesMigrator *)self _uniqueHandleStringsWithMessage:v4];
  if (![v5 count])
  {
    id v17 = 0;
    goto LABEL_28;
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  int v8 = v6;
  uint64_t v25 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v25) {
    goto LABEL_27;
  }
  v23 = v5;
  uint64_t v24 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v29 != v24) {
        objc_enumerationMutation(v7);
      }
      id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      ppStmt = 0;
      if (sqlite3_prepare(self->_database, "SELECT ROWID FROM handle WHERE id=? LIMIT 1", -1, &ppStmt, 0)) {
        goto LABEL_8;
      }
      sqlite3_bind_text(ppStmt, 1, (const char *)[v10 UTF8String], -1, 0);
      if (sqlite3_step(ppStmt) == 100)
      {
        do
          sqlite3_int64 insert_rowid = sqlite3_column_int64(ppStmt, 0);
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        sqlite3_int64 insert_rowid = -1;
      }
      if (sqlite3_errcode(self->_database) != 101 && sqlite3_errcode(self->_database) >= 1)
      {
        uint64_t v21 = sqlite3_errcode(self->_database);
        id v22 = sqlite3_errmsg(self->_database);
        uint64_t v19 = self;
        id v20 = "SELECT ROWID FROM handle WHERE id=? LIMIT 1";
        _WLLog();
      }
      sqlite3_finalize(ppStmt);
      if (insert_rowid == -1)
      {
LABEL_8:
        pStmt = 0;
        if (sqlite3_prepare(self->_database, "INSERT INTO handle (id, country, service, uncanonicalized_id) VALUES (?, ?, ?, ?)", -1, &pStmt, 0))
        {
          sqlite3_errcode(self->_database);
          sqlite3_errmsg(self->_database);
          _WLLog();
        }
        else
        {
          sqlite3_bind_text(pStmt, 1, (const char *)[v10 UTF8String], -1, 0);
          sqlite3_bind_null(pStmt, 2);
          id v11 = pStmt;
          id v12 = [(WLMessagesMigrator *)self _serviceStringWithMessage:v4];
          sqlite3_bind_text(v11, 3, (const char *)[v12 UTF8String], -1, 0);

          id v13 = pStmt;
          id v14 = [(WLMessagesMigrator *)self _uncanonicalizedIDWithMessage:v4];
          sqlite3_bind_text(v13, 4, (const char *)[v14 UTF8String], -1, 0);

          if (sqlite3_step(pStmt) == 101)
          {
            sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
            sqlite3_finalize(pStmt);
            goto LABEL_19;
          }
          sqlite3_errcode(self->_database);
          sqlite3_errmsg(self->_database);
          _WLLog();
          sqlite3_finalize(pStmt);
        }
        int v8 = 0;
        goto LABEL_26;
      }
LABEL_19:
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", insert_rowid, v19, v20, v21, v22);
      [v6 addObject:v16];
    }
    uint64_t v25 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v25) {
      continue;
    }
    break;
  }
  int v8 = v6;
LABEL_26:
  BOOL v5 = v23;
LABEL_27:

  id v17 = v8;
LABEL_28:

  return v17;
}

- (id)_uniqueHandleStringsWithMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if ([v4 isGroupMessage])
  {
    if ([v4 messageDirection] == 1)
    {
      id v6 = [v4 sender];

      if (v6)
      {
        id v7 = [v4 sender];
        int v8 = [v7 address];
        uint64_t v9 = [v8 length];

        if (!v9)
        {
          _WLLog();
          goto LABEL_19;
        }
        id v10 = [v4 sender];
        id v11 = [v10 address];
        [v5 addObject:v11];
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [v4 recipients];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_8:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        id v18 = [v17 address];
        uint64_t v19 = [v18 length];

        if (!v19) {
          goto LABEL_18;
        }
        id v20 = [v17 address];
        [v5 addObject:v20];

        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
LABEL_17:

    uint64_t v21 = [v5 array];
    goto LABEL_20;
  }
  id v12 = [(WLMessagesMigrator *)self _otherPartyAddressWithNonGroupMessage:v4];
  if ([v12 length])
  {
    [v5 addObject:v12];
    goto LABEL_17;
  }
LABEL_18:
  _WLLog();

LABEL_19:
  uint64_t v21 = 0;
LABEL_20:

  return v21;
}

- (int64_t)_senderHandleIDFromReceviedGroupMessageHandleIDs:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int64_t)_handleIDFromNonGroupMessageHandleIDs:(id)a3
{
  id v3 = [a3 objectAtIndexedSubscript:0];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (id)_serviceStringWithMessage:(id)a3
{
  return @"SMS";
}

- (id)_uncanonicalizedIDWithMessage:(id)a3
{
  return 0;
}

- (int64_t)_chatIDForHandleIDs:(id)a3 groupRoomName:(id)a4 groupID:(id)a5 message:(id)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v13 isGroupMessage]) {
    uint64_t v14 = "SELECT rowid FROM chat WHERE room_name=?";
  }
  else {
    uint64_t v14 = "SELECT rowid FROM chat WHERE chat_identifier=?";
  }
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v14, -1, &ppStmt, 0)) {
    goto LABEL_5;
  }
  int v16 = [v13 isGroupMessage];
  id v17 = ppStmt;
  if (v16)
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v11 UTF8String], -1, 0);
  }
  else
  {
    id v19 = [(WLMessagesMigrator *)self _chatIdentifierWithNonGroupMessage:v13];
    sqlite3_bind_text(v17, 1, (const char *)[v19 UTF8String], -1, 0);
  }
  if (sqlite3_step(ppStmt) == 100)
  {
    do
      sqlite3_int64 insert_rowid = sqlite3_column_int64(ppStmt, 0);
    while (sqlite3_step(ppStmt) == 100);
  }
  else
  {
    sqlite3_int64 insert_rowid = -1;
  }
  if (sqlite3_errcode(self->_database) != 101 && sqlite3_errcode(self->_database) >= 1)
  {
    uint64_t v59 = sqlite3_errcode(self->_database);
    id v61 = sqlite3_errmsg(self->_database);
    v55 = self;
    BOOL v57 = v14;
    _WLLog();
  }
  sqlite3_finalize(ppStmt);
  if (insert_rowid == -1)
  {
LABEL_5:
    pStmt = 0;
    if (sqlite3_prepare(self->_database, "INSERT INTO chat (guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, last_addressed_handle, display_name, group_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &pStmt, 0))
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
      sqlite3_int64 insert_rowid = -1;
    }
    else
    {
      if ([v13 isGroupMessage]) {
        [(WLMessagesMigrator *)self _chatGUIDWithGroupRoomName:v11];
      }
      else {
      id v18 = [(WLMessagesMigrator *)self _chatGUIDWithNonGroupMessage:v13];
      }
      uint64_t v28 = pStmt;
      id v29 = v18;
      sqlite3_bind_text(v28, 1, (const char *)[v29 UTF8String], -1, 0);
      sqlite3_bind_int(pStmt, 2, [(WLMessagesMigrator *)self _chatStyleWithMessage:v13]);
      sqlite3_bind_int(pStmt, 3, [(WLMessagesMigrator *)self _chatStateWithMessage:v13]);
      long long v30 = pStmt;
      id v31 = [(WLMessagesMigrator *)self _chatAccountIDWithMessage:v13];
      sqlite3_bind_text(v30, 4, (const char *)[v31 UTF8String], -1, 0);

      uint64_t v32 = [(WLMessagesMigrator *)self _chatPropertiesDataWithMessage:v13];
      uint64_t v33 = pStmt;
      id v63 = v32;
      sqlite3_bind_blob(v33, 5, (const void *)[v63 bytes], objc_msgSend(v63, "length"), 0);
      int v34 = [v13 isGroupMessage];
      v35 = pStmt;
      if (v34)
      {
        sqlite3_bind_text(pStmt, 6, (const char *)[v11 UTF8String], -1, 0);
      }
      else
      {
        id v36 = [(WLMessagesMigrator *)self _chatIdentifierWithNonGroupMessage:v13];
        sqlite3_bind_text(v35, 6, (const char *)[v36 UTF8String], -1, 0);
      }
      uint64_t v37 = pStmt;
      -[WLMessagesMigrator _chatServiceWithMessage:](self, "_chatServiceWithMessage:", v13, v55, v57, v59, v61);
      id v38 = objc_claimAutoreleasedReturnValue();
      sqlite3_bind_text(v37, 7, (const char *)[v38 UTF8String], -1, 0);

      if ([v13 isGroupMessage]) {
        sqlite3_bind_text(pStmt, 8, (const char *)[v11 UTF8String], -1, 0);
      }
      else {
        sqlite3_bind_null(pStmt, 8);
      }
      v39 = pStmt;
      id v40 = [(WLMessagesMigrator *)self _chatAccountLoginWithMessage:v13];
      sqlite3_bind_text(v39, 9, (const char *)[v40 UTF8String], -1, 0);

      long long v41 = pStmt;
      id v42 = [(WLMessagesMigrator *)self _chatLastAddressedHandleWithMessage:v13];
      sqlite3_bind_text(v41, 10, (const char *)[v42 UTF8String], -1, 0);

      long long v43 = pStmt;
      id v44 = [(WLMessagesMigrator *)self _chatDisplayNameWithMessage:v13];
      sqlite3_bind_text(v43, 11, (const char *)[v44 UTF8String], -1, 0);

      int v45 = [v13 isGroupMessage];
      id v46 = pStmt;
      if (v45)
      {
        sqlite3_bind_text(pStmt, 12, (const char *)[v12 UTF8String], -1, 0);
      }
      else
      {
        id v47 = [(WLMessagesMigrator *)self _chatGroupIDWithNonGroupMessage:v13];
        sqlite3_bind_text(v46, 12, (const char *)[v47 UTF8String], -1, 0);
      }
      id v64 = v12;
      if (sqlite3_step(pStmt) == 101)
      {
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
      }
      else
      {
        uint64_t v58 = sqlite3_errcode(self->_database);
        v60 = sqlite3_errmsg(self->_database);
        v56 = self;
        _WLLog();
        sqlite3_int64 insert_rowid = -1;
      }
      sqlite3_finalize(pStmt);
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v48 = v10;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v70 objects:v77 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        id v62 = v29;
        uint64_t v51 = *(void *)v71;
        while (2)
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v71 != v51) {
              objc_enumerationMutation(v48);
            }
            uint64_t v53 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            if (!-[WLMessagesMigrator _insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:](self, "_insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:", insert_rowid, objc_msgSend(v53, "longLongValue", v56, v58, v60), 0))
            {
              [v53 longLongValue];
              _WLLog();
              sqlite3_int64 insert_rowid = -1;
              goto LABEL_53;
            }
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v70 objects:v77 count:16];
          if (v50) {
            continue;
          }
          break;
        }
LABEL_53:
        id v29 = v62;
      }

      id v12 = v64;
    }
  }
  else if ([v13 isGroupMessage])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v65 = v11;
      id v23 = v10;
      id v24 = v12;
      uint64_t v25 = *(void *)v67;
      while (2)
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v67 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          if (!-[WLMessagesMigrator _insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:](self, "_insertChatHandleJoinRowWithChatID:handleID:duplicateMightExist:", insert_rowid, objc_msgSend(v27, "longLongValue", v55, v57, v59, v61), 1))
          {
            [v27 longLongValue];
            _WLLog();
            sqlite3_int64 insert_rowid = -1;
            goto LABEL_56;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v76 count:16];
        if (v22) {
          continue;
        }
        break;
      }
LABEL_56:
      id v12 = v24;
      id v10 = v23;
      id v11 = v65;
    }
  }
  return insert_rowid;
}

- (id)_chatGUIDWithGroupRoomName:(id)a3
{
  return (id)[NSString stringWithFormat:@"SMS;+;%@", a3];
}

- (id)_chatGUIDWithNonGroupMessage:(id)a3
{
  id v3 = [(WLMessagesMigrator *)self _otherPartyAddressWithNonGroupMessage:a3];
  int64_t v4 = [NSString stringWithFormat:@"SMS;-;%@", v3];

  return v4;
}

- (int64_t)_chatStyleWithMessage:(id)a3
{
  if ([a3 isGroupMessage]) {
    return 43;
  }
  else {
    return 45;
  }
}

- (int64_t)_chatStateWithMessage:(id)a3
{
  return 3;
}

- (id)_chatAccountIDWithMessage:(id)a3
{
  return self->_accountGuid;
}

- (id)_chatPropertiesDataWithMessage:(id)a3
{
  return 0;
}

- (id)_chatServiceWithMessage:(id)a3
{
  return @"SMS";
}

- (id)_chatAccountLoginWithMessage:(id)a3
{
  id v3 = [(WLMessagesMigrator *)self _ourAddressWithMessage:a3];
  int64_t v4 = [NSString stringWithFormat:@"P:%@", v3];

  return v4;
}

- (id)_chatDisplayNameWithMessage:(id)a3
{
  return &stru_26DF81F20;
}

- (id)_chatGroupIDWithNonGroupMessage:(id)a3
{
  return (id)objc_msgSend(NSString, "wl_uniqueIdentifier", a3);
}

- (int64_t)_insertMessageRowWithMessage:(id)a3 handleIDs:(id)a4 groupRoomName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO message (guid, text, service_center, handle_id, subject, country, attributedBody, version, service, account, account_guid, error, date, date_read, date_delivered, is_finished, is_from_me, cache_roomnames, was_data_detected, date_played, group_title, is_read, is_sent) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    sqlite3_int64 insert_rowid = -1;
    goto LABEL_16;
  }
  id v12 = objc_msgSend(NSString, "wl_uniqueIdentifier");
  id v13 = ppStmt;
  id v14 = v12;
  sqlite3_bind_text(v13, 1, (const char *)[v14 UTF8String], -1, 0);
  uint64_t v15 = ppStmt;
  id v16 = [v8 messageText];
  sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0);

  id v17 = ppStmt;
  id v18 = [(WLMessagesMigrator *)self _messageServiceCenterWithMessage:v8];
  sqlite3_bind_text(v17, 3, (const char *)[v18 UTF8String], -1, 0);

  if ([v8 isGroupMessage])
  {
    if (![v8 messageDirection])
    {
      sqlite3_int64 v20 = 0;
      goto LABEL_9;
    }
    int64_t v19 = [(WLMessagesMigrator *)self _senderHandleIDFromReceviedGroupMessageHandleIDs:v9];
  }
  else
  {
    int64_t v19 = [(WLMessagesMigrator *)self _handleIDFromNonGroupMessageHandleIDs:v9];
  }
  sqlite3_int64 v20 = v19;
LABEL_9:
  sqlite3_bind_int64(ppStmt, 4, v20);
  uint64_t v21 = ppStmt;
  id v22 = [(WLMessagesMigrator *)self _messageSubjectWithMessage:v8];
  sqlite3_bind_text(v21, 5, (const char *)[v22 UTF8String], -1, 0);

  sqlite3_bind_null(ppStmt, 6);
  id v23 = [(WLMessagesMigrator *)self _messageAttributedBodyDataWithMessage:v8];
  id v24 = ppStmt;
  id v25 = v23;
  sqlite3_bind_blob(v24, 7, (const void *)[v25 bytes], objc_msgSend(v25, "length"), 0);
  sqlite3_bind_int(ppStmt, 8, [(WLMessagesMigrator *)self _messageVersionWithMessage:v8]);
  long long v26 = ppStmt;
  id v27 = [(WLMessagesMigrator *)self _messageServiceWithMessage:v8];
  sqlite3_bind_text(v26, 9, (const char *)[v27 UTF8String], -1, 0);

  uint64_t v28 = ppStmt;
  id v29 = [(WLMessagesMigrator *)self _messageAccountWithMessage:v8];
  sqlite3_bind_text(v28, 10, (const char *)[v29 UTF8String], -1, 0);

  long long v30 = ppStmt;
  id v31 = [(WLMessagesMigrator *)self _messageAccountGUIDWithMessage:v8];
  sqlite3_bind_text(v30, 11, (const char *)[v31 UTF8String], -1, 0);

  sqlite3_bind_int(ppStmt, 12, [(WLMessagesMigrator *)self _messageErrorWithMessage:v8]);
  sqlite3_bind_int64(ppStmt, 13, [(WLMessagesMigrator *)self _messageDateWithMessage:v8]);
  sqlite3_bind_int64(ppStmt, 14, [(WLMessagesMigrator *)self _messageDateReadWithMessage:v8]);
  sqlite3_bind_int64(ppStmt, 15, [(WLMessagesMigrator *)self _messageDateDeliveredWithMessage:v8]);
  sqlite3_bind_int(ppStmt, 16, 1);
  sqlite3_bind_int(ppStmt, 17, [(WLMessagesMigrator *)self _messageIsFromMeWithMessage:v8]);
  if ([v8 isGroupMessage]) {
    sqlite3_bind_text(ppStmt, 18, (const char *)[v10 UTF8String], -1, 0);
  }
  else {
    sqlite3_bind_null(ppStmt, 18);
  }
  sqlite3_bind_int(ppStmt, 19, 1);
  sqlite3_bind_int(ppStmt, 20, 0);
  uint64_t v32 = ppStmt;
  id v33 = [(WLMessagesMigrator *)self _messageGroupTitleWithMessage:v8];
  sqlite3_bind_text(v32, 21, (const char *)[v33 UTF8String], -1, 0);

  sqlite3_bind_int(ppStmt, 22, 1);
  sqlite3_bind_int(ppStmt, 23, 1);
  if (sqlite3_step(ppStmt) == 101)
  {
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
  }
  else
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    sqlite3_int64 insert_rowid = -1;
  }
  sqlite3_finalize(ppStmt);

LABEL_16:
  return insert_rowid;
}

- (id)_messageServiceCenterWithMessage:(id)a3
{
  return 0;
}

- (id)_messageSubjectWithMessage:(id)a3
{
  return 0;
}

- (id)_messageAttributedBodyDataWithMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  id v5 = [v3 messageText];
  id v6 = (void *)[v4 initWithString:v5];

  id v7 = [v3 attachments];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    id v10 = [v3 attachments];
    id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = [v3 attachments];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) guid];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    uint64_t v18 = IMCreateSuperFormatStringWithAppendedFileTransfers();
    id v6 = (void *)v18;
  }
  int64_t v19 = [MEMORY[0x263F08688] archivedDataWithRootObject:v6];
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  _WLLog();

  return v19;
}

- (int64_t)_messageVersionWithMessage:(id)a3
{
  return 10;
}

- (id)_messageServiceWithMessage:(id)a3
{
  return @"SMS";
}

- (id)_messageAccountWithMessage:(id)a3
{
  id v3 = [(WLMessagesMigrator *)self _ourAddressWithMessage:a3];
  id v4 = [NSString stringWithFormat:@"p:%@", v3];

  return v4;
}

- (id)_messageAccountGUIDWithMessage:(id)a3
{
  return self->_accountGuid;
}

- (int64_t)_messageErrorWithMessage:(id)a3
{
  return 0;
}

- (int64_t)_messageDateWithMessage:(id)a3
{
  id v3 = [a3 date];
  [v3 timeIntervalSinceReferenceDate];
  int64_t v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_messageDateReadWithMessage:(id)a3
{
  id v3 = [a3 date];
  [v3 timeIntervalSinceReferenceDate];
  int64_t v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_messageDateDeliveredWithMessage:(id)a3
{
  id v3 = [a3 date];
  [v3 timeIntervalSinceReferenceDate];
  int64_t v5 = (uint64_t)(v4 * 1000000000.0);

  return v5;
}

- (int64_t)_attachmentDateWithMessage:(id)a3
{
  id v3 = [a3 date];
  [v3 timeIntervalSinceReferenceDate];
  int64_t v5 = (uint64_t)v4;

  return v5;
}

- (BOOL)_messageIsFromMeWithMessage:(id)a3
{
  return [a3 messageDirection] == 0;
}

- (id)_messageGroupTitleWithMessage:(id)a3
{
  return 0;
}

- (BOOL)_insertChatMessageJoinRowWithChatID:(int64_t)a3 messageID:(int64_t)a4 date:(int64_t)a5
{
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO chat_message_join (chat_id, message_id, message_date) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    sqlite3_bind_int64(ppStmt, 3, a5);
    int v10 = sqlite3_step(ppStmt);
    BOOL v9 = v10 == 101;
    if (v10 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

- (BOOL)_insertChatHandleJoinRowWithChatID:(int64_t)a3 handleID:(int64_t)a4 duplicateMightExist:(BOOL)a5
{
  if (a5) {
    uint64_t v8 = "INSERT OR IGNORE INTO chat_handle_join (chat_id, handle_id) VALUES (?, ?)";
  }
  else {
    uint64_t v8 = "INSERT INTO chat_handle_join (chat_id, handle_id) VALUES (?, ?)";
  }
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v8, -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
    return 0;
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, a4);
    int v10 = sqlite3_step(ppStmt);
    BOOL v9 = v10 == 101;
    if (v10 != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

- (void)_updateClient
{
  id v3 = [NSString stringWithFormat:@"UPDATE _SqliteDatabaseProperties SET value = ? WHERE key = ?"];
  ppStmt = 0;
  database = self->_database;
  id v5 = v3;
  if (sqlite3_prepare(database, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, 16199);
    sqlite3_bind_text(ppStmt, 2, (const char *)[@"_ClientVersion" UTF8String], -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
    }
    _WLLog();
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)isValidTableName:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:&stru_26DF81F20];
  double v4 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  if ([v3 length])
  {
    uint64_t v6 = [v3 length];
    BOOL v7 = v6 == [v5 length];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)deleteFromTable:(id)a3
{
  id v4 = a3;
  if (![(WLMessagesMigrator *)self isValidTableName:v4]) {
    goto LABEL_4;
  }
  id v5 = [NSString stringWithFormat:@"DELETE FROM %@", v4];

  ppStmt = 0;
  database = self->_database;
  id v4 = v5;
  if (sqlite3_prepare(database, (const char *)[v4 UTF8String], -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
LABEL_4:
    _WLLog();
    goto LABEL_5;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  sqlite3_finalize(ppStmt);
LABEL_5:
}

- (void)deleteData
{
  if ([MEMORY[0x263F862A0] isInternal])
  {
    [(WLMessagesMigrator *)self _openDatabase];
    [(WLMessagesMigrator *)self deleteFromTable:@"message_attachment_join"];
    [(WLMessagesMigrator *)self deleteFromTable:@"chat_message_join"];
    [(WLMessagesMigrator *)self deleteFromTable:@"chat_handle_join"];
    [(WLMessagesMigrator *)self deleteFromTable:@"attachment"];
    [(WLMessagesMigrator *)self deleteFromTable:@"message"];
    [(WLMessagesMigrator *)self deleteFromTable:@"chat"];
    [(WLMessagesMigrator *)self deleteFromTable:@"handle"];
    [(WLMessagesMigrator *)self _closeDatabase];
  }
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (WLSQLController)sqlController
{
  return self->_sqlController;
}

- (void)setSqlController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlController, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_accountGuid, 0);
}

@end