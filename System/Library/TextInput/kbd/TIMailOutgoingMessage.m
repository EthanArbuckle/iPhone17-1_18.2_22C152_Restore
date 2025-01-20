@interface TIMailOutgoingMessage
- (NSDate)dateSent;
- (NSDictionary)searchResult;
- (NSString)body;
- (NSString)recipient;
- (void)setSearchResult:(id)a3;
@end

@implementation TIMailOutgoingMessage

- (NSDate)dateSent
{
  v2 = [(TIMailOutgoingMessage *)self searchResult];
  v3 = [v2 objectForKey:MSResultsKeyDateSent];

  return (NSDate *)v3;
}

- (NSString)recipient
{
  v3 = [(TIMailOutgoingMessage *)self searchResult];
  v4 = [v3 objectForKey:MSResultsKeyRecipientTo];

  if ([v4 count] == (id)1
    && ([(TIMailOutgoingMessage *)self searchResult],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:MSResultsKeyRecipientCc],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5,
        !v7))
  {
    v8 = [v4 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)body
{
  v2 = [(TIMailOutgoingMessage *)self searchResult];
  v3 = [v2 objectForKey:_MSResultsKeyPredictiveModelSummary];

  return (NSString *)v3;
}

- (NSDictionary)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end