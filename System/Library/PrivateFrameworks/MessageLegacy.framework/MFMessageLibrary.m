@interface MFMessageLibrary
- (BOOL)canProvideMinimumRemoteID;
- (BOOL)hasCompleteDataForMimePart:(id)a3;
- (BOOL)isBusy;
- (BOOL)isMessageContentsLocallyAvailable:(id)a3;
- (BOOL)libraryExists;
- (BOOL)renameMailboxes:(id)a3 to:(id)a4;
- (BOOL)shouldCancel;
- (MFMessageLibrary)initWithPath:(id)a3;
- (id)UIDsToDeleteInMailbox:(id)a3;
- (id)accountForMessage:(id)a3;
- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6;
- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13;
- (id)allUIDsInMailbox:(id)a3;
- (id)bodyDataForMessage:(id)a3;
- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4;
- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5;
- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5;
- (id)dataConsumerForMessage:(id)a3;
- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4;
- (id)dataConsumerForMessage:(id)a3 part:(id)a4;
- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5;
- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4;
- (id)dataPathForMessage:(id)a3;
- (id)dataPathForMessage:(id)a3 part:(id)a4;
- (id)dataProvider;
- (id)dateOfNewestNonSearchResultMessageInMailbox:(id)a3;
- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3;
- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3;
- (id)deletedUIDsInMailbox:(id)a3;
- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 clearFlags:(unint64_t)a7 messageFlagsForMessages:(id)a8 createNewCacheFiles:(BOOL)a9;
- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4;
- (id)getDetailsForAllMessagesFromMailbox:(id)a3;
- (id)getDetailsForMessages:(unint64_t)a3 absoluteBottom:(unint64_t)a4 topOfDesiredRange:(unint64_t)a5 range:(_NSRange *)a6 fromMailbox:(id)a7;
- (id)getDetailsForMessagesWithRemoteIDInRange:(_NSRange)a3 fromMailbox:(id)a4;
- (id)headerDataForMessage:(id)a3;
- (id)hiddenPOPUIDsInMailbox:(id)a3;
- (id)loadMeetingDataForMessage:(id)a3;
- (id)loadMeetingExternalIDForMessage:(id)a3;
- (id)loadMeetingMetadataForMessage:(id)a3;
- (id)mailboxUidForMessage:(id)a3;
- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)messageWithMessageID:(id)a3 inMailbox:(id)a4;
- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4;
- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6;
- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 success:(BOOL *)a5;
- (id)messagesNeedingSyncConfirmationForMailbox:(id)a3;
- (id)messagesWithMessageIDHeader:(id)a3;
- (id)messagesWithSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5;
- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4;
- (id)messagesWithoutSummariesForMailbox:(id)a3;
- (id)messagesWithoutSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5;
- (id)metadataForMessage:(id)a3 ofClass:(Class)a4 key:(id)a5;
- (id)offlineCacheOperationsForAccount:(int64_t)a3 lastTemporaryID:(unsigned int *)a4;
- (id)oldestMessageInMailbox:(id)a3;
- (id)orderedBatchOfMessagesEndingAtRowId:(unsigned int)a3 limit:(unsigned int)a4 success:(BOOL *)a5;
- (id)remoteStoreForMessage:(id)a3;
- (id)sequenceIdentifierForMailbox:(id)a3;
- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4;
- (id)serverSearchResultMessagesForMailbox:(id)a3;
- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4;
- (id)storedIntegerPropertyWithName:(id)a3;
- (id)urlForMailboxID:(unsigned int)a3;
- (int64_t)createLibraryIDForAccount:(id)a3;
- (int64_t)libraryIDForAccount:(id)a3;
- (int64_t)statusCountDeltaForMailbox:(id)a3;
- (unint64_t)mostRecentStatusCountForMailbox:(id)a3;
- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3;
- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5;
- (unsigned)attachmentCountForMailboxes:(id)a3;
- (unsigned)deletedCountForMailbox:(id)a3;
- (unsigned)mailboxIDForURLString:(id)a3;
- (unsigned)maximumRemoteIDForMailbox:(id)a3;
- (unsigned)minimumRemoteIDForMailbox:(id)a3;
- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3;
- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5;
- (unsigned)nonDeletedCountForMailbox:(id)a3;
- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5;
- (unsigned)totalCountForMailbox:(id)a3;
- (unsigned)unreadCountForAggregatedMailboxes:(id)a3;
- (unsigned)unreadCountForAggregatedMailboxes:(id)a3 matchingCriterion:(id)a4;
- (unsigned)unreadCountForMailbox:(id)a3;
- (unsigned)unreadCountForMailbox:(id)a3 matchingCriterion:(id)a4;
- (void)compactMessages:(id)a3;
- (void)dealloc;
- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5;
- (void)setFlagsForMessages:(id)a3;
@end

@implementation MFMessageLibrary

- (MFMessageLibrary)initWithPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFMessageLibrary;
  v4 = [(MFMessageLibrary *)&v6 init];
  if (v4) {
    v4->_path = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageLibrary;
  [(MFMessageLibrary *)&v3 dealloc];
}

- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 clearFlags:(unint64_t)a7 messageFlagsForMessages:(id)a8 createNewCacheFiles:(BOOL)a9
{
  v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  LOWORD(v18) = a9;
  -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, a5, 0, v16, a4, a6, a7, a8, v18, 0);
  return v16;
}

- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4
{
  return 0;
}

- (id)serverSearchResultMessagesForMailbox:(id)a3
{
  return 0;
}

- (id)messagesNeedingSyncConfirmationForMailbox:(id)a3
{
  return 0;
}

- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)dateOfNewestNonSearchResultMessageInMailbox:(id)a3
{
  return 0;
}

- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4
{
  return 0;
}

- (id)messagesWithoutSummariesForMailbox:(id)a3
{
  return 0;
}

- (id)messagesWithSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5
{
  return 0;
}

- (id)messagesWithoutSummariesForMailbox:(id)a3 fromRowID:(unsigned int)a4 limit:(unsigned int)a5
{
  return 0;
}

- (id)orderedBatchOfMessagesEndingAtRowId:(unsigned int)a3 limit:(unsigned int)a4 success:(BOOL *)a5
{
  return 0;
}

- (unsigned)unreadCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)unreadCountForMailbox:(id)a3 matchingCriterion:(id)a4
{
  return 0;
}

- (unsigned)unreadCountForAggregatedMailboxes:(id)a3
{
  return 0;
}

- (unsigned)unreadCountForAggregatedMailboxes:(id)a3 matchingCriterion:(id)a4
{
  return 0;
}

- (unsigned)attachmentCountForMailboxes:(id)a3
{
  return 0;
}

- (unsigned)deletedCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3
{
  return 0;
}

- (unsigned)nonDeletedCountForAggregatedMailboxes:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3
{
  return 0;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  return 0;
}

- (unsigned)totalCountForMailbox:(id)a3
{
  return 0;
}

- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3
{
  return 0;
}

- (int64_t)statusCountDeltaForMailbox:(id)a3
{
  return 0;
}

- (unint64_t)mostRecentStatusCountForMailbox:(id)a3
{
  return 0;
}

- (id)oldestMessageInMailbox:(id)a3
{
  return 0;
}

- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4
{
  return 0;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5
{
  return 0;
}

- (unsigned)maximumRemoteIDForMailbox:(id)a3
{
  return 0;
}

- (unsigned)minimumRemoteIDForMailbox:(id)a3
{
  return 0;
}

- (BOOL)canProvideMinimumRemoteID
{
  return 0;
}

- (id)sequenceIdentifierForMailbox:(id)a3
{
  return 0;
}

- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4
{
  return 0;
}

- (id)getDetailsForMessagesWithRemoteIDInRange:(_NSRange)a3 fromMailbox:(id)a4
{
  return 0;
}

- (id)getDetailsForAllMessagesFromMailbox:(id)a3
{
  return 0;
}

- (id)getDetailsForMessages:(unint64_t)a3 absoluteBottom:(unint64_t)a4 topOfDesiredRange:(unint64_t)a5 range:(_NSRange *)a6 fromMailbox:(id)a7
{
  if (a6)
  {
    a6->location = a4;
    a6->length = a5 - a4;
  }
  return 0;
}

- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (id)messagesWithMessageIDHeader:(id)a3
{
  return 0;
}

- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  return 0;
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)compactMessages:(id)a3
{
}

- (BOOL)renameMailboxes:(id)a3 to:(id)a4
{
  return 0;
}

- (id)messageWithMessageID:(id)a3 inMailbox:(id)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4
{
  return 0;
}

- (id)dataConsumerForMessage:(id)a3
{
  return 0;
}

- (id)metadataForMessage:(id)a3 ofClass:(Class)a4 key:(id)a5
{
  return 0;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  return 0;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  return 0;
}

- (id)headerDataForMessage:(id)a3
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 success:(BOOL *)a5
{
  return 0;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6
{
  return 0;
}

- (BOOL)libraryExists
{
  return 0;
}

- (BOOL)isBusy
{
  return 0;
}

- (id)UIDsToDeleteInMailbox:(id)a3
{
  return 0;
}

- (id)deletedUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)allUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)hiddenPOPUIDsInMailbox:(id)a3
{
  return 0;
}

- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5
{
  return 0;
}

- (int64_t)createLibraryIDForAccount:(id)a3
{
  return -1;
}

- (int64_t)libraryIDForAccount:(id)a3
{
  return -1;
}

- (id)offlineCacheOperationsForAccount:(int64_t)a3 lastTemporaryID:(unsigned int *)a4
{
  return 0;
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  return 0;
}

- (id)urlForMailboxID:(unsigned int)a3
{
  return 0;
}

- (BOOL)isMessageContentsLocallyAvailable:(id)a3
{
  return 0;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13
{
  return 0;
}

- (id)dataPathForMessage:(id)a3
{
  return 0;
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  return 0;
}

- (id)mailboxUidForMessage:(id)a3
{
  return 0;
}

- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4
{
  return 0;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5
{
  return 0;
}

- (id)remoteStoreForMessage:(id)a3
{
  return 0;
}

- (unsigned)mailboxIDForURLString:(id)a3
{
  return 0;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6
{
  LOWORD(v7) = 1;
  return -[MFMessageLibrary addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:](self, "addMessages:withMailbox:fetchBodies:newMessagesByOldMessage:remoteIDs:setFlags:clearFlags:messageFlagsForMessages:copyFiles:addPOPUIDs:dataSectionsByMessage:", a3, a4, a5, a6, 0, 0, 0, 0, v7, 0);
}

- (void)setFlagsForMessages:(id)a3
{
}

- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  if ([a3 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:a3 forKey:@"messages"];
    if (a5) {
      [v9 setObject:a5 forKey:@"oldFlagsByMessage"];
    }
    if (a4) {
      [v9 setObject:a4 forKey:@"flags"];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MailMessageStoreMessageFlagsChanged", self, v9);
  }
}

- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (a3 == a4)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = v10;
    if ((a3 & 1) != (a4 & 1))
    {
      if (a4) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      [v10 setObject:v11 forKey:@"MessageIsRead"];
    }
    unint64_t v12 = a4 ^ a3;
    if ((a4 ^ a3) >= 2)
    {
      if (((a3 >> 1) & 1) != ((a4 >> 1) & 1))
      {
        if ((a4 & 2) != 0) {
          v13 = @"YES";
        }
        else {
          v13 = @"NO";
        }
        [v8 setObject:v13 forKey:@"MessageIsDeleted"];
      }
      if (v12 >= 4)
      {
        if (((a3 >> 2) & 1) != ((a4 >> 2) & 1))
        {
          if ((a4 & 4) != 0) {
            v14 = @"YES";
          }
          else {
            v14 = @"NO";
          }
          [v8 setObject:v14 forKey:@"MessageWasRepliedTo"];
        }
        if (v12 >= 8)
        {
          if (((a3 >> 3) & 1) != ((a4 >> 3) & 1))
          {
            if ((a4 & 8) != 0) {
              v15 = @"YES";
            }
            else {
              v15 = @"NO";
            }
            [v8 setObject:v15 forKey:@"MessageIsEncrypted"];
          }
          if (v12 >= 0x10)
          {
            if (((a3 >> 23) & 1) != ((a4 >> 23) & 1))
            {
              if ((a4 & 0x800000) != 0) {
                v16 = @"YES";
              }
              else {
                v16 = @"NO";
              }
              [v8 setObject:v16 forKey:@"MessageIsSigned"];
            }
            if ((v12 & 0xFFFFFFFFFF7FFFF0) != 0)
            {
              if (((a3 >> 24) & 1) != ((a4 >> 24) & 1))
              {
                if ((a4 & 0x1000000) != 0) {
                  v17 = @"YES";
                }
                else {
                  v17 = @"NO";
                }
                [v8 setObject:v17 forKey:@"MessageSenderIsVIP"];
              }
              if ((v12 & 0xFFFFFFFFFE7FFFF0) != 0)
              {
                if (((a3 >> 8) & 1) != ((a4 >> 8) & 1))
                {
                  if ((a4 & 0x100) != 0) {
                    uint64_t v18 = @"YES";
                  }
                  else {
                    uint64_t v18 = @"NO";
                  }
                  [v8 setObject:v18 forKey:@"MessageWasForwarded"];
                }
                if ((v12 & 0xFFFFFFFFFE7FFEF0) != 0)
                {
                  if (((a3 >> 9) & 1) != ((a4 >> 9) & 1))
                  {
                    if ((a4 & 0x200) != 0) {
                      v19 = @"YES";
                    }
                    else {
                      v19 = @"NO";
                    }
                    [v8 setObject:v19 forKey:@"MessageWasRedirected"];
                  }
                  if ((v12 & 0xFFFFFFFFFE7FFCF0) != 0)
                  {
                    if (((a3 >> 4) & 1) != ((a4 >> 4) & 1))
                    {
                      if ((a4 & 0x10) != 0) {
                        v20 = @"YES";
                      }
                      else {
                        v20 = @"NO";
                      }
                      [v8 setObject:v20 forKey:@"MessageIsFlagged"];
                    }
                    if ((v12 & 0xFFFFFFFFFE7FFCE0) != 0)
                    {
                      if (((a3 >> 30) & 1) != ((a4 >> 30) & 1))
                      {
                        if ((a4 & 0x40000000) != 0) {
                          v21 = @"YES";
                        }
                        else {
                          v21 = @"NO";
                        }
                        [v8 setObject:v21 forKey:@"MessageHighlightTextInTOC"];
                      }
                      if ((v12 & 0xFFFFFFFFBE7FFCE0) != 0)
                      {
                        if ((WORD1(a3) & 7) != (WORD1(a4) & 7)) {
                          objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"MessagePriorityLevel");
                        }
                        if ((v12 & 0xFFFFFFFFBE78FCE0) != 0)
                        {
                          unint64_t v22 = ((a3 >> 26) & 7) - 1;
                          int v23 = v22 > 6 ? 0 : dword_1CFD6F6F0[v22];
                          unint64_t v24 = ((a4 >> 26) & 7) - 1;
                          int v25 = v24 > 6 ? 0 : dword_1CFD6F6F0[v24];
                          if (v23 != v25) {
                            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:"), @"MessageFontSizeDelta");
                          }
                          if ((v12 & 0xFFFFFFFFA278FCE0) != 0)
                          {

                            id v8 = 0;
LABEL_78:
                            v29[0] = a5;
                            uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
                            uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3, a5);
                            -[MFMessageLibrary postFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "postFlagsChangedForMessages:flags:oldFlagsByMessage:", v26, v8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1]);
                            goto LABEL_79;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (!v8 || [v8 count]) {
    goto LABEL_78;
  }
LABEL_79:
}

- (id)accountForMessage:(id)a3
{
  id v3 = [(MFMessageLibrary *)self mailboxUidForMessage:a3];
  return (id)[v3 account];
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  return [(MFMessageLibrary *)self bodyDataForMessage:a3 andHeaderDataIfReadilyAvailable:a4 isComplete:0];
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  return 0;
}

- (id)storedIntegerPropertyWithName:(id)a3
{
  return 0;
}

- (id)dataProvider
{
  id result = self->_attachmentDataProvider;
  if (!result)
  {
    id result = [[MFAttachmentLibraryDataProvider alloc] initWithLibrary:self];
    self->_attachmentDataProvider = (MFAttachmentLibraryDataProvider *)result;
  }
  return result;
}

@end