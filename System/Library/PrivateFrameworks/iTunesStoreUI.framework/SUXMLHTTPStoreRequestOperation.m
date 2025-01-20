@interface SUXMLHTTPStoreRequestOperation
- (ISDataProvider)dataProvider;
- (SSAuthenticationContext)authenticationContext;
- (SUXMLHTTPStoreRequestOperation)initWithRequestProperties:(id)a3;
- (id)outputBlock;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUXMLHTTPStoreRequestOperation

- (SUXMLHTTPStoreRequestOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUXMLHTTPStoreRequestOperation;
  v5 = [(SUXMLHTTPStoreRequestOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = (SSURLRequestProperties *)v6;
  }
  return v5;
}

- (id)outputBlock
{
  [(SUXMLHTTPStoreRequestOperation *)self lock];
  v3 = (void *)[self->_outputBlock copy];
  [(SUXMLHTTPStoreRequestOperation *)self unlock];
  id v4 = (void *)MEMORY[0x22A680AE0](v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(SUXMLHTTPStoreRequestOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(SUXMLHTTPStoreRequestOperation *)self unlock];
}

- (void)run
{
  v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v15 = 0;
  id v4 = [(SUXMLHTTPStoreRequestOperation *)self loadedURLBagWithContext:v3 returningError:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F89528]);
    [v6 setRequestProperties:self->_requestProperties];
    [v6 setAuthenticationContext:self->_authenticationContext];
    [v6 setDataProvider:self->_dataProvider];
    id v14 = v5;
    uint64_t v7 = [(SUXMLHTTPStoreRequestOperation *)self runSubOperation:v6 returningError:&v14];
    id v8 = v14;

    objc_super v9 = [v6 dataProvider];
    v10 = [v9 output];

    v11 = [v6 response];

    id v5 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    v11 = 0;
    v10 = 0;
  }
  uint64_t v12 = [(SUXMLHTTPStoreRequestOperation *)self outputBlock];
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v12 + 16))(v12, v7, v5, v11, v10);
    [(SUXMLHTTPStoreRequestOperation *)self setOutputBlock:0];
  }
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (ISDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);

  objc_storeStrong(&self->_outputBlock, 0);
}

@end