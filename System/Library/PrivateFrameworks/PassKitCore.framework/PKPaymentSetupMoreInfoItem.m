@interface PKPaymentSetupMoreInfoItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlternativeAction;
- (NSData)imageData;
- (NSDictionary)reportingMetadata;
- (NSString)alternativeAction;
- (NSString)body;
- (NSString)doneAction;
- (NSString)linkText;
- (NSString)nextAction;
- (NSString)title;
- (NSURL)imageURL;
- (NSURL)linkURL;
- (PKPaymentSetupMoreInfoItem)initWithCoder:(id)a3;
- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3;
- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3 imageData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)_updateActionStrings;
- (void)encodeWithCoder:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation PKPaymentSetupMoreInfoItem

- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3
{
  return [(PKPaymentSetupMoreInfoItem *)self initWithMoreInfoDictionary:a3 imageData:0];
}

- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3 imageData:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentSetupMoreInfoItem;
  v8 = [(PKPaymentSetupMoreInfoItem *)&v50 init];
  if (!v8) {
    goto LABEL_18;
  }
  v9 = [v6 PKStringForKey:@"title"];
  uint64_t v10 = [v9 copy];
  title = v8->_title;
  v8->_title = (NSString *)v10;

  v12 = [v6 PKStringForKey:@"body"];
  uint64_t v13 = [v12 copy];
  body = v8->_body;
  v8->_body = (NSString *)v13;

  v15 = [v6 PKURLForKey:@"imageURL"];
  uint64_t v16 = [v15 copy];
  imageURL = v8->_imageURL;
  v8->_imageURL = (NSURL *)v16;

  uint64_t v18 = [v7 copy];
  imageData = v8->_imageData;
  v8->_imageData = (NSData *)v18;

  v20 = [v6 PKURLForKey:@"linkURL"];
  uint64_t v21 = [v20 copy];
  linkURL = v8->_linkURL;
  v8->_linkURL = (NSURL *)v21;

  v23 = [v6 PKStringForKey:@"linkText"];
  uint64_t v24 = [v23 copy];
  linkText = v8->_linkText;
  v8->_linkText = (NSString *)v24;

  v26 = v8->_linkText;
  v27 = v8->_linkURL;
  if (v27)
  {
    if (!v26) {
      goto LABEL_6;
    }
  }
  else if (v26)
  {
LABEL_6:
    v28 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = "linkText missing";
      if (!v27) {
        v29 = "linkURL missing or malformed";
      }
      *(_DWORD *)buf = 136315138;
      v52 = v29;
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "more info link invalid: %s", buf, 0xCu);
    }

    v30 = v8->_linkText;
    v8->_linkText = 0;

    v31 = v8->_linkURL;
    v8->_linkURL = 0;
  }
  v32 = [v6 PKStringForKey:@"type"];
  v33 = v32;
  if (v32) {
    uint64_t v34 = PKPaymentSetupMoreInfoItemTypeFromDescription(v32);
  }
  else {
    uint64_t v34 = 2;
  }
  v8->_type = v34;
  v35 = [v6 PKStringForKey:@"nextAction"];
  uint64_t v36 = [v35 copy];
  nextActionOverride = v8->_nextActionOverride;
  v8->_nextActionOverride = (NSString *)v36;

  v38 = [v6 PKStringForKey:@"doneAction"];
  uint64_t v39 = [v38 copy];
  doneActionOverride = v8->_doneActionOverride;
  v8->_doneActionOverride = (NSString *)v39;

  v41 = [v6 PKStringForKey:@"altAction"];
  uint64_t v42 = [v41 copy];
  alternativeActionOverride = v8->_alternativeActionOverride;
  v8->_alternativeActionOverride = (NSString *)v42;

  v44 = [v6 PKNumberForKey:@"hideAltAction"];
  v45 = v44;
  if (v44) {
    char v46 = [v44 BOOLValue];
  }
  else {
    char v46 = 1;
  }
  v8->_hideAlternativeAction = v46;
  uint64_t v47 = [v6 PKDictionaryForKey:@"reportingMetadata"];
  reportingMetadata = v8->_reportingMetadata;
  v8->_reportingMetadata = (NSDictionary *)v47;

  [(PKPaymentSetupMoreInfoItem *)v8 _updateActionStrings];
LABEL_18:

  return v8;
}

- (void)_updateActionStrings
{
  PKLocalizedPaymentString(&cfstr_Next.isa, 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  nextAction = self->_nextAction;
  self->_nextAction = v3;

  PKLocalizedString(&cfstr_Done.isa, 0);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  doneAction = self->_doneAction;
  self->_doneAction = v5;

  alternativeAction = self->_alternativeAction;
  self->_alternativeAction = 0;

  self->_hasAlternativeAction = 0;
  if ((unint64_t)(self->_type - 1) <= 1)
  {
    PKLocalizedTransitString(&cfstr_ExpressTransit_5.isa, 0);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_alternativeAction;
    self->_alternativeAction = v8;

    self->_hasAlternativeAction = !self->_hideAlternativeAction;
  }
  nextActionOverride = self->_nextActionOverride;
  if (nextActionOverride)
  {
    objc_storeStrong((id *)&self->_nextAction, nextActionOverride);
    objc_storeStrong((id *)&self->_doneAction, self->_doneActionOverride);
  }
  doneActionOverride = self->_doneActionOverride;
  if (doneActionOverride) {
    objc_storeStrong((id *)&self->_doneAction, doneActionOverride);
  }
  alternativeActionOverride = self->_alternativeActionOverride;
  if (alternativeActionOverride)
  {
    objc_storeStrong((id *)&self->_alternativeAction, alternativeActionOverride);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupMoreInfoItem)initWithCoder:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPaymentSetupMoreInfoItem;
  v5 = [(PKPaymentSetupMoreInfoItem *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageDataKey"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkURL"];
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkText"];
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v16;

    uint64_t v18 = v5->_linkText;
    v19 = v5->_linkURL;
    if (v19)
    {
      if (!v18) {
        goto LABEL_6;
      }
    }
    else if (v18)
    {
LABEL_6:
      v20 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = "linkText missing";
        if (!v19) {
          uint64_t v21 = "linkURL missing or malformed";
        }
        *(_DWORD *)buf = 136315138;
        v37 = v21;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "more info link invalid: %s", buf, 0xCu);
      }

      v22 = v5->_linkText;
      v5->_linkText = 0;

      v23 = v5->_linkURL;
      v5->_linkURL = 0;
    }
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = PKPaymentSetupMoreInfoItemTypeFromDescription(v24);

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextAction"];
    nextActionOverride = v5->_nextActionOverride;
    v5->_nextActionOverride = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneAction"];
    doneActionOverride = v5->_doneActionOverride;
    v5->_doneActionOverride = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altAction"];
    alternativeActionOverride = v5->_alternativeActionOverride;
    v5->_alternativeActionOverride = (NSString *)v29;

    v5->_hideAlternativeAction = [v4 decodeBoolForKey:@"hideAltAction"];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = [v4 decodeDictionaryWithKeysOfClass:v31 objectsOfClass:objc_opt_class() forKey:@"reportingMetadata"];
    reportingMetadata = v5->_reportingMetadata;
    v5->_reportingMetadata = (NSDictionary *)v32;

    [(PKPaymentSetupMoreInfoItem *)v5 _updateActionStrings];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_title forKey:@"title"];
  [v6 encodeObject:self->_body forKey:@"body"];
  [v6 encodeObject:self->_imageURL forKey:@"imageURL"];
  [v6 encodeObject:self->_imageData forKey:@"imageDataKey"];
  [v6 encodeObject:self->_linkURL forKey:@"linkURL"];
  [v6 encodeObject:self->_linkText forKey:@"linkText"];
  unint64_t type = self->_type;
  if (type > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E56D8C68[type];
  }
  [v6 encodeObject:v5 forKey:@"type"];
  [v6 encodeObject:self->_nextActionOverride forKey:@"nextAction"];
  [v6 encodeObject:self->_doneActionOverride forKey:@"doneAction"];
  [v6 encodeObject:self->_alternativeActionOverride forKey:@"altAction"];
  [v6 encodeBool:self->_hideAlternativeAction forKey:@"hideAltAction"];
  [v6 encodeObject:self->_reportingMetadata forKey:@"reportingMetadata"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_body copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSURL *)self->_imageURL copyWithZone:a3];
  v11 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v10;

  uint64_t v12 = [(NSData *)self->_imageData copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v12;

  uint64_t v14 = [(NSURL *)self->_linkURL copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_linkText copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  *(void *)(v5 + 80) = self->_type;
  uint64_t v18 = [(NSString *)self->_nextActionOverride copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  uint64_t v20 = [(NSString *)self->_doneActionOverride copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  uint64_t v22 = [(NSString *)self->_alternativeActionOverride copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  *(unsigned char *)(v5 + 8) = self->_hideAlternativeAction;
  uint64_t v24 = [(NSDictionary *)self->_reportingMetadata copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  return (id)v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasAlternativeAction
{
  return self->_hasAlternativeAction;
}

- (NSString)nextAction
{
  return self->_nextAction;
}

- (NSString)doneAction
{
  return self->_doneAction;
}

- (NSString)alternativeAction
{
  return self->_alternativeAction;
}

- (NSDictionary)reportingMetadata
{
  return self->_reportingMetadata;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_reportingMetadata, 0);
  objc_storeStrong((id *)&self->_alternativeAction, 0);
  objc_storeStrong((id *)&self->_doneAction, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alternativeActionOverride, 0);
  objc_storeStrong((id *)&self->_doneActionOverride, 0);
  objc_storeStrong((id *)&self->_nextActionOverride, 0);
}

@end