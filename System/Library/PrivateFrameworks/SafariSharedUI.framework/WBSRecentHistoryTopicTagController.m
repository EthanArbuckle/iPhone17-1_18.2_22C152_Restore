@interface WBSRecentHistoryTopicTagController
- (WBSRecentHistoryTopicTagController)initWithHistory:(id)a3;
- (double)timeIntervalBeforeNowForFetchingTags;
- (unint64_t)maximumNumberOfTopics;
- (void)loadTopicsWithCompletionHandler:(id)a3;
- (void)setMaximumNumberOfTopics:(unint64_t)a3;
- (void)setTimeIntervalBeforeNowForFetchingTags:(double)a3;
@end

@implementation WBSRecentHistoryTopicTagController

- (WBSRecentHistoryTopicTagController)initWithHistory:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRecentHistoryTopicTagController;
  v6 = [(WBSRecentHistoryTopicTagController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    v7->_timeIntervalBeforeNowForFetchingTags = 604800.0;
    v8 = v7;
  }

  return v7;
}

- (void)loadTopicsWithCompletionHandler:(id)a3
{
  history = self->_history;
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  double v6 = -self->_timeIntervalBeforeNowForFetchingTags;
  id v7 = a3;
  id v9 = [v5 dateWithTimeIntervalSinceNow:v6];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSHistory *)history fetchTopicsFromStartDate:v9 toEndDate:v8 limit:self->_maximumNumberOfTopics minimumItemCount:1 sortOrder:2 completionHandler:v7];
}

- (unint64_t)maximumNumberOfTopics
{
  return self->_maximumNumberOfTopics;
}

- (void)setMaximumNumberOfTopics:(unint64_t)a3
{
  self->_maximumNumberOfTopics = a3;
}

- (double)timeIntervalBeforeNowForFetchingTags
{
  return self->_timeIntervalBeforeNowForFetchingTags;
}

- (void)setTimeIntervalBeforeNowForFetchingTags:(double)a3
{
  self->_timeIntervalBeforeNowForFetchingTags = a3;
}

- (void).cxx_destruct
{
}

@end