@interface FCFeedDatabaseLookup
- (id)description;
@end

@implementation FCFeedDatabaseLookup

- (id)description
{
  v3 = +[FCDescription descriptionWithObject:self];
  v4 = v3;
  if (self)
  {
    [v3 addField:@"feedID" value:self->_feedID];
    feedRange = self->_feedRange;
  }
  else
  {
    [v3 addField:@"feedID" value:0];
    feedRange = 0;
  }
  v6 = [(FCFeedRange *)feedRange dateRange];
  [v4 addField:@"feedRange", @"%@", v6 format];

  if (self)
  {
    objc_msgSend(v4, "addField:format:", @"maxCount", @"%lu", self->_maxCount);
    if (self->_cachedOnly) {
      v7 = @"YES";
    }
    else {
      v7 = @"NO";
    }
  }
  else
  {
    objc_msgSend(v4, "addField:format:", @"maxCount", @"%lu", 0);
    v7 = @"NO";
  }
  [v4 addField:@"cachedOnly" value:v7];
  v8 = [v4 descriptionString];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeature, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end