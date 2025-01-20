@interface SearchTopHitsSuggestion
- (EMCollectionItemID)itemID;
- (EMMessage)message;
- (EMMessageList)messageList;
- (EMSearchableIndexTopHitsQueryResult)queryResult;
- (NSDictionary)matchingHintsByGlobalMessageID;
- (SFMailRankingSignals)mailRankingSignals;
- (id)category;
- (id)messageConversationID;
- (int64_t)rankingIndex;
- (void)setMailRankingSignals:(id)a3;
- (void)setMatchingHintsByGlobalMessageID:(id)a3;
- (void)userDidInteract;
@end

@implementation SearchTopHitsSuggestion

- (id)category
{
  return +[MUISearchSuggestionCategory topHitsCategory];
}

- (void)userDidInteract
{
  id v4 = [(SearchTopHitsSuggestion *)self queryResult];
  v3 = -[SearchTopHitsSuggestion messageConversationID]_0(self);
  [v4 userDidInteractWithConversationID:v3];
}

- (id)messageConversationID
{
  if (a1)
  {
    v1 = [a1 message];
    v2 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v1 conversationID]);
    v3 = [v2 stringValue];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)rankingIndex
{
  v3 = [(SearchTopHitsSuggestion *)self queryResult];
  id v4 = -[SearchTopHitsSuggestion messageConversationID]_0(self);
  id v5 = [v3 rankingIndexForConversationID:v4];

  return (int64_t)v5;
}

- (EMMessage)message
{
  v3 = [(SearchTopHitsSuggestion *)self messageList];
  id v4 = [(SearchTopHitsSuggestion *)self itemID];
  id v5 = [v3 messageListItemForItemID:v4];
  v6 = [v5 result];

  return (EMMessage *)v6;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (EMSearchableIndexTopHitsQueryResult)queryResult
{
  return self->_queryResult;
}

- (NSDictionary)matchingHintsByGlobalMessageID
{
  return self->_matchingHintsByGlobalMessageID;
}

- (void)setMatchingHintsByGlobalMessageID:(id)a3
{
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (void)setMailRankingSignals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
  objc_storeStrong((id *)&self->_matchingHintsByGlobalMessageID, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_itemID, 0);

  objc_storeStrong((id *)&self->_messageList, 0);
}

@end