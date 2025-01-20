@interface FCCKFeedRequest
- (FCCKFeedRequest)init;
- (id)description;
@end

@implementation FCCKFeedRequest

- (FCCKFeedRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)FCCKFeedRequest;
  result = [(FCCKFeedRequest *)&v4 init];
  if (result)
  {
    *(_OWORD *)&result->_startOrder = xmmword_1A49739E0;
    *(void *)&long long v3 = 0xFFFFLL;
    *((void *)&v3 + 1) = 0xFFFFLL;
    *(_OWORD *)&result->_softResultsLimit = v3;
  }
  return result;
}

- (id)description
{
  long long v3 = +[FCDescription descriptionWithObject:self];
  objc_super v4 = v3;
  if (self)
  {
    [v3 addField:@"feedID" value:self->_feedID];
    startCursor = self->_startCursor;
  }
  else
  {
    [v3 addField:@"feedID" value:0];
    startCursor = 0;
  }
  uint64_t v6 = [(NSData *)startCursor length];
  v7 = @"non-empty";
  if (!v6) {
    v7 = @"empty";
  }
  [v4 addField:@"startCursor", @"%@", v7 format];
  if (self)
  {
    objc_msgSend(v4, "addField:format:", @"startOrder", @"%llu", self->_startOrder);
    objc_msgSend(v4, "addField:format:", @"orderLimit", @"%llu", self->_orderLimit);
    objc_msgSend(v4, "addField:format:", @"softResultsLimit", @"%llu", self->_softResultsLimit);
    unint64_t hardResultsLimit = self->_hardResultsLimit;
  }
  else
  {
    objc_msgSend(v4, "addField:format:", @"startOrder", @"%llu", 0);
    objc_msgSend(v4, "addField:format:", @"orderLimit", @"%llu", 0);
    objc_msgSend(v4, "addField:format:", @"softResultsLimit", @"%llu", 0);
    unint64_t hardResultsLimit = 0;
  }
  objc_msgSend(v4, "addField:format:", @"hardResultsLimit", @"%llu", hardResultsLimit);
  v9 = [v4 descriptionString];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCursor, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end