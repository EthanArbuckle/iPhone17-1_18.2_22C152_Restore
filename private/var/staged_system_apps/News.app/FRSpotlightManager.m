@interface FRSpotlightManager
+ (id)_spotlightFolder;
+ (id)spotlightQueue;
+ (void)clearIndex;
- (BOOL)_copyThumbnail:(id)a3 forHeadline:(id)a4;
- (BOOL)_removeThumbnailForArticleID:(id)a3;
- (BOOL)_shouldIndexArticleID:(id)a3;
- (BOOL)_shouldIndexArticleWithDate:(id)a3;
- (BOOL)addSkipBackupAttributeToItemAtPath:(id)a3;
- (FCArticleController)articleController;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCSubscriptionController)subscriptionController;
- (FRSpotlightManager)initWithCloudContext:(id)a3;
- (NUAppEntityAssociator)associator;
- (id)_itemForTag:(id)a3;
- (id)_thumbnailURLForArticleID:(id)a3;
- (id)_thumbnailURLForHeadline:(id)a3;
- (void)_indexArticleIDs:(id)a3 searchableIndex:(id)a4 acknowledgementHandler:(id)a5;
- (void)_indexTags:(id)a3 searchableIndex:(id)a4;
- (void)_removeAllArticleThumbnailsWithCompletion:(id)a3;
- (void)addSubscriptionsWithTags:(id)a3;
- (void)createSpotlightDirectoryIfNeeded;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
- (void)removeArticlesWithIDs:(id)a3;
- (void)removeSubscriptionsWithTags:(id)a3;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setArticleController:(id)a3;
- (void)setAssociator:(id)a3;
- (void)setReadingHistory:(id)a3;
- (void)setReadingList:(id)a3;
- (void)setSubscriptionController:(id)a3;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation FRSpotlightManager

- (FRSpotlightManager)initWithCloudContext:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FRSpotlightManager;
  v5 = [(FRSpotlightManager *)&v23 init];
  if (v5)
  {
    v6 = [v4 subscriptionController];
    v7 = [v4 readingHistory];
    v8 = [v4 readingList];
    [v6 addObserver:v5];
    [v7 addObserver:v5];
    [v8 addObserver:v5];
    readingList = v5->_readingList;
    v5->_readingList = (FCReadingList *)v8;
    id v10 = v8;

    subscriptionController = v5->_subscriptionController;
    v5->_subscriptionController = (FCSubscriptionController *)v6;
    id v12 = v6;

    readingHistory = v5->_readingHistory;
    v5->_readingHistory = (FCReadingHistory *)v7;
    id v14 = v7;

    uint64_t v15 = [v4 articleController];
    articleController = v5->_articleController;
    v5->_articleController = (FCArticleController *)v15;

    v17 = [(id)objc_opt_class() spotlightQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000672EC;
    block[3] = &unk_1000C5680;
    v18 = v5;
    v22 = v18;
    dispatch_async(v17, block);

    v19 = v18;
  }

  return v5;
}

- (void)setAssociator:(id)a3
{
}

+ (id)spotlightQueue
{
  return +[FCTaskScheduler lowPriorityQueue];
}

+ (id)_spotlightFolder
{
  if (qword_1000EE3D0[0] != -1) {
    dispatch_once(qword_1000EE3D0, &stru_1000CA0F8);
  }
  v2 = (void *)qword_1000EE3C8;

  return v2;
}

- (void)createSpotlightDirectoryIfNeeded
{
  v3 = [(id)objc_opt_class() _spotlightFolder];
  id v4 = [v3 path];
  v5 = +[NSFileManager defaultManager];
  char v12 = 0;
  if ([v5 fileExistsAtPath:v4 isDirectory:&v12])
  {
    if (v12) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007B49C();
    }
    if (v12)
    {
LABEL_6:
      id v6 = 0;
      goto LABEL_16;
    }
    id v11 = 0;
    unsigned __int8 v7 = [v5 removeItemAtPath:v4 error:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007B3C4();
    }
  }
  id v10 = 0;
  unsigned __int8 v9 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v10];
  id v6 = v10;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10007B308();
      if (!v6) {
        goto LABEL_16;
      }
    }
    else if (!v6)
    {
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007B288((uint64_t)v4);
    }
  }
LABEL_16:
  if (![(FRSpotlightManager *)self addSkipBackupAttributeToItemAtPath:v4]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007B1CC();
  }
}

- (BOOL)addSkipBackupAttributeToItemAtPath:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];
  v5 = +[NSFileManager defaultManager];
  id v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {

LABEL_8:
    unsigned __int8 v8 = 0;
    goto LABEL_9;
  }
  id v11 = 0;
  unsigned __int8 v8 = [v4 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007B558(v4, (uint64_t)v9);
  }

LABEL_9:
  return v8;
}

- (void)addSubscriptionsWithTags:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() spotlightQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000676FC;
  v7[3] = &unk_1000C56D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeSubscriptionsWithTags:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() spotlightQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006780C;
  block[3] = &unk_1000C5680;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (void)clearIndex
{
  v2 = [a1 spotlightQueue];
  dispatch_async(v2, &stru_1000CA158);
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!a8)
  {
    uint64_t v15 = [(id)objc_opt_class() spotlightQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100067AD0;
    v16[3] = &unk_1000C5720;
    id v17 = v12;
    v18 = self;
    id v19 = v14;
    id v20 = v13;
    dispatch_async(v15, v16);
  }
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [v6 allKeys];
  id v20 = +[NSMutableArray array];
  id v8 = +[NSDate date];
  id v9 = [v8 dateByAddingTimeInterval:-2592000.0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v16 = [v6 objectForKeyedSubscript:v15];
        unsigned __int8 v17 = [v16 integerValue];

        if ((v17 & 4) != 0 && [(FRSpotlightManager *)self _shouldIndexArticleID:v15])
        {
          v18 = [v21 lastVisitedDateForArticleID:v15];
          if (objc_msgSend(v18, "fc_isLaterThan:", v9)) {
            [v20 addObject:v15];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  if ([v20 count])
  {
    id v19 = [(id)objc_opt_class() spotlightQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100067E0C;
    block[3] = &unk_1000C56D0;
    void block[4] = self;
    id v23 = v20;
    dispatch_async(v19, block);
  }
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() spotlightQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100067F28;
  v8[3] = &unk_1000C56D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)readingHistoryDidClear:(id)a3
{
  id v3 = [(id)objc_opt_class() spotlightQueue];
  dispatch_async(v3, &stru_1000CA198);
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 count];
  if (!a6 && v11)
  {
    id v12 = +[CSSearchableIndex defaultSearchableIndex];
    [(FRSpotlightManager *)self _indexArticleIDs:v9 searchableIndex:v12 acknowledgementHandler:0];
  }
  uint64_t v13 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (!-[FRSpotlightManager _shouldIndexArticleID:](self, "_shouldIndexArticleID:", v19, (void)v20)) {
          [v13 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  [(FRSpotlightManager *)self removeArticlesWithIDs:v13];
}

- (void)removeArticlesWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(id)objc_opt_class() spotlightQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000682DC;
    v6[3] = &unk_1000C56D0;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (BOOL)_shouldIndexArticleID:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FRSpotlightManager *)self readingHistory];
  if ([v5 hasArticleBeenMarkedAsOffensive:v4])
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    id v7 = [(FRSpotlightManager *)self readingHistory];
    if ([v7 hasArticleBeenVisited:v4])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      id v8 = [(FRSpotlightManager *)self readingList];
      unsigned __int8 v6 = [v8 isArticleOnReadingList:v4];
    }
  }

  return v6;
}

- (void)_indexTags:(id)a3 searchableIndex:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(id)objc_opt_class() spotlightQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000685EC;
  v8[3] = &unk_1000C56D0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_indexArticleIDs:(id)a3 searchableIndex:(id)a4 acknowledgementHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([v8 count])
  {
    id v11 = [(FRSpotlightManager *)self articleController];
    id v12 = [v11 headlinesFetchOperationForArticleIDs:v8];

    [v12 setCachePolicy:0];
    uint64_t v13 = [(id)objc_opt_class() spotlightQueue];
    [v12 setFetchCompletionQueue:v13];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006887C;
    v15[3] = &unk_1000CA2D0;
    v15[4] = self;
    id v16 = v9;
    uint64_t v17 = v10;
    [v12 setFetchCompletionBlock:v15];
    id v14 = +[NSOperationQueue fc_sharedConcurrentQueue];
    [v14 addOperation:v12];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

- (id)_itemForTag:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:kUTTypeContent];
  id v5 = [v3 identifier];
  [v4 setRelatedUniqueIdentifier:v5];

  unsigned __int8 v6 = [v3 name];
  [v4 setTitle:v6];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"news" value:&stru_1000CABC0 table:0];
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"feed" value:&stru_1000CABC0 table:0];
  id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v10, 0);
  [v4 setKeywords:v11];

  id v12 = objc_alloc((Class)CSSearchableItem);
  uint64_t v13 = [v3 identifier];

  id v14 = [v12 initWithUniqueIdentifier:v13 domainIdentifier:NSSSpotlightFeedDomainIdentifier attributeSet:v4];

  return v14;
}

- (BOOL)_shouldIndexArticleWithDate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = +[NSDate date];
  unsigned __int8 v6 = [v4 components:24 fromDate:v3 toDate:v5 options:0];

  BOOL v7 = (uint64_t)[v6 month] < 2;
  return v7;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000690C0;
  v7[3] = &unk_1000C8598;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(FRSpotlightManager *)v8 _removeAllArticleThumbnailsWithCompletion:v7];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100069624;
  v12[3] = &unk_1000C7AA8;
  id v13 = a4;
  id v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [(FRSpotlightManager *)self _removeAllArticleThumbnailsWithCompletion:v12];
}

- (void)_removeAllArticleThumbnailsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() spotlightQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100069928;
  v7[3] = &unk_1000C5988;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_thumbnailURLForHeadline:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007B8B4();
  }
  id v5 = [v4 articleID];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007B7F0();
  }
  id v6 = [(FRSpotlightManager *)self _thumbnailURLForArticleID:v5];

  return v6;
}

- (id)_thumbnailURLForArticleID:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007B978();
  }
  id v4 = [(id)objc_opt_class() _spotlightFolder];
  id v5 = [v4 URLByAppendingPathComponent:v3];

  return v5;
}

- (BOOL)_copyThumbnail:(id)a3 forHeadline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[NSThread isMainThread]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007BDE4();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007BD20();
  }
LABEL_6:
  id v8 = [v6 thumbnailAssetHandle];
  id v9 = [v8 filePath];

  if (![v9 length] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007BC64();
    if (v7) {
      goto LABEL_11;
    }
  }
  else if (v7)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007BBA0();
  }
LABEL_11:
  id v10 = [v7 articleID];
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007BA3C();
    }
    [v9 length];
    goto LABEL_18;
  }
  if (![v9 length])
  {
LABEL_18:
    unsigned __int8 v16 = 0;
    goto LABEL_25;
  }
  id v11 = +[NSURL fileURLWithPath:v9 isDirectory:0];
  id v12 = +[NSFileManager defaultManager];
  id v13 = [(FRSpotlightManager *)self _thumbnailURLForHeadline:v7];
  id v14 = [v13 path];
  unsigned __int8 v15 = [v12 fileExistsAtPath:v14];

  if (v15)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    id v20 = 0;
    unsigned __int8 v16 = [v12 copyItemAtURL:v11 toURL:v13 error:&v20];
    id v17 = v20;
    v18 = v17;
    if ((v16 & 1) == 0 && v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007BB00(v18);
    }
  }
LABEL_25:

  return v16;
}

- (BOOL)_removeThumbnailForArticleID:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007BF64();
  }
  id v5 = [(FRSpotlightManager *)self _thumbnailURLForArticleID:v4];
  id v6 = +[NSFileManager defaultManager];
  id v7 = [v5 path];
  if ([v6 fileExistsAtPath:v7])
  {
    id v12 = 0;
    unsigned __int8 v8 = [v6 removeItemAtURL:v5 error:&v12];
    id v9 = v12;
    id v10 = v9;
    if ((v8 & 1) == 0 && v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007BEA0((uint64_t)v7, v10);
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NUAppEntityAssociator)associator
{
  return self->associator;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (void)setReadingList:(id)a3
{
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (void)setArticleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleController, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);

  objc_storeStrong((id *)&self->associator, 0);
}

@end