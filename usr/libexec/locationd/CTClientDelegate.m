@interface CTClientDelegate
- (id)fCarrierBundleChangeCb;
- (id)fCellInfoCb;
- (id)fDataStatusCb;
- (id)fDefaultBundleChangeCb;
- (id)fDisplayStatusCb;
- (id)fEmergModeCb;
- (id)fImsRegStatusCb;
- (id)fLinkQualityCb;
- (id)fOperatorBundleChangeCb;
- (id)fPhoneNumberInfoCb;
- (id)fServingCellChangedCb;
- (id)fServingNetworkChangedCb;
- (id)fSimStatusCb;
- (id)fSmsSentCb;
- (id)fStewieSupportChangedCb;
- (id)fSubscriberMccCb;
- (id)fSubscriptionInfoCb;
- (id)fSuplSmsCb;
- (id)fTandemCapabilityChangeCb;
- (id)fVoiceLinkQualityCb;
- (id)fprefDataSimChangedCb;
- (void)carrierBundleChange:(id)a3;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)defaultBundleChange;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)dualSimCapabilityDidChange;
- (void)emergencyModeChanged:(id)a3 mode:(id)a4;
- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4;
- (void)imsRegistrationChanged:(id)a3 info:(id)a4;
- (void)operatorBundleChange:(id)a3;
- (void)phoneNumberAvailable:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)postSUPLInitNotification:(id)a3 data:(id)a4;
- (void)preferredDataSimChanged:(id)a3;
- (void)servingNetworkChanged:(id)a3;
- (void)setFCarrierBundleChangeCb:(id)a3;
- (void)setFCellInfoCb:(id)a3;
- (void)setFDataStatusCb:(id)a3;
- (void)setFDefaultBundleChangeCb:(id)a3;
- (void)setFDisplayStatusCb:(id)a3;
- (void)setFEmergModeCb:(id)a3;
- (void)setFImsRegStatusCb:(id)a3;
- (void)setFLinkQualityCb:(id)a3;
- (void)setFOperatorBundleChangeCb:(id)a3;
- (void)setFPhoneNumberInfoCb:(id)a3;
- (void)setFServingCellChangedCb:(id)a3;
- (void)setFServingNetworkChangedCb:(id)a3;
- (void)setFSimStatusCb:(id)a3;
- (void)setFSmsSentCb:(id)a3;
- (void)setFStewieSupportChangedCb:(id)a3;
- (void)setFSubscriberMccCb:(id)a3;
- (void)setFSubscriptionInfoCb:(id)a3;
- (void)setFSuplSmsCb:(id)a3;
- (void)setFTandemCapabilityChangeCb:(id)a3;
- (void)setFVoiceLinkQualityCb:(id)a3;
- (void)setFprefDataSimChangedCb:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)stewieSupportChanged;
- (void)subscriberCountryCodeDidChange:(id)a3;
- (void)subscriptionInfoDidChange;
- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4;
@end

@implementation CTClientDelegate

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
}

- (void)emergencyModeChanged:(id)a3 mode:(id)a4
{
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
}

- (void)carrierBundleChange:(id)a3
{
}

- (void)operatorBundleChange:(id)a3
{
}

- (void)defaultBundleChange
{
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
}

- (void)subscriptionInfoDidChange
{
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
}

- (void)servingNetworkChanged:(id)a3
{
}

- (void)postSUPLInitNotification:(id)a3 data:(id)a4
{
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
}

- (void)preferredDataSimChanged:(id)a3
{
}

- (void)phoneNumberChanged:(id)a3
{
}

- (void)phoneNumberAvailable:(id)a3
{
}

- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4
{
}

- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4
{
}

- (void)dualSimCapabilityDidChange
{
}

- (void)stewieSupportChanged
{
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
}

- (void)dealloc
{
  self->_fEmergModeCb = 0;
  self->_fSimStatusCb = 0;

  self->_fCarrierBundleChangeCb = 0;
  self->_fOperatorBundleChangeCb = 0;

  self->_fDefaultBundleChangeCb = 0;
  self->_fDisplayStatusCb = 0;

  self->_fDataStatusCb = 0;
  self->_fSubscriptionInfoCb = 0;

  self->_fSubscriberMccCb = 0;
  self->_fCellInfoCb = 0;

  self->_fLinkQualityCb = 0;
  self->_fVoiceLinkQualityCb = 0;

  self->_fServingCellChangedCb = 0;
  self->_fServingNetworkChangedCb = 0;

  self->_fSuplSmsCb = 0;
  self->_fprefDataSimChangedCb = 0;

  self->_fTandemCapabilityChangeCb = 0;
  self->_fSmsSentCb = 0;

  self->_fPhoneNumberInfoCb = 0;
  self->_fStewieSupportChangedCb = 0;

  self->_fImsRegStatusCb = 0;
  v3.receiver = self;
  v3.super_class = (Class)CTClientDelegate;
  [(CTClientDelegate *)&v3 dealloc];
}

- (id)fEmergModeCb
{
  return self->_fEmergModeCb;
}

- (void)setFEmergModeCb:(id)a3
{
}

- (id)fSimStatusCb
{
  return self->_fSimStatusCb;
}

- (void)setFSimStatusCb:(id)a3
{
}

- (id)fCarrierBundleChangeCb
{
  return self->_fCarrierBundleChangeCb;
}

- (void)setFCarrierBundleChangeCb:(id)a3
{
}

- (id)fOperatorBundleChangeCb
{
  return self->_fOperatorBundleChangeCb;
}

- (void)setFOperatorBundleChangeCb:(id)a3
{
}

- (id)fDefaultBundleChangeCb
{
  return self->_fDefaultBundleChangeCb;
}

- (void)setFDefaultBundleChangeCb:(id)a3
{
}

- (id)fDisplayStatusCb
{
  return self->_fDisplayStatusCb;
}

- (void)setFDisplayStatusCb:(id)a3
{
}

- (id)fSubscriptionInfoCb
{
  return self->_fSubscriptionInfoCb;
}

- (void)setFSubscriptionInfoCb:(id)a3
{
}

- (id)fSubscriberMccCb
{
  return self->_fSubscriberMccCb;
}

- (void)setFSubscriberMccCb:(id)a3
{
}

- (id)fCellInfoCb
{
  return self->_fCellInfoCb;
}

- (void)setFCellInfoCb:(id)a3
{
}

- (id)fLinkQualityCb
{
  return self->_fLinkQualityCb;
}

- (void)setFLinkQualityCb:(id)a3
{
}

- (id)fVoiceLinkQualityCb
{
  return self->_fVoiceLinkQualityCb;
}

- (void)setFVoiceLinkQualityCb:(id)a3
{
}

- (id)fServingCellChangedCb
{
  return self->_fServingCellChangedCb;
}

- (void)setFServingCellChangedCb:(id)a3
{
}

- (id)fServingNetworkChangedCb
{
  return self->_fServingNetworkChangedCb;
}

- (void)setFServingNetworkChangedCb:(id)a3
{
}

- (id)fDataStatusCb
{
  return self->_fDataStatusCb;
}

- (void)setFDataStatusCb:(id)a3
{
}

- (id)fSuplSmsCb
{
  return self->_fSuplSmsCb;
}

- (void)setFSuplSmsCb:(id)a3
{
}

- (id)fSmsSentCb
{
  return self->_fSmsSentCb;
}

- (void)setFSmsSentCb:(id)a3
{
}

- (id)fprefDataSimChangedCb
{
  return self->_fprefDataSimChangedCb;
}

- (void)setFprefDataSimChangedCb:(id)a3
{
}

- (id)fPhoneNumberInfoCb
{
  return self->_fPhoneNumberInfoCb;
}

- (void)setFPhoneNumberInfoCb:(id)a3
{
}

- (id)fImsRegStatusCb
{
  return self->_fImsRegStatusCb;
}

- (void)setFImsRegStatusCb:(id)a3
{
}

- (id)fTandemCapabilityChangeCb
{
  return self->_fTandemCapabilityChangeCb;
}

- (void)setFTandemCapabilityChangeCb:(id)a3
{
}

- (id)fStewieSupportChangedCb
{
  return self->_fStewieSupportChangedCb;
}

- (void)setFStewieSupportChangedCb:(id)a3
{
}

@end