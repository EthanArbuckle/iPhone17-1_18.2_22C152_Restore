@interface FCFeedDatabaseLookupResult
- (id)description;
@end

@implementation FCFeedDatabaseLookupResult

- (id)description
{
  v3 = +[FCDescription descriptionWithObject:self];
  if (self)
  {
    objc_msgSend(v3, "addField:format:", @"feedItems", @"%lu", -[NSArray count](self->_feedItems, "count"));
    feedRange = self->_feedRange;
  }
  else
  {
    objc_msgSend(v3, "addField:format:", @"feedItems", @"%lu", objc_msgSend(0, "count"));
    feedRange = 0;
  }
  v5 = [(FCFeedRange *)feedRange dateRange];
  [v3 addField:@"feedRange", @"%@", v5 format];

  if (self)
  {
    if (self->_exhaustedRange) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    [v3 addField:@"exhaustedRange" value:v6];
    objc_msgSend(v3, "addField:format:", @"ckFromOrder", @"%llu", self->_ckFromOrder);
    objc_msgSend(v3, "addField:format:", @"ckToOrder", @"%llu", self->_ckToOrder);
    if (self->_ckFromOrder)
    {
      v7 = @"non-nil";
      goto LABEL_12;
    }
  }
  else
  {
    [v3 addField:@"exhaustedRange" value:@"NO"];
    objc_msgSend(v3, "addField:format:", @"ckFromOrder", @"%llu", 0);
    objc_msgSend(v3, "addField:format:", @"ckToOrder", @"%llu", 0);
  }
  v7 = @"nil";
LABEL_12:
  [v3 addField:@"insertionToken" value:v7];
  v8 = [v3 descriptionString];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_insertionToken, 0);
  objc_storeStrong((id *)&self->_ckFromCursor, 0);
  objc_storeStrong((id *)&self->_feedRange, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
}

@end