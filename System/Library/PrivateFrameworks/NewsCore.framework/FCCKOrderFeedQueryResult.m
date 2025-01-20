@interface FCCKOrderFeedQueryResult
- (id)initWithFeedItemAndArticleRecords:(void *)a3 feedResponses:(void *)a4 tagRecords:(void *)a5 issueRecords:;
@end

@implementation FCCKOrderFeedQueryResult

- (id)initWithFeedItemAndArticleRecords:(void *)a3 feedResponses:(void *)a4 tagRecords:(void *)a5 issueRecords:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)FCCKOrderFeedQueryResult;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueRecords, 0);
  objc_storeStrong((id *)&self->_tagRecords, 0);
  objc_storeStrong((id *)&self->_feedResponses, 0);
  objc_storeStrong((id *)&self->_feedItemAndArticleRecords, 0);
}

@end