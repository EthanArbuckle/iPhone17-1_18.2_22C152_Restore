@interface NMSIncomingRequest
- (BOOL)expectsResponse;
- (IDSMessageContext)context;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingResponse)response;
- (NSData)data;
- (NSString)idsIdentifier;
- (id)description;
- (id)pbRequest;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)configureResponse;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setData:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setResponse:(id)a3;
@end

@implementation NMSIncomingRequest

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p> messageID: %hu", v4, self, self->_messageID];

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NMSIncomingRequest;
  [(NMSIncomingRequest *)&v2 dealloc];
}

- (void)configureResponse
{
  v3 = objc_alloc_init(NMSOutgoingResponse);
  [(NMSOutgoingResponse *)v3 setPriority:self->_priority];
  [(NMSOutgoingResponse *)v3 setRequest:self];
  response = self->_response;
  self->_response = v3;
}

- (id)pbRequest
{
  id pbRequest = self->_pbRequest;
  if (!pbRequest)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    v5 = [WeakRetained _pbMappingForMessageID:self->_messageID];

    id v6 = [objc_alloc((Class)[v5 requestClass]) initWithData:self->_data];
    id v7 = self->_pbRequest;
    self->_id pbRequest = v6;

    id pbRequest = self->_pbRequest;
  }

  return pbRequest;
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);

  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
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

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NMSOutgoingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (IDSMessageContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void)setPbRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);

  objc_destroyWeak((id *)&self->_messageCenter);
}

@end