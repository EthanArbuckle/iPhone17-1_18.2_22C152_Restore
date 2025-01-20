@interface FCCKOrderFeedRequest
- (FCCKOrderFeedRequest)init;
- (id)description;
@end

@implementation FCCKOrderFeedRequest

- (FCCKOrderFeedRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKOrderFeedRequest;
  result = [(FCCKOrderFeedRequest *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_maxOrder = xmmword_1A49739E0;
    result->_resultsLimit = 0xFFFFLL;
  }
  return result;
}

- (id)description
{
  objc_super v3 = +[FCDescription descriptionWithObject:self];
  v4 = v3;
  if (self)
  {
    [v3 addField:@"feedID" value:self->_feedID];
    objc_msgSend(v4, "addField:format:", @"maxOrder", @"%llu", self->_maxOrder);
    objc_msgSend(v4, "addField:format:", @"minOrder", @"%llu", self->_minOrder);
    unint64_t resultsLimit = self->_resultsLimit;
  }
  else
  {
    [v3 addField:@"feedID" value:0];
    objc_msgSend(v4, "addField:format:", @"maxOrder", @"%llu", 0);
    objc_msgSend(v4, "addField:format:", @"minOrder", @"%llu", 0);
    unint64_t resultsLimit = 0;
  }
  objc_msgSend(v4, "addField:format:", @"resultsLimit", @"%llu", resultsLimit);
  v6 = [v4 descriptionString];

  return v6;
}

- (void).cxx_destruct
{
}

@end