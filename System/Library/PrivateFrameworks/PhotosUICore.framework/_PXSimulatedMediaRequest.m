@interface _PXSimulatedMediaRequest
+ (id)defaultSimulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4;
- (_PXSimulatedMediaRequest)init;
- (_PXSimulatedMediaRequest)initWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4;
- (_PXSimulatedMediaRequest)initWithWrappedMediaRequest:(id)a3;
- (_RequestOptions)simulatedOptions;
- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6;
- (void)handleOriginalResult:(id)a3 info:(id)a4;
@end

@implementation _PXSimulatedMediaRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedOptions, 0);
  objc_storeStrong(&self->_simulatedResultHandler, 0);
  objc_storeStrong(&self->_originalProgressHandler, 0);
}

- (_RequestOptions)simulatedOptions
{
  return self->_simulatedOptions;
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
}

- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6
{
  originalProgressHandler = (void (**)(id, id, BOOL *, id, double))self->_originalProgressHandler;
  if (originalProgressHandler) {
    originalProgressHandler[2](originalProgressHandler, a4, a5, a6, a3);
  }
}

- (_PXSimulatedMediaRequest)initWithWrappedMediaRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 simulatedOptions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56___PXSimulatedMediaRequest_initWithWrappedMediaRequest___block_invoke;
  v9[3] = &unk_1E5DC9E40;
  id v10 = v4;
  id v6 = v4;
  v7 = [(_PXSimulatedMediaRequest *)self initWithOriginalOptions:v5 simulatedResultHandler:v9];

  return v7;
}

- (_PXSimulatedMediaRequest)initWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_PXSimulatedMediaRequest;
  v8 = [(_PXSimulatedMediaRequest *)&v23 init];
  if (v8)
  {
    v9 = [v6 progressHandler];
    uint64_t v10 = [v9 copy];
    id originalProgressHandler = v8->_originalProgressHandler;
    v8->_id originalProgressHandler = (id)v10;

    uint64_t v12 = [v6 copyWithZone:0];
    simulatedOptions = v8->_simulatedOptions;
    v8->_simulatedOptions = (_RequestOptions *)v12;

    objc_initWeak(&location, v8);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __75___PXSimulatedMediaRequest_initWithOriginalOptions_simulatedResultHandler___block_invoke;
    v20 = &unk_1E5DD1230;
    objc_copyWeak(&v21, &location);
    [(_RequestOptions *)v8->_simulatedOptions setProgressHandler:&v17];
    uint64_t v14 = objc_msgSend(v7, "copy", v17, v18, v19, v20);
    id simulatedResultHandler = v8->_simulatedResultHandler;
    v8->_id simulatedResultHandler = (id)v14;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (_PXSimulatedMediaRequest)init
{
  return [(_PXSimulatedMediaRequest *)self initWithOriginalOptions:0 simulatedResultHandler:&__block_literal_global_242961];
}

+ (id)defaultSimulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PXMediaProviderSettings sharedInstance];
  v8 = [[_PXSimulatedMediaRequest alloc] initWithOriginalOptions:v6 simulatedResultHandler:v5];

  [v7 simulatedDelay];
  if (v9 > 0.0)
  {
    uint64_t v10 = [_PXSimulatedDelayedMediaRequest alloc];
    [v7 simulatedDelay];
    uint64_t v11 = -[_PXSimulatedDelayedMediaRequest initWithWrappedMediaRequest:delay:](v10, "initWithWrappedMediaRequest:delay:", v8);

    v8 = (_PXSimulatedMediaRequest *)v11;
  }
  if ([v7 simulateError])
  {
    uint64_t v12 = [_PXSimulatedFailingMediaRequest alloc];
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXSimulatedUIMediaProvider" code:1 userInfo:0];
    uint64_t v14 = [(_PXSimulatedFailingMediaRequest *)v12 initWithWrappedMediaRequest:v8 error:v13];

    v8 = (_PXSimulatedMediaRequest *)v14;
  }

  return v8;
}

@end