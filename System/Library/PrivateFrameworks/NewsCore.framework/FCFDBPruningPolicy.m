@interface FCFDBPruningPolicy
- (FCFDBPruningPolicy)initWithMaxAgeToPersist:(double)a3;
- (FCFDBPruningPolicy)initWithMaxOrderToPrune:(unint64_t)a3;
- (FCFeedRange)feedRangeToPrune;
@end

@implementation FCFDBPruningPolicy

- (FCFDBPruningPolicy)initWithMaxOrderToPrune:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FCFDBPruningPolicy;
  v4 = [(FCFDBPruningPolicy *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[FCFeedRange feedRangeWithMaxOrder:a3 minOrder:0];
    feedRangeToPrune = v4->_feedRangeToPrune;
    v4->_feedRangeToPrune = (FCFeedRange *)v5;
  }
  return v4;
}

- (FCFDBPruningPolicy)initWithMaxAgeToPersist:(double)a3
{
  v4 = +[FCFeedCursor cursorForTimeIntervalBeforeNow:a3];
  uint64_t v5 = -[FCFDBPruningPolicy initWithMaxOrderToPrune:](self, "initWithMaxOrderToPrune:", [v4 order]);

  return v5;
}

- (FCFeedRange)feedRangeToPrune
{
  return self->_feedRangeToPrune;
}

- (void).cxx_destruct
{
}

@end