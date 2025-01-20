@interface MFIMAPMessageWithCache
- (BOOL)isMessageContentsLocallyAvailable;
- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (ECMessageHeaders)headers;
- (EDMessageCategorizationResult)categorizationResult;
- (id)headerData;
- (id)messageData;
- (int64_t)authenticationState;
- (void)setAuthenticationState:(int64_t)a3;
- (void)setCategorizationResult:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setMessageData:(id)a3 isPartial:(BOOL)a4;
@end

@implementation MFIMAPMessageWithCache

- (id)messageData
{
  if ([(MFIMAPMessage *)self isPartial]) {
    v3 = 0;
  }
  else {
    v3 = self->_messageData;
  }
  if ([(MFIMAPMessage *)self isPartial])
  {
    v6.receiver = self;
    v6.super_class = (Class)MFIMAPMessageWithCache;
    uint64_t v4 = [(MFIMAPMessageWithCache *)&v6 messageData];

    v3 = (NSData *)v4;
  }
  return v3;
}

- (void)setMessageData:(id)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (NSData *)a3;
  v8 = v7;
  if (self->_messageData != v7)
  {
    if (v7)
    {
      uint64_t v10 = [(NSData *)v7 mf_rangeOfRFC822HeaderData];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = -[NSData mf_subdataWithRange:](v8, "mf_subdataWithRange:", v10, v9);
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F73508]), "initWithHeaderData:encoding:", v11, -[MFIMAPMessageWithCache preferredEncoding](self, "preferredEncoding"));
        if (v12) {
          [(MFIMAPMessageWithCache *)self setHeaders:v12];
        }
      }
    }
    objc_storeStrong((id *)&self->_messageData, a3);
    v13.receiver = self;
    v13.super_class = (Class)MFIMAPMessageWithCache;
    [(MFIMAPMessage *)&v13 setIsPartial:v4];
  }
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  messageData = self->_messageData;
  if (messageData)
  {
    if (a4) {
      *a4 = [(NSData *)messageData length];
    }
    if (a5) {
      *a5 = 1;
    }
    if (a3)
    {
      id v10 = [MEMORY[0x1E4F734C8] dataHolderWithData:self->_messageData];
      BOOL result = 0;
      *a3 = v10;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFIMAPMessageWithCache;
    return [(MFIMAPMessageWithCache *)&v12 messageDataHolder:a3 messageSize:a4 isComplete:a5 downloadIfNecessary:a6];
  }
  return result;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  if (self->_messageData) {
    return ![(MFIMAPMessage *)self isPartial];
  }
  else {
    return 0;
  }
}

- (ECMessageHeaders)headers
{
  return (ECMessageHeaders *)self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (id)headerData
{
  v3 = [(MFIMAPMessageWithCache *)self messageData];
  v5 = v3;
  if (!v3
    || (uint64_t v4 = objc_msgSend(v3, "mf_rangeOfRFC822HeaderData"), v4 == 0x7FFFFFFFFFFFFFFFLL)
    || (objc_msgSend(v5, "mf_subdataWithRange:", v4, v6), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)MFIMAPMessageWithCache;
    v7 = [(MFIMAPMessageWithCache *)&v9 headerData];
  }

  return v7;
}

- (EDMessageCategorizationResult)categorizationResult
{
  return self->_categorizationResult;
}

- (void)setCategorizationResult:(id)a3
{
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorizationResult, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end