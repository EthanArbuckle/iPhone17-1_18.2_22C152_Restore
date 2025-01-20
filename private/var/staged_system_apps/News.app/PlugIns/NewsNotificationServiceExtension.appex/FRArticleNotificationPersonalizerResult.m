@interface FRArticleNotificationPersonalizerResult
- (FCFeedPersonalizedItems)items;
- (FCTodayPrivateData)todayData;
- (FRArticleNotificationPersonalizerResult)initWithItems:(id)a3 baselineClickThroughRate:(double)a4 todayData:(id)a5;
- (double)baselineClickThroughRate;
@end

@implementation FRArticleNotificationPersonalizerResult

- (FRArticleNotificationPersonalizerResult)initWithItems:(id)a3 baselineClickThroughRate:(double)a4 todayData:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FRArticleNotificationPersonalizerResult;
  v11 = [(FRArticleNotificationPersonalizerResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    v12->_baselineClickThroughRate = a4;
    objc_storeStrong((id *)&v12->_todayData, a5);
  }

  return v12;
}

- (FCFeedPersonalizedItems)items
{
  return self->_items;
}

- (double)baselineClickThroughRate
{
  return self->_baselineClickThroughRate;
}

- (FCTodayPrivateData)todayData
{
  return self->_todayData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayData, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end