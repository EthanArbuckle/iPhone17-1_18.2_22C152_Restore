@interface KmlDeviceConfigurationData
@end

@implementation KmlDeviceConfigurationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsData, 0);
  objc_storeStrong((id *)&self->_mfiPPID, 0);
  objc_storeStrong((id *)&self->_oemSpecificContentAsData, 0);
  objc_storeStrong((id *)&self->_sharingPasswordLengthAsData, 0);
  objc_storeStrong((id *)&self->_additionalMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3PrivateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_v3ConfMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_privateMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_confMailboxSettingAsData, 0);
  objc_storeStrong((id *)&self->_supportedKeyProfiles, 0);
  objc_storeStrong((id *)&self->_onlineBleOOBMasterKeyOverride, 0);
  objc_storeStrong((id *)&self->_deviceBtIntroKey, 0);
  objc_storeStrong((id *)&self->_deviceBtOOBKey, 0);
  objc_storeStrong((id *)&self->_readerBtIdAddress, 0);
  objc_storeStrong((id *)&self->_readerBtIRK, 0);

  objc_storeStrong((id *)&self->_remainingTlvs, 0);
}

@end