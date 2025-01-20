@interface SLFetchShareableContentMetadataActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)responseWithMetadata:(id)a3 initiatorRequest:(id)a4;
- (SLFetchShareableContentMetadataActionResponse)initWithBSXPCCoder:(id)a3;
- (SLFetchShareableContentMetadataActionResponse)initWithCoder:(id)a3;
- (SLShareableContentInitiatorRequest)initiatorRequest;
- (SLShareableContentMetadata)metadata;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInitiatorRequest:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SLFetchShareableContentMetadataActionResponse

+ (id)responseWithMetadata:(id)a3 initiatorRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 response];
  [v8 setMetadata:v7];

  [v8 setInitiatorRequest:v6];
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchShareableContentMetadataActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v15 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_metadata);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    metadata = v5->_metadata;
    v5->_metadata = (SLShareableContentMetadata *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_initiatorRequest);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    initiatorRequest = v5->_initiatorRequest;
    v5->_initiatorRequest = (SLShareableContentInitiatorRequest *)v12;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchShareableContentMetadataActionResponse *)self metadata];
  uint64_t v6 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(SLFetchShareableContentMetadataActionResponse *)self initiatorRequest];
  uint64_t v8 = NSStringFromSelector(sel_initiatorRequest);
  [v4 encodeObject:v7 forKey:v8];

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  [(SLShareableContentActionResponse *)&v9 encodeWithBSXPCCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentMetadataActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_metadata);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    metadata = v5->_metadata;
    v5->_metadata = (SLShareableContentMetadata *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_initiatorRequest);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    initiatorRequest = v5->_initiatorRequest;
    v5->_initiatorRequest = (SLShareableContentInitiatorRequest *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchShareableContentMetadataActionResponse *)self metadata];
  uint64_t v6 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(SLFetchShareableContentMetadataActionResponse *)self initiatorRequest];
  uint64_t v8 = NSStringFromSelector(sel_initiatorRequest);
  [v4 encodeObject:v7 forKey:v8];

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  [(SLShareableContentActionResponse *)&v9 encodeWithCoder:v4];
}

- (SLShareableContentMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SLShareableContentInitiatorRequest)initiatorRequest
{
  return self->_initiatorRequest;
}

- (void)setInitiatorRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorRequest, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end