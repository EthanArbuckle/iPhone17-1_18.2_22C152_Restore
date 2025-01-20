@interface PDAccountWebServiceEndpointMetadata
- (BOOL)isDirty;
- (NSDate)lastUpdated;
- (NSDate)localLastUpdated;
- (NSString)accountIdentifier;
- (PDAccountWebServiceEndpointMetadata)initWithAccountIdentifier:(id)a3 endpoint:(unint64_t)a4;
- (unint64_t)endpoint;
- (void)setAccountIdentifier:(id)a3;
- (void)setEndpoint:(unint64_t)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLocalLastUpdated:(id)a3;
@end

@implementation PDAccountWebServiceEndpointMetadata

- (PDAccountWebServiceEndpointMetadata)initWithAccountIdentifier:(id)a3 endpoint:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountWebServiceEndpointMetadata;
  v8 = [(PDAccountWebServiceEndpointMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_endpoint = a4;
  }

  return v9;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSDate)localLastUpdated
{
  return self->_localLastUpdated;
}

- (void)setLocalLastUpdated:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localLastUpdated, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end