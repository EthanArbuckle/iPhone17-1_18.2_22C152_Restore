@interface CompletionListDismissalAnalyticsReporter
- (BOOL)acceptedCompletionListItem;
- (int64_t)unifiedFieldContentType;
- (void)reportAnalytics;
- (void)setAcceptedCompletionListItem:(BOOL)a3;
- (void)setUnifiedFieldContentType:(int64_t)a3;
@end

@implementation CompletionListDismissalAnalyticsReporter

- (void)reportAnalytics
{
  id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v3 didDismissCompletionListWithItemAccepted:self->_acceptedCompletionListItem goKeyTapped:self->_goKeyTapped unifiedFieldContentType:self->_unifiedFieldContentType];
}

- (void)setUnifiedFieldContentType:(int64_t)a3
{
  self->_unifiedFieldContentType = a3;
  self->_goKeyTapped = 1;
}

- (BOOL)acceptedCompletionListItem
{
  return self->_acceptedCompletionListItem;
}

- (void)setAcceptedCompletionListItem:(BOOL)a3
{
  self->_acceptedCompletionListItem = a3;
}

- (int64_t)unifiedFieldContentType
{
  return self->_unifiedFieldContentType;
}

@end