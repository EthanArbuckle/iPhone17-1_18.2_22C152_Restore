@interface SKUICompletionDataConsumer
- (id)_invalidResponseError;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SKUICompletionDataConsumer

- (id)_invalidResponseError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA8680] code:111 userInfo:0];
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICompletionDataConsumer objectForData:response:error:]();
  }
  if ([v9 statusCode] != 200)
  {
    if (a5)
    {
      [(SKUICompletionDataConsumer *)self _invalidResponseError];
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  if (!v8)
  {
LABEL_13:
    v13 = 0;
    goto LABEL_21;
  }
  id v16 = 0;
  v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (!v10 || v11)
  {
    if (a5)
    {
      id v14 = v11;
LABEL_18:
      v13 = 0;
      *a5 = v14;
      goto LABEL_20;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      id v14 = [(SKUICompletionDataConsumer *)self _invalidResponseError];
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = [[SKUICompletionList alloc] initWithCompletionListDictionary:v10];
LABEL_20:

LABEL_21:

  return v13;
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICompletionDataConsumer objectForData:response:error:]";
}

@end