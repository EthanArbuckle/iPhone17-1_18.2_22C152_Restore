@interface SUUIGiftValidationResponse
- (BOOL)isValid;
- (NSString)errorString;
- (NSString)giftKey;
- (NSString)totalGiftAmountString;
- (SUUIGiftValidationResponse)initWithValidationDictionary:(id)a3;
@end

@implementation SUUIGiftValidationResponse

- (SUUIGiftValidationResponse)initWithValidationDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUIGiftValidationResponse;
  v5 = [(SUUIGiftValidationResponse *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"status"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 integerValue];
      v5->_valid = v7 == 0;
      if (!v7)
      {
        v8 = [v4 objectForKey:@"amountFormatted"];
        if (!v8)
        {
          v8 = [v4 objectForKey:@"totalPriceFormatted"];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 copy];
          totalGiftAmountString = v5->_totalGiftAmountString;
          v5->_totalGiftAmountString = (NSString *)v9;
        }
        v11 = [v4 objectForKey:@"giftKey"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_22;
        }
        uint64_t v12 = [v11 copy];
        giftKey = v5->_giftKey;
        v5->_giftKey = (NSString *)v12;
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      v5->_valid = 0;
    }
    v11 = [v4 objectForKey:@"errorEntries"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
    {
      v14 = [v11 objectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [v14 objectForKey:@"localizedMessage"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 copy];
          errorString = v5->_errorString;
          v5->_errorString = (NSString *)v16;
        }
      }
    }
    if (v5->_errorString) {
      goto LABEL_22;
    }
    giftKey = [v4 objectForKey:@"userPresentableErrorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [giftKey copy];
      v19 = v5->_errorString;
      v5->_errorString = (NSString *)v18;
    }
    goto LABEL_21;
  }
LABEL_23:

  return v5;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (NSString)giftKey
{
  return self->_giftKey;
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_giftKey, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end