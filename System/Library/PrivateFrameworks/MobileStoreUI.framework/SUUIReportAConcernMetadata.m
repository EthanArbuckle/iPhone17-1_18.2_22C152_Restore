@interface SUUIReportAConcernMetadata
- (NSString)details;
- (NSURL)reportConcernURL;
- (SUUIReportAConcernReason)selectedReason;
- (int64_t)itemIdentifier;
- (void)setDetails:(id)a3;
- (void)setItemIdentifier:(int64_t)a3;
- (void)setReportConcernURL:(id)a3;
- (void)setSelectedReason:(id)a3;
@end

@implementation SUUIReportAConcernMetadata

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (void)setReportConcernURL:(id)a3
{
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (SUUIReportAConcernReason)selectedReason
{
  return self->_selectedReason;
}

- (void)setSelectedReason:(id)a3
{
}

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

@end