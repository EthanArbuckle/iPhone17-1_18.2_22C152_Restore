@interface MessageHeaderViewModel
- (BOOL)_viewModelHasChanges:(BOOL)a1;
- (ECSubject)subject;
- (EFFuture)brandIndicatorFuture;
- (EFObserver)observableObserver;
- (EMCollectionItemID)itemID;
- (MFAddressAtomStatusManager)atomManager;
- (MFMailboxUid)mailbox;
- (MUIAvatarImageContext)avatarContext;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MessageHeaderViewModel)initWithBuilder:(id)a3;
- (MessageHeaderViewModel)initWithItemBuilder:(id)a3;
- (NSArray)bccList;
- (NSArray)ccList;
- (NSArray)replyToList;
- (NSArray)senderList;
- (NSArray)toList;
- (NSDate)dateSent;
- (id)updatedFlagsModelWithBuilder:(id)a3;
- (id)updatedModelWithBuilder:(id)a3;
- (id)updatedModelWithMessage:(id)a3 brandIndicatorFuture:(id)a4;
- (uint64_t)_flagsChangedInModel:(uint64_t)a1;
- (void)setAtomManager:(id)a3;
- (void)setAvatarContext:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setBccList:(id)a3;
- (void)setBrandIndicatorFuture:(id)a3;
- (void)setCcList:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setItemID:(id)a3;
- (void)setMailbox:(id)a3;
- (void)setObservableObserver:(id)a3;
- (void)setReplyToList:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToList:(id)a3;
@end

@implementation MessageHeaderViewModel

- (MessageHeaderViewModel)initWithBuilder:(id)a3
{
  v5 = (void (**)(id, MessageHeaderViewModel *))a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MessageHeaderViewModel.m", 32, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)MessageHeaderViewModel;
  v6 = [(MessageHeaderViewModel *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F60DD8] observableObserver];
    observableObserver = v6->_observableObserver;
    v6->_observableObserver = (EFObserver *)v7;

    v5[2](v5, v6);
  }

  return v6;
}

- (MessageHeaderViewModel)initWithItemBuilder:(id)a3
{
  id v5 = a3;
  [(MessageHeaderViewModel *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageHeaderViewModel initWithItemBuilder:]", "MessageHeaderViewModel.m", 45, "0");
}

- (id)updatedModelWithBuilder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MessageHeaderViewModel.m", 57, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MessageHeaderViewModel_updatedModelWithBuilder___block_invoke;
  v13[3] = &unk_1E6D1AD78;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  v8 = (void *)[v6 initWithBuilder:v13];
  v9 = [(MessageHeaderViewModel *)self observableObserver];
  [v8 setObservableObserver:v9];

  if (-[MessageHeaderViewModel _viewModelHasChanges:]((BOOL)self, v8))
  {
    v10 = [v8 observableObserver];
    [v10 observerDidReceiveResult:v8];
  }
  return v8;
}

void __50__MessageHeaderViewModel_updatedModelWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v34 = a2;
  v3 = [*(id *)(a1 + 32) itemID];
  [v34 setItemID:v3];

  v4 = [*(id *)(a1 + 32) dateSent];
  id v5 = (void *)[v4 copy];
  [v34 setDateSent:v5];

  id v6 = [*(id *)(a1 + 32) subject];
  id v7 = (void *)[v6 copy];
  [v34 setSubject:v7];

  v8 = [*(id *)(a1 + 32) senderList];
  v9 = (void *)[v8 copy];
  [v34 setSenderList:v9];

  v10 = [*(id *)(a1 + 32) replyToList];
  objc_super v11 = (void *)[v10 copy];
  [v34 setReplyToList:v11];

  v12 = [*(id *)(a1 + 32) toList];
  v13 = (void *)[v12 copy];
  [v34 setToList:v13];

  id v14 = [*(id *)(a1 + 32) ccList];
  v15 = (void *)[v14 copy];
  [v34 setCcList:v15];

  v16 = [*(id *)(a1 + 32) bccList];
  v17 = (void *)[v16 copy];
  [v34 setBccList:v17];

  v18 = [*(id *)(a1 + 32) atomManager];
  [v34 setAtomManager:v18];

  v19 = [*(id *)(a1 + 32) brandIndicatorFuture];
  [v34 setBrandIndicatorFuture:v19];

  v20 = [*(id *)(a1 + 32) sendLaterDate];
  v21 = (void *)[v20 copy];
  [v34 setSendLaterDate:v21];

  objc_msgSend(v34, "setRead:", objc_msgSend(*(id *)(a1 + 32), "isRead"));
  objc_msgSend(v34, "setFlagged:", objc_msgSend(*(id *)(a1 + 32), "isFlagged"));
  v22 = [*(id *)(a1 + 32) flagColors];
  v23 = (void *)[v22 copy];
  [v34 setFlagColors:v23];

  objc_msgSend(v34, "setReplied:", objc_msgSend(*(id *)(a1 + 32), "isReplied"));
  objc_msgSend(v34, "setForwarded:", objc_msgSend(*(id *)(a1 + 32), "isForwarded"));
  objc_msgSend(v34, "setRedirected:", objc_msgSend(*(id *)(a1 + 32), "isRedirected"));
  objc_msgSend(v34, "setJunk:", objc_msgSend(*(id *)(a1 + 32), "isJunk"));
  objc_msgSend(v34, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v34, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "isNotify"));
  objc_msgSend(v34, "setMute:", objc_msgSend(*(id *)(a1 + 32), "isMute"));
  v24 = [*(id *)(a1 + 32) readLaterDate];
  v25 = (void *)[v24 copy];
  [v34 setReadLaterDate:v25];

  v26 = [*(id *)(a1 + 32) sendLaterDate];
  v27 = (void *)[v26 copy];
  [v34 setSendLaterDate:v27];

  v28 = [*(id *)(a1 + 32) displayDate];
  v29 = (void *)[v28 copy];
  [v34 setDisplayDate:v29];

  v30 = [*(id *)(a1 + 32) followUp];
  v31 = (void *)[v30 copy];
  [v34 setFollowUp:v31];

  objc_msgSend(v34, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlockedSender"));
  objc_msgSend(v34, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v34, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  v32 = [*(id *)(a1 + 32) date];
  v33 = (void *)[v32 copy];
  [v34 setDate:v33];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_viewModelHasChanges:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[MessageHeaderViewModel _flagsChangedInModel:](a1, v3))
    {
      a1 = 1;
    }
    else
    {
      v4 = [(id)a1 itemID];
      id v5 = [v3 itemID];
      if ([v4 isEqual:v5])
      {
        id v6 = [(id)a1 dateSent];
        id v7 = [v3 dateSent];
        if ([v6 isEqual:v7])
        {
          v8 = [(id)a1 subject];
          v9 = [v3 subject];
          if ([v8 isEqual:v9])
          {
            v10 = [(id)a1 sendLaterDate];
            objc_super v11 = [v3 sendLaterDate];
            if ([v10 isEqual:v11])
            {
              v37 = [(id)a1 readLaterDate];
              v36 = [v3 readLaterDate];
              if (objc_msgSend(v37, "isEqual:"))
              {
                v35 = [(id)a1 sendLaterDate];
                id v34 = [v3 sendLaterDate];
                if (objc_msgSend(v35, "isEqual:"))
                {
                  v33 = [(id)a1 displayDate];
                  v32 = [v3 displayDate];
                  if (objc_msgSend(v33, "isEqual:"))
                  {
                    v31 = [(id)a1 followUp];
                    v30 = [v3 followUp];
                    if (objc_msgSend(v31, "isEqual:"))
                    {
                      v29 = [(id)a1 date];
                      v28 = [v3 date];
                      if (objc_msgSend(v29, "isEqual:"))
                      {
                        v27 = [(id)a1 displayDate];
                        v26 = [v3 displayDate];
                        if (objc_msgSend(v27, "isEqual:"))
                        {
                          v25 = [(id)a1 senderList];
                          v24 = [v3 senderList];
                          if (objc_msgSend(v25, "isEqualToArray:"))
                          {
                            v23 = [(id)a1 replyToList];
                            v22 = [v3 replyToList];
                            if ([v23 isEqualToArray:v22])
                            {
                              v21 = [(id)a1 toList];
                              v20 = [v3 toList];
                              if ([v21 isEqualToArray:v20])
                              {
                                v19 = [(id)a1 ccList];
                                v18 = [v3 ccList];
                                if ([v19 isEqualToArray:v18])
                                {
                                  v17 = [(id)a1 bccList];
                                  v16 = [v3 bccList];
                                  if ([v17 isEqualToArray:v16]
                                    && (int v14 = [(id)a1 hasAttachments],
                                        v14 == [v3 hasAttachments])
                                    && (int v15 = [(id)a1 isBlockedSender],
                                        v15 == [v3 isBlockedSender]))
                                  {
                                    uint64_t v13 = [(id)a1 unsubscribeType];
                                    a1 = v13 != [v3 unsubscribeType];
                                  }
                                  else
                                  {
                                    a1 = 1;
                                  }
                                }
                                else
                                {
                                  a1 = 1;
                                }
                              }
                              else
                              {
                                a1 = 1;
                              }
                            }
                            else
                            {
                              a1 = 1;
                            }
                          }
                          else
                          {
                            a1 = 1;
                          }
                        }
                        else
                        {
                          a1 = 1;
                        }
                      }
                      else
                      {
                        a1 = 1;
                      }
                    }
                    else
                    {
                      a1 = 1;
                    }
                  }
                  else
                  {
                    a1 = 1;
                  }
                }
                else
                {
                  a1 = 1;
                }
              }
              else
              {
                a1 = 1;
              }
            }
            else
            {
              a1 = 1;
            }
          }
          else
          {
            a1 = 1;
          }
        }
        else
        {
          a1 = 1;
        }
      }
      else
      {
        a1 = 1;
      }
    }
  }

  return a1;
}

- (id)updatedFlagsModelWithBuilder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MessageHeaderViewModel.m", 101, @"Invalid parameter not satisfying: %@", @"flagsBuilderBlock" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__MessageHeaderViewModel_updatedFlagsModelWithBuilder___block_invoke;
  v13[3] = &unk_1E6D1AD78;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  v8 = (void *)[v6 initWithBuilder:v13];
  v9 = [(MessageHeaderViewModel *)self observableObserver];
  [v8 setObservableObserver:v9];

  if (-[MessageHeaderViewModel _flagsChangedInModel:]((uint64_t)self, v8))
  {
    v10 = [v8 observableObserver];
    [v10 observerDidReceiveResult:v8];
  }
  return v8;
}

void __55__MessageHeaderViewModel_updatedFlagsModelWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v27 = a2;
  id v3 = [*(id *)(a1 + 32) itemID];
  [v27 setItemID:v3];

  objc_msgSend(v27, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlockedSender"));
  objc_msgSend(v27, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  v4 = [*(id *)(a1 + 32) date];
  id v5 = (void *)[v4 copy];
  [v27 setDate:v5];

  id v6 = [*(id *)(a1 + 32) dateSent];
  id v7 = (void *)[v6 copy];
  [v27 setDateSent:v7];

  v8 = [*(id *)(a1 + 32) subject];
  v9 = (void *)[v8 copy];
  [v27 setSubject:v9];

  v10 = [*(id *)(a1 + 32) mailbox];
  objc_super v11 = (void *)[v10 copy];
  [v27 setMailbox:v11];

  v12 = [*(id *)(a1 + 32) senderList];
  uint64_t v13 = (void *)[v12 copy];
  [v27 setSenderList:v13];

  id v14 = [*(id *)(a1 + 32) replyToList];
  int v15 = (void *)[v14 copy];
  [v27 setReplyToList:v15];

  v16 = [*(id *)(a1 + 32) toList];
  v17 = (void *)[v16 copy];
  [v27 setToList:v17];

  v18 = [*(id *)(a1 + 32) ccList];
  v19 = (void *)[v18 copy];
  [v27 setCcList:v19];

  v20 = [*(id *)(a1 + 32) bccList];
  v21 = (void *)[v20 copy];
  [v27 setBccList:v21];

  v22 = [*(id *)(a1 + 32) atomManager];
  [v27 setAtomManager:v22];

  v23 = [*(id *)(a1 + 32) brandIndicatorFuture];
  [v27 setBrandIndicatorFuture:v23];

  v24 = [*(id *)(a1 + 32) readLaterDate];
  [v27 setReadLaterDate:v24];

  v25 = [*(id *)(a1 + 32) followUp];
  [v27 setFollowUp:v25];

  v26 = [*(id *)(a1 + 32) sendLaterDate];
  [v27 setSendLaterDate:v26];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (uint64_t)_flagsChangedInModel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [(id)a1 isRead];
    if (v4 == [v3 isRead]
      && (int v5 = [(id)a1 isFlagged], v5 == objc_msgSend(v3, "isFlagged")))
    {
      id v6 = [(id)a1 flagColors];
      id v7 = [v3 flagColors];
      if ([v6 isEqualToIndexSet:v7]
        && (int v8 = [(id)a1 isReplied], v8 == objc_msgSend(v3, "isReplied"))
        && (int v9 = [(id)a1 isForwarded], v9 == objc_msgSend(v3, "isForwarded"))
        && (int v10 = [(id)a1 isVIP], v10 == objc_msgSend(v3, "isVIP"))
        && (int v11 = [(id)a1 isNotify], v11 == objc_msgSend(v3, "isNotify")))
      {
        int v13 = [(id)a1 isMute];
        a1 = v13 ^ [v3 isMute];
      }
      else
      {
        a1 = 1;
      }
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (id)updatedModelWithMessage:(id)a3 brandIndicatorFuture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MessageHeaderViewModel.m", 135, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  id v9 = objc_alloc((Class)objc_opt_class());
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__MessageHeaderViewModel_updatedModelWithMessage_brandIndicatorFuture___block_invoke;
  v17[3] = &unk_1E6D1ADA0;
  id v10 = v7;
  id v18 = v10;
  v19 = self;
  id v11 = v8;
  id v20 = v11;
  v12 = (void *)[v9 initWithBuilder:v17];
  int v13 = [(MessageHeaderViewModel *)self observableObserver];
  [v12 setObservableObserver:v13];

  if (-[MessageHeaderViewModel _viewModelHasChanges:]((BOOL)self, v12))
  {
    id v14 = [v12 observableObserver];
    [v14 observerDidReceiveResult:v12];
  }
  return v12;
}

void __71__MessageHeaderViewModel_updatedModelWithMessage_brandIndicatorFuture___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [*(id *)(a1 + 32) flags];
  int v4 = [*(id *)(a1 + 32) itemID];
  [v22 setItemID:v4];

  objc_msgSend(v22, "setRead:", objc_msgSend(v3, "read"));
  objc_msgSend(v22, "setFlagged:", objc_msgSend(v3, "flagged"));
  int v5 = [*(id *)(a1 + 32) flagColors];
  [v22 setFlagColors:v5];

  objc_msgSend(v22, "setReplied:", objc_msgSend(v3, "replied"));
  objc_msgSend(v22, "setForwarded:", objc_msgSend(v3, "forwarded"));
  objc_msgSend(v22, "setRedirected:", objc_msgSend(v3, "redirected"));
  objc_msgSend(v22, "setJunk:", objc_msgSend(v3, "isJunk"));
  objc_msgSend(v22, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v22, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 2);
  objc_msgSend(v22, "setMute:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 1);
  objc_msgSend(v22, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v22, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v22, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  id v6 = [*(id *)(a1 + 32) date];
  [v22 setDateSent:v6];

  id v7 = [*(id *)(a1 + 32) date];
  [v22 setDate:v7];

  id v8 = [*(id *)(a1 + 32) subject];
  [v22 setSubject:v8];

  id v9 = [*(id *)(a1 + 32) senderList];
  [v22 setSenderList:v9];

  id v10 = [*(id *)(a1 + 40) replyToList];
  [v22 setReplyToList:v10];

  id v11 = [*(id *)(a1 + 32) toList];
  [v22 setToList:v11];

  v12 = [*(id *)(a1 + 32) ccList];
  [v22 setCcList:v12];

  int v13 = [*(id *)(a1 + 32) bccList];
  [v22 setBccList:v13];

  id v14 = [*(id *)(a1 + 32) readLater];
  int v15 = [v14 date];
  [v22 setReadLaterDate:v15];

  v16 = [*(id *)(a1 + 32) sendLaterDate];
  [v22 setSendLaterDate:v16];

  v17 = [*(id *)(a1 + 32) followUp];
  [v22 setFollowUp:v17];

  id v18 = [*(id *)(a1 + 32) displayDate];
  [v22 setDisplayDate:v18];

  v19 = [*(id *)(a1 + 40) mailbox];
  id v20 = (void *)[v19 copy];
  [v22 setMailbox:v20];

  v21 = [*(id *)(a1 + 40) atomManager];
  [v22 setAtomManager:v21];

  [v22 setBrandIndicatorFuture:*(void *)(a1 + 48)];
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
}

- (NSArray)bccList
{
  return self->_bccList;
}

- (void)setBccList:(id)a3
{
}

- (MFAddressAtomStatusManager)atomManager
{
  return self->_atomManager;
}

- (void)setAtomManager:(id)a3
{
}

- (EFFuture)brandIndicatorFuture
{
  return self->_brandIndicatorFuture;
}

- (void)setBrandIndicatorFuture:(id)a3
{
}

- (MUIAvatarImageContext)avatarContext
{
  return self->_avatarContext;
}

- (void)setAvatarContext:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (EFObserver)observableObserver
{
  return self->_observableObserver;
}

- (void)setObservableObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableObserver, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_avatarContext, 0);
  objc_storeStrong((id *)&self->_brandIndicatorFuture, 0);
  objc_storeStrong((id *)&self->_atomManager, 0);
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end