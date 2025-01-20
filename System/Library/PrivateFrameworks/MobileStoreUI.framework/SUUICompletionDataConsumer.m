@interface SUUICompletionDataConsumer
- (id)_invalidResponseError;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUICompletionDataConsumer

- (id)_invalidResponseError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:111 userInfo:0];
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 statusCode] != 200)
  {
    if (a5)
    {
      [(SUUICompletionDataConsumer *)self _invalidResponseError];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_19;
  }
  id v16 = 0;
  v9 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:&v16];
  id v10 = v16;
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    if (a5)
    {
      id v13 = v10;
LABEL_16:
      v14 = 0;
      *a5 = v13;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      id v13 = [(SUUICompletionDataConsumer *)self _invalidResponseError];
      goto LABEL_16;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v14 = [[SUUICompletionList alloc] initWithCompletionListDictionary:v9];
LABEL_18:

LABEL_19:
  return v14;
}

@end