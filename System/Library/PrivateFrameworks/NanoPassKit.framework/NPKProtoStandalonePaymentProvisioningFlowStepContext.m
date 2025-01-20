@interface NPKProtoStandalonePaymentProvisioningFlowStepContext
- (BOOL)allowsAddLater;
- (BOOL)hasAllowsAddLater;
- (BOOL)hasBackStepIdentifier;
- (BOOL)hasChooseCredentialsStepContext;
- (BOOL)hasChooseFlowStepContext;
- (BOOL)hasChooseProductStepContext;
- (BOOL)hasDigitalIssuanceAmountStepContext;
- (BOOL)hasDigitalIssuancePaymentStepContext;
- (BOOL)hasIssuerVerificationChannelsStepContext;
- (BOOL)hasIssuerVerificationCodeStepContext;
- (BOOL)hasIssuerVerificationFieldsStepContext;
- (BOOL)hasLocalDeviceManualEntryProgressStepContext;
- (BOOL)hasLocalDeviceManualEntryStepContext;
- (BOOL)hasManualEntryStepContext;
- (BOOL)hasMoreInformationStepContext;
- (BOOL)hasPasscodeUpgradeStepContext;
- (BOOL)hasProductDisambiguationStepContext;
- (BOOL)hasProvisioningProgressStepContext;
- (BOOL)hasProvisioningResultStepContext;
- (BOOL)hasReaderModeEntryStepContext;
- (BOOL)hasReaderModeIngestionStepContext;
- (BOOL)hasSecondaryManualEntryStepContext;
- (BOOL)hasTermsAndConditionsStepContext;
- (BOOL)hasWelcomeStepContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext)chooseCredentialsStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext)chooseFlowStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext)chooseProductStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext)digitalIssuanceAmountStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext)digitalIssuancePaymentStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext)issuerVerificationChannelsStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext)issuerVerificationCodeStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext)issuerVerificationFieldsStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext)localDeviceManualEntryProgressStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext)localDeviceManualEntryStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext)moreInformationStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext)passcodeUpgradeStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext)productDisambiguationStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext)provisioningProgressStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext)provisioningResultStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext)readerModeEntryStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext)readerModeIngestionStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext)termsAndConditionsStepContext;
- (NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext)welcomeStepContext;
- (NSString)backStepIdentifier;
- (NSString)stepIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowsAddLater:(BOOL)a3;
- (void)setBackStepIdentifier:(id)a3;
- (void)setChooseCredentialsStepContext:(id)a3;
- (void)setChooseFlowStepContext:(id)a3;
- (void)setChooseProductStepContext:(id)a3;
- (void)setDigitalIssuanceAmountStepContext:(id)a3;
- (void)setDigitalIssuancePaymentStepContext:(id)a3;
- (void)setHasAllowsAddLater:(BOOL)a3;
- (void)setIssuerVerificationChannelsStepContext:(id)a3;
- (void)setIssuerVerificationCodeStepContext:(id)a3;
- (void)setIssuerVerificationFieldsStepContext:(id)a3;
- (void)setLocalDeviceManualEntryProgressStepContext:(id)a3;
- (void)setLocalDeviceManualEntryStepContext:(id)a3;
- (void)setManualEntryStepContext:(id)a3;
- (void)setMoreInformationStepContext:(id)a3;
- (void)setPasscodeUpgradeStepContext:(id)a3;
- (void)setProductDisambiguationStepContext:(id)a3;
- (void)setProvisioningProgressStepContext:(id)a3;
- (void)setProvisioningResultStepContext:(id)a3;
- (void)setReaderModeEntryStepContext:(id)a3;
- (void)setReaderModeIngestionStepContext:(id)a3;
- (void)setSecondaryManualEntryStepContext:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)setTermsAndConditionsStepContext:(id)a3;
- (void)setWelcomeStepContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowStepContext

- (BOOL)hasBackStepIdentifier
{
  return self->_backStepIdentifier != 0;
}

- (void)setAllowsAddLater:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowsAddLater = a3;
}

- (void)setHasAllowsAddLater:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsAddLater
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasWelcomeStepContext
{
  return self->_welcomeStepContext != 0;
}

- (BOOL)hasChooseFlowStepContext
{
  return self->_chooseFlowStepContext != 0;
}

- (BOOL)hasChooseProductStepContext
{
  return self->_chooseProductStepContext != 0;
}

- (BOOL)hasChooseCredentialsStepContext
{
  return self->_chooseCredentialsStepContext != 0;
}

- (BOOL)hasDigitalIssuanceAmountStepContext
{
  return self->_digitalIssuanceAmountStepContext != 0;
}

- (BOOL)hasDigitalIssuancePaymentStepContext
{
  return self->_digitalIssuancePaymentStepContext != 0;
}

- (BOOL)hasMoreInformationStepContext
{
  return self->_moreInformationStepContext != 0;
}

- (BOOL)hasReaderModeEntryStepContext
{
  return self->_readerModeEntryStepContext != 0;
}

- (BOOL)hasReaderModeIngestionStepContext
{
  return self->_readerModeIngestionStepContext != 0;
}

- (BOOL)hasManualEntryStepContext
{
  return self->_manualEntryStepContext != 0;
}

- (BOOL)hasSecondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext != 0;
}

- (BOOL)hasLocalDeviceManualEntryStepContext
{
  return self->_localDeviceManualEntryStepContext != 0;
}

- (BOOL)hasLocalDeviceManualEntryProgressStepContext
{
  return self->_localDeviceManualEntryProgressStepContext != 0;
}

- (BOOL)hasProductDisambiguationStepContext
{
  return self->_productDisambiguationStepContext != 0;
}

- (BOOL)hasPasscodeUpgradeStepContext
{
  return self->_passcodeUpgradeStepContext != 0;
}

- (BOOL)hasTermsAndConditionsStepContext
{
  return self->_termsAndConditionsStepContext != 0;
}

- (BOOL)hasProvisioningProgressStepContext
{
  return self->_provisioningProgressStepContext != 0;
}

- (BOOL)hasProvisioningResultStepContext
{
  return self->_provisioningResultStepContext != 0;
}

- (BOOL)hasIssuerVerificationChannelsStepContext
{
  return self->_issuerVerificationChannelsStepContext != 0;
}

- (BOOL)hasIssuerVerificationFieldsStepContext
{
  return self->_issuerVerificationFieldsStepContext != 0;
}

- (BOOL)hasIssuerVerificationCodeStepContext
{
  return self->_issuerVerificationCodeStepContext != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier) {
    [v3 setObject:stepIdentifier forKey:@"stepIdentifier"];
  }
  backStepIdentifier = self->_backStepIdentifier;
  if (backStepIdentifier) {
    [v4 setObject:backStepIdentifier forKey:@"backStepIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_allowsAddLater];
    [v4 setObject:v7 forKey:@"allowsAddLater"];
  }
  welcomeStepContext = self->_welcomeStepContext;
  if (welcomeStepContext)
  {
    v9 = [(NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *)welcomeStepContext dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"welcomeStepContext"];
  }
  chooseFlowStepContext = self->_chooseFlowStepContext;
  if (chooseFlowStepContext)
  {
    v11 = [(NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *)chooseFlowStepContext dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"chooseFlowStepContext"];
  }
  chooseProductStepContext = self->_chooseProductStepContext;
  if (chooseProductStepContext)
  {
    v13 = [(NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *)chooseProductStepContext dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"chooseProductStepContext"];
  }
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  if (chooseCredentialsStepContext)
  {
    v15 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)chooseCredentialsStepContext dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"chooseCredentialsStepContext"];
  }
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  if (digitalIssuanceAmountStepContext)
  {
    v17 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *)digitalIssuanceAmountStepContext dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"digitalIssuanceAmountStepContext"];
  }
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  if (digitalIssuancePaymentStepContext)
  {
    v19 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *)digitalIssuancePaymentStepContext dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"digitalIssuancePaymentStepContext"];
  }
  moreInformationStepContext = self->_moreInformationStepContext;
  if (moreInformationStepContext)
  {
    v21 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)moreInformationStepContext dictionaryRepresentation];
    [v4 setObject:v21 forKey:@"moreInformationStepContext"];
  }
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  if (readerModeEntryStepContext)
  {
    v23 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)readerModeEntryStepContext dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"readerModeEntryStepContext"];
  }
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  if (readerModeIngestionStepContext)
  {
    v25 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *)readerModeIngestionStepContext dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"readerModeIngestionStepContext"];
  }
  manualEntryStepContext = self->_manualEntryStepContext;
  if (manualEntryStepContext)
  {
    v27 = [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)manualEntryStepContext dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"manualEntryStepContext"];
  }
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if (secondaryManualEntryStepContext)
  {
    v29 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)secondaryManualEntryStepContext dictionaryRepresentation];
    [v4 setObject:v29 forKey:@"secondaryManualEntryStepContext"];
  }
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  if (localDeviceManualEntryStepContext)
  {
    v31 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *)localDeviceManualEntryStepContext dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"localDeviceManualEntryStepContext"];
  }
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  if (localDeviceManualEntryProgressStepContext)
  {
    v33 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *)localDeviceManualEntryProgressStepContext dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"localDeviceManualEntryProgressStepContext"];
  }
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  if (productDisambiguationStepContext)
  {
    v35 = [(NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *)productDisambiguationStepContext dictionaryRepresentation];
    [v4 setObject:v35 forKey:@"productDisambiguationStepContext"];
  }
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  if (passcodeUpgradeStepContext)
  {
    v37 = [(NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *)passcodeUpgradeStepContext dictionaryRepresentation];
    [v4 setObject:v37 forKey:@"passcodeUpgradeStepContext"];
  }
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  if (termsAndConditionsStepContext)
  {
    v39 = [(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *)termsAndConditionsStepContext dictionaryRepresentation];
    [v4 setObject:v39 forKey:@"termsAndConditionsStepContext"];
  }
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  if (provisioningProgressStepContext)
  {
    v41 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *)provisioningProgressStepContext dictionaryRepresentation];
    [v4 setObject:v41 forKey:@"provisioningProgressStepContext"];
  }
  provisioningResultStepContext = self->_provisioningResultStepContext;
  if (provisioningResultStepContext)
  {
    v43 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *)provisioningResultStepContext dictionaryRepresentation];
    [v4 setObject:v43 forKey:@"provisioningResultStepContext"];
  }
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  if (issuerVerificationChannelsStepContext)
  {
    v45 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)issuerVerificationChannelsStepContext dictionaryRepresentation];
    [v4 setObject:v45 forKey:@"issuerVerificationChannelsStepContext"];
  }
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  if (issuerVerificationFieldsStepContext)
  {
    v47 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *)issuerVerificationFieldsStepContext dictionaryRepresentation];
    [v4 setObject:v47 forKey:@"issuerVerificationFieldsStepContext"];
  }
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  if (issuerVerificationCodeStepContext)
  {
    v49 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *)issuerVerificationCodeStepContext dictionaryRepresentation];
    [v4 setObject:v49 forKey:@"issuerVerificationCodeStepContext"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_stepIdentifier) {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_backStepIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v5 = v6;
  if (self->_welcomeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseFlowStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseProductStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseCredentialsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_digitalIssuanceAmountStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_digitalIssuancePaymentStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_moreInformationStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_readerModeEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_readerModeIngestionStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_manualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_secondaryManualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_localDeviceManualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_localDeviceManualEntryProgressStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_productDisambiguationStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_passcodeUpgradeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_termsAndConditionsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_provisioningProgressStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_provisioningResultStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationChannelsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationFieldsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationCodeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setStepIdentifier:self->_stepIdentifier];
  if (self->_backStepIdentifier) {
    objc_msgSend(v5, "setBackStepIdentifier:");
  }
  id v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[192] = self->_allowsAddLater;
    v5[196] |= 1u;
  }
  if (self->_welcomeStepContext)
  {
    objc_msgSend(v5, "setWelcomeStepContext:");
    id v4 = v5;
  }
  if (self->_chooseFlowStepContext)
  {
    objc_msgSend(v5, "setChooseFlowStepContext:");
    id v4 = v5;
  }
  if (self->_chooseProductStepContext)
  {
    objc_msgSend(v5, "setChooseProductStepContext:");
    id v4 = v5;
  }
  if (self->_chooseCredentialsStepContext)
  {
    objc_msgSend(v5, "setChooseCredentialsStepContext:");
    id v4 = v5;
  }
  if (self->_digitalIssuanceAmountStepContext)
  {
    objc_msgSend(v5, "setDigitalIssuanceAmountStepContext:");
    id v4 = v5;
  }
  if (self->_digitalIssuancePaymentStepContext)
  {
    objc_msgSend(v5, "setDigitalIssuancePaymentStepContext:");
    id v4 = v5;
  }
  if (self->_moreInformationStepContext)
  {
    objc_msgSend(v5, "setMoreInformationStepContext:");
    id v4 = v5;
  }
  if (self->_readerModeEntryStepContext)
  {
    objc_msgSend(v5, "setReaderModeEntryStepContext:");
    id v4 = v5;
  }
  if (self->_readerModeIngestionStepContext)
  {
    objc_msgSend(v5, "setReaderModeIngestionStepContext:");
    id v4 = v5;
  }
  if (self->_manualEntryStepContext)
  {
    objc_msgSend(v5, "setManualEntryStepContext:");
    id v4 = v5;
  }
  if (self->_secondaryManualEntryStepContext)
  {
    objc_msgSend(v5, "setSecondaryManualEntryStepContext:");
    id v4 = v5;
  }
  if (self->_localDeviceManualEntryStepContext)
  {
    objc_msgSend(v5, "setLocalDeviceManualEntryStepContext:");
    id v4 = v5;
  }
  if (self->_localDeviceManualEntryProgressStepContext)
  {
    objc_msgSend(v5, "setLocalDeviceManualEntryProgressStepContext:");
    id v4 = v5;
  }
  if (self->_productDisambiguationStepContext)
  {
    objc_msgSend(v5, "setProductDisambiguationStepContext:");
    id v4 = v5;
  }
  if (self->_passcodeUpgradeStepContext)
  {
    objc_msgSend(v5, "setPasscodeUpgradeStepContext:");
    id v4 = v5;
  }
  if (self->_termsAndConditionsStepContext)
  {
    objc_msgSend(v5, "setTermsAndConditionsStepContext:");
    id v4 = v5;
  }
  if (self->_provisioningProgressStepContext)
  {
    objc_msgSend(v5, "setProvisioningProgressStepContext:");
    id v4 = v5;
  }
  if (self->_provisioningResultStepContext)
  {
    objc_msgSend(v5, "setProvisioningResultStepContext:");
    id v4 = v5;
  }
  if (self->_issuerVerificationChannelsStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationChannelsStepContext:");
    id v4 = v5;
  }
  if (self->_issuerVerificationFieldsStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationFieldsStepContext:");
    id v4 = v5;
  }
  if (self->_issuerVerificationCodeStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationCodeStepContext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stepIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v6;

  uint64_t v8 = [(NSString *)self->_backStepIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 192) = self->_allowsAddLater;
    *(unsigned char *)(v5 + 196) |= 1u;
  }
  id v10 = [(NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *)self->_welcomeStepContext copyWithZone:a3];
  v11 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v10;

  id v12 = [(NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *)self->_chooseFlowStepContext copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  id v14 = [(NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *)self->_chooseProductStepContext copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  id v16 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self->_chooseCredentialsStepContext copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  id v18 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *)self->_digitalIssuanceAmountStepContext copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  id v20 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *)self->_digitalIssuancePaymentStepContext copyWithZone:a3];
  v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  id v22 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self->_moreInformationStepContext copyWithZone:a3];
  v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  id v24 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self->_readerModeEntryStepContext copyWithZone:a3];
  v25 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v24;

  id v26 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *)self->_readerModeIngestionStepContext copyWithZone:a3];
  v27 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v26;

  id v28 = [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)self->_manualEntryStepContext copyWithZone:a3];
  v29 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v28;

  id v30 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)self->_secondaryManualEntryStepContext copyWithZone:a3];
  v31 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v30;

  id v32 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *)self->_localDeviceManualEntryStepContext copyWithZone:a3];
  v33 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v32;

  id v34 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *)self->_localDeviceManualEntryProgressStepContext copyWithZone:a3];
  v35 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v34;

  id v36 = [(NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *)self->_productDisambiguationStepContext copyWithZone:a3];
  v37 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v36;

  id v38 = [(NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *)self->_passcodeUpgradeStepContext copyWithZone:a3];
  v39 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v38;

  id v40 = [(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *)self->_termsAndConditionsStepContext copyWithZone:a3];
  v41 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v40;

  id v42 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *)self->_provisioningProgressStepContext copyWithZone:a3];
  v43 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v42;

  id v44 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *)self->_provisioningResultStepContext copyWithZone:a3];
  v45 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v44;

  id v46 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self->_issuerVerificationChannelsStepContext copyWithZone:a3];
  v47 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v46;

  id v48 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *)self->_issuerVerificationFieldsStepContext copyWithZone:a3];
  v49 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v48;

  id v50 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *)self->_issuerVerificationCodeStepContext copyWithZone:a3];
  v51 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v50;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  stepIdentifier = self->_stepIdentifier;
  if ((unint64_t)stepIdentifier | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](stepIdentifier, "isEqual:")) {
      goto LABEL_56;
    }
  }
  backStepIdentifier = self->_backStepIdentifier;
  if ((unint64_t)backStepIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](backStepIdentifier, "isEqual:")) {
      goto LABEL_56;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 196))
    {
      if (self->_allowsAddLater)
      {
        if (!*((unsigned char *)v4 + 192)) {
          goto LABEL_56;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_14;
      }
    }
LABEL_56:
    char v28 = 0;
    goto LABEL_57;
  }
  if (*((unsigned char *)v4 + 196)) {
    goto LABEL_56;
  }
LABEL_14:
  welcomeStepContext = self->_welcomeStepContext;
  if ((unint64_t)welcomeStepContext | *((void *)v4 + 23)
    && !-[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext isEqual:](welcomeStepContext, "isEqual:"))
  {
    goto LABEL_56;
  }
  chooseFlowStepContext = self->_chooseFlowStepContext;
  if ((unint64_t)chooseFlowStepContext | *((void *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext isEqual:](chooseFlowStepContext, "isEqual:")) {
      goto LABEL_56;
    }
  }
  chooseProductStepContext = self->_chooseProductStepContext;
  if ((unint64_t)chooseProductStepContext | *((void *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext isEqual:](chooseProductStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  if ((unint64_t)chooseCredentialsStepContext | *((void *)v4 + 2))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext isEqual:](chooseCredentialsStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  if ((unint64_t)digitalIssuanceAmountStepContext | *((void *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext isEqual:](digitalIssuanceAmountStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  if ((unint64_t)digitalIssuancePaymentStepContext | *((void *)v4 + 6))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext isEqual:](digitalIssuancePaymentStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  moreInformationStepContext = self->_moreInformationStepContext;
  if ((unint64_t)moreInformationStepContext | *((void *)v4 + 13))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext isEqual:](moreInformationStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  if ((unint64_t)readerModeEntryStepContext | *((void *)v4 + 18))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext isEqual:](readerModeEntryStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  if ((unint64_t)readerModeIngestionStepContext | *((void *)v4 + 19))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext isEqual:](readerModeIngestionStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  manualEntryStepContext = self->_manualEntryStepContext;
  if ((unint64_t)manualEntryStepContext | *((void *)v4 + 12))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext isEqual:](manualEntryStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if ((unint64_t)secondaryManualEntryStepContext | *((void *)v4 + 20))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext isEqual:](secondaryManualEntryStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  if ((unint64_t)localDeviceManualEntryStepContext | *((void *)v4 + 11))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext isEqual:](localDeviceManualEntryStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  if ((unint64_t)localDeviceManualEntryProgressStepContext | *((void *)v4 + 10))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext isEqual:](localDeviceManualEntryProgressStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  if ((unint64_t)productDisambiguationStepContext | *((void *)v4 + 15))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext isEqual:](productDisambiguationStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  if ((unint64_t)passcodeUpgradeStepContext | *((void *)v4 + 14))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext isEqual:](passcodeUpgradeStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  if ((unint64_t)termsAndConditionsStepContext | *((void *)v4 + 22))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext isEqual:](termsAndConditionsStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  if ((unint64_t)provisioningProgressStepContext | *((void *)v4 + 16))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext isEqual:](provisioningProgressStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  provisioningResultStepContext = self->_provisioningResultStepContext;
  if ((unint64_t)provisioningResultStepContext | *((void *)v4 + 17))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext isEqual:](provisioningResultStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  if ((unint64_t)issuerVerificationChannelsStepContext | *((void *)v4 + 7))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext isEqual:](issuerVerificationChannelsStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  if ((unint64_t)issuerVerificationFieldsStepContext | *((void *)v4 + 9))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext isEqual:](issuerVerificationFieldsStepContext, "isEqual:"))goto LABEL_56; {
  }
    }
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  if ((unint64_t)issuerVerificationCodeStepContext | *((void *)v4 + 8)) {
    char v28 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext isEqual:](issuerVerificationCodeStepContext, "isEqual:");
  }
  else {
    char v28 = 1;
  }
LABEL_57:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stepIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_backStepIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_allowsAddLater;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *)self->_welcomeStepContext hash];
  unint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *)self->_chooseFlowStepContext hash];
  unint64_t v8 = v7 ^ [(NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *)self->_chooseProductStepContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self->_chooseCredentialsStepContext hash];
  unint64_t v10 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *)self->_digitalIssuanceAmountStepContext hash];
  unint64_t v11 = v10 ^ [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *)self->_digitalIssuancePaymentStepContext hash];
  unint64_t v12 = v11 ^ [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self->_moreInformationStepContext hash];
  unint64_t v13 = v9 ^ v12 ^ [(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *)self->_readerModeEntryStepContext hash];
  unint64_t v14 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *)self->_readerModeIngestionStepContext hash];
  unint64_t v15 = v14 ^ [(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *)self->_manualEntryStepContext hash];
  unint64_t v16 = v15 ^ [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)self->_secondaryManualEntryStepContext hash];
  unint64_t v17 = v16 ^ [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *)self->_localDeviceManualEntryStepContext hash];
  unint64_t v18 = v13 ^ v17 ^ [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *)self->_localDeviceManualEntryProgressStepContext hash];
  unint64_t v19 = [(NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *)self->_productDisambiguationStepContext hash];
  unint64_t v20 = v19 ^ [(NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *)self->_passcodeUpgradeStepContext hash];
  unint64_t v21 = v20 ^ [(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *)self->_termsAndConditionsStepContext hash];
  unint64_t v22 = v21 ^ [(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *)self->_provisioningProgressStepContext hash];
  unint64_t v23 = v22 ^ [(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *)self->_provisioningResultStepContext hash];
  unint64_t v24 = v18 ^ v23 ^ [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self->_issuerVerificationChannelsStepContext hash];
  unint64_t v25 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *)self->_issuerVerificationFieldsStepContext hash];
  return v24 ^ v25 ^ [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *)self->_issuerVerificationCodeStepContext hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  v47 = v4;
  if (*((void *)v4 + 21))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setStepIdentifier:](self, "setStepIdentifier:");
    NSUInteger v4 = v47;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setBackStepIdentifier:](self, "setBackStepIdentifier:");
    NSUInteger v4 = v47;
  }
  if (v4[196])
  {
    self->_allowsAddLater = v4[192];
    *(unsigned char *)&self->_has |= 1u;
  }
  welcomeStepContext = self->_welcomeStepContext;
  uint64_t v6 = *((void *)v4 + 23);
  if (welcomeStepContext)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext mergeFrom:](welcomeStepContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setWelcomeStepContext:](self, "setWelcomeStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_13:
  chooseFlowStepContext = self->_chooseFlowStepContext;
  uint64_t v8 = *((void *)v4 + 3);
  if (chooseFlowStepContext)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext mergeFrom:](chooseFlowStepContext, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseFlowStepContext:](self, "setChooseFlowStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_19:
  chooseProductStepContext = self->_chooseProductStepContext;
  uint64_t v10 = *((void *)v4 + 4);
  if (chooseProductStepContext)
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext mergeFrom:](chooseProductStepContext, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseProductStepContext:](self, "setChooseProductStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_25:
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  uint64_t v12 = *((void *)v4 + 2);
  if (chooseCredentialsStepContext)
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext mergeFrom:](chooseCredentialsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseCredentialsStepContext:](self, "setChooseCredentialsStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_31:
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  uint64_t v14 = *((void *)v4 + 5);
  if (digitalIssuanceAmountStepContext)
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext mergeFrom:](digitalIssuanceAmountStepContext, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setDigitalIssuanceAmountStepContext:](self, "setDigitalIssuanceAmountStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_37:
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  uint64_t v16 = *((void *)v4 + 6);
  if (digitalIssuancePaymentStepContext)
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext mergeFrom:](digitalIssuancePaymentStepContext, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setDigitalIssuancePaymentStepContext:](self, "setDigitalIssuancePaymentStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_43:
  moreInformationStepContext = self->_moreInformationStepContext;
  uint64_t v18 = *((void *)v4 + 13);
  if (moreInformationStepContext)
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext mergeFrom:](moreInformationStepContext, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setMoreInformationStepContext:](self, "setMoreInformationStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_49:
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  uint64_t v20 = *((void *)v4 + 18);
  if (readerModeEntryStepContext)
  {
    if (!v20) {
      goto LABEL_55;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext mergeFrom:](readerModeEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_55;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setReaderModeEntryStepContext:](self, "setReaderModeEntryStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_55:
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  uint64_t v22 = *((void *)v4 + 19);
  if (readerModeIngestionStepContext)
  {
    if (!v22) {
      goto LABEL_61;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext mergeFrom:](readerModeIngestionStepContext, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_61;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setReaderModeIngestionStepContext:](self, "setReaderModeIngestionStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_61:
  manualEntryStepContext = self->_manualEntryStepContext;
  uint64_t v24 = *((void *)v4 + 12);
  if (manualEntryStepContext)
  {
    if (!v24) {
      goto LABEL_67;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext mergeFrom:](manualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_67;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setManualEntryStepContext:](self, "setManualEntryStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_67:
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  uint64_t v26 = *((void *)v4 + 20);
  if (secondaryManualEntryStepContext)
  {
    if (!v26) {
      goto LABEL_73;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext mergeFrom:](secondaryManualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_73;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setSecondaryManualEntryStepContext:](self, "setSecondaryManualEntryStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_73:
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  uint64_t v28 = *((void *)v4 + 11);
  if (localDeviceManualEntryStepContext)
  {
    if (!v28) {
      goto LABEL_79;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext mergeFrom:](localDeviceManualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_79;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setLocalDeviceManualEntryStepContext:](self, "setLocalDeviceManualEntryStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_79:
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  uint64_t v30 = *((void *)v4 + 10);
  if (localDeviceManualEntryProgressStepContext)
  {
    if (!v30) {
      goto LABEL_85;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext mergeFrom:](localDeviceManualEntryProgressStepContext, "mergeFrom:");
  }
  else
  {
    if (!v30) {
      goto LABEL_85;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setLocalDeviceManualEntryProgressStepContext:](self, "setLocalDeviceManualEntryProgressStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_85:
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  uint64_t v32 = *((void *)v4 + 15);
  if (productDisambiguationStepContext)
  {
    if (!v32) {
      goto LABEL_91;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext mergeFrom:](productDisambiguationStepContext, "mergeFrom:");
  }
  else
  {
    if (!v32) {
      goto LABEL_91;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProductDisambiguationStepContext:](self, "setProductDisambiguationStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_91:
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  uint64_t v34 = *((void *)v4 + 14);
  if (passcodeUpgradeStepContext)
  {
    if (!v34) {
      goto LABEL_97;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext mergeFrom:](passcodeUpgradeStepContext, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_97;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setPasscodeUpgradeStepContext:](self, "setPasscodeUpgradeStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_97:
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  uint64_t v36 = *((void *)v4 + 22);
  if (termsAndConditionsStepContext)
  {
    if (!v36) {
      goto LABEL_103;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext mergeFrom:](termsAndConditionsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_103;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setTermsAndConditionsStepContext:](self, "setTermsAndConditionsStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_103:
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  uint64_t v38 = *((void *)v4 + 16);
  if (provisioningProgressStepContext)
  {
    if (!v38) {
      goto LABEL_109;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext mergeFrom:](provisioningProgressStepContext, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_109;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProvisioningProgressStepContext:](self, "setProvisioningProgressStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_109:
  provisioningResultStepContext = self->_provisioningResultStepContext;
  uint64_t v40 = *((void *)v4 + 17);
  if (provisioningResultStepContext)
  {
    if (!v40) {
      goto LABEL_115;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext mergeFrom:](provisioningResultStepContext, "mergeFrom:");
  }
  else
  {
    if (!v40) {
      goto LABEL_115;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProvisioningResultStepContext:](self, "setProvisioningResultStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_115:
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  uint64_t v42 = *((void *)v4 + 7);
  if (issuerVerificationChannelsStepContext)
  {
    if (!v42) {
      goto LABEL_121;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext mergeFrom:](issuerVerificationChannelsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v42) {
      goto LABEL_121;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationChannelsStepContext:](self, "setIssuerVerificationChannelsStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_121:
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  uint64_t v44 = *((void *)v4 + 9);
  if (issuerVerificationFieldsStepContext)
  {
    if (!v44) {
      goto LABEL_127;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext mergeFrom:](issuerVerificationFieldsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_127;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationFieldsStepContext:](self, "setIssuerVerificationFieldsStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_127:
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  uint64_t v46 = *((void *)v4 + 8);
  if (issuerVerificationCodeStepContext)
  {
    if (!v46) {
      goto LABEL_133;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext mergeFrom:](issuerVerificationCodeStepContext, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_133;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationCodeStepContext:](self, "setIssuerVerificationCodeStepContext:");
  }
  NSUInteger v4 = v47;
LABEL_133:
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (NSString)backStepIdentifier
{
  return self->_backStepIdentifier;
}

- (void)setBackStepIdentifier:(id)a3
{
}

- (BOOL)allowsAddLater
{
  return self->_allowsAddLater;
}

- (NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext)welcomeStepContext
{
  return self->_welcomeStepContext;
}

- (void)setWelcomeStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext)chooseFlowStepContext
{
  return self->_chooseFlowStepContext;
}

- (void)setChooseFlowStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext)chooseProductStepContext
{
  return self->_chooseProductStepContext;
}

- (void)setChooseProductStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext)chooseCredentialsStepContext
{
  return self->_chooseCredentialsStepContext;
}

- (void)setChooseCredentialsStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext)digitalIssuanceAmountStepContext
{
  return self->_digitalIssuanceAmountStepContext;
}

- (void)setDigitalIssuanceAmountStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext)digitalIssuancePaymentStepContext
{
  return self->_digitalIssuancePaymentStepContext;
}

- (void)setDigitalIssuancePaymentStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext)moreInformationStepContext
{
  return self->_moreInformationStepContext;
}

- (void)setMoreInformationStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext)readerModeEntryStepContext
{
  return self->_readerModeEntryStepContext;
}

- (void)setReaderModeEntryStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext)readerModeIngestionStepContext
{
  return self->_readerModeIngestionStepContext;
}

- (void)setReaderModeIngestionStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext
{
  return self->_manualEntryStepContext;
}

- (void)setManualEntryStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext;
}

- (void)setSecondaryManualEntryStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext)localDeviceManualEntryStepContext
{
  return self->_localDeviceManualEntryStepContext;
}

- (void)setLocalDeviceManualEntryStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext)localDeviceManualEntryProgressStepContext
{
  return self->_localDeviceManualEntryProgressStepContext;
}

- (void)setLocalDeviceManualEntryProgressStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext)productDisambiguationStepContext
{
  return self->_productDisambiguationStepContext;
}

- (void)setProductDisambiguationStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext)passcodeUpgradeStepContext
{
  return self->_passcodeUpgradeStepContext;
}

- (void)setPasscodeUpgradeStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext)termsAndConditionsStepContext
{
  return self->_termsAndConditionsStepContext;
}

- (void)setTermsAndConditionsStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext)provisioningProgressStepContext
{
  return self->_provisioningProgressStepContext;
}

- (void)setProvisioningProgressStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext)provisioningResultStepContext
{
  return self->_provisioningResultStepContext;
}

- (void)setProvisioningResultStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext)issuerVerificationChannelsStepContext
{
  return self->_issuerVerificationChannelsStepContext;
}

- (void)setIssuerVerificationChannelsStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext)issuerVerificationFieldsStepContext
{
  return self->_issuerVerificationFieldsStepContext;
}

- (void)setIssuerVerificationFieldsStepContext:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext)issuerVerificationCodeStepContext
{
  return self->_issuerVerificationCodeStepContext;
}

- (void)setIssuerVerificationCodeStepContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcomeStepContext, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsStepContext, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryManualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_readerModeIngestionStepContext, 0);
  objc_storeStrong((id *)&self->_readerModeEntryStepContext, 0);
  objc_storeStrong((id *)&self->_provisioningResultStepContext, 0);
  objc_storeStrong((id *)&self->_provisioningProgressStepContext, 0);
  objc_storeStrong((id *)&self->_productDisambiguationStepContext, 0);
  objc_storeStrong((id *)&self->_passcodeUpgradeStepContext, 0);
  objc_storeStrong((id *)&self->_moreInformationStepContext, 0);
  objc_storeStrong((id *)&self->_manualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_localDeviceManualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_localDeviceManualEntryProgressStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationFieldsStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationCodeStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationChannelsStepContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentStepContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmountStepContext, 0);
  objc_storeStrong((id *)&self->_chooseProductStepContext, 0);
  objc_storeStrong((id *)&self->_chooseFlowStepContext, 0);
  objc_storeStrong((id *)&self->_chooseCredentialsStepContext, 0);
  objc_storeStrong((id *)&self->_backStepIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowStepContext.m", 700, "nil != self->_stepIdentifier");
}

@end