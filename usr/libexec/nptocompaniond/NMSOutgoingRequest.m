@interface NMSOutgoingRequest
+ (id)requestWithMessageID:(unsigned __int16)a3;
- (BOOL)doNotCompress;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingRequest)init;
- (NSData)data;
- (NSDictionary)persistentUserInfo;
- (NSString)idsIdentifier;
- (NSString)queueOneIdentifier;
- (double)responseTimeout;
- (double)sendTimeout;
- (id)description;
- (id)pbRequest;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)setData:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setQueueOneIdentifier:(id)a3;
- (void)setResponseTimeout:(double)a3;
- (void)setSendTimeout:(double)a3;
@end

@implementation NMSOutgoingRequest

+ (id)requestWithMessageID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 setMessageID:v3];

  return v4;
}

- (NMSOutgoingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NMSOutgoingRequest;
  result = [(NMSOutgoingRequest *)&v3 init];
  if (result) {
    result->_priority = 0;
  }
  return result;
}

- (void)setPbRequest:(id)a3
{
  objc_storeStrong(&self->_pbRequest, a3);
  id v7 = a3;
  v5 = [self->_pbRequest data];
  data = self->_data;
  self->_data = v5;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p> messageID: %hu", v4, self, self->_messageID];

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
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

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
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

- (NSString)queueOneIdentifier
{
  return self->_queueOneIdentifier;
}

- (void)setQueueOneIdentifier:(id)a3
{
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);

  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end