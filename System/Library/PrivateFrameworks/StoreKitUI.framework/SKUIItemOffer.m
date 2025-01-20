@interface SKUIItemOffer
- (BOOL)shouldEnableMessagesExtension;
- (NSDictionary)lookupDictionary;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)actionParameters;
- (NSString)buttonText;
- (NSString)confirmationText;
- (NSString)fileSizeText;
- (NSString)variantIdentifier;
- (SKUIItemOffer)initWithButtonText:(id)a3;
- (SKUIItemOffer)initWithCacheRepresentation:(id)a3;
- (SKUIItemOffer)initWithLookupDictionary:(id)a3;
- (SKUIItemOffer)initWithOfferDictionary:(id)a3;
- (SKUIItemOffer)initWithRedownloadToken:(id)a3;
- (float)price;
- (int64_t)fileSize;
- (int64_t)offerType;
- (void)_addActionParameterWithName:(id)a3 value:(id)a4;
- (void)_setFileSizeWithAssets:(id)a3;
- (void)_setFileSizeWithDeviceSizes:(id)a3;
- (void)_setFileSizeWithFlavors:(id)a3;
@end

@implementation SKUIItemOffer

- (SKUIItemOffer)initWithButtonText:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemOffer initWithButtonText:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIItemOffer;
  v13 = [(SKUIItemOffer *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v4 copy];
    buttonText = v13->_buttonText;
    v13->_buttonText = (NSString *)v14;

    confirmationText = v13->_confirmationText;
    v13->_confirmationText = (NSString *)&stru_1F1C879E8;
  }
  return v13;
}

- (SKUIItemOffer)initWithLookupDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemOffer initWithLookupDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIItemOffer;
  v13 = [(SKUIItemOffer *)&v39 init];
  if (v13)
  {
    uint64_t v14 = [v4 objectForKey:@"buyParams"];
    if (!v14)
    {
      uint64_t v14 = [v4 objectForKey:@"action-params"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_actionParameters, v14);
    }
    v15 = [v4 objectForKey:@"actionText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v15 objectForKey:@"medium"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v16 uppercaseString];
      }
      else
      {
        v17 = 0;
      }
      uint64_t v14 = v16;
    }
    else
    {
      v17 = 0;
    }
    objc_super v18 = [v4 objectForKey:@"priceFormatted"];

    if (!v18)
    {
      objc_super v18 = [v4 objectForKey:@"button_text"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    v20 = [v4 objectForKey:@"price"];
    if (objc_opt_respondsToSelector())
    {
      [v20 floatValue];
      v13->_float price = price;
    }
    else
    {
      float price = v13->_price;
    }
    v36 = v17;
    v38 = v15;
    if (price == 0.0)
    {
      if (v17) {
        v22 = v17;
      }
      else {
        v22 = v19;
      }
      uint64_t v23 = objc_msgSend(v22, "copy", v17, v15);
      buttonText = v13->_buttonText;
      v13->_buttonText = (NSString *)v23;
    }
    else
    {
      objc_storeStrong((id *)&v13->_buttonText, v19);
      v25 = v17;
      buttonText = v13->_confirmationText;
      v13->_confirmationText = v25;
    }

    v26 = [v4 objectForKey:@"assets"];
    v27 = [v4 objectForKey:@"assetFlavors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SKUIItemOffer *)v13 _setFileSizeWithAssets:v26];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SKUIItemOffer *)v13 _setFileSizeWithFlavors:v27];
      }
    }
    v28 = objc_msgSend(v4, "objectForKey:", @"type", v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [v28 copy];
      offerTypeString = v13->_offerTypeString;
      v13->_offerTypeString = (NSString *)v29;
    }
    v31 = [v4 objectForKey:@"variant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v32 = [v31 copy];
      variantIdentifier = v13->_variantIdentifier;
      v13->_variantIdentifier = (NSString *)v32;
    }
    v34 = [v4 objectForKey:@"shouldEnableMessagesExtension"];
    if (v34)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13->_shouldEnableMessagesExtension = [v34 BOOLValue];
      }
    }
  }
  return v13;
}

- (SKUIItemOffer)initWithOfferDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemOffer initWithOfferDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIItemOffer;
  v13 = [(SKUIItemOffer *)&v25 init];
  if (v13)
  {
    uint64_t v14 = [v4 objectForKey:@"action-params"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      actionParameters = v13->_actionParameters;
      v13->_actionParameters = (NSString *)v15;
    }
    v17 = [v4 objectForKey:@"button_text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 copy];
      buttonText = v13->_buttonText;
      v13->_buttonText = (NSString *)v18;

      v13->_float price = (float)([(NSString *)v13->_buttonText isEqualToString:@"FREE"] ^ 1);
    }
    v20 = [v4 objectForKey:@"confirm-text"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [v20 copy];
      confirmationText = v13->_confirmationText;
      v13->_confirmationText = (NSString *)v21;
    }
    uint64_t v23 = [v4 objectForKey:@"assetFlavors"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUIItemOffer *)v13 _setFileSizeWithFlavors:v23];
    }
  }
  return v13;
}

- (SKUIItemOffer)initWithRedownloadToken:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemOffer initWithRedownloadToken:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (![v4 length])
  {
    v13 = 0;
    goto LABEL_9;
  }
  v13 = [(SKUIItemOffer *)self init];
  if (v13)
  {
    uint64_t v14 = [v4 copy];
    actionParameters = v13->_actionParameters;
    v13->_actionParameters = (NSString *)v14;

    buttonText = v13->_buttonText;
    v13->_buttonText = (NSString *)@"FREE";

    self = (SKUIItemOffer *)v13->_confirmationText;
    v13->_confirmationText = (NSString *)@"INSTALL APP";
LABEL_9:
  }
  return v13;
}

- (NSString)fileSizeText
{
  fileSizeText = self->_fileSizeText;
  if (!fileSizeText)
  {
    id v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:self->_fileSize countStyle:1];
    BOOL v5 = self->_fileSizeText;
    self->_fileSizeText = v4;

    fileSizeText = self->_fileSizeText;
  }

  return fileSizeText;
}

- (NSDictionary)lookupDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", self->_confirmationText, @"medium", 0);
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
    uint64_t v11 = [NSNumber numberWithBool:1];
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
  uint64_t v11 = (NSString *)v9;

  uint64_t v12 = self->_actionParameters;
  self->_actionParameters = v11;
}

- (void)_setFileSizeWithDeviceSizes:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v4 = [MEMORY[0x1E4FA8140] currentDevice];
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

- (SKUIItemOffer)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22.receiver = self;
    v22.super_class = (Class)SKUIItemOffer;
    uint64_t v5 = [(SKUIItemOffer *)&v22 init];
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
      uint64_t v12 = [v4 objectForKey:@"confirm-text"];

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
      id v19 = [v4 objectForKey:@"price"];

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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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

  MEMORY[0x1F41817F8](v4, v5);
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

  MEMORY[0x1F41817F8](v4, v5);
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

- (void)initWithButtonText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLookupDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithOfferDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRedownloadToken:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end