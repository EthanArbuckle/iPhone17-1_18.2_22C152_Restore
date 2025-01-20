@interface NPKProtoStandalonePaymentProvisioningFlowResponse
- (BOOL)hasContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentProvisioningFlowStepContext)context;
- (NPKProtoStandaloneResponseHeader)responseHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fromStepAsString:(int)a3;
- (id)toStepAsString:(int)a3;
- (int)StringAsFromStep:(id)a3;
- (int)StringAsToStep:(id)a3;
- (int)fromStep;
- (int)toStep;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setFromStep:(int)a3;
- (void)setResponseHeader:(id)a3;
- (void)setToStep:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowResponse

- (id)fromStepAsString:(int)a3
{
  if (a3 > 179)
  {
    if (a3 > 209)
    {
      if (a3 <= 239)
      {
        switch(a3)
        {
          case 210:
            v4 = @"ProvisioningProgress";
            break;
          case 220:
            v4 = @"ProvisioningResult";
            break;
          case 230:
            v4 = @"IssuerVerificationChannels";
            break;
          default:
            goto LABEL_114;
        }
      }
      else if (a3 > 259)
      {
        if (a3 == 260)
        {
          v4 = @"AppleBalanceAccountDetails";
        }
        else
        {
          if (a3 != 300) {
            goto LABEL_114;
          }
          v4 = @"GetIssuerApplicationAddRequest";
        }
      }
      else if (a3 == 240)
      {
        v4 = @"IssuerVerificationFields";
      }
      else
      {
        if (a3 != 250) {
          goto LABEL_114;
        }
        v4 = @"IssuerVerificationCode";
      }
    }
    else
    {
      switch(a3)
      {
        case 190:
          v4 = @"SecondaryManualEntry";
          break;
        case 191:
        case 194:
        case 196:
        case 198:
        case 199:
          goto LABEL_114;
        case 192:
          v4 = @"LocalDeviceManualEntry";
          break;
        case 193:
          v4 = @"LocalDeviceManualEntryProgress";
          break;
        case 195:
          v4 = @"ProductDisambiguation";
          break;
        case 197:
          v4 = @"PasscodeUpgrade";
          break;
        case 200:
          v4 = @"TermsAndConditions";
          break;
        default:
          if (a3 != 180) {
            goto LABEL_114;
          }
          v4 = @"ManualEntry";
          break;
      }
    }
  }
  else if (a3 <= 134)
  {
    if (a3 > 119)
    {
      if (a3 == 120)
      {
        v4 = @"Welcome";
      }
      else
      {
        if (a3 != 130) {
          goto LABEL_114;
        }
        v4 = @"ChooseFlow";
      }
    }
    else if (a3 == 100)
    {
      v4 = @"Initialized";
    }
    else
    {
      if (a3 != 110) {
        goto LABEL_114;
      }
      v4 = @"Preconditions";
    }
  }
  else
  {
    if (a3 <= 154)
    {
      switch(a3)
      {
        case 135:
          v4 = @"ChooseProduct";
          break;
        case 137:
          v4 = @"ChooseTransitProduct";
          break;
        case 138:
          v4 = @"ChooseEMoneyProduct";
          break;
        case 140:
          v4 = @"ChooseCredentials";
          break;
        case 144:
          v4 = @"ChooseTransitProductType";
          break;
        case 145:
          v4 = @"ChooseServiceProviderProducts";
          break;
        case 150:
          v4 = @"DigitalIssuanceAmount";
          break;
        default:
          goto LABEL_114;
      }
      return v4;
    }
    if (a3 > 159)
    {
      if (a3 == 160)
      {
        v4 = @"ReaderModeEntry";
      }
      else
      {
        if (a3 != 165) {
          goto LABEL_114;
        }
        v4 = @"ReaderModeIngestion";
      }
    }
    else
    {
      if (a3 != 155)
      {
        if (a3 == 157)
        {
          v4 = @"MoreInformation";
          return v4;
        }
LABEL_114:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      v4 = @"DigitalIssuancePayment";
    }
  }
  return v4;
}

- (int)StringAsFromStep:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Initialized"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Preconditions"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Welcome"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"ChooseFlow"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"ChooseProduct"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"ChooseTransitProduct"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"ChooseEMoneyProduct"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"ChooseCredentials"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"ChooseTransitProductType"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"ChooseServiceProviderProducts"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"DigitalIssuanceAmount"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"DigitalIssuancePayment"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"MoreInformation"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"ReaderModeEntry"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestion"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"ManualEntry"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"SecondaryManualEntry"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"LocalDeviceManualEntry"])
  {
    int v4 = 192;
  }
  else if ([v3 isEqualToString:@"LocalDeviceManualEntryProgress"])
  {
    int v4 = 193;
  }
  else if ([v3 isEqualToString:@"ProductDisambiguation"])
  {
    int v4 = 195;
  }
  else if ([v3 isEqualToString:@"PasscodeUpgrade"])
  {
    int v4 = 197;
  }
  else if ([v3 isEqualToString:@"TermsAndConditions"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"ProvisioningProgress"])
  {
    int v4 = 210;
  }
  else if ([v3 isEqualToString:@"ProvisioningResult"])
  {
    int v4 = 220;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationChannels"])
  {
    int v4 = 230;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationFields"])
  {
    int v4 = 240;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationCode"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"AppleBalanceAccountDetails"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"GetIssuerApplicationAddRequest"])
  {
    int v4 = 300;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (id)toStepAsString:(int)a3
{
  if (a3 > 179)
  {
    if (a3 > 209)
    {
      if (a3 <= 239)
      {
        switch(a3)
        {
          case 210:
            int v4 = @"ProvisioningProgress";
            break;
          case 220:
            int v4 = @"ProvisioningResult";
            break;
          case 230:
            int v4 = @"IssuerVerificationChannels";
            break;
          default:
            goto LABEL_114;
        }
      }
      else if (a3 > 259)
      {
        if (a3 == 260)
        {
          int v4 = @"AppleBalanceAccountDetails";
        }
        else
        {
          if (a3 != 300) {
            goto LABEL_114;
          }
          int v4 = @"GetIssuerApplicationAddRequest";
        }
      }
      else if (a3 == 240)
      {
        int v4 = @"IssuerVerificationFields";
      }
      else
      {
        if (a3 != 250) {
          goto LABEL_114;
        }
        int v4 = @"IssuerVerificationCode";
      }
    }
    else
    {
      switch(a3)
      {
        case 190:
          int v4 = @"SecondaryManualEntry";
          break;
        case 191:
        case 194:
        case 196:
        case 198:
        case 199:
          goto LABEL_114;
        case 192:
          int v4 = @"LocalDeviceManualEntry";
          break;
        case 193:
          int v4 = @"LocalDeviceManualEntryProgress";
          break;
        case 195:
          int v4 = @"ProductDisambiguation";
          break;
        case 197:
          int v4 = @"PasscodeUpgrade";
          break;
        case 200:
          int v4 = @"TermsAndConditions";
          break;
        default:
          if (a3 != 180) {
            goto LABEL_114;
          }
          int v4 = @"ManualEntry";
          break;
      }
    }
  }
  else if (a3 <= 134)
  {
    if (a3 > 119)
    {
      if (a3 == 120)
      {
        int v4 = @"Welcome";
      }
      else
      {
        if (a3 != 130) {
          goto LABEL_114;
        }
        int v4 = @"ChooseFlow";
      }
    }
    else if (a3 == 100)
    {
      int v4 = @"Initialized";
    }
    else
    {
      if (a3 != 110) {
        goto LABEL_114;
      }
      int v4 = @"Preconditions";
    }
  }
  else
  {
    if (a3 <= 154)
    {
      switch(a3)
      {
        case 135:
          int v4 = @"ChooseProduct";
          break;
        case 137:
          int v4 = @"ChooseTransitProduct";
          break;
        case 138:
          int v4 = @"ChooseEMoneyProduct";
          break;
        case 140:
          int v4 = @"ChooseCredentials";
          break;
        case 144:
          int v4 = @"ChooseTransitProductType";
          break;
        case 145:
          int v4 = @"ChooseServiceProviderProducts";
          break;
        case 150:
          int v4 = @"DigitalIssuanceAmount";
          break;
        default:
          goto LABEL_114;
      }
      return v4;
    }
    if (a3 > 159)
    {
      if (a3 == 160)
      {
        int v4 = @"ReaderModeEntry";
      }
      else
      {
        if (a3 != 165) {
          goto LABEL_114;
        }
        int v4 = @"ReaderModeIngestion";
      }
    }
    else
    {
      if (a3 != 155)
      {
        if (a3 == 157)
        {
          int v4 = @"MoreInformation";
          return v4;
        }
LABEL_114:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"DigitalIssuancePayment";
    }
  }
  return v4;
}

- (int)StringAsToStep:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Initialized"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Preconditions"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"Welcome"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"ChooseFlow"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"ChooseProduct"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"ChooseTransitProduct"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"ChooseEMoneyProduct"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"ChooseCredentials"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"ChooseTransitProductType"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"ChooseServiceProviderProducts"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"DigitalIssuanceAmount"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"DigitalIssuancePayment"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"MoreInformation"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"ReaderModeEntry"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestion"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"ManualEntry"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"SecondaryManualEntry"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"LocalDeviceManualEntry"])
  {
    int v4 = 192;
  }
  else if ([v3 isEqualToString:@"LocalDeviceManualEntryProgress"])
  {
    int v4 = 193;
  }
  else if ([v3 isEqualToString:@"ProductDisambiguation"])
  {
    int v4 = 195;
  }
  else if ([v3 isEqualToString:@"PasscodeUpgrade"])
  {
    int v4 = 197;
  }
  else if ([v3 isEqualToString:@"TermsAndConditions"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"ProvisioningProgress"])
  {
    int v4 = 210;
  }
  else if ([v3 isEqualToString:@"ProvisioningResult"])
  {
    int v4 = 220;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationChannels"])
  {
    int v4 = 230;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationFields"])
  {
    int v4 = 240;
  }
  else if ([v3 isEqualToString:@"IssuerVerificationCode"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"AppleBalanceAccountDetails"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"GetIssuerApplicationAddRequest"])
  {
    int v4 = 300;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowResponse;
  int v4 = [(NPKProtoStandalonePaymentProvisioningFlowResponse *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    v5 = [(NPKProtoStandaloneResponseHeader *)responseHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"responseHeader"];
  }
  int fromStep = self->_fromStep;
  if (fromStep <= 179)
  {
    if (fromStep <= 134)
    {
      if (fromStep > 119)
      {
        if (fromStep == 120)
        {
          v7 = @"Welcome";
          goto LABEL_59;
        }
        if (fromStep == 130)
        {
          v7 = @"ChooseFlow";
          goto LABEL_59;
        }
      }
      else
      {
        if (fromStep == 100)
        {
          v7 = @"Initialized";
          goto LABEL_59;
        }
        if (fromStep == 110)
        {
          v7 = @"Preconditions";
          goto LABEL_59;
        }
      }
    }
    else
    {
      if (fromStep <= 154)
      {
        switch(fromStep)
        {
          case 135:
            v7 = @"ChooseProduct";
            break;
          case 137:
            v7 = @"ChooseTransitProduct";
            break;
          case 138:
            v7 = @"ChooseEMoneyProduct";
            break;
          case 140:
            v7 = @"ChooseCredentials";
            break;
          case 144:
            v7 = @"ChooseTransitProductType";
            break;
          case 145:
            v7 = @"ChooseServiceProviderProducts";
            break;
          case 150:
            v7 = @"DigitalIssuanceAmount";
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      if (fromStep > 159)
      {
        if (fromStep == 160)
        {
          v7 = @"ReaderModeEntry";
          goto LABEL_59;
        }
        if (fromStep == 165)
        {
          v7 = @"ReaderModeIngestion";
          goto LABEL_59;
        }
      }
      else
      {
        if (fromStep == 155)
        {
          v7 = @"DigitalIssuancePayment";
          goto LABEL_59;
        }
        if (fromStep == 157)
        {
          v7 = @"MoreInformation";
          goto LABEL_59;
        }
      }
    }
LABEL_58:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fromStep);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (fromStep > 209)
  {
    if (fromStep <= 239)
    {
      switch(fromStep)
      {
        case 210:
          v7 = @"ProvisioningProgress";
          goto LABEL_59;
        case 220:
          v7 = @"ProvisioningResult";
          goto LABEL_59;
        case 230:
          v7 = @"IssuerVerificationChannels";
          goto LABEL_59;
      }
    }
    else if (fromStep > 259)
    {
      if (fromStep == 260)
      {
        v7 = @"AppleBalanceAccountDetails";
        goto LABEL_59;
      }
      if (fromStep == 300)
      {
        v7 = @"GetIssuerApplicationAddRequest";
        goto LABEL_59;
      }
    }
    else
    {
      if (fromStep == 240)
      {
        v7 = @"IssuerVerificationFields";
        goto LABEL_59;
      }
      if (fromStep == 250)
      {
        v7 = @"IssuerVerificationCode";
        goto LABEL_59;
      }
    }
    goto LABEL_58;
  }
  switch(fromStep)
  {
    case 190:
      v7 = @"SecondaryManualEntry";
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_58;
    case 192:
      v7 = @"LocalDeviceManualEntry";
      break;
    case 193:
      v7 = @"LocalDeviceManualEntryProgress";
      break;
    case 195:
      v7 = @"ProductDisambiguation";
      break;
    case 197:
      v7 = @"PasscodeUpgrade";
      break;
    case 200:
      v7 = @"TermsAndConditions";
      break;
    default:
      if (fromStep != 180) {
        goto LABEL_58;
      }
      v7 = @"ManualEntry";
      break;
  }
LABEL_59:
  [v3 setObject:v7 forKey:@"fromStep"];

  int toStep = self->_toStep;
  if (toStep <= 179)
  {
    if (toStep <= 134)
    {
      if (toStep > 119)
      {
        if (toStep == 120)
        {
          v9 = @"Welcome";
          goto LABEL_115;
        }
        if (toStep == 130)
        {
          v9 = @"ChooseFlow";
          goto LABEL_115;
        }
      }
      else
      {
        if (toStep == 100)
        {
          v9 = @"Initialized";
          goto LABEL_115;
        }
        if (toStep == 110)
        {
          v9 = @"Preconditions";
          goto LABEL_115;
        }
      }
    }
    else
    {
      if (toStep <= 154)
      {
        switch(toStep)
        {
          case 135:
            v9 = @"ChooseProduct";
            break;
          case 137:
            v9 = @"ChooseTransitProduct";
            break;
          case 138:
            v9 = @"ChooseEMoneyProduct";
            break;
          case 140:
            v9 = @"ChooseCredentials";
            break;
          case 144:
            v9 = @"ChooseTransitProductType";
            break;
          case 145:
            v9 = @"ChooseServiceProviderProducts";
            break;
          case 150:
            v9 = @"DigitalIssuanceAmount";
            break;
          default:
            goto LABEL_114;
        }
        goto LABEL_115;
      }
      if (toStep > 159)
      {
        if (toStep == 160)
        {
          v9 = @"ReaderModeEntry";
          goto LABEL_115;
        }
        if (toStep == 165)
        {
          v9 = @"ReaderModeIngestion";
          goto LABEL_115;
        }
      }
      else
      {
        if (toStep == 155)
        {
          v9 = @"DigitalIssuancePayment";
          goto LABEL_115;
        }
        if (toStep == 157)
        {
          v9 = @"MoreInformation";
          goto LABEL_115;
        }
      }
    }
LABEL_114:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_toStep);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_115;
  }
  if (toStep > 209)
  {
    if (toStep <= 239)
    {
      switch(toStep)
      {
        case 210:
          v9 = @"ProvisioningProgress";
          goto LABEL_115;
        case 220:
          v9 = @"ProvisioningResult";
          goto LABEL_115;
        case 230:
          v9 = @"IssuerVerificationChannels";
          goto LABEL_115;
      }
    }
    else if (toStep > 259)
    {
      if (toStep == 260)
      {
        v9 = @"AppleBalanceAccountDetails";
        goto LABEL_115;
      }
      if (toStep == 300)
      {
        v9 = @"GetIssuerApplicationAddRequest";
        goto LABEL_115;
      }
    }
    else
    {
      if (toStep == 240)
      {
        v9 = @"IssuerVerificationFields";
        goto LABEL_115;
      }
      if (toStep == 250)
      {
        v9 = @"IssuerVerificationCode";
        goto LABEL_115;
      }
    }
    goto LABEL_114;
  }
  switch(toStep)
  {
    case 190:
      v9 = @"SecondaryManualEntry";
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_114;
    case 192:
      v9 = @"LocalDeviceManualEntry";
      break;
    case 193:
      v9 = @"LocalDeviceManualEntryProgress";
      break;
    case 195:
      v9 = @"ProductDisambiguation";
      break;
    case 197:
      v9 = @"PasscodeUpgrade";
      break;
    case 200:
      v9 = @"TermsAndConditions";
      break;
    default:
      if (toStep != 180) {
        goto LABEL_114;
      }
      v9 = @"ManualEntry";
      break;
  }
LABEL_115:
  [v3 setObject:v9 forKey:@"toStep"];

  context = self->_context;
  if (context)
  {
    v11 = [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)context dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"context"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_context) {
    PBDataWriterWriteSubmessage();
  }
  if (!self->_responseHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[4] = self->_fromStep;
  v4[8] = self->_toStep;
  v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    id v4 = v5;
  }
  [v4 setResponseHeader:self->_responseHeader];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_fromStep;
  *(_DWORD *)(v5 + 32) = self->_toStep;
  id v6 = [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)self->_context copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_fromStep == *((_DWORD *)v4 + 4)
    && self->_toStep == *((_DWORD *)v4 + 8)
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[NPKProtoStandalonePaymentProvisioningFlowStepContext isEqual:](context, "isEqual:")))
  {
    responseHeader = self->_responseHeader;
    if ((unint64_t)responseHeader | v4[3]) {
      char v7 = -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_toStep) ^ (2654435761 * self->_fromStep);
  unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)self->_context hash];
  return v3 ^ v4 ^ [(NPKProtoStandaloneResponseHeader *)self->_responseHeader hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_int fromStep = v4[4];
  self->_int toStep = v4[8];
  context = self->_context;
  uint64_t v6 = *((void *)v4 + 1);
  v9 = v4;
  if (context)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext mergeFrom:](context, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowResponse setContext:](self, "setContext:");
  }
  unint64_t v4 = v9;
LABEL_7:
  responseHeader = self->_responseHeader;
  uint64_t v8 = *((void *)v4 + 3);
  if (responseHeader)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowResponse setResponseHeader:](self, "setResponseHeader:");
  }
  unint64_t v4 = v9;
LABEL_13:
}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
}

- (int)fromStep
{
  return self->_fromStep;
}

- (void)setFromStep:(int)a3
{
  self->_int fromStep = a3;
}

- (int)toStep
{
  return self->_toStep;
}

- (void)setToStep:(int)a3
{
  self->_int toStep = a3;
}

- (NPKProtoStandalonePaymentProvisioningFlowStepContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowResponse writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowResponse.m", 159, "self->_responseHeader != nil");
}

@end