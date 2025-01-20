@interface SUUIItemOffer
- (BOOL)shouldEnableMessagesExtension;
- (NSDictionary)lookupDictionary;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)actionParameters;
- (NSString)buttonText;
- (NSString)confirmationText;
- (NSString)fileSizeText;
- (NSString)variantIdentifier;
- (SUUIItemOffer)initWithButtonText:(id)a3;
- (SUUIItemOffer)initWithCacheRepresentation:(id)a3;
- (SUUIItemOffer)initWithLookupDictionary:(id)a3;
- (SUUIItemOffer)initWithOfferDictionary:(id)a3;
- (SUUIItemOffer)initWithRedownloadToken:(id)a3;
- (float)price;
- (int64_t)fileSize;
- (int64_t)offerType;
- (void)_addActionParameterWithName:(id)a3 value:(id)a4;
- (void)_setFileSizeWithAssets:(id)a3;
- (void)_setFileSizeWithDeviceSizes:(id)a3;
- (void)_setFileSizeWithFlavors:(id)a3;
@end

@implementation SUUIItemOffer

- (SUUIItemOffer)initWithButtonText:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIItemOffer;
  v5 = [(SUUIItemOffer *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)v6;

    confirmationText = v5->_confirmationText;
    v5->_confirmationText = (NSString *)&stru_2704F8130;
  }
  return v5;
}

- (SUUIItemOffer)initWithLookupDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUIItemOffer;
  v5 = [(SUUIItemOffer *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"buyParams"];
    if (!v6)
    {
      uint64_t v6 = [v4 objectForKey:@"action-params"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_actionParameters, v6);
    }
    v7 = [v4 objectForKey:@"actionText"];
    objc_opt_class();
    v30 = v7;
    if (objc_opt_isKindOfClass())
    {
      v8 = [v7 objectForKey:@"medium"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v8 uppercaseString];
      }
      else
      {
        v9 = 0;
      }
      uint64_t v6 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_super v10 = [v4 objectForKey:@"priceFormatted"];

    if (!v10)
    {
      objc_super v10 = [v4 objectForKey:@"button_text"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    v12 = [v4 objectForKey:@"price"];
    if (objc_opt_respondsToSelector())
    {
      [v12 floatValue];
      v5->_float price = price;
    }
    else
    {
      float price = v5->_price;
    }
    v28 = v9;
    if (price == 0.0)
    {
      if (v9) {
        v14 = v9;
      }
      else {
        v14 = v11;
      }
      uint64_t v15 = objc_msgSend(v14, "copy", v9, v30);
      buttonText = v5->_buttonText;
      v5->_buttonText = (NSString *)v15;
    }
    else
    {
      objc_storeStrong((id *)&v5->_buttonText, v11);
      v17 = v9;
      buttonText = v5->_confirmationText;
      v5->_confirmationText = v17;
    }

    v18 = [v4 objectForKey:@"assets"];
    v19 = [v4 objectForKey:@"assetFlavors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUUIItemOffer *)v5 _setFileSizeWithAssets:v18];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SUUIItemOffer *)v5 _setFileSizeWithFlavors:v19];
      }
    }
    v20 = objc_msgSend(v4, "objectForKey:", @"type", v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [v20 copy];
      offerTypeString = v5->_offerTypeString;
      v5->_offerTypeString = (NSString *)v21;
    }
    v23 = [v4 objectForKey:@"variant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v23 copy];
      variantIdentifier = v5->_variantIdentifier;
      v5->_variantIdentifier = (NSString *)v24;
    }
    v26 = [v4 objectForKey:@"shouldEnableMessagesExtension"];
    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_shouldEnableMessagesExtension = [v26 BOOLValue];
      }
    }
  }
  return v5;
}

- (SUUIItemOffer)initWithOfferDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIItemOffer;
  v5 = [(SUUIItemOffer *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"action-params"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      actionParameters = v5->_actionParameters;
      v5->_actionParameters = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"button_text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      buttonText = v5->_buttonText;
      v5->_buttonText = (NSString *)v10;

      v5->_float price = (float)([(NSString *)v5->_buttonText isEqualToString:@"FREE"] ^ 1);
    }
    v12 = [v4 objectForKey:@"confirm-text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      confirmationText = v5->_confirmationText;
      v5->_confirmationText = (NSString *)v13;
    }
    uint64_t v15 = [v4 objectForKey:@"assetFlavors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUIItemOffer *)v5 _setFileSizeWithFlavors:v15];
    }
  }
  return v5;
}

- (SUUIItemOffer)initWithRedownloadToken:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    v5 = 0;
    goto LABEL_5;
  }
  v5 = [(SUUIItemOffer *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actionParameters = v5->_actionParameters;
    v5->_actionParameters = (NSString *)v6;

    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)@"FREE";

    self = (SUUIItemOffer *)v5->_confirmationText;
    v5->_confirmationText = (NSString *)@"INSTALL APP";
LABEL_5:
  }
  return v5;
}

- (NSString)fileSizeText
{
  fileSizeText = self->_fileSizeText;
  if (!fileSizeText)
  {
    CPFSSizeStrings();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileSizeText;
    self->_fileSizeText = v4;

    fileSizeText = self->_fileSizeText;
  }
  return fileSizeText;
}

- (NSDictionary)lookupDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  actionParameters = self->_actionParameters;
  if (actionParameters) {
    [v3 setObject:actionParameters forKey:@"buyParams"];
  }
  if (self->_price > 0.00000011921)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v4 setObject:v6 forKey:@"price"];
  }
  if (self->_confirmationText)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", self->_confirmationText, @"medium", 0);
    [v4 setObject:v7 forKey:@"actionText"];
  }
  buttonText = self->_buttonText;
  if (buttonText) {
    [v4 setObject:buttonText forKey:@"priceFormatted"];
  }
  offerTypeString = self->_offerTypeString;
  if (offerTypeString) {
    [v4 setObject:offerTypeString forKey:@"type"];
  }
  variantIdentifier = self->_variantIdentifier;
  if (variantIdentifier) {
    [v4 setObject:variantIdentifier forKey:@"variant"];
  }
  if (self->_shouldEnableMessagesExtension)
  {
    id v11 = [NSNumber numberWithBool:1];
    [v4 setObject:v11 forKey:@"shouldEnableMessagesExtension"];
  }
  return (NSDictionary *)v4;
}

- (int64_t)offerType
{
  if ([(NSString *)self->_offerTypeString isEqualToString:@"rent"]) {
    return 3;
  }
  if ([(NSString *)self->_offerTypeString isEqualToString:@"preorder"]) {
    return 2;
  }
  if ([(NSString *)self->_offerTypeString isEqualToString:@"complete"]) {
    return 1;
  }
  if ([(NSString *)self->_offerTypeString isEqualToString:@"get"]) {
    return 4;
  }
  return 0;
}

- (void)_addActionParameterWithName:(id)a3 value:(id)a4
{
  actionParameters = self->_actionParameters;
  if (actionParameters)
  {
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [(NSString *)actionParameters stringByAppendingFormat:@"&%@=%@", v8, v7];
  }
  else
  {
    uint64_t v10 = (objc_class *)NSString;
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [[v10 alloc] initWithFormat:@"%@=%@", v8, v7];
  }
  id v11 = (NSString *)v9;

  v12 = self->_actionParameters;
  self->_actionParameters = v11;
}

- (void)_setFileSizeWithDeviceSizes:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v4 = [MEMORY[0x263F7B148] currentDevice];
  v11[0] = [v4 thinnedApplicationVariantIdentifier];
  [v4 compatibleProductType];
  uint64_t v5 = 0;
  v11[1] = (id)objc_claimAutoreleasedReturnValue();
  v11[2] = @"universal";
  while (1)
  {
    id v6 = (id)v11[v5];
    if (v6) {
      break;
    }
LABEL_5:

    if (++v5 == 3) {
      goto LABEL_8;
    }
  }
  id v7 = [v10 objectForKey:v6];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  int64_t v8 = [v7 longLongValue];
  fileSizeText = self->_fileSizeText;
  self->_fileSize = v8;
  self->_fileSizeText = 0;

LABEL_8:
}

- (SUUIItemOffer)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22.receiver = self;
    v22.super_class = (Class)SUUIItemOffer;
    uint64_t v5 = [(SUUIItemOffer *)&v22 init];
    if (v5)
    {
      id v6 = [v4 objectForKey:@"action-params"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 copy];
        actionParameters = v5->_actionParameters;
        v5->_actionParameters = (NSString *)v7;
      }
      uint64_t v9 = [v4 objectForKey:@"button_text"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        buttonText = v5->_buttonText;
        v5->_buttonText = (NSString *)v10;
      }
      v12 = [v4 objectForKey:@"confirm-text"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        confirmationText = v5->_confirmationText;
        v5->_confirmationText = (NSString *)v13;
      }
      uint64_t v15 = [v4 objectForKey:@"fileSize"];

      if (objc_opt_respondsToSelector()) {
        v5->_fileSize = [v15 longLongValue];
      }
      v16 = [v4 objectForKey:@"fileSizeText"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 copy];
        fileSizeText = v5->_fileSizeText;
        v5->_fileSizeText = (NSString *)v17;
      }
      v19 = [v4 objectForKey:@"price"];

      if (objc_opt_respondsToSelector())
      {
        [v19 floatValue];
        v5->_float price = v20;
      }
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithLongLong:self->_fileSize];
  [v3 setObject:v4 forKey:@"fileSize"];

  *(float *)&double v5 = self->_price;
  id v6 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v6 forKey:@"price"];

  actionParameters = self->_actionParameters;
  if (actionParameters) {
    [v3 setObject:actionParameters forKey:@"action-params"];
  }
  buttonText = self->_buttonText;
  if (buttonText) {
    [v3 setObject:buttonText forKey:@"button_text"];
  }
  confirmationText = self->_confirmationText;
  if (confirmationText) {
    [v3 setObject:confirmationText forKey:@"confirm-text"];
  }
  fileSizeText = self->_fileSizeText;
  if (fileSizeText) {
    [v3 setObject:fileSizeText forKey:@"fileSizeText"];
  }
  return (NSMutableDictionary *)v3;
}

- (void)_setFileSizeWithAssets:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 count];
  id v5 = v8;
  if (v4)
  {
    id v6 = [v8 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKey:@"size"];
      if (objc_opt_respondsToSelector()) {
        self->_fileSize = [v7 longLongValue];
      }
    }
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_setFileSizeWithFlavors:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 count];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 objectForKey:@"fileSize"];
      if (objc_opt_respondsToSelector()) {
        self->_fileSize = [v7 longLongValue];
      }
      id v8 = [v6 objectForKey:@"fileSizeText"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (NSString *)[v8 copy];
        fileSizeText = self->_fileSizeText;
        self->_fileSizeText = v9;
      }
    }

    id v5 = v11;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (NSString)actionParameters
{
  return self->_actionParameters;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (float)price
{
  return self->_price;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)shouldEnableMessagesExtension
{
  return self->_shouldEnableMessagesExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_offerTypeString, 0);
  objc_storeStrong((id *)&self->_fileSizeText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_actionParameters, 0);
}

@end