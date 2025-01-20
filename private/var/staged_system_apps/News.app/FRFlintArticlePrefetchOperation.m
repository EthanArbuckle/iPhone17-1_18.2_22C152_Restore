@interface FRFlintArticlePrefetchOperation
- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4;
@end

@implementation FRFlintArticlePrefetchOperation

- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4
{
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000661F4;
  v15 = &unk_1000CA0B0;
  v16 = self;
  id v17 = a4;
  id v6 = v17;
  id v7 = a3;
  v8 = objc_retainBlock(&v12);
  v9 = [(FRArticlePrefetchOperation *)self headline];
  v10 = FCDispatchQueueForQualityOfService();
  [v7 fetchFlintDataProviderForHeadline:v9 completionQueue:v10 completionHandler:v8];

  return self;
}

@end