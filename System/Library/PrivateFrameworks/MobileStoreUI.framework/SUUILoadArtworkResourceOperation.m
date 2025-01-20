@interface SUUILoadArtworkResourceOperation
- (SSVLoadURLOperation)underlyingOperation;
- (SUUILoadArtworkResourceOperation)initWithResourceRequest:(id)a3;
- (void)cancel;
- (void)main;
- (void)setUnderlyingOperation:(id)a3;
@end

@implementation SUUILoadArtworkResourceOperation

- (SUUILoadArtworkResourceOperation)initWithResourceRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadArtworkResourceOperation;
  return [(SUUILoadResourceOperation *)&v4 initWithResourceRequest:a3];
}

- (void)main
{
  v3 = [(SUUILoadResourceOperation *)self resourceRequest];
  objc_super v4 = [v3 imageName];
  v5 = [v3 URL];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F7B3A0]);
    v7 = [v3 URL];
    v8 = (void *)[v6 initWithURL:v7];

    v9 = [v3 dataConsumer];
    [v8 setDataConsumer:v9];

    [v8 setITunesStoreRequest:0];
    [v8 setRecordsMetrics:0];
    v10 = [(SUUILoadResourceOperation *)self outputBlock];
    [v8 setOutputBlock:v10];

    [(SUUILoadArtworkResourceOperation *)self setUnderlyingOperation:v8];
    [v8 main];
  }
  else if (v4)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__61;
    v30 = __Block_byref_object_dispose__61;
    id v31 = 0;
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v11 = (void *)MEMORY[0x263F827E8];
      v12 = SUUIBundle();
      uint64_t v13 = [v11 imageNamed:v4 inBundle:v12];
      v14 = (void *)v27[5];
      v27[5] = v13;
    }
    else
    {
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __40__SUUILoadArtworkResourceOperation_main__block_invoke;
      v23 = &unk_2654008E0;
      v25 = &v26;
      id v24 = v4;
      dispatch_sync(MEMORY[0x263EF83A0], &v20);
      v12 = v24;
    }

    if (([(SUUILoadArtworkResourceOperation *)self isCancelled] & 1) == 0)
    {
      v15 = [v3 dataConsumer];
      v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 imageForImage:v27[5]];
        v18 = (void *)v27[5];
        v27[5] = v17;
      }
      v19 = [(SUUILoadResourceOperation *)self outputBlock];
      if (v19 && ([(SUUILoadArtworkResourceOperation *)self isCancelled] & 1) == 0) {
        v19[2](v19, v27[5], 0);
      }
    }
    _Block_object_dispose(&v26, 8);
  }
}

void __40__SUUILoadArtworkResourceOperation_main__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = *(void *)(a1 + 32);
  SUUIBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 imageNamed:v3 inBundle:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadArtworkResourceOperation;
  [(SUUILoadResourceOperation *)&v4 cancel];
  uint64_t v3 = [(SUUILoadArtworkResourceOperation *)self underlyingOperation];
  [v3 cancel];
}

- (SSVLoadURLOperation)underlyingOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingOperation);
  return (SSVLoadURLOperation *)WeakRetained;
}

- (void)setUnderlyingOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end