@interface SUUIGiftValidator
- (BOOL)isValidating;
- (NSOperationQueue)operationQueue;
- (SUUIGiftValidator)initWithValidationURL:(id)a3 clientContext:(id)a4;
- (void)_finishValidationWithResponse:(id)a3 error:(id)a4 attemptNumber:(int64_t)a5 block:(id)a6;
- (void)_validateWithBodyDictionary:(id)a3 completionBlock:(id)a4;
- (void)cancelValidation;
- (void)setOperationQueue:(id)a3;
- (void)validateDonation:(id)a3 withCompletionBlock:(id)a4;
- (void)validateGift:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation SUUIGiftValidator

- (SUUIGiftValidator)initWithValidationURL:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIGiftValidator;
  v8 = [(SUUIGiftValidator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    uint64_t v10 = [v6 copy];
    validationURL = v9->_validationURL;
    v9->_validationURL = (NSURL *)v10;
  }
  return v9;
}

- (void)cancelValidation
{
  [(SSVLoadURLOperation *)self->_validationOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_validationOperation cancel];
  validationOperation = self->_validationOperation;
  self->_validationOperation = 0;
}

- (BOOL)isValidating
{
  return self->_validationOperation != 0;
}

- (void)validateDonation:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 HTTPBodyDictionary];
  [(SUUIGiftValidator *)self _validateWithBodyDictionary:v7 completionBlock:v6];
}

- (void)validateGift:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 HTTPBodyDictionary];
  [(SUUIGiftValidator *)self _validateWithBodyDictionary:v7 completionBlock:v6];
}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4 attemptNumber:(int64_t)a5 block:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  v11 = (void (**)(id, SUUIGiftValidationResponse *, id))a6;
  if (self->_validationCount == a5)
  {
    [(SSVLoadURLOperation *)self->_validationOperation setOutputBlock:0];
    validationOperation = self->_validationOperation;
    self->_validationOperation = 0;

    if (v11)
    {
      objc_super v13 = [[SUUIGiftValidationResponse alloc] initWithValidationDictionary:v14];
      v11[2](v11, v13, v10);
    }
  }
}

- (void)_validateWithBodyDictionary:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SUUIGiftValidator *)self cancelValidation];
  id v24 = 0;
  v8 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v24];
  id v9 = v24;
  if (v8)
  {
    id v10 = (void *)(self->_validationCount + 1);
    self->_validationCount = (int64_t)v10;
    v11 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:self->_validationURL];
    [v11 setHTTPBody:v8];
    [v11 setHTTPMethod:@"POST"];
    [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v12 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURLRequest:v11];
    validationOperation = self->_validationOperation;
    self->_validationOperation = v12;

    id v14 = self->_validationOperation;
    v15 = +[SSVURLDataConsumer consumer];
    [(SSVLoadURLOperation *)v14 setDataConsumer:v15];

    v16 = self->_validationOperation;
    v17 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
    [(SSVLoadURLOperation *)v16 setStoreFrontSuffix:v17];

    objc_initWeak(&location, self);
    v18 = self->_validationOperation;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke;
    v20[3] = &unk_265408B60;
    objc_copyWeak(v22, &location);
    v22[1] = v10;
    id v21 = v7;
    [(SSVLoadURLOperation *)v18 setOutputBlock:v20];
    v19 = [(SUUIGiftValidator *)self operationQueue];
    [v19 addOperation:self->_validationOperation];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

void __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke_2;
  block[3] = &unk_265402948;
  objc_copyWeak(v13, a1 + 5);
  id v10 = v5;
  id v11 = v6;
  v13[1] = a1[6];
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v13);
}

void __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishValidationWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40) attemptNumber:*(void *)(a1 + 64) block:*(void *)(a1 + 48)];
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationURL, 0);
  objc_storeStrong((id *)&self->_validationOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end