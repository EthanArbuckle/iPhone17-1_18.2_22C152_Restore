@interface FCCKFeedResponse
- (id)description;
@end

@implementation FCCKFeedResponse

- (id)description
{
  v3 = +[FCDescription descriptionWithObject:self];
  v4 = v3;
  if (self)
  {
    [v3 addField:@"feedID" value:self->_feedID];
    feedItemAndArticleRecords = self->_feedItemAndArticleRecords;
  }
  else
  {
    [v3 addField:@"feedID" value:0];
    feedItemAndArticleRecords = 0;
  }
  objc_msgSend(v4, "addField:format:", @"feedItemAndArticleRecords", @"%lu", -[NSArray count](feedItemAndArticleRecords, "count"));
  if (self)
  {
    if (self->_reachedEnd) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    [v4 addField:@"reachedEnd" value:v6];
    if (self->_reachedOrderLimit) {
      v7 = @"YES";
    }
    else {
      v7 = @"NO";
    }
    [v4 addField:@"reachedOrderLimit" value:v7];
    objc_msgSend(v4, "addField:format:", @"extent", @"%llu", self->_extent);
    cursor = self->_cursor;
  }
  else
  {
    [v4 addField:@"reachedEnd" value:@"NO"];
    [v4 addField:@"reachedOrderLimit" value:@"NO"];
    objc_msgSend(v4, "addField:format:", @"extent", @"%llu", 0);
    cursor = 0;
  }
  if (cursor) {
    v9 = @"non-nil";
  }
  else {
    v9 = @"nil";
  }
  [v4 addField:@"cursor", @"%@", v9 format];
  v10 = @"NO";
  if (self && self->_wasDropped) {
    v10 = @"YES";
  }
  [v4 addField:@"wasDropped" value:v10];
  v11 = [v4 descriptionString];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_feedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end