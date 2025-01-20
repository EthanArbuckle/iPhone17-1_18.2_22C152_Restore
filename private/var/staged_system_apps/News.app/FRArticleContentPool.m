@interface FRArticleContentPool
- (FCCloudContext)context;
- (FRArticleContentPool)initWithCloudContext:(id)a3 dataProviderFactory:(id)a4;
- (FRFlintDataProviderFactory)dataProviderFactory;
- (NSCountedSet)interests;
- (NSMutableDictionary)accessDates;
- (NSMutableDictionary)pool;
- (id)_createEntryForHeadline:(id)a3;
- (id)_entryForHeadline:(id)a3;
- (id)contentForHeadline:(id)a3;
- (id)flintDataProviderForHeadline:(id)a3;
- (unint64_t)highWaterMark;
- (void)_fetchEntryForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)_flushIfNeeded;
- (void)addInterestInArticleWithID:(id)a3;
- (void)fetchContentForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchFlintDataProviderForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)flushContentWithArticleID:(id)a3;
- (void)removeInterestInArticleWithID:(id)a3;
- (void)setAccessDates:(id)a3;
- (void)setHighWaterMark:(unint64_t)a3;
- (void)setInterests:(id)a3;
- (void)setPool:(id)a3;
@end

@implementation FRArticleContentPool

- (FRArticleContentPool)initWithCloudContext:(id)a3 dataProviderFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FRArticleContentPool;
  v9 = [(FRArticleContentPool *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_dataProviderFactory, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pool = v10->_pool;
    v10->_pool = v11;

    v13 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    interests = v10->_interests;
    v10->_interests = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accessDates = v10->_accessDates;
    v10->_accessDates = v15;
  }
  return v10;
}

- (void)addInterestInArticleWithID:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = [(FRArticleContentPool *)self interests];
  [v5 addObject:v4];

  v6 = [(FRArticleContentPool *)self accessDates];
  id v7 = +[NSDate date];
  [v6 setObject:v7 forKey:v4];

  unint64_t v8 = [(FRArticleContentPool *)self highWaterMark];
  v9 = [(FRArticleContentPool *)self interests];
  id v10 = [v9 count];

  if (v8 <= (unint64_t)v10) {
    id v11 = v10;
  }
  else {
    id v11 = (id)v8;
  }

  [(FRArticleContentPool *)self setHighWaterMark:v11];
}

- (void)removeInterestInArticleWithID:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = [(FRArticleContentPool *)self interests];
  [v5 removeObject:v4];

  v6 = [(FRArticleContentPool *)self accessDates];
  id v7 = +[NSDate date];
  [v6 setObject:v7 forKey:v4];

  [(FRArticleContentPool *)self _flushIfNeeded];
}

- (id)contentForHeadline:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = [(FRArticleContentPool *)self _entryForHeadline:v4];

  v6 = [v5 content];

  return v6;
}

- (void)fetchContentForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B0EC;
  v9[3] = &unk_1000C7750;
  id v10 = a5;
  id v8 = v10;
  [(FRArticleContentPool *)self _fetchEntryForHeadline:a3 completionQueue:a4 completionHandler:v9];
}

- (id)flintDataProviderForHeadline:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  if ([v4 contentType] == (id)2)
  {
    v5 = [(FRArticleContentPool *)self _entryForHeadline:v4];
    v6 = [v5 flintDataProvider];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchFlintDataProviderForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B29C;
  v9[3] = &unk_1000C7750;
  id v10 = a5;
  id v8 = v10;
  [(FRArticleContentPool *)self _fetchEntryForHeadline:a3 completionQueue:a4 completionHandler:v9];
}

- (void)flushContentWithArticleID:(id)a3
{
  id v5 = a3;
  +[NSThread isMainThread];
  if (v5)
  {
    id v4 = [(FRArticleContentPool *)self pool];
    [v4 removeObjectForKey:v5];
  }
}

- (id)_entryForHeadline:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [v4 articleID];

  if (v5)
  {
    v6 = [(FRArticleContentPool *)self pool];
    id v7 = [v4 articleID];
    id v5 = [v6 objectForKey:v7];

    if (!v5)
    {
      id v5 = [(FRArticleContentPool *)self _createEntryForHeadline:v4];
      id v8 = [(FRArticleContentPool *)self pool];
      v9 = [v4 articleID];
      [v8 setObject:v5 forKey:v9];

      [(FRArticleContentPool *)self _flushIfNeeded];
    }
  }

  return v5;
}

- (void)_fetchEntryForHeadline:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(FRArticleContentPool *)self _createEntryForHeadline:v8];
  v17 = v15 = v8;
  objc_super v18 = v10;
  v16 = v9;
  id v11 = v17;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  FCPerformBlockOnMainThread();
}

- (id)_createEntryForHeadline:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FRArticleContentPoolEntry);
  v6 = [(FRArticleContentPool *)self context];
  id v7 = [v4 contentWithContext:v6];
  [(FRArticleContentPoolEntry *)v5 setContent:v7];

  if ([v4 contentType] == (id)2)
  {
    id v8 = [(FRArticleContentPool *)self dataProviderFactory];
    id v9 = [(FRArticleContentPoolEntry *)v5 content];
    id v10 = [v9 anfContent];
    id v11 = [v8 flintDataProviderForANFContent:v10 headline:v4];
    [(FRArticleContentPoolEntry *)v5 setFlintDataProvider:v11];
  }

  return v5;
}

- (void)_flushIfNeeded
{
  +[NSThread isMainThread];
  v3 = [(FRArticleContentPool *)self pool];
  id v4 = [v3 count];
  unint64_t v5 = [(FRArticleContentPool *)self highWaterMark];

  if ((unint64_t)v4 > v5)
  {
    v6 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [(FRArticleContentPool *)self pool];
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
          id v13 = [(FRArticleContentPool *)self interests];
          id v14 = [v13 countForObject:v12];

          if (!v14) {
            [v6 addObject:v12];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003BAD4;
    v20[3] = &unk_1000C5B08;
    v20[4] = self;
    [v6 sortUsingComparator:v20];
    while ([v6 count])
    {
      v15 = [(FRArticleContentPool *)self pool];
      id v16 = [v15 count];
      unint64_t v17 = [(FRArticleContentPool *)self highWaterMark];

      if ((unint64_t)v16 <= v17) {
        break;
      }
      objc_super v18 = [(FRArticleContentPool *)self pool];
      v19 = [v6 firstObject];
      [v18 removeObjectForKey:v19];

      [v6 fc_removeFirstObject];
    }
  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (NSMutableDictionary)pool
{
  return self->_pool;
}

- (void)setPool:(id)a3
{
}

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)setHighWaterMark:(unint64_t)a3
{
  self->_highWaterMark = a3;
}

- (NSCountedSet)interests
{
  return self->_interests;
}

- (void)setInterests:(id)a3
{
}

- (NSMutableDictionary)accessDates
{
  return self->_accessDates;
}

- (void)setAccessDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessDates, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end