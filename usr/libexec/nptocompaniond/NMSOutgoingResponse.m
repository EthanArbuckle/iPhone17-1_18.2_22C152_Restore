@interface NMSOutgoingResponse
- (BOOL)doNotCompress;
- (BOOL)isSent;
- (NMSIncomingRequest)request;
- (NMSOutgoingResponse)init;
- (NSData)data;
- (NSDictionary)persistentUserInfo;
- (NSString)idsIdentifier;
- (double)sendTimeout;
- (id)description;
- (id)pbResponse;
- (unint64_t)priority;
- (void)send;
- (void)setData:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setPbResponse:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setSendTimeout:(double)a3;
- (void)setSent:(BOOL)a3;
@end

@implementation NMSOutgoingResponse

- (NMSOutgoingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSOutgoingResponse;
  v2 = [(NMSOutgoingResponse *)&v6 init];
  if (v2)
  {
    v3 = [[NPTOTransaction alloc] initWithDescription:@"com.apple.NanoPhotos.NanoMessagingService.NMSOutgoingResponse"];
    transaction = v2->_transaction;
    v2->_transaction = v3;
  }
  return v2;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p> messageID: %hu", v4, self, [WeakRetained messageID]);

  return v6;
}

- (void)send
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  id v7 = [WeakRetained messageCenter];

  id pbResponse = self->_pbResponse;
  if (pbResponse)
  {
    v5 = [pbResponse data];
    data = self->_data;
    self->_data = v5;
  }
  [v7 _sendResponse:self];
}

- (void)setPbResponse:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  v5 = [WeakRetained messageCenter];
  objc_super v6 = [v5 _pbMappingForMessageID:[WeakRetained messageID]];
  id pbResponse = self->_pbResponse;
  self->_id pbResponse = v4;
}

- (NMSIncomingRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);

  return (NMSIncomingRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (BOOL)doNotCompress
{
  return self->_doNotCompress;
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (BOOL)isSent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (id)pbResponse
{
  return self->_pbResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_request);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end