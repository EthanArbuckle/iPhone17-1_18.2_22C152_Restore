@interface ICSuzeLeaseSessionConfiguration
- (ICStoreRequestContext)requestContext;
- (ICSuzeLeaseSessionConfiguration)initWithRequestContext:(id)a3 leaseID:(id)a4 mediaType:(int64_t)a5;
- (id)leaseID;
- (int64_t)mediaType;
@end

@implementation ICSuzeLeaseSessionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong(&self->_leaseID, 0);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (id)leaseID
{
  return self->_leaseID;
}

- (ICSuzeLeaseSessionConfiguration)initWithRequestContext:(id)a3 leaseID:(id)a4 mediaType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICSuzeLeaseSessionConfiguration;
  v10 = [(ICSuzeLeaseSessionConfiguration *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    requestContext = v10->_requestContext;
    v10->_requestContext = (ICStoreRequestContext *)v11;

    objc_storeStrong(&v10->_leaseID, a4);
    v10->_mediaType = a5;
  }

  return v10;
}

@end