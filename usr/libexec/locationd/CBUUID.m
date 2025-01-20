@interface CBUUID
+ (id)_cl_BtTxPowerCharacteristicUUID;
+ (id)_cl_BtTxPowerServiceUUID;
+ (id)_cl_DurianDebugServiceUUID;
+ (id)_cl_DurianKeyIndexCharacteristicUUID;
+ (id)_cl_DurianLoggingCharacteristicUUID;
+ (id)_cl_DurianServiceUUID;
+ (id)_cl_DurianUnauthorizedConnectionServiceUUID;
+ (id)_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID;
+ (id)_cl_DurianUnauthorizedSoundCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID;
+ (id)_cl_HawkeyeAccessoryInformationServiceUUID;
+ (id)_cl_HawkeyeConfigurationCharacteristicUUID;
+ (id)_cl_HawkeyeDebugCharacteristicUUID;
+ (id)_cl_HawkeyeFindMyNetworkServiceUUID;
+ (id)_cl_HawkeyeNonOwnerCharacteristicUUID;
+ (id)_cl_HawkeyePairedOwnerInformationCharacteristicUUID;
+ (id)_cl_HawkeyePreciseFindingCharacteristicUUID;
+ (id)_cl_PoshAccessoryNonOwnerCharacteristicUUID;
+ (id)_cl_PoshAccessoryNonOwnerServiceUUID;
@end

@implementation CBUUID

+ (id)_cl_DurianServiceUUID
{
  return +[CBUUID UUIDWithString:@"7DFC7000-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianDebugServiceUUID
{
  return +[CBUUID UUIDWithString:@"7DFC8000-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianUnauthorizedConnectionServiceUUID
{
  return +[CBUUID UUIDWithString:@"7DFC9000-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianLoggingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"7DFC8003-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianUnauthorizedSoundCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"7DFC9001-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianKeyIndexCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"7DFC9002-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"7DFC9003-7D1C-4951-86AA-8D9728F8D66C"];
}

+ (id)_cl_BtTxPowerServiceUUID
{
  return +[CBUUID UUIDWithString:@"1804"];
}

+ (id)_cl_BtTxPowerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"2A07"];
}

+ (id)_cl_HawkeyeFindMyNetworkServiceUUID
{
  return +[CBUUID UUIDWithString:@"FD44"];
}

+ (id)_cl_HawkeyeConfigurationCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"4F860002-943B-49EF-BED4-2F730304427A"];
}

+ (id)_cl_HawkeyeNonOwnerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"4F860003-943B-49EF-BED4-2F730304427A"];
}

+ (id)_cl_HawkeyePairedOwnerInformationCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"4F860004-943B-49EF-BED4-2F730304427A"];
}

+ (id)_cl_HawkeyeDebugCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"4F860005-943B-49EF-BED4-2F730304427A"];
}

+ (id)_cl_HawkeyePreciseFindingCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"4F860006-943B-49EF-BED4-2F730304427A"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceUUID
{
  return +[CBUUID UUIDWithString:@"87290102-3C51-43B1-A1A9-11B9DC38478B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50001-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50002-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50003-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50004-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50005-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50006-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50007-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50008-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA50009-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"6AA5000A-6352-4D57-A7B4-003A416FBB0B"];
}

+ (id)_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID
{
  return +[CBUUID UUIDWithString:@"FD43"];
}

+ (id)_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"94110001-6D9B-4225-A4F1-6A4A7F01B0DE"];
}

+ (id)_cl_PoshAccessoryNonOwnerServiceUUID
{
  return +[CBUUID UUIDWithString:@"15190001-12F4-C226-88ED-2AC5579F2A85"];
}

+ (id)_cl_PoshAccessoryNonOwnerCharacteristicUUID
{
  return +[CBUUID UUIDWithString:@"8E0C0001-1D68-FB92-BF61-48377421680E"];
}

@end