@interface NNMKResendScheduler
- (NNMKResendSchedulerDelegate)delegate;
- (NNMKSyncController)syncController;
- (id)deviceRegistry;
- (id)messageTypeForIDSIdentifier:(id)a3;
- (id)objectIdsForPendingIDSIdentifier:(id)a3;
- (unint64_t)initialSyncResendInterval;
- (void)_executePendingResendsAndContentRequests;
- (void)_failPendingComposedMessages;
- (void)_resendInitialSyncWithIDSIdentifier:(id)a3 newResendInterval:(unint64_t)a4 mailboxIds:(id)a5;
- (void)_resendObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 idsIdentifier:(id)a6;
- (void)_resendPendingAccountWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5;
- (void)_resendPendingMessageContentWithId:(id)a3 sentBecauseUserRequested:(BOOL)a4 idsIdentifier:(id)a5 newResendInterval:(unint64_t)a6;
- (void)_resendPendingMessagesWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5;
- (void)_resendSendingProgressForComposedMessageWithId:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5;
- (void)_scheduleIdsIdentifierForResend:(id)a3 currentResendInterval:(unint64_t)a4 newResendInterval:(unint64_t)a5 errorCode:(int64_t)a6;
- (void)deletePendingIDSMessagesForMailboxId:(id)a3;
- (void)forceRetryingAllPendingIDSMessages;
- (void)handleIDSMessageFailedWithId:(id)a3 errorCode:(int64_t)a4;
- (void)handleIDSMessageSentSuccessfullyWithId:(id)a3;
- (void)registerIDSIdentifier:(id)a3 objectIds:(id)a4 type:(id)a5 resendInterval:(unint64_t)a6;
- (void)resendObjectsForIDSIdentifier:(id)a3;
- (void)resetInitialSyncResendInterval;
- (void)setDelegate:(id)a3;
- (void)setInitialSyncResendInterval:(unint64_t)a3;
- (void)setSyncController:(id)a3;
@end

@implementation NNMKResendScheduler

- (void)registerIDSIdentifier:(id)a3 objectIds:(id)a4 type:(id)a5 resendInterval:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
    -[NNMKResendScheduler registerIDSIdentifier:objectIds:type:resendInterval:]((uint64_t)v10, (uint64_t)v12, v13);
  }
  if (![v11 count])
  {

    id v11 = &unk_26F131940;
  }
  v14 = [(NNMKResendScheduler *)self deviceRegistry];
  [v14 addObjectIds:v11 type:v12 resendInterval:a6 forIDSIdentifierNotYetAckd:v10];
}

- (void)resendObjectsForIDSIdentifier:(id)a3
{
  uint64_t v9 = 0;
  id v4 = a3;
  v5 = [(NNMKResendScheduler *)self deviceRegistry];
  id v8 = 0;
  v6 = [v5 objectIdsForIDSIdentifierNotYetAckd:v4 type:&v8 resendInterval:&v9];
  id v7 = v8;

  [(NNMKResendScheduler *)self _resendObjectIds:v6 type:v7 resendInterval:v9 idsIdentifier:v4];
}

- (void)handleIDSMessageFailedWithId:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NNMKResendScheduler *)self deviceRegistry];

  if (v7)
  {
    uint64_t v16 = 0;
    id v8 = [(NNMKResendScheduler *)self deviceRegistry];
    id v15 = 0;
    uint64_t v9 = [v8 objectIdsForIDSIdentifierNotYetAckd:v6 type:&v15 resendInterval:&v16];
    id v10 = v15;

    id v11 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2048;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      int64_t v24 = a4;
      _os_log_error_impl(&dword_23D3DF000, v11, OS_LOG_TYPE_ERROR, "Error sending IDS Messages (IDS Identifier: %{public}@ - Object Type: %{public}@ - Resend Interval: %lu - Error code: %li).", buf, 0x2Au);
    }
    id v12 = [(NNMKResendScheduler *)self delegate];
    uint64_t v13 = [v12 resendScheduler:self didRequestNewResendIntervalForPreviousResendInterval:v16 errorCode:a4];

    if (a4 == 27)
    {
      uint64_t v16 = v13;
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = v16;
    }
    if (v14) {
      [(NNMKResendScheduler *)self _scheduleIdsIdentifierForResend:v6 currentResendInterval:v14 newResendInterval:v13 errorCode:a4];
    }
    else {
      [(NNMKResendScheduler *)self _resendObjectIds:v9 type:v10 resendInterval:v13 idsIdentifier:v6];
    }
  }
}

- (void)handleIDSMessageSentSuccessfullyWithId:(id)a3
{
  id v4 = a3;
  v5 = [(NNMKResendScheduler *)self deviceRegistry];

  if (v5)
  {
    id v6 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEBUG)) {
      -[NNMKResendScheduler handleIDSMessageSentSuccessfullyWithId:]((uint64_t)v4, v6);
    }
    id v7 = [(NNMKResendScheduler *)self deviceRegistry];
    [v7 markIDSIdentifierAsAckd:v4];

    id v8 = [(NNMKResendScheduler *)self delegate];
    [v8 resendScheduler:self didRequestDequeueIDSIdentifierForResend:v4];
  }
}

- (void)deletePendingIDSMessagesForMailboxId:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v61 = v44;
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Deleting pending IDS messages for mailbox. (Id: %{public}@)", buf, 0xCu);
  }
  v5 = [(NNMKResendScheduler *)self deviceRegistry];
  [v5 beginUpdates];

  id v6 = [(NNMKResendScheduler *)self deviceRegistry];
  id v7 = [v6 objectIdsForType:@"InitialSync"];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ([v13 isEqualToString:v13])
        {
          uint64_t v14 = [(NNMKResendScheduler *)self deviceRegistry];
          [v14 deleteObjectId:v13 fromIDSIdentifiersNotYetAckdOfType:@"InitialSync"];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v10);
  }
  v43 = v8;

  id v15 = [(NNMKResendScheduler *)self deviceRegistry];
  uint64_t v16 = [v15 objectIdsForType:@"Message"];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        __int16 v23 = [(NNMKResendScheduler *)self deviceRegistry];
        int64_t v24 = [v23 syncedMessageForMessageWithId:v22];

        if (!v24
          || ([v24 mailboxId],
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              int v26 = [v25 isEqualToString:v44],
              v25,
              v26))
        {
          v27 = [(NNMKResendScheduler *)self deviceRegistry];
          [v27 deleteObjectId:v22 fromIDSIdentifiersNotYetAckdOfType:@"Message"];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v19);
  }
  v42 = v17;

  v28 = [(NNMKResendScheduler *)self deviceRegistry];
  v29 = [v28 objectIdsForType:@"MessageContent"];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        v36 = [(NNMKResendScheduler *)self deviceRegistry];
        v37 = [v36 syncedMessageForMessageWithId:v35];

        if (!v37
          || ([v37 mailboxId],
              v38 = objc_claimAutoreleasedReturnValue(),
              int v39 = [v38 isEqualToString:v44],
              v38,
              v39))
        {
          v40 = [(NNMKResendScheduler *)self deviceRegistry];
          [v40 deleteObjectId:v35 fromIDSIdentifiersNotYetAckdOfType:@"MessageContent"];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v32);
  }

  v41 = [(NNMKResendScheduler *)self deviceRegistry];
  [v41 endUpdates];
}

- (void)forceRetryingAllPendingIDSMessages
{
  v3 = [(NNMKResendScheduler *)self deviceRegistry];

  if (v3)
  {
    id v4 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Forcing retrying all pending ids messages", v9, 2u);
    }
    v5 = [(NNMKResendScheduler *)self deviceRegistry];
    [v5 prepareIDSIdentifiersForResendForErrorCode:27];

    id v6 = [(NNMKResendScheduler *)self delegate];
    id v7 = [(NNMKResendScheduler *)self deviceRegistry];
    id v8 = [v7 datesForIDSIdentifiersScheduledToBeResent];
    [v6 resendScheduler:self didRequestEnqueueIDSIdentifiersForResend:v8];

    [(NNMKResendScheduler *)self _executePendingResendsAndContentRequests];
    [(NNMKResendScheduler *)self _failPendingComposedMessages];
  }
}

- (id)messageTypeForIDSIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NNMKResendScheduler *)self deviceRegistry];
  id v6 = [v5 typeForIDSIdentifierNotYetAckd:v4];

  return v6;
}

- (id)objectIdsForPendingIDSIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NNMKResendScheduler *)self deviceRegistry];
  id v6 = [v5 objectIdsForIDSIdentifierNotYetAckd:v4 type:0 resendInterval:0];

  return v6;
}

- (void)resetInitialSyncResendInterval
{
  self->_initialSyncResendInterval = 0;
}

- (id)deviceRegistry
{
  v2 = [(NNMKResendScheduler *)self delegate];
  v3 = [v2 currentDeviceRegistry];

  return v3;
}

- (void)_executePendingResendsAndContentRequests
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [(NNMKResendScheduler *)self deviceRegistry];
  id v4 = [v3 syncedMessageIdsResendRequested];

  if ([v4 count])
  {
    v5 = [(NNMKResendScheduler *)self delegate];
    [v5 resendScheduler:self didRequestRetrySendingMessageWithIds:v4];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = [(NNMKResendScheduler *)self deviceRegistry];
  id v7 = [v6 syncedAccountIdsResendRequested];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v13 = [(NNMKResendScheduler *)self delegate];
        [v13 resendScheduler:self didRequestRetrySendingAccountWithId:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [(NNMKResendScheduler *)self deviceRegistry];
  id v15 = [v14 syncedMessageIdsContentRequestedByUser];

  if ([v15 count])
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          uint64_t v22 = [(NNMKResendScheduler *)self delegate];
          [v22 resendScheduler:self didRequestRetrySendingContentForMessageId:v21 highPriority:1];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v18);
    }
  }
  else
  {
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    *((void *)&v30 + 1) = 0;
    long long v31 = 0uLL;
    __int16 v23 = [(NNMKResendScheduler *)self deviceRegistry];
    id v16 = [v23 firstSyncedMessageIdsContentNotSyncedOrRequestedByUser:20];

    uint64_t v24 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v16);
          }
          uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * k);
          v29 = [(NNMKResendScheduler *)self delegate];
          [v29 resendScheduler:self didRequestRetrySendingContentForMessageId:v28 highPriority:0];
        }
        uint64_t v25 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v25);
    }
  }
}

- (void)_failPendingComposedMessages
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(NNMKResendScheduler *)self deviceRegistry];
  id v4 = [v3 pendingComposedMessageIds];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        uint64_t v11 = [(NNMKResendScheduler *)self delegate];
        [v11 resendScheduler:self didRequestRetrySendingComposeMessageProgress:-1 messageId:v10 resendInterval:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [(NNMKResendScheduler *)self deviceRegistry];
  [v12 removePendingComposedMessages];
}

- (void)_scheduleIdsIdentifierForResend:(id)a3 currentResendInterval:(unint64_t)a4 newResendInterval:(unint64_t)a5 errorCode:(int64_t)a6
{
  uint64_t v9 = (void *)MEMORY[0x263EFF910];
  double v10 = (double)a4;
  id v11 = a3;
  id v14 = [v9 dateWithTimeIntervalSinceNow:v10];
  uint64_t v12 = [(NNMKResendScheduler *)self deviceRegistry];
  [v12 rescheduleIDSIdentifier:v11 resendInterval:a5 withDateToResend:v14 errorCode:a6];

  long long v13 = [(NNMKResendScheduler *)self delegate];
  [v13 resendScheduler:self didRequestEnqueueIDSIdentifierForResend:v11 date:v14 silent:0];
}

- (void)_resendObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 idsIdentifier:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138544130;
    id v22 = v12;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    _os_log_impl(&dword_23D3DF000, v13, OS_LOG_TYPE_DEFAULT, "Resending IDS messages. (IDS id: %{public}@, Type: %{public}@, objects: %{public}@, resend interval: %lu)", (uint8_t *)&v21, 0x2Au);
  }
  if ([v11 isEqualToString:@"InitialSync"])
  {
    [(NNMKResendScheduler *)self _resendInitialSyncWithIDSIdentifier:v12 newResendInterval:a5 mailboxIds:v10];
    goto LABEL_23;
  }
  if ([v11 isEqualToString:@"Message"])
  {
    [(NNMKResendScheduler *)self _resendPendingMessagesWithIds:v10 forIDSIdentifier:v12 newResendInterval:a5];
    goto LABEL_23;
  }
  if (![v11 isEqualToString:@"MessageContent"])
  {
    if ([v11 isEqualToString:@"Account"])
    {
      [(NNMKResendScheduler *)self _resendPendingAccountWithIds:v10 forIDSIdentifier:v12 newResendInterval:a5];
      goto LABEL_23;
    }
    if ([v11 isEqualToString:@"SendingProgress"])
    {
      id v14 = [v10 firstObject];
      [(NNMKResendScheduler *)self _resendSendingProgressForComposedMessageWithId:v14 forIDSIdentifier:v12 newResendInterval:a5];
    }
    else if ([v11 isEqualToString:@"MailboxSelection"])
    {
      id v14 = [(NNMKResendScheduler *)self delegate];
      [v14 resendScheduler:self didRequestRetrySendingMailboxSelectionWithResendInterval:a5];
    }
    else if ([v11 isEqualToString:@"AccountIdentity"])
    {
      id v14 = [v10 firstObject];
      uint64_t v18 = [(NNMKResendScheduler *)self delegate];
      [v18 resendScheduler:self didRequestRetrySendingAccountIdentifier:v14 resendInterval:a5];
    }
    else
    {
      if (![v11 isEqualToString:@"VIPList"]) {
        goto LABEL_23;
      }
      id v14 = [(NNMKResendScheduler *)self delegate];
      [v14 resendScheduler:self didRequestRetrySendingVIPListWithResendInterval:a5];
    }
LABEL_22:

    goto LABEL_23;
  }
  if ([v10 count] == 2)
  {
    id v14 = [v10 objectAtIndexedSubscript:0];
    long long v15 = [v10 objectAtIndexedSubscript:1];
    uint64_t v16 = [v15 BOOLValue];

    [(NNMKResendScheduler *)self _resendPendingMessageContentWithId:v14 sentBecauseUserRequested:v16 idsIdentifier:v12 newResendInterval:a5];
    goto LABEL_22;
  }
  uint64_t v17 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
    -[NNMKResendScheduler _resendObjectIds:type:resendInterval:idsIdentifier:]((uint64_t)v12, v17);
  }
LABEL_23:
  uint64_t v19 = [(NNMKResendScheduler *)self deviceRegistry];
  [v19 markIDSIdentifierAsAckd:v12];

  uint64_t v20 = [(NNMKResendScheduler *)self delegate];
  [v20 resendScheduler:self didRequestDequeueIDSIdentifierForResend:v12];
}

- (void)_resendInitialSyncWithIDSIdentifier:(id)a3 newResendInterval:(unint64_t)a4 mailboxIds:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        long long v15 = [(NNMKResendScheduler *)self deviceRegistry];
        uint64_t v16 = [v15 mailboxWithId:v14];

        if (v16) {
          [v8 addObject:v16];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    uint64_t v17 = [(NNMKResendScheduler *)self delegate];
    [v17 resendScheduler:self didRequestRetryFullSyncForMailboxes:v8];

    self->_initialSyncResendInterval = a4;
  }
}

- (void)_resendPendingMessagesWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v45 = a4;
  uint64_t v8 = [(NNMKResendScheduler *)self deviceRegistry];
  [v8 beginUpdates];

  v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v43 = [MEMORY[0x263EFF980] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v49;
    *(void *)&long long v10 = 138543362;
    long long v41 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * v13);
        long long v15 = [(NNMKResendScheduler *)self deviceRegistry];
        uint64_t v16 = [v15 syncedMessageForMessageWithId:v14];

        if (v16)
        {
          int v17 = [v16 resendRequested];
          long long v18 = qword_26AC21850;
          BOOL v19 = os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = v14;
              __int16 v54 = 2114;
              uint64_t v55 = (uint64_t)v45;
              __int16 v56 = 2048;
              unint64_t v57 = a5;
              _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Requested to resend message but a resend has already been requested. Ignoring. (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }
          }
          else
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = v14;
              __int16 v54 = 2114;
              uint64_t v55 = (uint64_t)v45;
              __int16 v56 = 2048;
              unint64_t v57 = a5;
              _os_log_impl(&dword_23D3DF000, v18, OS_LOG_TYPE_DEFAULT, "Resending Message (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }
            if ([v16 usedNotificationPriorityForMessageSync])
            {
              uint64_t v29 = [v16 dateReceived];
              [v29 timeIntervalSinceNow];
              double v31 = -v30;
              double v32 = *(double *)&kIntervalBeforeDowngradingMessagesToDefaultPriority;

              if (v32 < v31)
              {
                long long v33 = qword_26AC21850;
                if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  uint64_t v53 = kIntervalBeforeDowngradingMessagesToDefaultPriority;
                  __int16 v54 = 2114;
                  uint64_t v55 = v14;
                  _os_log_impl(&dword_23D3DF000, v33, OS_LOG_TYPE_DEFAULT, "Message is older than %.0f seconds. Downgrading to Default Priority (Id: %{public}@).", buf, 0x16u);
                }
                [v16 setUsedNotificationPriorityForMessageSync:0];
              }
            }
            [v16 setResendRequested:1];
            [v16 setResendInterval:a5];
            long long v34 = [(NNMKResendScheduler *)self deviceRegistry];
            [v34 addOrUpdateSyncedMessage:v16];

            long long v35 = [(NNMKResendScheduler *)self deviceRegistry];
            [v35 deleteObjectId:v14 fromIDSIdentifiersNotYetAckdOfType:@"Message"];

            [v42 addObject:v14];
          }
        }
        else
        {
          long long v20 = objc_alloc_init(NNMKProtoMessageDeletion);
          long long v21 = [(NNMKResendScheduler *)self syncController];
          id v22 = [v21 watchMessageIdFromMessageId:v14];
          [(NNMKProtoMessageDeletion *)v20 setMessageId:v22];

          uint64_t v23 = [(NNMKResendScheduler *)self deviceRegistry];
          id v24 = [v23 mailboxIdForDeletedMessageId:v14];

          if (v24) {
            goto LABEL_12;
          }
          __int16 v25 = [(NNMKResendScheduler *)self deviceRegistry];
          id v26 = [v25 mailboxWithId:@"-1"];
          id v24 = [v26 mailboxId];

          if (v24)
          {
LABEL_12:
            __int16 v27 = [v44 objectForKeyedSubscript:v24];
            if (!v27)
            {
              __int16 v27 = objc_alloc_init(NNMKProtoMessageDeletions);
              [v44 setObject:v27 forKeyedSubscript:v24];
            }
            [(NNMKProtoMessageDeletions *)v27 addMessageDeletion:v20];
            [v43 addObject:v14];
            unint64_t v28 = qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v53 = v14;
              __int16 v54 = 2114;
              uint64_t v55 = (uint64_t)v45;
              __int16 v56 = 2048;
              unint64_t v57 = a5;
              _os_log_impl(&dword_23D3DF000, v28, OS_LOG_TYPE_DEFAULT, "Resending Message Deletion (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }
          }
          else
          {
            long long v36 = qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v41;
              uint64_t v53 = v14;
              _os_log_error_impl(&dword_23D3DF000, v36, OS_LOG_TYPE_ERROR, "Could not find mailbox for deleted message with id %{public}@", buf, 0xCu);
            }
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      uint64_t v11 = v37;
    }
    while (v37);
  }

  if ([v42 count])
  {
    long long v38 = [(NNMKResendScheduler *)self delegate];
    [v38 resendScheduler:self didRequestRetrySendingMessageWithIds:v42];
  }
  if ([v43 count])
  {
    long long v39 = [(NNMKResendScheduler *)self delegate];
    [v39 resendScheduler:self didRequestRetrySendingMessageDeletions:v44 deletionsMessageIds:v43 resendInterval:a5];
  }
  long long v40 = [(NNMKResendScheduler *)self deviceRegistry];
  [v40 endUpdates];
}

- (void)_resendPendingMessageContentWithId:(id)a3 sentBecauseUserRequested:(BOOL)a4 idsIdentifier:(id)a5 newResendInterval:(unint64_t)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [(NNMKResendScheduler *)self deviceRegistry];
  [v12 beginUpdates];

  uint64_t v13 = [(NNMKResendScheduler *)self deviceRegistry];
  uint64_t v14 = [v13 syncedMessageForMessageWithId:v10];

  if (v14)
  {
    if ([v14 usedNotificationPriorityForMessageSync])
    {
      long long v15 = [v14 dateReceived];
      [v15 timeIntervalSinceNow];
      double v17 = -v16;
      double v18 = *(double *)&kIntervalBeforeDowngradingMessagesToDefaultPriority;

      if (v18 < v17)
      {
        BOOL v19 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unint64_t v28 = 134218242;
          *(void *)&v28[4] = kIntervalBeforeDowngradingMessagesToDefaultPriority;
          *(_WORD *)&v28[12] = 2114;
          *(void *)&v28[14] = v10;
          _os_log_impl(&dword_23D3DF000, v19, OS_LOG_TYPE_DEFAULT, "Message is older than %.0f seconds. Downgrading to Default Priority (Id: %{public}@).", v28, 0x16u);
        }
        [v14 setUsedNotificationPriorityForMessageSync:0];
      }
    }
    if (v8)
    {
      [v14 setContentRequestedByUser:1];
      [v14 setContentSyncedUsingNotificationPriority:0];
      [v14 setContentSyncedBecauseUserRequested:0];
      [v14 setContentSynced:0];
    }
    else
    {
      [v14 setContentSyncedUsingNotificationPriority:0];
      [v14 setContentSyncedBecauseUserRequested:0];
      [v14 setContentSynced:0];
      if (![v14 usedNotificationPriorityForMessageSync])
      {
        [v14 setContentResendInterval:0];
        uint64_t v25 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unint64_t v28 = 138543618;
          *(void *)&v28[4] = v10;
          *(_WORD *)&v28[12] = 2114;
          *(void *)&v28[14] = v11;
          id v22 = "Not resending content for message, as it's not for a notification and the user didn't request it (Id: %{"
                "public}@ - IDS Identifier: %{public}@).";
          uint64_t v23 = v25;
          uint32_t v24 = 22;
          goto LABEL_14;
        }
LABEL_15:
        id v26 = [(NNMKResendScheduler *)self deviceRegistry];
        [v26 addOrUpdateSyncedMessage:v14];

        goto LABEL_16;
      }
    }
    [v14 setContentResendInterval:a6];
    long long v20 = [(NNMKResendScheduler *)self delegate];
    [v20 resendScheduler:self didRequestRetrySendingContentForMessageId:v10 highPriority:v8];

    uint64_t v21 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v28 = 138543874;
      *(void *)&v28[4] = v10;
      *(_WORD *)&v28[12] = 2114;
      *(void *)&v28[14] = v11;
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = v8;
      id v22 = "Resending content for message (Id: %{public}@ - IDS Identifier: %{public}@ - User Requested: %d)...";
      uint64_t v23 = v21;
      uint32_t v24 = 28;
LABEL_14:
      _os_log_impl(&dword_23D3DF000, v23, OS_LOG_TYPE_DEFAULT, v22, v28, v24);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  __int16 v27 = [(NNMKResendScheduler *)self deviceRegistry];
  [v27 endUpdates];
}

- (void)_resendPendingAccountWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a4;
  uint64_t v9 = [(NNMKResendScheduler *)self deviceRegistry];
  [v9 beginUpdates];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v26;
    *(void *)&long long v12 = 138543618;
    long long v23 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
        double v17 = qword_26AC21850;
        if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          uint64_t v30 = v16;
          __int16 v31 = 2114;
          id v32 = v24;
          _os_log_impl(&dword_23D3DF000, v17, OS_LOG_TYPE_DEFAULT, "Resending account (Id: %{public}@ - IDS Identifier: %{public}@)...", buf, 0x16u);
        }
        double v18 = [(NNMKResendScheduler *)self deviceRegistry];
        BOOL v19 = [v18 syncedAccountForAccountWithId:v16];

        if (v19)
        {
          [v19 setResendRequested:1];
          [v19 setResendInterval:a5];
          long long v20 = [(NNMKResendScheduler *)self deviceRegistry];
          [v20 addOrUpdateSyncedAccount:v19];

          uint64_t v21 = [(NNMKResendScheduler *)self delegate];
          [v21 resendScheduler:self didRequestRetrySendingAccountWithId:v16];
        }
        else
        {
          uint64_t v21 = [(NNMKResendScheduler *)self delegate];
          [v21 resendScheduler:self didRequestRetrySendingDeletionForAccountWithId:v16 resendInterval:a5];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }

  id v22 = [(NNMKResendScheduler *)self deviceRegistry];
  [v22 endUpdates];
}

- (void)_resendSendingProgressForComposedMessageWithId:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_23D3DF000, v10, OS_LOG_TYPE_DEFAULT, "Resending progress for composed message (Id: %{public}@ - IDS Identifier: %{public}@)...", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v11 = [(NNMKResendScheduler *)self deviceRegistry];
  uint64_t v12 = [v11 progressForComposedMessageWithId:v8];

  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0x7FFFFFFFLL;
  }
  uint64_t v14 = [(NNMKResendScheduler *)self delegate];
  [v14 resendScheduler:self didRequestRetrySendingComposeMessageProgress:v13 messageId:v8 resendInterval:a5];
}

- (unint64_t)initialSyncResendInterval
{
  return self->_initialSyncResendInterval;
}

- (void)setInitialSyncResendInterval:(unint64_t)a3
{
  self->_initialSyncResendInterval = a3;
}

- (NNMKResendSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKResendSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerIDSIdentifier:(os_log_t)log objectIds:type:resendInterval:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23D3DF000, log, OS_LOG_TYPE_DEBUG, "IDS message sent. (IDS Identifier: %{public}@, Type:%{public}@)", (uint8_t *)&v3, 0x16u);
}

- (void)handleIDSMessageSentSuccessfullyWithId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_DEBUG, "IDS Message Sent Successfully (IDS Identifier: %{public}@).", (uint8_t *)&v2, 0xCu);
}

- (void)_resendObjectIds:(uint64_t)a1 type:(NSObject *)a2 resendInterval:idsIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Error re-sending content, as object IDs were corrupt (IDS Identifier: %{public}@).", (uint8_t *)&v2, 0xCu);
}

@end