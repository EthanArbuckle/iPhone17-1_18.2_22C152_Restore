@interface FCFeedResponse
- (BOOL)exhaustedRequestRange;
- (FCFeedRange)feedRange;
- (NSArray)feedItems;
- (NSError)error;
- (NSString)feedID;
- (id)feedResponseByMergingWithResponse:(id)a3;
- (int64_t)compareFeedItemCount:(id)a3;
- (void)setError:(id)a3;
- (void)setExhaustedRequestRange:(BOOL)a3;
- (void)setFeedID:(id)a3;
- (void)setFeedItems:(id)a3;
@end

@implementation FCFeedResponse

- (id)feedResponseByMergingWithResponse:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(FCFeedResponse);
  v6 = [(FCFeedResponse *)self feedID];
  [(FCFeedResponse *)v5 setFeedID:v6];

  v7 = [(FCFeedResponse *)self error];
  [(FCFeedResponse *)v5 setError:v7];

  uint64_t v8 = [(FCFeedResponse *)self error];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v4 error];

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = [(FCFeedResponse *)self feedItems];
      v13 = [v4 feedItems];
      v14 = objc_msgSend(v11, "fc_arrayByAddingObjectsFromArray:toArray:", v12, v13);
      [(FCFeedResponse *)v5 setFeedItems:v14];

      if ([(FCFeedResponse *)self exhaustedRequestRange]) {
        uint64_t v15 = [v4 exhaustedRequestRange];
      }
      else {
        uint64_t v15 = 0;
      }
      [(FCFeedResponse *)v5 setExhaustedRequestRange:v15];
    }
  }

  return v5;
}

- (int64_t)compareFeedItemCount:(id)a3
{
  id v4 = a3;
  v5 = [(FCFeedResponse *)self feedItems];
  unint64_t v6 = [v5 count];
  v7 = [v4 feedItems];

  unint64_t v8 = [v7 count];
  if (v6 < v8) {
    int64_t v9 = -1;
  }
  else {
    int64_t v9 = v6 > v8;
  }

  return v9;
}

- (FCFeedRange)feedRange
{
  v3 = [(FCFeedResponse *)self feedItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(FCFeedResponse *)self feedItems];
    unint64_t v6 = [v5 firstObject];
    v7 = +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", [v6 order]);

    unint64_t v8 = [(FCFeedResponse *)self feedItems];
    int64_t v9 = [v8 lastObject];
    v10 = +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", [v9 order] - 1);

    v11 = +[FCFeedRange feedRangeWithTop:v7 bottom:v10];
  }
  else
  {
    v11 = 0;
  }
  return (FCFeedRange *)v11;
}

- (NSString)feedID
{
  return self->_feedID;
}

- (void)setFeedID:(id)a3
{
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

- (BOOL)exhaustedRequestRange
{
  return self->_exhaustedRequestRange;
}

- (void)setExhaustedRequestRange:(BOOL)a3
{
  self->_exhaustedRequestRange = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end