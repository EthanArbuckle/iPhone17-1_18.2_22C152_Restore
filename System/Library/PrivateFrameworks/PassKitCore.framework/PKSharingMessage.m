@interface PKSharingMessage
+ (BOOL)supportsSecureCoding;
+ (id)_payloadForContent:(uint64_t)a3 format:;
+ (id)embeddedMessageDictionaryForShareURL:(id)a3 targetDevice:(int64_t)a4;
+ (id)specializedMessageFromPayload:(id)a3 displayInformation:(id)a4 outError:(id *)a5;
- (BOOL)configureWithContent:(id)a3;
- (NSData)payload;
- (NSString)identifier;
- (PKSharingMessage)init;
- (PKSharingMessage)initWithCoder:(id)a3;
- (PKSharingMessage)initWithContent:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6;
- (PKSharingMessageDisplayInformation)displayInformation;
- (id)_initWithPayload:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6;
- (id)description;
- (id)embeddedAddressForDeviceType:(int64_t)a3;
- (id)embeddedMessageURLs;
- (id)typeDescription;
- (unint64_t)format;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayInformation:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPayload:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateMessageContentTo:(id)a3;
@end

@implementation PKSharingMessage

- (PKSharingMessage)init
{
  return 0;
}

- (PKSharingMessage)initWithContent:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = +[PKSharingMessage _payloadForContent:format:]((uint64_t)PKSharingMessage, v10, a4);
  v13 = [(PKSharingMessage *)self _initWithPayload:v12 format:a4 type:a5 displayInformation:v11];

  if (v13 && ![(PKSharingMessage *)v13 configureWithContent:v10])
  {

    v13 = 0;
  }

  return v13;
}

+ (id)_payloadForContent:(uint64_t)a3 format:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  if (PKSharingSimulateCrossPlatformShare())
  {
    v5 = (void *)[v4 mutableCopy];
    [v5 setObject:0 forKeyedSubscript:@"apple"];

    id v4 = v5;
  }
  v17[0] = @"format";
  v6 = PKSharingMessageFormatToString(a3);
  v17[1] = @"content";
  v18[0] = v6;
  v18[1] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v14 = 0;
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:1 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (!v8 || v9)
  {
    v12 = PKLogFacilityTypeGetObject(0x21uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: unable to serialize json with error %@", buf, 0xCu);
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)_initWithPayload:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (v11)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKSharingMessage;
    v13 = [(PKSharingMessage *)&v20 init];
    id v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_payload, a3);
      v14->_type = a5;
      v14->_format = a4;
      objc_storeStrong((id *)&v14->_displayInformation, a6);
      id v15 = objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v16 = [v15 UUIDString];
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v16;
    }
    self = v14;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)specializedMessageFromPayload:(id)a3 displayInformation:(id)a4 outError:(id *)a5
{
  v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v7 = (void *)MEMORY[0x1E4F28D90];
    id v35 = 0;
    id v33 = a4;
    id v8 = a3;
    id v9 = [v7 JSONObjectWithData:v8 options:0 error:&v35];
    id v10 = v35;
    id v11 = v10;
    if (v10) {
      id *v5 = v10;
    }
    id v12 = [v9 PKDictionaryForKey:@"content"];
    v13 = [v9 PKStringForKey:@"format"];
    uint64_t v14 = PKSharingMessageFormatFromString(v13);

    id v15 = PKSharingMessageGenericDataKeyForFormat(v14);
    uint64_t v16 = [v12 PKDictionaryForKey:v15];

    uint64_t v17 = [v16 PKIntegerForKey:@"sharingDataType"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke;
    v34[3] = &__block_descriptor_48_e23___PKSharingMessage_8__0l;
    v34[4] = v14;
    v34[5] = v17;
    v18 = __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke((uint64_t)v34);
    v19 = PKLogFacilityTypeGetObject(0x21uLL);
    objc_super v20 = v19;
    if (!v18)
    {
      v31 = v12;
      v32 = v11;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = PKSharingMessageFormatToString(v14);
        *(_DWORD *)buf = 138412290;
        v41 = v21;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: Unable to find specalized message class for format: '%@'", buf, 0xCu);
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39 = @"Message format not supported";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id *v5 = [v22 errorWithDomain:@"PKAddSecureElementPassErrorDomain" code:0 userInfo:v23];

      id v12 = v31;
      id v11 = v32;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v9;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: creating message from: \n %@", buf, 0xCu);
    }

    v24 = (void *)[v18 _initWithPayload:v8 format:v14 type:v17 displayInformation:v33];
    if ([v24 configureWithContent:v12])
    {
      v5 = v24;
    }
    else
    {
      v25 = v11;
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37 = @"Invalid message content";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      v28 = v27 = v16;
      v29 = v26;
      id v11 = v25;
      id *v5 = [v29 errorWithDomain:@"PKAddSecureElementPassErrorDomain" code:0 userInfo:v28];

      uint64_t v16 = v27;
      v5 = 0;
    }
  }
  return v5;
}

id __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke(uint64_t a1)
{
  v1 = off_1E56D6CD8;
  switch(*(void *)(a1 + 32))
  {
    case 1:
      goto LABEL_30;
    case 2:
      uint64_t v2 = *(void *)(a1 + 40);
      if (v2 <= 1000)
      {
        if ((unint64_t)(v2 - 2) < 6 || v2 == 0)
        {
          v1 = off_1E56D6C50;
          goto LABEL_30;
        }
        if (v2 == 1)
        {
          v1 = off_1E56D6C48;
          goto LABEL_30;
        }
        goto LABEL_19;
      }
      if (v2 == 1001) {
        goto LABEL_28;
      }
      if (v2 == 1002)
      {
LABEL_26:
        v1 = off_1E56D6C88;
        goto LABEL_30;
      }
      if (v2 != 1003)
      {
LABEL_19:
        id v4 = 0;
        if (v2 > 1002)
        {
          if (v2 != 1003)
          {
            if (v2 == 2001)
            {
              v1 = off_1E56D6928;
            }
            else
            {
              if (v2 != 2002) {
                goto LABEL_31;
              }
              v1 = off_1E56D6930;
            }
            goto LABEL_30;
          }
          goto LABEL_27;
        }
        if (v2 != 1001)
        {
          if (v2 != 1002) {
            goto LABEL_31;
          }
          goto LABEL_26;
        }
LABEL_28:
        v1 = off_1E56D6CB0;
        goto LABEL_30;
      }
LABEL_27:
      v1 = off_1E56D6CF0;
LABEL_30:
      id v4 = objc_alloc(*v1);
LABEL_31:
      return v4;
    case 3:
      uint64_t v2 = *(void *)(a1 + 40);
      goto LABEL_19;
    case 4:
      uint64_t v2 = *(void *)(a1 + 40);
      if (v2 != 1) {
        goto LABEL_19;
      }
      v1 = off_1E56D6C98;
      goto LABEL_30;
    default:
      id v4 = 0;
      goto LABEL_31;
  }
}

- (BOOL)configureWithContent:(id)a3
{
  return 1;
}

- (void)updateMessageContentTo:(id)a3
{
  id v5 = a3;
  id v4 = +[PKSharingMessage _payloadForContent:format:]((uint64_t)PKSharingMessage, v5, self->_format);
  if (v4)
  {
    objc_storeStrong((id *)&self->_payload, v4);
    [(PKSharingMessage *)self configureWithContent:v5];
  }
}

- (id)typeDescription
{
  v3 = PKSharingMessageFormatToString(self->_format);
  id v4 = PKSharingMessageTypeToString(self->_type);
  id v5 = [NSString stringWithFormat:@"<%@-%@>", v3, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessage)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  id v27 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v27];
  id v7 = v27;
  uint64_t v8 = [v6 PKDictionaryForKey:@"content"];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    id v11 = PKLogFacilityTypeGetObject(0x21uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v7;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: unable to decode json during NSCoding. %@", buf, 0xCu);
    }

    id v12 = 0;
  }
  else
  {
    v26 = v6;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
    uint64_t v14 = PKSharingMessageFormatFromString(v13);
    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    uint64_t v16 = PKSharingMessageTypeFromString(v15);
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayInformation"];
    v18 = [(PKSharingMessage *)self _initWithPayload:v5 format:v14 type:v16 displayInformation:v17];

    if (v18)
    {
      objc_storeStrong(v18 + 4, v5);
      uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayInformation"];
      id v20 = v18[5];
      v18[5] = (id)v19;

      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      id v22 = v18[1];
      v18[1] = (id)v21;

      v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
      v18[2] = (id)PKSharingMessageTypeFromString(v23);

      v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
      void v18[3] = (id)PKSharingMessageFormatFromString(v24);

      if (([v18 configureWithContent:v9] & 1) == 0)
      {

        v18 = 0;
      }
    }
    v6 = v26;
    self = v18;
    id v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  payload = self->_payload;
  id v5 = a3;
  [v5 encodeObject:payload forKey:@"payload"];
  [v5 encodeObject:self->_displayInformation forKey:@"displayInformation"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  v6 = PKSharingMessageTypeToString(self->_type);
  [v5 encodeObject:v6 forKey:@"type"];

  PKSharingMessageFormatToString(self->_format);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"format"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  id v4 = PKSharingMessageTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@"payload: '%@'; ", self->_payload];
  [v3 appendFormat:@"displayInformation: '%@'; ", self->_displayInformation];
  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

+ (id)embeddedMessageDictionaryForShareURL:(id)a3 targetDevice:(int64_t)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"address";
  id v5 = [a3 absoluteString];
  v10[0] = v5;
  v9[1] = @"targetDeviceType";
  v6 = PKPassCredentialShareTargetDeviceToString(a4);
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)embeddedMessageURLs
{
  return 0;
}

- (id)embeddedAddressForDeviceType:(int64_t)a3
{
  id v4 = [(PKSharingMessage *)self embeddedMessageURLs];
  id v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 absoluteString];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (void)setDisplayInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInformation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end