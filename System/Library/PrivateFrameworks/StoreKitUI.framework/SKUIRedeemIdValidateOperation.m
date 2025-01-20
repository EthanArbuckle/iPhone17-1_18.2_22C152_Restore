@interface SKUIRedeemIdValidateOperation
- (NSDictionary)dictionary;
- (SKUIRedeemIdValidateOperation)initWithDictionary:(id)a3;
- (id)_subOperation;
- (id)resultBlock;
- (void)_handleFailure:(id)a3 serverDialogDictionary:(id)a4;
- (void)_logResultsForSuccess:(BOOL)a3 failureReason:(id)a4 failureMessage:(id)a5 error:(id)a6;
- (void)main;
- (void)operation:(id)a3 selectedButton:(id)a4;
- (void)setDictionary:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation SKUIRedeemIdValidateOperation

- (SKUIRedeemIdValidateOperation)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdValidateOperation initWithDictionary:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemIdValidateOperation;
  v6 = [(SKUIRedeemIdValidateOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (void)main
{
  v3 = [(SKUIRedeemIdValidateOperation *)self _subOperation];
  id v16 = 0;
  int v4 = [(SKUIRedeemIdValidateOperation *)self runSubOperation:v3 returningError:&v16];
  unint64_t v5 = (unint64_t)v16;
  if (!v4)
  {
    objc_super v9 = [NSString stringWithFormat:@"Underlying sub-operation for '%@' failed.", @"redeemValidateIdUrl"];
    [(SKUIRedeemIdValidateOperation *)self _logResultsForSuccess:0 failureReason:v9 failureMessage:0 error:v5];
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  v6 = [v3 dataProvider];
  v7 = [v6 output];

  v8 = [v7 objectForKeyedSubscript:@"validNationalId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v8 BOOLValue])
    {
      objc_super v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = 1;
      goto LABEL_12;
    }
    v12 = [v7 objectForKeyedSubscript:@"dialog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v10 = v12;
    }
    else {
      unint64_t v10 = 0;
    }

    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [NSString stringWithFormat:@"Unuccessful operation. We did not have a valid %@ flag in the response.", @"validNationalId"];
    unint64_t v10 = 0;
  }
  uint64_t v11 = 0;
LABEL_12:

  [(SKUIRedeemIdValidateOperation *)self _logResultsForSuccess:v11 failureReason:v9 failureMessage:v10 error:v5];
  if (v11)
  {
    char v13 = 1;
LABEL_17:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SKUIRedeemIdValidateOperation_main__block_invoke;
    block[3] = &unk_1E64260E0;
    block[4] = self;
    char v15 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_18;
  }
LABEL_14:
  char v13 = v5 | v10;
  if (!(v5 | v10))
  {
    unint64_t v10 = 0;
    goto LABEL_17;
  }
  [(SKUIRedeemIdValidateOperation *)self _handleFailure:v5 serverDialogDictionary:v10];
LABEL_18:
}

uint64_t __37__SKUIRedeemIdValidateOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))(*(void *)(*(void *)(a1 + 32) + 336), *(unsigned __int8 *)(a1 + 40));
}

- (void)_handleFailure:(id)a3 serverDialogDictionary:(id)a4
{
  id v8 = a4;
  if (v8)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB8808]) initWithDialogDictionary:v8];
    v7 = [MEMORY[0x1E4FB8810] operationWithDialog:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4FB8810] operationWithError:a3];
  }
  [v7 setDelegate:self];
  [(SKUIRedeemIdValidateOperation *)self runSubOperation:v7 returningError:0];
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SKUIRedeemIdValidateOperation_operation_selectedButton___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__SKUIRedeemIdValidateOperation_operation_selectedButton___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 336) + 16))();
}

- (id)_subOperation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB8858]);
  id v4 = objc_alloc_init(MEMORY[0x1E4FA8268]);
  [v4 setURLBagKey:@"redeemValidateIdUrl"];
  [v4 setITunesStoreRequest:1];
  unint64_t v5 = SSVDefaultUserAgent();
  [v4 setValue:v5 forHTTPHeaderField:@"User-Agent"];

  [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v4 setHTTPMethod:@"POST"];
  v6 = (void *)MEMORY[0x1E4F28D90];
  v7 = [(SKUIRedeemIdValidateOperation *)self dictionary];
  id v8 = [v6 dataWithJSONObject:v7 options:0 error:0];

  [v4 setHTTPBody:v8];
  [v3 setRequestProperties:v4];
  objc_super v9 = [MEMORY[0x1E4FB8850] provider];
  [v3 setDataProvider:v9];

  return v3;
}

- (void)_logResultsForSuccess:(BOOL)a3 failureReason:(id)a4 failureMessage:(id)a5 error:(id)a6
{
  BOOL v8 = a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  char v15 = @"validNationalId";
  v12 = [NSNumber numberWithBool:v8];
  v16[0] = v12;
  char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v14 = (void *)[v13 mutableCopy];

  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"dialog"];
  }
  if (v9) {
    [v14 setObject:v9 forKeyedSubscript:@"failure reason"];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"error"];
  }
  SSDebugLog();
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)initWithDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemIdValidateOperation initWithDictionary:]";
}

@end