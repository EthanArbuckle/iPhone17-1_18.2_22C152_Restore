@interface NMSIncomingResponse
- (IDSMessageContext)context;
- (NSData)data;
- (NSDate)requestSent;
- (NSDictionary)requestPersistentUserInfo;
- (NSString)idsIdentifier;
- (NSString)requestIDSIdentifier;
- (id)description;
- (id)pbResponse;
- (unsigned)messageID;
- (void)setContext:(id)a3;
- (void)setData:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbResponse:(id)a3;
- (void)setRequestIDSIdentifier:(id)a3;
- (void)setRequestPersistentUserInfo:(id)a3;
- (void)setRequestSent:(id)a3;
@end

@implementation NMSIncomingResponse

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p> messageID: %hu", v4, self, self->_messageID];

  return v5;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)requestIDSIdentifier
{
  return self->_requestIDSIdentifier;
}

- (void)setRequestIDSIdentifier:(id)a3
{
}

- (NSDate)requestSent
{
  return self->_requestSent;
}

- (void)setRequestSent:(id)a3
{
}

- (NSDictionary)requestPersistentUserInfo
{
  return self->_requestPersistentUserInfo;
}

- (void)setRequestPersistentUserInfo:(id)a3
{
}

- (IDSMessageContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)pbResponse
{
  return self->_pbResponse;
}

- (void)setPbResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, 0);
  objc_storeStrong((id *)&self->_requestSent, 0);
  objc_storeStrong((id *)&self->_requestIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end