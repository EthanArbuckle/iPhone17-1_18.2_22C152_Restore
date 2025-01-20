@interface NPKProtoStandaloneHelper
+ (CGSize)passImageSize;
+ (CGSize)passThumbnailImageSize;
+ (id)_convertProtoWelcomeStepContext:(id)a3 requestContext:(id)a4;
+ (id)fromNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 requestContext:(id)a4;
+ (id)sha1hash:(id)a3;
+ (id)toJsonString:(id)a3;
+ (id)toNPKProtoStandaloneCreditAccountCredential:(id)a3 thumbnailSize:(BOOL)a4;
+ (id)toNPKProtoStandaloneError:(id)a3;
+ (id)toNPKProtoStandalonePass:(id)a3 thumbnailSize:(BOOL)a4;
+ (id)toNPKProtoStandalonePaymentCredential:(id)a3;
+ (id)toNPKProtoStandalonePaymentCredentialUnion:(id)a3 withFlowIdentifier:(id)a4 thumbnailSize:(BOOL)a5;
+ (id)toNPKProtoStandalonePaymentDigitalIssuanceMetadata:(id)a3;
+ (id)toNPKProtoStandalonePaymentPass:(id)a3 thumbnailSize:(BOOL)a4;
+ (id)toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:(id)a3;
+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerItem:(id)a3;
+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerSection:(id)a3;
+ (id)toNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 fromStep:(int)a4 toStep:(int)a5;
+ (id)toNPKProtoStandalonePaymentProvisioningMethodMetadata:(id)a3;
+ (id)toNPKProtoStandalonePaymentRemoteCredential:(id)a3 thumbnailSize:(BOOL)a4;
+ (id)toNPKProtoStandalonePaymentSetupField:(id)a3;
+ (id)toNPKProtoStandalonePaymentSetupMoreInfoItem:(id)a3;
+ (id)toNPKProtoStandalonePaymentSetupProduct:(id)a3;
+ (id)toNPKProtoStandalonePaymentSetupProductImageAssetURLs:(id)a3;
+ (id)toNPKProtoStandalonePaymentSetupProductPaymentOption:(id)a3;
+ (id)toNPKProtoStandaloneVerificationChannel:(id)a3;
+ (id)toPKPaymentSetupField:(id)a3;
+ (id)toStringValue:(id)a3;
+ (int)toNPKProtoStandalonePassType:(unint64_t)a3;
+ (int)toNPKProtoStandalonePaymentApplicationState:(int64_t)a3;
+ (int)toNPKProtoStandalonePaymentPassActivationState:(unint64_t)a3;
+ (int)toNPKProtoStandalonePaymentSetupFieldType:(unint64_t)a3;
+ (int)toNPKProtoStandaloneReaderModeIngestionState:(unint64_t)a3;
+ (int)toNPKProtoStandaloneVerificationChannelType:(unint64_t)a3;
+ (unint64_t)toPKPaymentSetupFieldType:(int)a3;
+ (void)_convertChooseCredentialsStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertChooseFlowStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertChooseProductStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertDigitalIssuanceAmountStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertDigitalIssuancePaymentStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertIssuerVerificationChannelsStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertIssuerVerificationCodeStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertIssuerVerificationFieldsStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertLocalDeviceManualEntry:(id)a3 protoContext:(id)a4;
+ (void)_convertLocalDeviceManualEntryProgress:(id)a3 protoContext:(id)a4;
+ (void)_convertManualEntryStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertMoreInformationStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertPasscodeUpgradeStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertProvisioningProgressStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertProvisioningResultStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertReaderModeEntryStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertReaderModeIngestionStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertSecondaryManualEntryStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertTermsAndConditionsStepContext:(id)a3 protoContext:(id)a4;
+ (void)_convertWelcomeStepContext:(id)a3 protoContext:(id)a4;
+ (void)setPassImageSize:(CGSize)a3;
+ (void)setPassThumbnailImageSize:(CGSize)a3;
@end

@implementation NPKProtoStandaloneHelper

+ (void)setPassImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12.CGFloat width = width;
        v12.CGFloat height = height;
        int v9 = 138412290;
        CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
        CFDictionaryRef v8 = DictionaryRepresentation;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring invalid pass image size %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    __PassImageSize_0 = *(void *)&a3.width;
    __PassImageSize_1 = *(void *)&a3.height;
  }
}

+ (CGSize)passImageSize
{
  double v2 = *(double *)&__PassImageSize_0;
  double v3 = *(double *)&__PassImageSize_1;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (void)setPassThumbnailImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12.CGFloat width = width;
        v12.CGFloat height = height;
        int v9 = 138412290;
        CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
        CFDictionaryRef v8 = DictionaryRepresentation;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring invalid pass thumbnail image size %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    __PassThumbnailImageSize_0 = *(void *)&a3.width;
    __PassThumbnailImageSize_1 = *(void *)&a3.height;
  }
}

+ (CGSize)passThumbnailImageSize
{
  double v2 = *(double *)&__PassThumbnailImageSize_0;
  double v3 = *(double *)&__PassThumbnailImageSize_1;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 fromStep:(int)a4 toStep:(int)a5
{
  id v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowStepContext);
  CFDictionaryRef v8 = [v6 stepIdentifier];
  [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)v7 setStepIdentifier:v8];

  int v9 = [v6 backStepIdentifier];
  [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)v7 setBackStepIdentifier:v9];

  -[NPKProtoStandalonePaymentProvisioningFlowStepContext setAllowsAddLater:](v7, "setAllowsAddLater:", [v6 allowsAddLater]);
  if (a5 > 164)
  {
    if (a5 > 209)
    {
      if (a5 <= 229)
      {
        if (a5 == 210)
        {
          +[NPKProtoStandaloneHelper _convertProvisioningProgressStepContext:v6 protoContext:v7];
        }
        else if (a5 == 220)
        {
          +[NPKProtoStandaloneHelper _convertProvisioningResultStepContext:v6 protoContext:v7];
        }
      }
      else
      {
        switch(a5)
        {
          case 230:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationChannelsStepContext:v6 protoContext:v7];
            break;
          case 240:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationFieldsStepContext:v6 protoContext:v7];
            break;
          case 250:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationCodeStepContext:v6 protoContext:v7];
            break;
        }
      }
    }
    else
    {
      switch(a5)
      {
        case 190:
          +[NPKProtoStandaloneHelper _convertSecondaryManualEntryStepContext:v6 protoContext:v7];
          break;
        case 191:
        case 194:
        case 195:
        case 196:
        case 198:
        case 199:
          goto LABEL_46;
        case 192:
          +[NPKProtoStandaloneHelper _convertLocalDeviceManualEntry:v6 protoContext:v7];
          break;
        case 193:
          +[NPKProtoStandaloneHelper _convertLocalDeviceManualEntryProgress:v6 protoContext:v7];
          break;
        case 197:
          +[NPKProtoStandaloneHelper _convertPasscodeUpgradeStepContext:v6 protoContext:v7];
          break;
        case 200:
          +[NPKProtoStandaloneHelper _convertTermsAndConditionsStepContext:v6 protoContext:v7];
          break;
        default:
          if (a5 == 165)
          {
            +[NPKProtoStandaloneHelper _convertReaderModeIngestionStepContext:v6 protoContext:v7];
          }
          else if (a5 == 180)
          {
            +[NPKProtoStandaloneHelper _convertManualEntryStepContext:v6 protoContext:v7];
          }
          break;
      }
    }
    goto LABEL_46;
  }
  if (a5 > 143)
  {
    if (a5 > 154)
    {
      switch(a5)
      {
        case 155:
          +[NPKProtoStandaloneHelper _convertDigitalIssuancePaymentStepContext:v6 protoContext:v7];
          break;
        case 157:
          +[NPKProtoStandaloneHelper _convertMoreInformationStepContext:v6 protoContext:v7];
          break;
        case 160:
          +[NPKProtoStandaloneHelper _convertReaderModeEntryStepContext:v6 protoContext:v7];
          break;
      }
    }
    else if ((a5 - 144) < 2 || a5 == 150)
    {
      +[NPKProtoStandaloneHelper _convertDigitalIssuanceAmountStepContext:v6 protoContext:v7];
    }
    goto LABEL_46;
  }
  if (a5 > 136)
  {
    if ((a5 - 137) >= 2)
    {
      if (a5 == 140) {
        +[NPKProtoStandaloneHelper _convertChooseCredentialsStepContext:v6 protoContext:v7];
      }
      goto LABEL_46;
    }
LABEL_21:
    +[NPKProtoStandaloneHelper _convertChooseProductStepContext:v6 protoContext:v7];
    goto LABEL_46;
  }
  switch(a5)
  {
    case 120:
      +[NPKProtoStandaloneHelper _convertWelcomeStepContext:v6 protoContext:v7];
      break;
    case 130:
      +[NPKProtoStandaloneHelper _convertChooseFlowStepContext:v6 protoContext:v7];
      break;
    case 135:
      goto LABEL_21;
  }
LABEL_46:

  return v7;
}

+ (int)toNPKProtoStandalonePaymentSetupFieldType:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    return 100;
  }
  else {
    return 10 * (a3 - 1) + 110;
  }
}

+ (id)toNPKProtoStandaloneError:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandaloneError);
  -[NPKProtoStandaloneError setCode:](v5, "setCode:", [v4 code]);
  id v6 = [v4 domain];
  if (v6)
  {
    v7 = [v4 domain];
    [(NPKProtoStandaloneError *)v5 setDomain:v7];
  }
  else
  {
    [(NPKProtoStandaloneError *)v5 setDomain:@"com.apple.NPKStandaloneErrorDomain"];
  }

  CFDictionaryRef v8 = [v4 userInfo];

  if (v8)
  {
    int v9 = [v4 userInfo];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__NPKProtoStandaloneHelper_toNPKProtoStandaloneError___block_invoke;
    v11[3] = &unk_2644D64A8;
    id v13 = a1;
    CGSize v12 = v5;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
  return v5;
}

void __54__NPKProtoStandaloneHelper_toNPKProtoStandaloneError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandaloneUserInfo);
  [(NPKProtoStandaloneUserInfo *)v8 setKey:v6];

  v7 = [*(id *)(a1 + 40) toStringValue:v5];

  [(NPKProtoStandaloneUserInfo *)v8 setValue:v7];
  [*(id *)(a1 + 32) addUserInfos:v8];
}

+ (id)toStringValue:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_15:
    CFDictionaryRef v8 = &stru_26CFEBA18;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (__CFString *)v3;
LABEL_14:
    CFDictionaryRef v8 = v4;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 absoluteString];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 stringValue];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v5 = v3;
  if ([v5 count]
    && ([v5 firstObject],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    CFDictionaryRef v8 = [v5 firstObject];
  }
  else
  {
    CFDictionaryRef v8 = &stru_26CFEBA18;
  }

LABEL_16:
  return v8;
}

+ (void)_convertWelcomeStepContext:(id)a3 protoContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 welcomeStepContext];
  if (v7)
  {
    id v21 = v5;
    CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext);
    [v6 setWelcomeStepContext:v8];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [v7 heroImages];
    uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x223C37110]();
          v15 = objc_alloc_init(NPKProtoStandalonePaymentHeroImage);
          v16 = [v13 identifier];
          [(NPKProtoStandalonePaymentHeroImage *)v15 setIdentifier:v16];

          PKScreenScale();
          v17 = objc_msgSend(v13, "URLForImageWithScale:");
          v18 = [v17 absoluteString];
          [(NPKProtoStandalonePaymentHeroImage *)v15 setImageURL:v18];

          if ([v7 defaultImagesUsed])
          {
            v19 = 0;
          }
          else
          {
            PKScreenScale();
            v19 = objc_msgSend(v13, "imageWithScale:");
          }
          -[NPKProtoStandalonePaymentHeroImage setImageData:](v15, "setImageData:", v19, v21);
          v20 = [v6 welcomeStepContext];
          [v20 addHeroImages:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    id v5 = v21;
  }
}

+ (void)_convertChooseFlowStepContext:(id)a3 protoContext:(id)a4
{
  id v6 = a4;
  v7 = [a3 chooseFlowStepContext];
  if (v7)
  {
    CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext);
    [v6 setChooseFlowStepContext:v8];

    uint64_t v9 = [v7 sections];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__NPKProtoStandaloneHelper__convertChooseFlowStepContext_protoContext___block_invoke;
    v10[3] = &unk_2644D64D0;
    id v11 = v6;
    id v12 = a1;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

void __71__NPKProtoStandaloneHelper__convertChooseFlowStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 chooseFlowStepContext];
  id v5 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentProvisioningFlowPickerSection:v4];

  [v6 addSections:v5];
}

+ (void)_convertChooseProductStepContext:(id)a3 protoContext:(id)a4
{
  id v6 = a4;
  v7 = [a3 chooseProductStepContext];
  if (v7)
  {
    CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext);
    [v6 setChooseProductStepContext:v8];

    uint64_t v9 = [v7 products];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__NPKProtoStandaloneHelper__convertChooseProductStepContext_protoContext___block_invoke;
    v10[3] = &unk_2644D64F8;
    id v11 = v6;
    id v12 = a1;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

void __74__NPKProtoStandaloneHelper__convertChooseProductStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 chooseProductStepContext];
  id v5 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupProduct:v4];

  [v6 addProducts:v5];
}

+ (void)_convertChooseCredentialsStepContext:(id)a3 protoContext:(id)a4
{
  id v6 = a4;
  v7 = [a3 chooseCredentialsStepContext];
  if (v7)
  {
    CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext);
    [v6 setChooseCredentialsStepContext:v8];

    uint64_t v9 = [v7 allowsManualEntry];
    uint64_t v10 = [v6 chooseCredentialsStepContext];
    [v10 setAllowsManualEntry:v9];

    id v11 = [v7 flowIdentifiers];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__NPKProtoStandaloneHelper__convertChooseCredentialsStepContext_protoContext___block_invoke;
    v12[3] = &unk_2644D6520;
    id v13 = v7;
    id v14 = v6;
    id v15 = a1;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __78__NPKProtoStandaloneHelper__convertChooseCredentialsStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 flowIdentifierToCredential];
  id v12 = [v5 objectForKey:v4];

  id v6 = [*(id *)(a1 + 40) chooseCredentialsStepContext];
  v7 = [*(id *)(a1 + 48) toNPKProtoStandalonePaymentCredentialUnion:v12 withFlowIdentifier:v4 thumbnailSize:1];

  [v6 addCredentials:v7];
  if ([v12 isRemoteCredential])
  {
    CFDictionaryRef v8 = [*(id *)(a1 + 40) chooseCredentialsStepContext];
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = [v12 remoteCredential];
    id v11 = [v9 toNPKProtoStandalonePaymentRemoteCredential:v10 thumbnailSize:1];
    [v8 addRemoteCredentials:v11];
  }
}

+ (void)_convertDigitalIssuanceAmountStepContext:(id)a3 protoContext:(id)a4
{
  id v14 = a4;
  id v6 = [a3 digitalIssuanceAmountStepContext];
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext);
    [v14 setDigitalIssuanceAmountStepContext:v7];

    CFDictionaryRef v8 = [v6 product];

    if (v8)
    {
      uint64_t v9 = [v6 product];
      uint64_t v10 = [a1 toNPKProtoStandalonePaymentSetupProduct:v9];
      id v11 = [v14 digitalIssuanceAmountStepContext];
      [v11 setProduct:v10];
    }
    uint64_t v12 = [v6 allowsReaderModeEntry];
    id v13 = [v14 digitalIssuanceAmountStepContext];
    [v13 setAllowsReaderModeEntry:v12];
  }
}

+ (void)_convertDigitalIssuancePaymentStepContext:(id)a3 protoContext:(id)a4
{
  id v12 = a4;
  id v6 = [a3 digitalIssuancePaymentStepContext];
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext);
    [v12 setDigitalIssuancePaymentStepContext:v7];

    CFDictionaryRef v8 = [v6 product];

    if (v8)
    {
      uint64_t v9 = [v6 product];
      uint64_t v10 = [a1 toNPKProtoStandalonePaymentSetupProduct:v9];
      id v11 = [v12 digitalIssuancePaymentStepContext];
      [v11 setProduct:v10];
    }
  }
}

+ (void)_convertReaderModeEntryStepContext:(id)a3 protoContext:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a3 readerModeEntryStepContext];
  if (v7)
  {
    CFDictionaryRef v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext);
    [v6 setReaderModeEntryStepContext:v8];

    uint64_t v9 = [v7 title];
    uint64_t v10 = [v6 readerModeEntryStepContext];
    [v10 setTitle:v9];

    id v11 = [v7 subtitle];
    id v12 = [v6 readerModeEntryStepContext];
    [v12 setSubtitle:v11];

    uint64_t v13 = [v7 setupFields];
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = [v7 setupFields];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v17 = objc_msgSend(v7, "setupFields", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * v21);
              long long v23 = [v6 readerModeEntryStepContext];
              long long v24 = [a1 toNPKProtoStandalonePaymentSetupField:v22];
              [v23 addSetupFields:v24];

              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v19);
        }
      }
    }
    long long v25 = [v7 product];

    if (v25)
    {
      long long v26 = [v7 product];
      v27 = [a1 toNPKProtoStandalonePaymentSetupProduct:v26];
      uint64_t v28 = [v6 readerModeEntryStepContext];
      [v28 setProduct:v27];
    }
  }
}

+ (void)_convertReaderModeIngestionStepContext:(id)a3 protoContext:(id)a4
{
  id v22 = a4;
  id v6 = [a3 readerModeIngestionStepContext];
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext);
    [v22 setReaderModeIngestionStepContext:v7];

    CFDictionaryRef v8 = [v6 physicalCardImageURL];

    if (v8)
    {
      uint64_t v9 = [v6 physicalCardImageURL];
      uint64_t v10 = [v9 absoluteString];
      id v11 = [v22 readerModeIngestionStepContext];
      [v11 setPhysicalCardImageURL:v10];
    }
    id v12 = [v6 title];
    uint64_t v13 = [v22 readerModeIngestionStepContext];
    [v13 setTitle:v12];

    id v14 = [v6 subtitle];
    id v15 = [v22 readerModeIngestionStepContext];
    [v15 setSubtitle:v14];

    uint64_t v16 = objc_msgSend(a1, "toNPKProtoStandaloneReaderModeIngestionState:", objc_msgSend(v6, "ingestionState"));
    v17 = [v22 readerModeIngestionStepContext];
    [v17 setIngestionState:v16];

    [v6 ingestionProgress];
    float v19 = v18;
    uint64_t v20 = [v22 readerModeIngestionStepContext];
    *(float *)&double v21 = v19;
    [v20 setIngestionProgress:v21];
  }
}

+ (void)_convertManualEntryStepContext:(id)a3 protoContext:(id)a4
{
  id v8 = a4;
  id v6 = [a3 manualEntryStepContext];
  if (v6)
  {
    v7 = [a1 toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:v6];
    [v8 setManualEntryStepContext:v7];
  }
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext);
  -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext setCameraFirstProvisioningEnabled:](v5, "setCameraFirstProvisioningEnabled:", [v4 cameraFirstProvisioningEnabled]);
  uint64_t v6 = [v4 setupFields];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [v4 setupFields];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = objc_msgSend(v4, "setupFields", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [a1 toNPKProtoStandalonePaymentSetupField:*(void *)(*((void *)&v17 + 1) + 8 * i)];
            [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)v5 addSetupFields:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }

  return v5;
}

+ (id)toNPKProtoStandalonePaymentSetupField:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupField);
  id v5 = [v3 identifier];
  [(NPKProtoStandalonePaymentSetupField *)v4 setIdentifier:v5];

  uint64_t v6 = [v3 fieldType];
  [(NPKProtoStandalonePaymentSetupField *)v4 setFieldType:+[NPKProtoStandaloneHelper toNPKProtoStandalonePaymentSetupFieldType:v6]];
  return v4;
}

+ (void)_convertSecondaryManualEntryStepContext:(id)a3 protoContext:(id)a4
{
  id v21 = a4;
  uint64_t v6 = [a3 secondaryManualEntryStepContext];
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext);
    [v21 setSecondaryManualEntryStepContext:v7];

    id v8 = [a1 toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:v6];
    uint64_t v9 = [v21 secondaryManualEntryStepContext];
    [v9 setManualEntryStepContext:v8];

    uint64_t v10 = [v6 credential];

    if (v10)
    {
      uint64_t v11 = [v6 credential];
      uint64_t v12 = [a1 toNPKProtoStandalonePaymentCredentialUnion:v11 withFlowIdentifier:0 thumbnailSize:0];
      uint64_t v13 = [v21 secondaryManualEntryStepContext];
      [v13 setCredential:v12];

      id v14 = [v6 credential];
      LODWORD(v12) = [v14 isRemoteCredential];

      if (v12)
      {
        id v15 = [v6 credential];
        uint64_t v16 = [v15 remoteCredential];
        long long v17 = [a1 toNPKProtoStandalonePaymentRemoteCredential:v16 thumbnailSize:0];
        long long v18 = [v21 secondaryManualEntryStepContext];
        [v18 setRemoteCredential:v17];
      }
    }
    uint64_t v19 = [v6 allowsAddingDifferentCard];
    long long v20 = [v21 secondaryManualEntryStepContext];
    [v20 setAllowsAddingDifferentCard:v19];
  }
}

+ (void)_convertLocalDeviceManualEntry:(id)a3 protoContext:(id)a4
{
  id v27 = a4;
  uint64_t v6 = [a3 localDeviceManualEntryStepContext];
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext);
    [v27 setLocalDeviceManualEntryStepContext:v7];

    id v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext);
    uint64_t v9 = [v27 localDeviceManualEntryStepContext];
    [v9 setSecondaryManualEntryStepContext:v8];

    uint64_t v10 = [a1 toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:v6];
    uint64_t v11 = [v27 localDeviceManualEntryStepContext];
    uint64_t v12 = [v11 secondaryManualEntryStepContext];
    [v12 setManualEntryStepContext:v10];

    uint64_t v13 = [v6 credential];

    if (v13)
    {
      id v14 = [v6 credential];
      id v15 = [a1 toNPKProtoStandalonePaymentCredentialUnion:v14 withFlowIdentifier:0 thumbnailSize:0];
      uint64_t v16 = [v27 localDeviceManualEntryStepContext];
      long long v17 = [v16 secondaryManualEntryStepContext];
      [v17 setCredential:v15];

      long long v18 = [v6 credential];
      LODWORD(v15) = [v18 isRemoteCredential];

      if (v15)
      {
        uint64_t v19 = [v6 credential];
        long long v20 = [v19 remoteCredential];
        id v21 = [a1 toNPKProtoStandalonePaymentRemoteCredential:v20 thumbnailSize:0];
        uint64_t v22 = [v27 localDeviceManualEntryStepContext];
        long long v23 = [v22 secondaryManualEntryStepContext];
        [v23 setRemoteCredential:v21];
      }
    }
    uint64_t v24 = [v6 allowsAddingDifferentCard];
    long long v25 = [v27 localDeviceManualEntryStepContext];
    long long v26 = [v25 secondaryManualEntryStepContext];
    [v26 setAllowsAddingDifferentCard:v24];
  }
}

+ (void)_convertLocalDeviceManualEntryProgress:(id)a3 protoContext:(id)a4
{
  id v9 = a4;
  id v5 = [a3 localDeviceManualEntryProgressStepContext];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext);
    [v9 setLocalDeviceManualEntryProgressStepContext:v6];

    uint64_t v7 = [v5 numericEntryPending];
    id v8 = [v9 localDeviceManualEntryProgressStepContext];
    [v8 setNumericEntryPending:v7];
  }
}

+ (void)_convertPasscodeUpgradeStepContext:(id)a3 protoContext:(id)a4
{
  id v7 = a4;
  id v5 = [a3 passcodeUpgradeStepContext];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext);
    [v7 setPasscodeUpgradeStepContext:v6];
  }
}

+ (void)_convertTermsAndConditionsStepContext:(id)a3 protoContext:(id)a4
{
  id v16 = a4;
  uint64_t v6 = [a3 termsAndConditionsStepContext];
  if (v6)
  {
    id v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext);
    [v16 setTermsAndConditionsStepContext:v7];

    id v8 = [v6 termsURL];

    if (v8)
    {
      id v9 = [v6 termsURL];
      uint64_t v10 = [v9 absoluteString];
      uint64_t v11 = [v16 termsAndConditionsStepContext];
      [v11 setTermsURL:v10];
    }
    objc_msgSend(v6, "setAllowNonSecureHTTP:", objc_msgSend(v6, "allowNonSecureHTTP"));
    uint64_t v12 = [v6 product];

    if (v12)
    {
      uint64_t v13 = [v6 product];
      id v14 = [a1 toNPKProtoStandalonePaymentSetupProduct:v13];
      id v15 = [v16 termsAndConditionsStepContext];
      [v15 setProduct:v14];
    }
  }
}

+ (void)_convertProvisioningProgressStepContext:(id)a3 protoContext:(id)a4
{
  id v15 = a4;
  uint64_t v6 = [a3 provisioningProgressStepContext];
  if (v6)
  {
    id v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext);
    [v15 setProvisioningProgressStepContext:v7];

    id v8 = [v6 product];

    if (v8)
    {
      id v9 = [v6 product];
      uint64_t v10 = [a1 toNPKProtoStandalonePaymentSetupProduct:v9];
      uint64_t v11 = [v15 provisioningProgressStepContext];
      [v11 setProduct:v10];
    }
    uint64_t v12 = [v6 localizedProgressDescription];

    if (v12)
    {
      uint64_t v13 = [v6 localizedProgressDescription];
      id v14 = [v15 provisioningProgressStepContext];
      [v14 setLocalizedProgressDescription:v13];
    }
  }
}

+ (void)_convertProvisioningResultStepContext:(id)a3 protoContext:(id)a4
{
  id v14 = a4;
  uint64_t v6 = [a3 provisioningResultStepContext];
  if (v6)
  {
    id v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext);
    [v14 setProvisioningResultStepContext:v7];

    uint64_t v8 = [v6 cardAdded];
    id v9 = [v14 provisioningResultStepContext];
    [v9 setCardAdded:v8];

    uint64_t v10 = [v6 error];

    if (v10)
    {
      uint64_t v11 = [v6 error];
      uint64_t v12 = [a1 toNPKProtoStandaloneError:v11];
      uint64_t v13 = [v14 provisioningResultStepContext];
      [v13 setError:v12];
    }
  }
}

+ (void)_convertIssuerVerificationChannelsStepContext:(id)a3 protoContext:(id)a4
{
  id v6 = a4;
  id v7 = [a3 verificationChannelsStepContext];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext);
    [v6 setIssuerVerificationChannelsStepContext:v8];

    id v9 = [v7 paymentPass];

    if (v9)
    {
      uint64_t v10 = [v7 paymentPass];
      uint64_t v11 = [a1 toNPKProtoStandalonePaymentPass:v10 thumbnailSize:0];
      uint64_t v12 = [v6 issuerVerificationChannelsStepContext];
      [v12 setPaymentPass:v11];
    }
    uint64_t v13 = [v7 verificationChannels];

    if (v13)
    {
      id v14 = [v7 verificationChannels];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __87__NPKProtoStandaloneHelper__convertIssuerVerificationChannelsStepContext_protoContext___block_invoke;
      v15[3] = &unk_2644D6548;
      id v16 = v6;
      id v17 = a1;
      [v14 enumerateObjectsUsingBlock:v15];
    }
  }
}

void __87__NPKProtoStandaloneHelper__convertIssuerVerificationChannelsStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 issuerVerificationChannelsStepContext];
  id v5 = [*(id *)(a1 + 40) toNPKProtoStandaloneVerificationChannel:v4];

  [v6 addVerificationChannels:v5];
}

+ (void)_convertIssuerVerificationFieldsStepContext:(id)a3 protoContext:(id)a4
{
  id v7 = a4;
  id v5 = [a3 verificationFieldsStepContext];
  if (v5)
  {
    id v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext);
    [v7 setIssuerVerificationFieldsStepContext:v6];
  }
}

+ (void)_convertMoreInformationStepContext:(id)a3 protoContext:(id)a4
{
  id v6 = a4;
  id v7 = [a3 moreInformationStepContext];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext);
    [v6 setMoreInformationStepContext:v8];

    id v9 = [v7 moreInfoItems];

    if (v9)
    {
      uint64_t v10 = [v7 moreInfoItems];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      id v17 = __76__NPKProtoStandaloneHelper__convertMoreInformationStepContext_protoContext___block_invoke;
      long long v18 = &unk_2644D6570;
      id v19 = v6;
      id v20 = a1;
      [v10 enumerateObjectsUsingBlock:&v15];
    }
    uint64_t v11 = objc_msgSend(v7, "paymentPass", v15, v16, v17, v18);

    if (v11)
    {
      uint64_t v12 = [v7 paymentPass];
      uint64_t v13 = [a1 toNPKProtoStandalonePaymentPass:v12 thumbnailSize:0];
      id v14 = [v6 moreInformationStepContext];
      [v14 setPaymentPass:v13];
    }
  }
}

void __76__NPKProtoStandaloneHelper__convertMoreInformationStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 moreInformationStepContext];
  id v5 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupMoreInfoItem:v4];

  [v6 addMoreInfoItems:v5];
}

+ (void)_convertIssuerVerificationCodeStepContext:(id)a3 protoContext:(id)a4
{
  id v7 = a4;
  id v5 = [a3 verificationCodeStepContext];
  if (v5)
  {
    id v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext);
    [v7 setIssuerVerificationCodeStepContext:v6];
  }
}

+ (id)_convertProtoWelcomeStepContext:(id)a3 requestContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  id v6 = [[NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc] initWithRequestContext:v20];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v5 heroImages];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x263F5C018]);
        uint64_t v15 = [v13 identifier];
        uint64_t v16 = [v13 imageData];
        id v17 = (void *)[v14 initWithIdentifier:v15 imageData:v16 credentialType:0];

        [v7 addObject:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v7 copy];
  [(NPKPaymentProvisioningFlowControllerWelcomeStepContext *)v6 setHeroImages:v18];

  return v6;
}

+ (id)fromNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 requestContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 hasWelcomeStepContext])
  {
    uint64_t v8 = [v7 welcomeStepContext];

    uint64_t v9 = [a1 _convertProtoWelcomeStepContext:v8 requestContext:v6];
  }
  else
  {
    int v10 = [v7 hasChooseFlowStepContext];

    if (v10) {
      uint64_t v9 = [[NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc] initWithRequestContext:v6];
    }
    else {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

+ (id)toNPKProtoStandalonePaymentSetupMoreInfoItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupMoreInfoItem);
  id v5 = [v3 title];

  if (v5)
  {
    id v6 = [v3 title];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setTitle:v6];
  }
  id v7 = [v3 body];

  if (v7)
  {
    uint64_t v8 = [v3 body];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setBody:v8];
  }
  uint64_t v9 = [v3 linkText];

  if (v9)
  {
    int v10 = [v3 linkText];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setLinkText:v10];
  }
  uint64_t v11 = [v3 linkURL];

  if (v11)
  {
    uint64_t v12 = [v3 linkURL];
    uint64_t v13 = [v12 absoluteString];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setLinkURL:v13];
  }
  id v14 = [v3 imageURL];

  if (v14)
  {
    uint64_t v15 = [v3 imageURL];
    uint64_t v16 = [v15 absoluteString];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setImageURL:v16];
  }
  id v17 = [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 imageURL];
  if (!v17)
  {
    long long v18 = [v3 imageData];

    if (!v18) {
      goto LABEL_15;
    }
    id v17 = [v3 imageData];
    [(NPKProtoStandalonePaymentSetupMoreInfoItem *)v4 setImageData:v17];
  }

LABEL_15:
  return v4;
}

+ (int)toNPKProtoStandalonePassType:(unint64_t)a3
{
  if (a3 == 1) {
    int v3 = 110;
  }
  else {
    int v3 = 100;
  }
  if (a3 == -1) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (int)toNPKProtoStandalonePaymentPassActivationState:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 100;
  }
  else {
    return 10 * (a3 - 1) + 110;
  }
}

+ (id)toNPKProtoStandalonePass:(id)a3 thumbnailSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NPKProtoStandalonePass);
  -[NPKProtoStandalonePass setPassType:](v7, "setPassType:", objc_msgSend(a1, "toNPKProtoStandalonePassType:", objc_msgSend(v6, "passType")));
  uint64_t v8 = NPKURLForPass(v6);
  if (v8)
  {
    [a1 passImageSize];
    if (v4) {
      [a1 passThumbnailImageSize];
    }
    if (v9 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      PKScreenSize();
      PKScreenScale();
    }
    id v12 = v8;
    uint64_t v13 = (void *)MEMORY[0x223C37110]();
    id v14 = (void *)[MEMORY[0x263F5BF50] createWithFileURL:v12 warnings:0 error:0];
    uint64_t v15 = [v14 imageSetLoadedIfNeeded:0];
    uint64_t v16 = [v15 faceImage];
    id v17 = [v16 imageData];

    [(NPKProtoStandalonePass *)v7 setImageData:v17];
  }
  long long v18 = [v6 serialNumber];
  [(NPKProtoStandalonePass *)v7 setSerialNumber:v18];

  id v19 = [v6 passTypeIdentifier];
  [(NPKProtoStandalonePass *)v7 setPassTypeIdentifier:v19];

  id v20 = [v6 localizedName];
  [(NPKProtoStandalonePass *)v7 setLocalizedName:v20];

  long long v21 = [v6 localizedDescription];
  [(NPKProtoStandalonePass *)v7 setLocalizedDescription:v21];

  long long v22 = [v6 organizationName];
  [(NPKProtoStandalonePass *)v7 setOrganizationName:v22];

  long long v23 = [v6 userInfo];

  if (v23)
  {
    long long v24 = [v6 userInfo];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67__NPKProtoStandaloneHelper_toNPKProtoStandalonePass_thumbnailSize___block_invoke;
    v27[3] = &unk_2644D6598;
    uint64_t v28 = v7;
    [v24 enumerateKeysAndObjectsUsingBlock:v27];
  }
  -[NPKProtoStandalonePass setRemotePass:](v7, "setRemotePass:", [v6 isRemotePass]);
  long long v25 = [v6 deviceName];
  [(NPKProtoStandalonePass *)v7 setDeviceName:v25];

  return v7;
}

void __67__NPKProtoStandaloneHelper_toNPKProtoStandalonePass_thumbnailSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  id v6 = objc_alloc_init(NPKProtoStandaloneUserInfo);
  [(NPKProtoStandaloneUserInfo *)v6 setKey:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NPKProtoStandaloneUserInfo *)v6 setValue:v7];
    }
  }
  [*(id *)(a1 + 32) addUserInfos:v6];
}

+ (id)sha1hash:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  BOOL v4 = [MEMORY[0x263F089D8] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

+ (id)toNPKProtoStandalonePaymentPass:(id)a3 thumbnailSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NPKProtoStandalonePaymentPass);
  uint64_t v8 = (void *)MEMORY[0x223C37110]();
  double v9 = [a1 toNPKProtoStandalonePass:v6 thumbnailSize:v4];
  [(NPKProtoStandalonePaymentPass *)v7 setPass:v9];

  double v10 = [v6 primaryAccountIdentifier];
  [(NPKProtoStandalonePaymentPass *)v7 setPrimaryAccountIdentifier:v10];

  uint64_t v11 = [v6 primaryAccountNumberSuffix];
  [(NPKProtoStandalonePaymentPass *)v7 setPrimaryAccountNumberSuffix:v11];

  id v12 = [v6 deviceAccountIdentifier];
  [(NPKProtoStandalonePaymentPass *)v7 setDeviceAccountIdentifier:v12];

  uint64_t v13 = [v6 deviceAccountNumberSuffix];
  [(NPKProtoStandalonePaymentPass *)v7 setDeviceAccountNumberSuffix:v13];

  -[NPKProtoStandalonePaymentPass setActivationState:](v7, "setActivationState:", objc_msgSend(a1, "toNPKProtoStandalonePaymentPassActivationState:", objc_msgSend(v6, "activationState")));
  id v14 = [v6 devicePrimaryPaymentApplication];

  if (v14)
  {
    uint64_t v15 = objc_alloc_init(NPKProtoStandalonePaymentApplication);
    [(NPKProtoStandalonePaymentPass *)v7 setDevicePrimaryPaymentApplication:v15];

    uint64_t v16 = [v6 devicePrimaryPaymentApplication];
    uint64_t v17 = objc_msgSend(a1, "toNPKProtoStandalonePaymentApplicationState:", objc_msgSend(v16, "state"));
    long long v18 = [(NPKProtoStandalonePaymentPass *)v7 devicePrimaryPaymentApplication];
    [v18 setState:v17];
  }

  return v7;
}

+ (int)toNPKProtoStandaloneVerificationChannelType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 110;
  }
  else {
    return dword_21EBB1848[a3 - 2];
  }
}

+ (id)toNPKProtoStandaloneVerificationChannel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(NPKProtoStandaloneVerificationChannel);
  id v6 = [v4 identifier];
  [(NPKProtoStandaloneVerificationChannel *)v5 setIdentifier:v6];

  -[NPKProtoStandaloneVerificationChannel setType:](v5, "setType:", objc_msgSend(a1, "toNPKProtoStandaloneVerificationChannelType:", objc_msgSend(v4, "type")));
  id v7 = [v4 typeDescriptionUnlocalized];
  [(NPKProtoStandaloneVerificationChannel *)v5 setTypeDescriptionUnlocalized:v7];

  uint64_t v8 = [v4 typeDescription];
  [(NPKProtoStandaloneVerificationChannel *)v5 setTypeDescription:v8];

  double v9 = [v4 organizationName];
  [(NPKProtoStandaloneVerificationChannel *)v5 setOrganizationName:v9];

  -[NPKProtoStandaloneVerificationChannel setRequiresUserInteraction:](v5, "setRequiresUserInteraction:", [v4 requiresUserInteraction]);
  double v10 = [v4 contactPoint];
  [(NPKProtoStandaloneVerificationChannel *)v5 setContactPoint:v10];

  uint64_t v11 = [v4 sourceAddress];

  [(NPKProtoStandaloneVerificationChannel *)v5 setSourceAddress:v11];
  return v5;
}

+ (int)toNPKProtoStandalonePaymentApplicationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return 100;
  }
  else {
    return dword_21EBB1864[a3 - 1];
  }
}

+ (id)toNPKProtoStandalonePaymentCredential:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NPKProtoStandalonePaymentCredential);
  id v5 = [v3 sanitizedPrimaryAccountNumber];
  [(NPKProtoStandalonePaymentCredential *)v4 setSanitizedPrimaryAccountNumber:v5];

  id v6 = [v3 expiration];
  [(NPKProtoStandalonePaymentCredential *)v4 setExpiration:v6];

  id v7 = [v3 longDescription];

  [(NPKProtoStandalonePaymentCredential *)v4 setLongDescription:v7];
  return v4;
}

+ (id)toNPKProtoStandalonePaymentCredentialUnion:(id)a3 withFlowIdentifier:(id)a4 thumbnailSize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = objc_alloc_init(NPKProtoStandalonePaymentCredentialUnion);
  [(NPKProtoStandalonePaymentCredentialUnion *)v10 setFlowIdentifier:v9];

  uint64_t v11 = [v8 remoteCredential];
  if (v11)
  {
    id v12 = [a1 toNPKProtoStandalonePaymentRemoteCredential:v11 thumbnailSize:v5];
    [(NPKProtoStandalonePaymentCredentialUnion *)v10 setRemoteCredential:v12];
  }
  uint64_t v13 = [v8 accountCredential];
  if (v13)
  {
    id v14 = [a1 toNPKProtoStandaloneCreditAccountCredential:v13 thumbnailSize:v5];
    [(NPKProtoStandalonePaymentCredentialUnion *)v10 setCreditAccountCredential:v14];
  }
  return v10;
}

+ (id)toNPKProtoStandalonePaymentRemoteCredential:(id)a3 thumbnailSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NPKProtoStandalonePaymentRemoteCredential);
  id v8 = [a1 toNPKProtoStandalonePaymentCredential:v6];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setPaymentCredential:v8];

  id v9 = [v6 identifier];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setIdentifier:v9];

  double v10 = [v6 passURL];
  uint64_t v11 = [v10 absoluteString];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setPassURL:v11];

  id v12 = [v6 summaryMetadataDescription];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setSummaryMetadataDescription:v12];

  uint64_t v13 = [v6 statusDescription];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setStatusDescription:v13];

  id v14 = [v6 paymentPass];
  uint64_t v15 = [a1 toNPKProtoStandalonePaymentPass:v14 thumbnailSize:v4];
  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setPaymentPass:v15];

  -[NPKProtoStandalonePaymentRemoteCredential setRank:](v7, "setRank:", [v6 rank]);
  uint64_t v16 = [v6 productIdentifier];

  [(NPKProtoStandalonePaymentRemoteCredential *)v7 setProductIdentifier:v16];
  return v7;
}

+ (id)toNPKProtoStandaloneCreditAccountCredential:(id)a3 thumbnailSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NPKProtoStandaloneCreditAccountCredential);
  id v8 = [a1 toNPKProtoStandalonePaymentCredential:v6];
  [(NPKProtoStandaloneCreditAccountCredential *)v7 setPaymentCredential:v8];

  id v9 = [v6 paymentPass];
  double v10 = [a1 toNPKProtoStandalonePaymentPass:v9 thumbnailSize:v4];
  [(NPKProtoStandaloneCreditAccountCredential *)v7 setPaymentPass:v10];

  uint64_t v11 = [v6 account];
  id v12 = [v11 creditDetails];
  uint64_t v13 = [v12 currencyCode];
  [(NPKProtoStandaloneCreditAccountCredential *)v7 setCurrencyCode:v13];

  id v14 = [v6 account];
  uint64_t v15 = [v14 creditDetails];
  uint64_t v16 = [v15 accountSummary];
  uint64_t v17 = [v16 currentBalance];
  [v17 doubleValue];
  -[NPKProtoStandaloneCreditAccountCredential setCurrentBalance:](v7, "setCurrentBalance:");

  long long v18 = [v6 account];

  id v19 = [v18 creditDetails];
  id v20 = [v19 accountSummary];
  long long v21 = [v20 creditLimit];
  [v21 doubleValue];
  -[NPKProtoStandaloneCreditAccountCredential setCreditLimit:](v7, "setCreditLimit:");

  return v7;
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerSection:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPickerSection);
  id v6 = [v4 title];
  [(NPKProtoStandalonePaymentProvisioningFlowPickerSection *)v5 setTitle:v6];

  id v7 = [v4 footer];
  [(NPKProtoStandalonePaymentProvisioningFlowPickerSection *)v5 setFooter:v7];

  id v8 = [v4 items];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerSection___block_invoke;
  v11[3] = &unk_2644D65C0;
  id v9 = v5;
  id v12 = v9;
  id v13 = a1;
  [v8 enumerateObjectsUsingBlock:v11];

  return v9;
}

void __85__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerSection___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentProvisioningFlowPickerItem:a2];
  [v2 addItems:v3];
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPickerItem);
  id v6 = [v4 title];
  [(NPKProtoStandalonePaymentProvisioningFlowPickerItem *)v5 setTitle:v6];

  id v7 = [v4 identifier];
  [(NPKProtoStandalonePaymentProvisioningFlowPickerItem *)v5 setIdentifier:v7];

  id v8 = [v4 products];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerItem___block_invoke;
  v11[3] = &unk_2644D64F8;
  id v9 = v5;
  id v12 = v9;
  id v13 = a1;
  [v8 enumerateObjectsUsingBlock:v11];

  return v9;
}

void __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerItem___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupProduct:a2];
  [v2 addProducts:v3];
}

+ (id)toNPKProtoStandalonePaymentSetupProduct:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentSetupProduct);
  id v6 = [v4 displayName];
  [(NPKProtoStandalonePaymentSetupProduct *)v5 setDisplayName:v6];

  id v7 = [v4 regions];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke;
  v44[3] = &unk_2644D65E8;
  id v8 = v5;
  v45 = v8;
  [v7 enumerateObjectsUsingBlock:v44];

  id v9 = [v4 productIdentifier];
  [(NPKProtoStandalonePaymentSetupProduct *)v8 setProductIdentifier:v9];

  double v10 = [v4 partnerIdentifier];
  [(NPKProtoStandalonePaymentSetupProduct *)v8 setPartnerIdentifier:v10];

  uint64_t v11 = [v4 partnerName];
  [(NPKProtoStandalonePaymentSetupProduct *)v8 setPartnerName:v11];

  id v12 = [v4 requiredFields];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_2;
  v41[3] = &unk_2644D6610;
  id v13 = v8;
  v42 = v13;
  id v43 = a1;
  [v12 enumerateObjectsUsingBlock:v41];

  id v14 = [v4 supportedProtocols];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_3;
  v39[3] = &unk_2644D3188;
  uint64_t v15 = v13;
  v40 = v15;
  [v14 enumerateObjectsUsingBlock:v39];

  uint64_t v16 = [v4 termsURL];

  if (v16)
  {
    uint64_t v17 = [v4 termsURL];
    long long v18 = [v17 absoluteString];
    [(NPKProtoStandalonePaymentSetupProduct *)v15 setTermsURL:v18];
  }
  -[NPKProtoStandalonePaymentSetupProduct setSupportedProvisioningMethods:](v15, "setSupportedProvisioningMethods:", [v4 supportedProvisioningMethods]);
  id v19 = [v4 readerModeMetadata];
  id v20 = [a1 toJsonString:v19];

  if (v20) {
    [(NPKProtoStandalonePaymentSetupProduct *)v15 setReaderModeMetadataJson:v20];
  }
  -[NPKProtoStandalonePaymentSetupProduct setFlags:](v15, "setFlags:", [v4 flags]);
  -[NPKProtoStandalonePaymentSetupProduct setHsa2Requirement:](v15, "setHsa2Requirement:", [v4 hsa2Requirement]);
  long long v21 = [v4 imageAssetURLs];

  if (v21)
  {
    long long v22 = [v4 imageAssetURLs];
    long long v23 = [a1 toNPKProtoStandalonePaymentSetupProductImageAssetURLs:v22];
    [(NPKProtoStandalonePaymentSetupProduct *)v15 setImageAssetURLs:v23];
  }
  -[NPKProtoStandalonePaymentSetupProduct setSuppressPendingPurchases:](v15, "setSuppressPendingPurchases:", [v4 suppressPendingPurchases]);
  long long v24 = [v4 paymentOptions];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_4;
  v36[3] = &unk_2644D6638;
  long long v25 = v15;
  v37 = v25;
  id v38 = a1;
  [v24 enumerateObjectsUsingBlock:v36];

  uint64_t v26 = [v4 provisioningMethodTypes];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_5;
  v32[3] = &unk_2644D6520;
  id v33 = v4;
  id v35 = a1;
  id v27 = v25;
  uint64_t v34 = v27;
  id v28 = v4;
  [v26 enumerateObjectsUsingBlock:v32];

  long long v29 = v34;
  long long v30 = v27;

  return v30;
}

uint64_t __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRegions:a2];
}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupField:a2];
  [v2 addRequiredFields:v3];
}

uint64_t __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSupportedProtocols:a2];
}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_4(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupProductPaymentOption:a2];
  [v2 addPaymentOptions:v3];
}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    id v4 = [a1[4] provisioningMethodMetadataForType:v3];
    if (v4)
    {
      BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry);
      [(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry *)v5 setType:v7];
      id v6 = [a1[6] toNPKProtoStandalonePaymentProvisioningMethodMetadata:v4];
      [(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry *)v5 setMetadata:v6];

      [a1[5] addRequestedProvisioningMethods:v5];
    }

    id v3 = v7;
  }
}

+ (id)toNPKProtoStandalonePaymentProvisioningMethodMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningMethodMetadata);
  id v6 = [v4 productIdentifier];

  if (v6)
  {
    id v7 = [v4 productIdentifier];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v5 setProductIdentifier:v7];
  }
  id v8 = [v4 currency];

  if (v8)
  {
    id v9 = [v4 currency];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v5 setCurrency:v9];
  }
  double v10 = [v4 depositAmount];

  if (v10)
  {
    uint64_t v11 = [v4 depositAmount];
    id v12 = [v11 stringValue];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v5 setDepositAmount:v12];
  }
  id v13 = [v4 minLoadedBalance];

  if (v13)
  {
    id v14 = [v4 minLoadedBalance];
    uint64_t v15 = [v14 stringValue];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v5 setMinLoadedBalance:v15];
  }
  uint64_t v16 = [v4 maxLoadedBalance];

  if (v16)
  {
    uint64_t v17 = [v4 maxLoadedBalance];
    long long v18 = [v17 stringValue];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v5 setMaxLoadedBalance:v18];
  }
  id v19 = [v4 requiredFields];
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  id v35 = __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningMethodMetadata___block_invoke;
  v36 = &unk_2644D6610;
  id v20 = v5;
  v37 = v20;
  id v38 = a1;
  [v19 enumerateObjectsUsingBlock:&v33];

  long long v21 = objc_msgSend(v4, "readerModeMetadata", v33, v34, v35, v36);
  long long v22 = [a1 toJsonString:v21];

  if (v22) {
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v20 setReaderModeMetadataJson:v22];
  }
  long long v23 = [v4 digitalIssuanceMetadata];

  if (v23)
  {
    long long v24 = [v4 digitalIssuanceMetadata];
    long long v25 = [a1 toNPKProtoStandalonePaymentDigitalIssuanceMetadata:v24];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v20 setDigitalIssuanceMetadata:v25];
  }
  uint64_t v26 = [v4 readerModeResources];
  id v27 = [a1 toJsonString:v26];

  if (v27) {
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v20 setReaderModeResourcesJson:v27];
  }
  id v28 = [v4 minimumReaderModeBalance];

  if (v28)
  {
    long long v29 = [v4 minimumReaderModeBalance];
    long long v30 = [v29 stringValue];
    [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)v20 setMinimumReaderModeBalance:v30];
  }
  long long v31 = v20;

  return v31;
}

void __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningMethodMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) toNPKProtoStandalonePaymentSetupField:a2];
  [v2 addRequiredFields:v3];
}

+ (id)toNPKProtoStandalonePaymentDigitalIssuanceMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKProtoStandalonePaymentDigitalIssuanceMetadata);
  id v6 = [v4 serviceProviderIdentifier];

  if (v6)
  {
    id v7 = [v4 serviceProviderIdentifier];
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v5 setServiceProviderIdentifier:v7];
  }
  id v8 = [v4 serviceProviderCountryCode];

  if (v8)
  {
    id v9 = [v4 serviceProviderCountryCode];
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v5 setServiceProviderCountryCode:v9];
  }
  double v10 = [v4 serviceProviderCountryCode];

  if (v10)
  {
    uint64_t v11 = [v4 serviceProviderCountryCode];
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v5 setServiceProviderCountryCode:v11];
  }
  id v12 = [v4 serviceProviderAcceptedNetworks];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke;
  v31[3] = &unk_2644D3188;
  id v13 = v5;
  long long v32 = v13;
  [v12 enumerateObjectsUsingBlock:v31];

  id v14 = [v4 serviceProviderCapabilities];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_2;
  v29[3] = &unk_2644D3188;
  uint64_t v15 = v13;
  long long v30 = v15;
  [v14 enumerateObjectsUsingBlock:v29];

  uint64_t v16 = [v4 serviceProviderDict];
  uint64_t v17 = [a1 toJsonString:v16];

  if (v17) {
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v15 setServiceProviderDictJson:v17];
  }
  long long v18 = [v4 action];

  if (v18)
  {
    id v19 = [v4 action];
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v15 setAction:v19];
  }
  id v20 = [v4 merchantID];

  if (v20)
  {
    long long v21 = [v4 merchantID];
    [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)v15 setMerchantID:v21];
  }
  long long v22 = [v4 defaultSuggestions];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_3;
  v27[3] = &unk_2644D6660;
  long long v23 = v15;
  id v28 = v23;
  [v22 enumerateObjectsUsingBlock:v27];

  long long v24 = v28;
  long long v25 = v23;

  return v25;
}

uint64_t __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addServiceProviderAcceptedNetworks:a2];
}

uint64_t __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addServiceProviderCapabilities:a2];
}

void __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  [v2 addDefaultSuggestions:v3];
}

+ (id)toNPKProtoStandalonePaymentSetupProductPaymentOption:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupProductPaymentOption);
  -[NPKProtoStandalonePaymentSetupProductPaymentOption setPriority:](v4, "setPriority:", [v3 priority]);
  -[NPKProtoStandalonePaymentSetupProductPaymentOption setCardType:](v4, "setCardType:", [v3 cardType]);
  uint64_t v5 = [v3 supportedProtocols];

  [(NPKProtoStandalonePaymentSetupProductPaymentOption *)v4 setSupportedProtocols:v5];
  return v4;
}

+ (id)toNPKProtoStandalonePaymentSetupProductImageAssetURLs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupProductImageAssetURLs);
  uint64_t v5 = [v3 digitalCardImageUrl];

  if (v5)
  {
    id v6 = [v3 digitalCardImageUrl];
    id v7 = [v6 absoluteString];
    [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)v4 setDigitalCardImageUrl:v7];
  }
  id v8 = [v3 thumbnailImageUrl];

  if (v8)
  {
    id v9 = [v3 thumbnailImageUrl];
    double v10 = [v9 absoluteString];
    [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)v4 setThumbnailImageUrl:v10];
  }
  uint64_t v11 = [v3 logoImageUrl];

  if (v11)
  {
    id v12 = [v3 logoImageUrl];
    id v13 = [v12 absoluteString];
    [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)v4 setLogoImageUrl:v13];
  }
  return v4;
}

+ (id)toJsonString:(id)a3
{
  id v3 = a3;
  if (v3
    && ([MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:0],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = (void *)v4;
    id v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (int)toNPKProtoStandaloneReaderModeIngestionState:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    return 100;
  }
  else {
    return 10 * (a3 - 1) + 110;
  }
}

+ (id)toPKPaymentSetupField:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "toPKPaymentSetupFieldType:", objc_msgSend(v4, "fieldType"));
  id v6 = (void *)MEMORY[0x263F5C0C0];
  id v7 = [v4 identifier];

  id v8 = [v6 paymentSetupFieldWithIdentifier:v7 type:v5];

  return v8;
}

+ (unint64_t)toPKPaymentSetupFieldType:(int)a3
{
  unint64_t v3 = 3;
  uint64_t v4 = 4;
  uint64_t v5 = 5;
  if (a3 != 150) {
    uint64_t v5 = 0;
  }
  if (a3 != 140) {
    uint64_t v4 = v5;
  }
  if (a3 != 130) {
    unint64_t v3 = v4;
  }
  unint64_t v6 = 1;
  uint64_t v7 = 2;
  if (a3 != 120) {
    uint64_t v7 = 0;
  }
  if (a3 != 110) {
    unint64_t v6 = v7;
  }
  if (a3 <= 129) {
    return v6;
  }
  else {
    return v3;
  }
}

@end