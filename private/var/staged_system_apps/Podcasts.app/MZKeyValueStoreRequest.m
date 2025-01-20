@interface MZKeyValueStoreRequest
- (BOOL)shouldAuthenticate;
- (MZKeyValueStoreOperationDelegate)delegate;
- (MZKeyValueStoreRequest)initWithTransaction:(id)a3;
- (MZKeyValueStoreSerializer)serializer;
- (MZKeyValueStoreTransaction)transaction;
- (NSString)DSID;
- (NSString)domain;
- (void)postData:(id)a3;
- (void)scheduleStoreURLRequest:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)start;
@end

@implementation MZKeyValueStoreRequest

- (MZKeyValueStoreRequest)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MZKeyValueStoreRequest;
  v6 = [(MZKeyValueStoreRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

- (void)start
{
  v3 = [(MZKeyValueStoreRequest *)self serializer];
  id v4 = [v3 payload];

  [(MZKeyValueStoreRequest *)self postData:v4];
}

- (void)postData:(id)a3
{
  id v10 = a3;
  if ([v10 length])
  {
    id v4 = objc_alloc((Class)NSMutableURLRequest);
    id v5 = [(MZKeyValueStoreRequest *)self transaction];
    v6 = [v5 URL];
    id v7 = [v4 initWithURL:v6];

    [v7 setHTTPBody:v10];
    [v7 setHTTPMethod:@"POST"];
    [v7 setValue:kMZKeyValueStorePlistContentType forHTTPHeaderField:@"Content-Type"];
    if ([(MZKeyValueStoreRequest *)self shouldAuthenticate])
    {
      v8 = +[MTAccountController sharedInstance];
      [v8 promptAccountAuthenticationWithDebugReason:@"Podcasts Bookkeeper Sync" forced:0];

      objc_super v9 = [(MZKeyValueStoreRequest *)self delegate];
      [v9 keyValueStoreOperationOperationDidFinish:self];
    }
    else
    {
      [(MZKeyValueStoreRequest *)self scheduleStoreURLRequest:v7];
    }
  }
  else
  {
    id v7 = [(MZKeyValueStoreRequest *)self delegate];
    [v7 keyValueStoreOperationOperationDidFinish:self];
  }
}

- (void)scheduleStoreURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MZKeyValueStoreRequest *)self delegate];
  [v5 keyValueStoreOperation:self scheduleURLRequest:v4];
}

- (MZKeyValueStoreSerializer)serializer
{
  if (!self->_serializer)
  {
    v3 = [(MZKeyValueStoreRequest *)self transaction];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      id v5 = MTApnsSerializer;
    }
    else {
      id v5 = MZKeyValueStoreSerializer;
    }
    id v6 = [v5 alloc];
    id v7 = [(MZKeyValueStoreRequest *)self transaction];
    v8 = (MZKeyValueStoreSerializer *)[v6 initWithTransaction:v7];
    serializer = self->_serializer;
    self->_serializer = v8;
  }
  id v10 = self->_serializer;

  return v10;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (MZKeyValueStoreOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MZKeyValueStoreOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end