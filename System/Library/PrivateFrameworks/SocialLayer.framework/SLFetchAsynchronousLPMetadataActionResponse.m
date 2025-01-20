@interface SLFetchAsynchronousLPMetadataActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)responseWithMetadata:(id)a3;
- (LPLinkMetadata)metadata;
- (SLFetchAsynchronousLPMetadataActionResponse)initWithBSXPCCoder:(id)a3;
- (SLFetchAsynchronousLPMetadataActionResponse)initWithCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SLFetchAsynchronousLPMetadataActionResponse

+ (id)responseWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = [a1 response];
  [v5 setMetadata:v4];

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchAsynchronousLPMetadataActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_metadata);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v8;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchAsynchronousLPMetadataActionResponse *)self metadata];
  uint64_t v6 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v5 forKey:v6];

  v7.receiver = self;
  v7.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  [(SLShareableContentActionResponse *)&v7 encodeWithBSXPCCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchAsynchronousLPMetadataActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_metadata);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchAsynchronousLPMetadataActionResponse *)self metadata];
  uint64_t v6 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v5 forKey:v6];

  v7.receiver = self;
  v7.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  [(SLShareableContentActionResponse *)&v7 encodeWithCoder:v4];
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end