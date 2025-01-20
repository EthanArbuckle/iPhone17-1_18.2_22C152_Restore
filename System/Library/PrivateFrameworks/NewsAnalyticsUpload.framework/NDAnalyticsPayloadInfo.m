@interface NDAnalyticsPayloadInfo
- (NDAnalyticsPayloadInfo)init;
- (NSArray)entriesToUpload;
- (NSDictionary)droppedEntriesByReason;
- (NSDictionary)valuesByHTTPHeaderField;
- (NSURL)endpointURL;
- (void)setDroppedEntriesByReason:(id)a3;
- (void)setEndpointURL:(id)a3;
- (void)setEntriesToUpload:(id)a3;
- (void)setValuesByHTTPHeaderField:(id)a3;
@end

@implementation NDAnalyticsPayloadInfo

- (NDAnalyticsPayloadInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)NDAnalyticsPayloadInfo;
  return [(NDAnalyticsPayloadInfo *)&v3 init];
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
}

- (NSDictionary)valuesByHTTPHeaderField
{
  return self->_valuesByHTTPHeaderField;
}

- (void)setValuesByHTTPHeaderField:(id)a3
{
}

- (NSArray)entriesToUpload
{
  return self->_entriesToUpload;
}

- (void)setEntriesToUpload:(id)a3
{
}

- (NSDictionary)droppedEntriesByReason
{
  return self->_droppedEntriesByReason;
}

- (void)setDroppedEntriesByReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedEntriesByReason, 0);
  objc_storeStrong((id *)&self->_entriesToUpload, 0);
  objc_storeStrong((id *)&self->_valuesByHTTPHeaderField, 0);

  objc_storeStrong((id *)&self->_endpointURL, 0);
}

@end