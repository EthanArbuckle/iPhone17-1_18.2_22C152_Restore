@interface SHClusterLoaderRequest
- (BOOL)shouldDeleteExistingDatabaseAtOutputURL;
- (NSURL)outputURL;
- (NSURL)sourceURL;
- (SHClusterLoaderRequest)initWithType:(int64_t)a3 configuration:(id)a4;
- (SHClusterLoaderRequest)initWithType:(int64_t)a3 sourceURL:(id)a4 outputURL:(id)a5 configuration:(id)a6;
- (int64_t)type;
- (void)sourceURLForRequestForStorefront:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation SHClusterLoaderRequest

- (SHClusterLoaderRequest)initWithType:(int64_t)a3 configuration:(id)a4
{
  return [(SHClusterLoaderRequest *)self initWithType:a3 sourceURL:0 outputURL:0 configuration:a4];
}

- (SHClusterLoaderRequest)initWithType:(int64_t)a3 sourceURL:(id)a4 outputURL:(id)a5 configuration:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHClusterLoaderRequest;
  v12 = [(SHClusterLoaderRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    objc_storeStrong((id *)&v12->_sourceURL, a4);
    objc_storeStrong((id *)&v13->_outputURL, a5);
  }

  return v13;
}

- (BOOL)shouldDeleteExistingDatabaseAtOutputURL
{
  return self->_sourceURL != 0;
}

- (void)sourceURLForRequestForStorefront:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id, void, double))a5;
  id v11 = [(SHClusterLoaderRequest *)self sourceURL];

  if (v11)
  {
    v12 = [(SHClusterLoaderRequest *)self sourceURL];
    v10[2](v10, v12, v8, 0, 3.40282347e38);
  }
  else
  {
    if ([(SHClusterLoaderRequest *)self type] == 1)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke;
      v18[3] = &unk_2647AD3D8;
      id v19 = v9;
      v21 = v10;
      id v20 = v8;
      [v19 tracksClusterEndpointForStorefront:v20 completionHandler:v18];

      id v13 = v19;
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_3;
      v14[3] = &unk_2647AD3D8;
      id v15 = v9;
      v17 = v10;
      id v16 = v8;
      [v15 artistsClusterEndpointWithCompletionHandler:v14];

      id v13 = v15;
    }
  }
}

void __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_2;
  v6[3] = &unk_2647AD3B0;
  id v7 = v3;
  id v9 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 tracksCachedDataMaxAgeWithCompletionHandler:v6];
}

void __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 48);
    v2(v3);
  }
  else
  {
    id v4 = +[SHInsightsError errorWithCode:100 underlyingError:0];
    (*(void (**)(uint64_t, void, void, id, double))(v1 + 16))(v1, 0, 0, v4, -1.0);
  }
}

void __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_4;
  v6[3] = &unk_2647AD3B0;
  id v7 = v3;
  id v9 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 artistsCachedDataMaxAgeWithCompletionHandler:v6];
}

void __84__SHClusterLoaderRequest_sourceURLForRequestForStorefront_configuration_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 48);
    v2(v3);
  }
  else
  {
    id v4 = +[SHInsightsError errorWithCode:100 underlyingError:0];
    (*(void (**)(uint64_t, void, void, id, double))(v1 + 16))(v1, 0, 0, v4, -1.0);
  }
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end