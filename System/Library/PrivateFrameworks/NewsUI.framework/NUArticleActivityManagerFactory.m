@interface NUArticleActivityManagerFactory
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCSubscriptionList)subscriptionList;
- (NUArticleActivityManagerFactory)initWithReadingHistory:(id)a3 readingList:(id)a4 subscriptionList:(id)a5 URLHandler:(id)a6 optionsProvider:(id)a7;
- (NUArticleActivityOptionsProvider)optionsProvider;
- (NUURLHandling)URLHandler;
- (id)activityProviderForHeadline:(id)a3 reportConcernViewPresenter:(id)a4 URLModifier:(id)a5;
@end

@implementation NUArticleActivityManagerFactory

- (NUArticleActivityManagerFactory)initWithReadingHistory:(id)a3 readingList:(id)a4 subscriptionList:(id)a5 URLHandler:(id)a6 optionsProvider:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NUArticleActivityManagerFactory;
  v17 = [(NUArticleActivityManagerFactory *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_readingHistory, a3);
    objc_storeStrong((id *)&v18->_readingList, a4);
    objc_storeStrong((id *)&v18->_subscriptionList, a5);
    objc_storeStrong((id *)&v18->_URLHandler, a6);
    objc_storeStrong((id *)&v18->_optionsProvider, a7);
  }

  return v18;
}

- (id)activityProviderForHeadline:(id)a3 reportConcernViewPresenter:(id)a4 URLModifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [NUArticleActivityManager alloc];
  v12 = [(NUArticleActivityManagerFactory *)self readingHistory];
  id v13 = [(NUArticleActivityManagerFactory *)self readingList];
  id v14 = [(NUArticleActivityManagerFactory *)self subscriptionList];
  id v15 = [(NUArticleActivityManagerFactory *)self URLHandler];
  id v16 = [(NUArticleActivityManagerFactory *)self optionsProvider];
  v17 = [(NUArticleActivityManager *)v11 initWithHeadline:v10 readingHistory:v12 readingList:v13 subscriptionList:v14 URLHandler:v15 reportConcernViewPresenter:v9 URLModifier:v8 optionsProvider:v16];

  return v17;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCSubscriptionList)subscriptionList
{
  return self->_subscriptionList;
}

- (NUURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (NUArticleActivityOptionsProvider)optionsProvider
{
  return self->_optionsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);

  objc_storeStrong((id *)&self->_readingHistory, 0);
}

@end