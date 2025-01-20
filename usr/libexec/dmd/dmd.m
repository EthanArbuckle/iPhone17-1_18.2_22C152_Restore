void sub_100005B50(uint64_t a1)
{
  void *v2;
  unint64_t date;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  NSObject *v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  double v18;

  [@"com.apple.alarm" UTF8String];
  [@"com.apple.dmd.emergency-mode.alarm" UTF8String];
  v2 = (void *)xpc_copy_event();
  if (v2)
  {
    date = xpc_dictionary_get_date(v2, (const char *)[@"Date" UTF8String]);
    if (date < 0x3B9ACA00)
    {
      v4 = DMFEmergencyModeLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_10008756C();
      }

      v5 = *(void *)(a1 + 32);
      v6 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
      goto LABEL_16;
    }
    v6 = +[NSDate dateWithTimeIntervalSince1970:(double)(date / 0x3B9ACA00)];
    [v6 timeIntervalSinceNow];
    v9 = v8;
    v10 = DMFEmergencyModeLog();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 <= 0.0)
    {
      if (v11)
      {
        v15 = 138543618;
        v16 = v6;
        v17 = 2048;
        v18 = v9;
        v12 = "Emergency Mode ended on %{public}@, %f seconds ago";
        goto LABEL_14;
      }
    }
    else if (v11)
    {
      v15 = 138543618;
      v16 = v6;
      v17 = 2048;
      v18 = v9;
      v12 = "Emergency Mode will end on %{public}@, %f seconds from now";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x16u);
    }

    v13 = *(void *)(a1 + 32);
    v14 = +[NSNumber numberWithDouble:v9];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);

LABEL_16:
    goto LABEL_17;
  }
  v7 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Emergency Mode is not set", (uint8_t *)&v15, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_17:
}

void sub_100005ECC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:"_updateForegroundBundleIdentifiers" withObject:0 waitUntilDone:0];
}

void sub_1000061E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v9 = [*(id *)(a1 + 32) identifier];
    v10 = +[DMDPolicyRegistration fetchRequest];
    v11 = +[NSPredicate predicateWithFormat:@"%K == %@", @"identifier", v9];
    [v10 setPredicate:v11];

    id v29 = 0;
    v12 = [v10 execute:&v29];
    id v13 = v29;
    if (!v12)
    {
      v17 = DMFPolicyLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100086DD4(v13);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      DMFErrorWithCodeAndUserInfo();
      v14 = (DMDPolicyRegistration *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, DMDPolicyRegistration *))(v18 + 16))(v18, 0, v14);
      goto LABEL_21;
    }
    v27 = v12;
    if ([v12 count])
    {
      v14 = [v12 firstObject];
      v15 = DMFPolicyLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        __int16 v32 = 2114;
        v33 = v9;
        v16 = "Updating existing registration %{public}@ with identifier %{public}@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      }
    }
    else
    {
      v14 = [[DMDPolicyRegistration alloc] initWithContext:v5];
      v15 = DMFPolicyLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        __int16 v32 = 2114;
        v33 = v9;
        v16 = "Adding new registration %{public}@ with identifier %{public}@";
        goto LABEL_14;
      }
    }

    [(DMDPolicyRegistration *)v14 setIdentifier:v9];
    v19 = [*(id *)(a1 + 32) policyTypes];
    [(DMDPolicyRegistration *)v14 setPolicyTypes:v19];
    v20 = objc_opt_new();
    [(DMDPolicyRegistration *)v14 setModificationDate:v20];

    id v28 = v13;
    unsigned int v21 = [v5 save:&v28];
    id v22 = v28;

    if (v21)
    {
      v23 = *(void **)(a1 + 40);
      v24 = [v19 allObjects];
      [v23 requestPoliciesForTypes:v24 replyHandler:*(void *)(a1 + 48)];
    }
    else
    {
      v25 = DMFPolicyLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100086E58((uint64_t)v14, v22);
      }

      uint64_t v26 = *(void *)(a1 + 48);
      v24 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v24);
    }
    v12 = v27;

    id v13 = v22;
LABEL_21:

    goto LABEL_22;
  }
  v7 = DMFPolicyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100086EF4(v6);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  NSErrorUserInfoKey v34 = NSUnderlyingErrorKey;
  id v35 = v6;
  v9 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v10 = DMFErrorWithCodeAndUserInfo();
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
LABEL_22:
}

void sub_1000068EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006924(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = a1[6];
    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    v12 = a3;
    id v5 = a3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    uint64_t v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    id v10 = 0;
    id v6 = 0;
    id v5 = [v8 _effectivePoliciesForTypes:v9 outError:&v10];
    id v7 = v10;
    (*(void (**)(void, id, id))(a1[6] + 16))(a1[6], v5, v7);
  }
}

uint64_t sub_100006F74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_100006F8C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100007934(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007A34(id a1)
{
  v4[0] = CEMQuery_activeManagedUsers;
  v4[1] = CEMQuery_maximumResidentUsers;
  v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_1000FB8D8;
  qword_1000FB8D8 = v2;
}

void sub_100007B3C(id a1)
{
  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_organizationInfo;
  void v4[2] = CEMQuery_mdmOptions;
  v4[3] = CEMQuery_lastCloudBackupDate;
  v4[4] = CEMQuery_awaitingConfiguration;
  v4[5] = CEMQuery_iTunesStoreAccountIsActive;
  v4[6] = CEMQuery_iTunesStoreAccountHash;
  v4[7] = CEMQuery_deviceName;
  v4[8] = CEMQuery_osVersion;
  v4[9] = CEMQuery_buildVersion;
  v4[10] = CEMQuery_modelName;
  v4[11] = CEMQuery_model;
  v4[12] = CEMQuery_productName;
  v4[13] = CEMQuery_marketingName;
  v4[14] = CEMQuery_serialNumber;
  v4[15] = CEMQuery_deviceCapacity;
  v4[16] = CEMQuery_availableDeviceCapacity;
  v4[17] = CEMQuery_IMEI;
  v4[18] = CEMQuery_MEID;
  v4[19] = CEMQuery_modemFirmwareVersion;
  v4[20] = CEMQuery_cellularTechnology;
  v4[21] = CEMQuery_batteryLevel;
  v4[22] = CEMQuery_isSupervised;
  v4[23] = CEMQuery_isMultiUser;
  v4[24] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[25] = CEMQuery_isActivationLockEnabled;
  v4[26] = CEMQuery_isDoNotDisturbInEffect;
  v4[27] = CEMQuery_deviceID;
  v4[28] = CEMQuery_easDeviceIdentifier;
  v4[29] = CEMQuery_isCloudBackupEnabled;
  v4[30] = CEMQuery_activeManagedUsers;
  v4[31] = CEMQuery_isMDMLostModeEnabled;
  v4[32] = CEMQuery_maximumResidentUsers;
  v4[33] = CEMQuery_diagnosticSubmissionEnabled;
  v4[34] = CEMQuery_appAnalyticsEnabled;
  v4[35] = CEMQuery_ICCID;
  v4[36] = CEMQuery_bluetoothMAC;
  v4[37] = CEMQuery_wiFiMAC;
  v4[38] = CEMQuery_ethernetMACs;
  v4[39] = CEMQuery_currentCarrierNetwork;
  v4[40] = CEMQuery_simCarrierNetwork;
  v4[41] = CEMQuery_subscriberCarrierNetwork;
  v4[42] = CEMQuery_carrierSettingsVersion;
  v4[43] = CEMQuery_phoneNumber;
  v4[44] = CEMQuery_dataRoamingEnabled;
  v4[45] = CEMQuery_voiceRoamingEnabled;
  v4[46] = CEMQuery_personalHotspotEnabled;
  v4[47] = CEMQuery_isNetworkTethered;
  v4[48] = CEMQuery_isRoaming;
  v4[49] = CEMQuery_subscriberMCC;
  v4[50] = CEMQuery_subscriberMNC;
  v4[51] = CEMQuery_currentMCC;
  v4[52] = CEMQuery_currentMNC;
  v1 = +[NSArray arrayWithObjects:v4 count:53];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_1000FB8E8;
  qword_1000FB8E8 = v2;
}

void sub_100007F18(id a1)
{
  v4[0] = CEMQuery_iTunesStoreAccountIsActive;
  v4[1] = CEMQuery_iTunesStoreAccountHash;
  void v4[2] = CEMQuery_pushToken;
  v1 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_1000FB8F8;
  qword_1000FB8F8 = v2;
}

void sub_100008030(id a1)
{
  v4[0] = CEMQuery_organizationInfo;
  v4[1] = CEMQuery_mdmOptions;
  void v4[2] = CEMQuery_pushToken;
  v1 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_1000FB908;
  qword_1000FB908 = v2;
}

void sub_100008170(id a1)
{
  v3[0] = CEMQuery_UDID;
  v3[1] = CEMQuery_lastCloudBackupDate;
  v4[0] = DMFDeviceUniqueIdentifierKey;
  v4[1] = DMFDeviceLastCloudBackupDateKey;
  v3[2] = CEMQuery_awaitingConfiguration;
  v3[3] = CEMQuery_iTunesStoreAccountIsActive;
  void v4[2] = DMFDeviceAwaitingConfigurationKey;
  void v4[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  v3[4] = CEMQuery_iTunesStoreAccountHash;
  v3[5] = CEMQuery_deviceName;
  v4[4] = DMFDeviceiTunesStoreAccountHashKey;
  v4[5] = DMFDeviceNameKey;
  v3[6] = CEMQuery_osVersion;
  v3[7] = CEMQuery_buildVersion;
  v4[6] = DMFDeviceOSVersionKey;
  v4[7] = DMFDeviceBuildVersionKey;
  v3[8] = CEMQuery_modelName;
  v3[9] = CEMQuery_model;
  v4[8] = DMFDeviceModelNameKey;
  v4[9] = DMFDeviceModelKey;
  v3[10] = CEMQuery_productName;
  v3[11] = CEMQuery_marketingName;
  v4[10] = DMFDeviceProductNameKey;
  v4[11] = DMFDeviceMarketingNameKey;
  v3[12] = CEMQuery_serialNumber;
  v3[13] = CEMQuery_deviceCapacity;
  v4[12] = DMFDeviceSerialNumberKey;
  v4[13] = DMFDeviceCapacityKey;
  v3[14] = CEMQuery_availableDeviceCapacity;
  v3[15] = CEMQuery_IMEI;
  v4[14] = DMFDeviceAvailableCapacityKey;
  v4[15] = DMFDeviceIMEIKey;
  v3[16] = CEMQuery_MEID;
  v3[17] = CEMQuery_modemFirmwareVersion;
  v4[16] = DMFDeviceMEIDKey;
  v4[17] = DMFDeviceModemFirmwareVersionKey;
  v3[18] = CEMQuery_cellularTechnology;
  v3[19] = CEMQuery_batteryLevel;
  v4[18] = DMFDeviceCellularTechnologyKey;
  v4[19] = DMFDeviceBatteryLevelKey;
  v3[20] = CEMQuery_isSupervised;
  v3[21] = CEMQuery_isMultiUser;
  v4[20] = DMFDeviceIsSupervisedKey;
  v4[21] = DMFDeviceIsEphemeralMultiUserKey;
  v3[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v3[23] = CEMQuery_isActivationLockEnabled;
  v4[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v4[23] = DMFDeviceIsActivationLockEnabledKey;
  v3[24] = CEMQuery_isDoNotDisturbInEffect;
  v3[25] = CEMQuery_deviceID;
  v4[24] = DMFDeviceIsDNDInEffectKey;
  v4[25] = DMFDeviceIdentifierKey;
  v3[26] = CEMQuery_easDeviceIdentifier;
  v3[27] = CEMQuery_isCloudBackupEnabled;
  v4[26] = DMFDeviceEASIdentifierKey;
  v4[27] = DMFDeviceIsCloudBackupEnabledKey;
  v3[28] = CEMQuery_isMDMLostModeEnabled;
  v3[29] = CEMQuery_maximumResidentUsers;
  v4[28] = DMFDeviceIsLostModeEnabledKey;
  v4[29] = DMFDeviceMaximumResidentUsersKey;
  v3[30] = CEMQuery_diagnosticSubmissionEnabled;
  v3[31] = CEMQuery_appAnalyticsEnabled;
  v4[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v4[31] = DMFDeviceAppAnalyticsEnabledKey;
  v3[32] = CEMQuery_ICCID;
  v3[33] = CEMQuery_bluetoothMAC;
  v4[32] = DMFDeviceICCIDKey;
  v4[33] = DMFDeviceBluetoothMACKey;
  v3[34] = CEMQuery_wiFiMAC;
  v3[35] = CEMQuery_currentCarrierNetwork;
  v4[34] = DMFDeviceWiFiMACKey;
  v4[35] = DMFDeviceCurrentCarrierNetworkKey;
  v3[36] = CEMQuery_simCarrierNetwork;
  v3[37] = CEMQuery_subscriberCarrierNetwork;
  v4[36] = DMFDeviceSIMCarrierNetworkKey;
  v4[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v3[38] = CEMQuery_carrierSettingsVersion;
  v3[39] = CEMQuery_phoneNumber;
  v4[38] = DMFDeviceCarrierSettingsVersionKey;
  v4[39] = DMFDevicePhoneNumberKey;
  v3[40] = CEMQuery_dataRoamingEnabled;
  v3[41] = CEMQuery_voiceRoamingEnabled;
  v4[40] = DMFDeviceDataRoamingEnabledKey;
  v4[41] = DMFDeviceVoiceRoamingEnabledKey;
  v3[42] = CEMQuery_personalHotspotEnabled;
  v3[43] = CEMQuery_isNetworkTethered;
  v4[42] = DMFDevicePersonalHotspotEnabledKey;
  v4[43] = DMFDeviceIsNetworkTetheredKey;
  v3[44] = CEMQuery_isRoaming;
  v3[45] = CEMQuery_subscriberMCC;
  v4[44] = DMFDeviceIsRoamingKey;
  v4[45] = DMFDeviceSubscriberMCCKey;
  v3[46] = CEMQuery_subscriberMNC;
  v3[47] = CEMQuery_currentMCC;
  v4[46] = DMFDeviceSubscriberMNCKey;
  v4[47] = DMFDeviceCurrentMCCKey;
  v3[48] = CEMQuery_currentMNC;
  v4[48] = DMFDeviceCurrentMNCKey;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:49];
  uint64_t v2 = (void *)qword_1000FB918;
  qword_1000FB918 = v1;
}

void sub_10000880C(id a1)
{
  v3[0] = DMFDeviceUniqueIdentifierKey;
  v3[1] = DMFDeviceLastCloudBackupDateKey;
  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_lastCloudBackupDate;
  v3[2] = DMFDeviceAwaitingConfigurationKey;
  v3[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  void v4[2] = CEMQuery_awaitingConfiguration;
  void v4[3] = CEMQuery_iTunesStoreAccountIsActive;
  v3[4] = DMFDeviceiTunesStoreAccountHashKey;
  v3[5] = DMFDeviceNameKey;
  v4[4] = CEMQuery_iTunesStoreAccountHash;
  v4[5] = CEMQuery_deviceName;
  v3[6] = DMFDeviceOSVersionKey;
  v3[7] = DMFDeviceBuildVersionKey;
  v4[6] = CEMQuery_osVersion;
  v4[7] = CEMQuery_buildVersion;
  v3[8] = DMFDeviceModelNameKey;
  v3[9] = DMFDeviceModelKey;
  v4[8] = CEMQuery_modelName;
  v4[9] = CEMQuery_model;
  v3[10] = DMFDeviceProductNameKey;
  v3[11] = DMFDeviceMarketingNameKey;
  v4[10] = CEMQuery_productName;
  v4[11] = CEMQuery_marketingName;
  v3[12] = DMFDeviceSerialNumberKey;
  v3[13] = DMFDeviceCapacityKey;
  v4[12] = CEMQuery_serialNumber;
  v4[13] = CEMQuery_deviceCapacity;
  v3[14] = DMFDeviceAvailableCapacityKey;
  v3[15] = DMFDeviceIMEIKey;
  v4[14] = CEMQuery_availableDeviceCapacity;
  v4[15] = CEMQuery_IMEI;
  v3[16] = DMFDeviceMEIDKey;
  v3[17] = DMFDeviceModemFirmwareVersionKey;
  v4[16] = CEMQuery_MEID;
  v4[17] = CEMQuery_modemFirmwareVersion;
  v3[18] = DMFDeviceCellularTechnologyKey;
  v3[19] = DMFDeviceBatteryLevelKey;
  v4[18] = CEMQuery_cellularTechnology;
  v4[19] = CEMQuery_batteryLevel;
  v3[20] = DMFDeviceIsSupervisedKey;
  v3[21] = DMFDeviceIsEphemeralMultiUserKey;
  v4[20] = CEMQuery_isSupervised;
  v4[21] = CEMQuery_isMultiUser;
  v3[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v3[23] = DMFDeviceIsActivationLockEnabledKey;
  v4[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[23] = CEMQuery_isActivationLockEnabled;
  v3[24] = DMFDeviceIsDNDInEffectKey;
  v3[25] = DMFDeviceIdentifierKey;
  v4[24] = CEMQuery_isDoNotDisturbInEffect;
  v4[25] = CEMQuery_deviceID;
  v3[26] = DMFDeviceEASIdentifierKey;
  v3[27] = DMFDeviceIsCloudBackupEnabledKey;
  v4[26] = CEMQuery_easDeviceIdentifier;
  v4[27] = CEMQuery_isCloudBackupEnabled;
  v3[28] = DMFDeviceIsLostModeEnabledKey;
  v3[29] = DMFDeviceMaximumResidentUsersKey;
  v4[28] = CEMQuery_isMDMLostModeEnabled;
  v4[29] = CEMQuery_maximumResidentUsers;
  v3[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v3[31] = DMFDeviceAppAnalyticsEnabledKey;
  v4[30] = CEMQuery_diagnosticSubmissionEnabled;
  v4[31] = CEMQuery_appAnalyticsEnabled;
  v3[32] = DMFDeviceICCIDKey;
  v3[33] = DMFDeviceBluetoothMACKey;
  v4[32] = CEMQuery_ICCID;
  v4[33] = CEMQuery_bluetoothMAC;
  v3[34] = DMFDeviceWiFiMACKey;
  v3[35] = DMFDeviceCurrentCarrierNetworkKey;
  v4[34] = CEMQuery_wiFiMAC;
  v4[35] = CEMQuery_currentCarrierNetwork;
  v3[36] = DMFDeviceSIMCarrierNetworkKey;
  v3[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v4[36] = CEMQuery_simCarrierNetwork;
  v4[37] = CEMQuery_subscriberCarrierNetwork;
  v3[38] = DMFDeviceCarrierSettingsVersionKey;
  v3[39] = DMFDevicePhoneNumberKey;
  v4[38] = CEMQuery_carrierSettingsVersion;
  v4[39] = CEMQuery_phoneNumber;
  v3[40] = DMFDeviceDataRoamingEnabledKey;
  v3[41] = DMFDeviceVoiceRoamingEnabledKey;
  v4[40] = CEMQuery_dataRoamingEnabled;
  v4[41] = CEMQuery_voiceRoamingEnabled;
  v3[42] = DMFDevicePersonalHotspotEnabledKey;
  v3[43] = DMFDeviceIsNetworkTetheredKey;
  v4[42] = CEMQuery_personalHotspotEnabled;
  v4[43] = CEMQuery_isNetworkTethered;
  v3[44] = DMFDeviceIsRoamingKey;
  v3[45] = DMFDeviceSubscriberMCCKey;
  v4[44] = CEMQuery_isRoaming;
  v4[45] = CEMQuery_subscriberMCC;
  v3[46] = DMFDeviceSubscriberMNCKey;
  v3[47] = DMFDeviceCurrentMCCKey;
  v4[46] = CEMQuery_subscriberMNC;
  v4[47] = CEMQuery_currentMCC;
  v3[48] = DMFDeviceCurrentMNCKey;
  v4[48] = CEMQuery_currentMNC;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:49];
  uint64_t v2 = (void *)qword_1000FB928;
  qword_1000FB928 = v1;
}

void sub_10000D680(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DMFConfigurationEngineLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007EA0C();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) predicateType];
    id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded stopping Usage Tracking monitor with budget identifier: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_10000E93C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10000E984()
{
  return v0;
}

void sub_10000E9A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

int64_t sub_100010FFC(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = DMFDeclarationPayloadIdentifierKey;
  id v5 = a3;
  id v6 = [(NSDictionary *)a2 objectForKeyedSubscript:v4];
  id v7 = [(NSDictionary *)v5 objectForKeyedSubscript:v4];

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

id sub_1000121D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) activationPredicateObserverDidTrigger:*(void *)(a1 + 40)];
}

void sub_100012648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000127B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000128A4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v1 activationPredicateObserverManager:v2 didObserveChangeForPredicateWithIdentifier:v3];
}

void sub_100012974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100012988(id a1, NSString *a2, DMDActivationPredicateObserver *a3, BOOL *a4)
{
}

void sub_10001366C(id a1)
{
  qword_1000FB930 = [[DMDAirPlayManager alloc] initPrivate];

  _objc_release_x1();
}

void sub_100013B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013B54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013B64(uint64_t a1)
{
}

void sub_100013B6C(void *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    obj[3] = v2;
    obj[4] = v3;
    id v5 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v6 = a1[8];
    uint64_t v7 = a1[6];
    uint64_t v8 = *(void *)(a1[7] + 8);
    obj[0] = *(id *)(v8 + 40);
    [v5 _setOutputDevices:v4 forSessionType:v6 password:v7 error:obj];
    objc_storeStrong((id *)(v8 + 40), obj[0]);
  }
}

void sub_100014478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000144AC(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  MRAVReconnaissanceSessionBeginSearch();
}

intptr_t sub_100014558(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4)
{
  if (cf)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFRetain(cf);
  }
  else if (a4)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    uint64_t v11 = a4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v6 = DMFErrorWithCodeAndUserInfo();
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000147DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000147FC(uint64_t a1, void *a2)
{
  id result = [a2 count];
  if (!result) {
    return result;
  }
  unint64_t v5 = 0;
  while (1)
  {
    values = (void *)CFArrayGetValueAtIndex((CFArrayRef)a2, v5);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
      break;
    }
    __int16 v13 = (void *)MRAVOutputDeviceCopyName();
    unsigned int v14 = [v13 isEqualToString:*(void *)(a1 + 40)];

    if (v14) {
      goto LABEL_16;
    }
LABEL_14:
    ++v5;
    id result = [a2 count];
    if (v5 >= (unint64_t)result) {
      return result;
    }
  }
  uint64_t v6 = (void *)MRAVOutputDeviceCopyMACAddress();
  uint64_t v7 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", ether_aton((const char *)[*(id *)(a1 + 40) UTF8String]), [v6 length]);
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = v7;
  id v11 = [v10 bytes];
  if (![v8 length])
  {
LABEL_12:

    goto LABEL_14;
  }
  uint64_t v12 = 0;
  do
  {
    if ((char *)[v8 length] - 1 <= v12)
    {
      if ((*((unsigned __int8 *)v11 + 5) ^ *((unsigned __int8 *)v9 + 5)) > 0xF) {
        goto LABEL_12;
      }
    }
    else if (v12[(void)v9] != v12[(void)v11])
    {
      goto LABEL_12;
    }
    ++v12;
  }
  while ([v8 length] > v12);

LABEL_16:
  CFArrayRef v15 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  uint64_t v16 = CFAutorelease(v15);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100014A88(id a1)
{
  qword_1000FB940 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initPrivate];

  _objc_release_x1();
}

void sub_100014E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100014E70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = [WeakRetained manifest];

  return v2;
}

void sub_100015138(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 bundleIdentifier];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_100015C58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007F344(a1, (uint64_t)v3, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100015F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015F6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015F7C(uint64_t a1)
{
}

void sub_100015F84(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void sub_100016DE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _metadataForBundleIdentifier:*(void *)(a1 + 40)];
  if (v7) {
    goto LABEL_4;
  }
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _newMetadataDictionary];
LABEL_4:
    id v8 = [v7 objectForKeyedSubscript:@"Attributes"];
    [v8 setObject:v5 forKeyedSubscript:@"Removable"];

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v17 = 0;
    unsigned __int8 v11 = [v9 _setMetadata:v7 forBundleIdentifier:v10 error:&v17];
    id v12 = v17;
    __int16 v13 = v12;
    if ((v11 & 1) == 0 && !v12)
    {
      __int16 v13 = DMFErrorWithCodeAndUserInfo();
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      if (v6) {
        id v15 = v6;
      }
      else {
        id v15 = v13;
      }
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
    }

    goto LABEL_13;
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
  }
LABEL_13:
}

void sub_100016F0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007F44C(a1);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v7();
    goto LABEL_13;
  }
  if (a2 != 3)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10 != a2)
    {
      unsigned __int8 v11 = *(void **)(a1 + 32);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000170D4;
      v12[3] = &unk_1000C9E18;
      id v13 = v11;
      id v15 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 40);
      +[IXAppInstallCoordinator setRemovability:v10 forAppWithBundleID:v13 byClient:3 completion:v12];

      goto LABEL_13;
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  id v8 = DMFErrorWithCodeAndUserInfo();
  id v9 = DMFAppLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10007F3D8(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

void sub_1000170D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007F3D8(a1);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

id sub_100017298()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000FB970;
  uint64_t v7 = qword_1000FB970;
  if (!qword_1000FB970)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B668;
    v3[3] = &unk_1000C9F48;
    v3[4] = &v4;
    sub_10001B668((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100017364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_100018C88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v2 = [WeakRetained _metadataByBundleIdentifier];
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100019D38(id a1)
{
  v22[0] = &off_1000D3398;
  v22[1] = &off_1000D33B0;
  v23[0] = &off_1000D3428;
  v23[1] = &off_1000D3380;
  v24[0] = &off_1000D3410;
  id v9 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v9;
  v24[1] = &off_1000D3380;
  v20[0] = &off_1000D3440;
  v20[1] = &off_1000D3458;
  v21[0] = &off_1000D3398;
  v21[1] = &off_1000D3410;
  id v1 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v25[1] = v1;
  v24[2] = &off_1000D33B0;
  v18[0] = &off_1000D3440;
  v18[1] = &off_1000D3458;
  v19[0] = &off_1000D3398;
  v19[1] = &off_1000D3410;
  v18[2] = &off_1000D3398;
  v18[3] = &off_1000D3380;
  v19[2] = &off_1000D3428;
  v19[3] = &off_1000D33F8;
  v18[4] = &off_1000D33B0;
  v19[4] = &off_1000D33F8;
  long long v2 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  v25[2] = v2;
  v24[3] = &off_1000D33C8;
  v16[0] = &off_1000D3380;
  v16[1] = &off_1000D33B0;
  v17[0] = &off_1000D33F8;
  v17[1] = &off_1000D33F8;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v25[3] = v3;
  v24[4] = &off_1000D3470;
  v14[0] = &off_1000D3458;
  v14[1] = &off_1000D33B0;
  v15[0] = &off_1000D3410;
  v15[1] = &off_1000D3380;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v25[4] = v4;
  v24[5] = &off_1000D3398;
  v12[0] = &off_1000D3458;
  v12[1] = &off_1000D33B0;
  v13[0] = &off_1000D3410;
  v13[1] = &off_1000D3380;
  id v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v25[5] = v5;
  v24[6] = &off_1000D3428;
  v10[0] = &off_1000D3458;
  v10[1] = &off_1000D33B0;
  v11[0] = &off_1000D3410;
  v11[1] = &off_1000D3380;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v25[6] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];
  id v8 = (void *)qword_1000FB950;
  qword_1000FB950 = v7;
}

void sub_10001A628(id a1)
{
  v3[0] = &off_1000D33B0;
  v3[1] = &off_1000D3488;
  v4[0] = &off_1000D3380;
  v4[1] = &off_1000D33B0;
  v3[2] = &off_1000D3440;
  v3[3] = &off_1000D33C8;
  void v4[2] = &off_1000D3398;
  void v4[3] = &off_1000D34A0;
  v3[4] = &off_1000D3458;
  void v3[5] = &off_1000D34B8;
  v4[4] = &off_1000D3410;
  v4[5] = &off_1000D33B0;
  v3[6] = &off_1000D3398;
  v3[7] = &off_1000D3410;
  v4[6] = &off_1000D3428;
  v4[7] = &off_1000D34A0;
  v3[8] = &off_1000D3380;
  v4[8] = &off_1000D34A0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:9];
  long long v2 = (void *)qword_1000FB960;
  qword_1000FB960 = v1;
}

void sub_10001AA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_10001AA70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v2 = [WeakRetained _metadataByBundleIdentifier];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001AD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_10001AD50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [WeakRetained _metadataByBundleIdentifier];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = (uint64_t *)(a1 + 32);
  [v5 setObject:v2 forKeyedSubscript:v7];

  id v8 = objc_loadWeakRetained(v3);
  uint64_t v9 = *(void *)(v6[3] + 8);
  id obj = *(id *)(v9 + 40);
  LOBYTE(WeakRetained) = [v8 writeManagementInformationToDiskWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(v6[2] + 8) + 24) = (_BYTE)WeakRetained;

  if (!*(unsigned char *)(*(void *)(v6[2] + 8) + 24))
  {
    uint64_t v10 = DMFAppLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007FA5C(v6, v10);
    }
  }
}

void sub_10001B140(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    id v12 = a4;
    id v5 = a4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v6 = 0;
    [v9 _getEnterpriseAppMetadataFromData:a2 completion:v10];
  }
}

Class sub_10001B668(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000FB978)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10001B794;
    v3[4] = &unk_1000C9F80;
    void v3[5] = v3;
    long long v4 = off_1000C9F68;
    uint64_t v5 = 0;
    qword_1000FB978 = _sl_dlopen();
  }
  if (!qword_1000FB978) {
    sub_10007FAD8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PRSettingsProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10007FB58();
  }
  qword_1000FB970 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001B794()
{
  uint64_t result = _sl_dlopen();
  qword_1000FB978 = result;
  return result;
}

void sub_10001B820(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001B98C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (![v8 updateState])
        {
          uint64_t v9 = *(void **)(a1 + 32);
          uint64_t v10 = [v8 bundleIdentifier];
          [v9 addObject:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_10001BB4C;
  v15[3] = &unk_1000CA060;
  NSErrorUserInfoKey v11 = *(void **)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = *(void **)(a1 + 64);
  id v17 = v12;
  uint64_t v18 = v13;
  id v19 = v14;
  id v20 = *(id *)(a1 + 72);
  [v11 getUpdatesWithCompletionBlock:v15];
}

void sub_10001BB4C(id *a1, void *a2)
{
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (![v7 updateState])
        {
          id v8 = a1[4];
          uint64_t v9 = [v7 bundleIdentifier];
          [v8 addObject:v9];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [a1[5] bundleIdentifiers];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001BED0;
  v37[3] = &unk_1000C9FA8;
  id v11 = a1[5];
  id v12 = a1[6];
  id v38 = v11;
  id v39 = v12;
  id v13 = v10;
  id v40 = v13;
  id v41 = a1[7];
  id v14 = objc_retainBlock(v37);
  id v15 = objc_opt_new();
  id v16 = [a1[5] type];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10001BF7C;
  v35[4] = sub_10001BF8C;
  id v17 = [a1[5] propertyKeys];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [a1[6] _allPropertyKeys];
  }
  id v36 = v19;

  id v20 = [a1[6] jobManager];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001C028;
  v25[3] = &unk_1000CA038;
  id v21 = a1[5];
  v33 = v35;
  id v26 = v21;
  v30 = &stru_1000C9FE8;
  long long v22 = v14;
  id v31 = v22;
  id v34 = v16;
  id v27 = a1[4];
  id v23 = v15;
  id v24 = a1[6];
  id v28 = v23;
  id v29 = v24;
  id v32 = a1[8];
  [v20 getJobsUsingBlock:v25];

  _Block_object_dispose(v35, 8);
}

void sub_10001BEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001BED0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) managedAppsOnly]
    && ([*(id *)(a1 + 40) managementInformationForBundleIdentifier:v5],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = *(void **)(a1 + 48);
    if ((v8 || *(void *)(a1 + 56)) && ([v8 containsObject:v5] & 1) == 0) {
      uint64_t v9 = (uint64_t)[*(id *)(a1 + 56) isEqualToNumber:v6];
    }
    else {
      uint64_t v9 = 1;
    }
  }

  return v9;
}

uint64_t sub_10001BF7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001BF8C(uint64_t a1)
{
}

BOOL sub_10001BF94(id a1, ASDJob *a2)
{
  uint64_t v2 = a2;
  if ([(ASDJob *)v2 storeItemID])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(ASDJob *)v2 bundleID];
    if ([v4 hasPrefix:@"com.apple."])
    {
      id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v4 error:0];
      BOOL v3 = v5 != 0;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

void sub_10001C028(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) managedAppsOnly])
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) arrayByAddingObject:@"managementInformation"];
    uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v39 = *(void *)v56;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v12 = [v10 bundleID];
        int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
        uint64_t v14 = *(void *)(a1 + 72);
        +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 storeItemID]);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!(*(unsigned int (**)(uint64_t, void *, id))(v14 + 16))(v14, v12, v15)) {
          goto LABEL_13;
        }
        uint64_t v16 = 1;
        if (!v13) {
          uint64_t v16 = 2;
        }
        uint64_t v17 = *(void *)(a1 + 96) & v16;

        if (v17)
        {
          id v15 = [objc_alloc((Class)DMFApp) initWithJob:v10 hasUpdateAvailable:[*(id *)(a1 + 40) containsObject:v12] propertyKeys:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
          [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v12];
LABEL_13:
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v8);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10001C4D4;
  v49[3] = &unk_1000CA010;
  uint64_t v18 = *(void *)(a1 + 96);
  v49[4] = *(void *)(a1 + 56);
  uint64_t v54 = v18;
  id v52 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 88);
  id v50 = v19;
  uint64_t v53 = v20;
  id v51 = *(id *)(a1 + 48);
  id v21 = objc_retainBlock(v49);
  long long v22 = [(id)objc_opt_class() enumeratorForOrdinaryApps];
  v61[0] = v22;
  id v23 = [(id)objc_opt_class() enumeratorForUserAppPlaceholders];
  v61[1] = v23;
  id v24 = [(id)objc_opt_class() enumeratorForSystemAppPlaceholders];
  v61[2] = v24;
  v25 = +[NSArray arrayWithObjects:v61 count:3];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v37 = v25;
  id v26 = [v37 countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v40 = *(void *)v46;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(v37);
        }
        id v29 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v30 = v29;
        id v31 = [v30 countByEnumeratingWithState:&v41 objects:v59 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v42;
          do
          {
            for (k = 0; k != v32; k = (char *)k + 1)
            {
              if (*(void *)v42 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
              ((void (*)(void *, uint64_t))v21[2])(v21, v35);
            }
            id v32 = [v30 countByEnumeratingWithState:&v41 objects:v59 count:16];
          }
          while (v32);
        }
      }
      id v27 = [v37 countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v27);
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void sub_10001C4D4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 bundleIdentifier];
  if (v3)
  {
    uint64_t v4 = [v8 compatibilityObject];
    if ((*(void *)(a1 + 72) & (unint64_t)[*(id *)(a1 + 32) appTypeFromProxy:v4]) != 0)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      id v6 = [v4 itemID];
      LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v3, v6);

      if (v5)
      {
        id v7 = [objc_alloc((Class)DMFApp) initWithApplicationRecord:v8 hasUpdateAvailable:[*(id *)(a1 + 40) containsObject:v3] propertyKeys:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v3];
      }
    }
  }
}

void sub_10001C6D4(id a1)
{
  v3[0] = @"type";
  v3[1] = @"displayName";
  v3[2] = @"bundleIdentifier";
  v3[3] = @"storeItemIdentifier";
  v3[4] = @"externalVersionIdentifier";
  void v3[5] = @"distributorIdentifier";
  v3[6] = @"version";
  v3[7] = @"shortVersion";
  v3[8] = @"staticUsage";
  void v3[9] = @"dynamicUsage";
  v3[10] = @"onDemandResourcesUsage";
  v3[11] = @"sharedUsage";
  v3[12] = @"installationState";
  v3[13] = @"isPlaceholder";
  v3[14] = @"isRestricted";
  v3[15] = @"isBlocked";
  v3[16] = @"isUserBasedVPP";
  v3[17] = @"isDeviceBasedVPP";
  v3[18] = @"isLicenseExpired";
  v3[19] = @"isLicenseRevoked";
  v3[20] = @"isUPP";
  v3[21] = @"isValidated";
  v3[22] = @"isAppClip";
  v3[23] = @"isAppStoreVendable";
  v3[24] = @"isBetaApp";
  v3[25] = @"isAdHocCodeSigned";
  v3[26] = @"hasUpdateAvailable";
  v3[27] = @"VPNUUIDString";
  v3[28] = @"cellularSliceUUIDString";
  v3[29] = @"contentFilterUUIDString";
  v3[30] = @"DNSProxyUUIDString";
  v3[31] = @"relayUUIDString";
  v3[32] = @"associatedDomains";
  v3[33] = @"associatedDomainsEnableDirectDownloads";
  v3[34] = @"removable";
  v3[35] = @"tapToPayScreenLock";
  v3[36] = @"allowUserToHide";
  v3[37] = @"allowUserToLock";
  v3[38] = @"configuration";
  v3[39] = @"feedback";
  v3[40] = @"sourceIdentifier";
  v3[41] = @"managementInformation";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:42];
  uint64_t v2 = (void *)qword_1000FB980;
  qword_1000FB980 = v1;
}

void sub_10001C9E4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
  else
  {
    if (v8)
    {
      NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
      id v14 = v8;
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v12 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
    }
    else
    {
      id v11 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

void sub_10001CCAC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 32) _installUserAppForRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      goto LABEL_7;
    }
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v3();
LABEL_7:
}

void sub_10001CE94(uint64_t a1, void *a2)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v8 bundleID];
      LOBYTE(v9) = [v9 isEqualToString:v10];

      if (v9) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 persistentID]);

    if (!v11) {
      goto LABEL_12;
    }
    id v12 = *(void **)(a1 + 40);
    id v21 = v11;
    NSErrorUserInfoKey v13 = +[NSArray arrayWithObjects:&v21 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_10001D0B4;
    v15[3] = &unk_1000CA120;
    id v16 = *(id *)(a1 + 48);
    [v12 resumeJobsWithIDs:v13 completionBlock:v15];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(a1 + 48);
    id v11 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }
}

void sub_10001D0B4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  else
  {
    if (v5)
    {
      NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
      id v11 = v5;
      id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
    }
    else
    {
      id v8 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

void sub_10001D3F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) allowFreePurchases])
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Install free app for request: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 40) _downloadAppForRequest:*(void *)(a1 + 32) type:3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001D5F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    NSErrorUserInfoKey v10 = a4;
    id v5 = a4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
  else
  {
    id v8 = *(void (**)(uint64_t, void))(v4 + 16);
    id v6 = 0;
    v8(v4, 0);
  }
}

void sub_10001D818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D898(id a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setShouldFilterExternalOriginatedDownloads:0];
  id v1 = [objc_alloc((Class)ASDJobManager) initWithOptions:v3];
  uint64_t v2 = (void *)qword_1000FB990;
  qword_1000FB990 = (uint64_t)v1;
}

void sub_10001D958(id a1)
{
  qword_1000FB9A0 = objc_opt_new();

  _objc_release_x1();
}

void sub_10001DD30(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v6 = [a2 authenticatedAccount];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

void sub_10001E034(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = DMFAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    NSErrorUserInfoKey v13 = [(id)objc_opt_class() changeTypeAsString:a4];
    int v14 = 138544130;
    CFStringRef v15 = v12;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    long long v19 = v13;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Send app store request result: success: %{public}@, metadata: %{public}@, change type: %{public}@, error: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001E608(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v7 = NSUnderlyingErrorKey;
    id v8 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    uint64_t v5 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void))(v2 + 16);
    id v4 = 0;
    v6(v2, 0);
  }
}

void sub_10001E820(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 bundleIdentifier];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_10001F05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F074(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001F084(uint64_t a1)
{
}

void sub_10001F08C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 != 1)
  {
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007FCB0();
    }
  }
  if (v5)
  {
    uint64_t v7 = a1 + 32;
    _CFPreferencesAppSynchronizeWithContainer();
    id v8 = _CFPreferencesCopyAppValueWithContainer();
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = v8;
        id v11 = *(NSObject **)(v9 + 40);
        *(void *)(v9 + 40) = v10;
      }
      else
      {
        id v11 = DMFAppLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10007FC40(v7, v11, v12, v13, v14, v15, v16, v17);
        }
      }
    }
  }
  else
  {
    id v8 = DMFAppLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10007FBD4();
    }
  }
}

void sub_10001F368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F388(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 != 1)
  {
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007FD98();
    }
  }
  if (v5)
  {
    _CFPreferencesSetAppValueWithContainer();
    _CFPreferencesAppSynchronizeWithContainer();
    +[NSArray arrayWithObject:*(void *)(a1 + 32)];
    _CFPreferencesPostValuesChangedInDomains();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10007FD2C();
    }
  }
}

void sub_10001F7F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [v4 setIsStoreApp:1];
  [v4 setBundleIdentifier:*(void *)(a1 + 32)];
  [v4 setStoreItemIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _applyStoreDictionary:v3 toAppMetadata:v4];

  id v5 = [v4 bundleIdentifier];

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Get metadata with device lookup for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@", buf, 0x20u);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_10001F9E4;
    v16[3] = &unk_1000CA2C8;
    id v14 = *(id *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 48);
    id v18 = v14;
    v16[4] = v15;
    id v17 = v4;
    [v12 sendAppRequestWithBundleIdentifier:v10 storeItemIdentifier:v11 personaIdentifier:v13 type:2 skipDownloads:1 completion:v16];
  }
}

void sub_10001F9E4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = DMFAppLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10007FE14((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _applyStoreDictionary:a2 toAppMetadata:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) setNeedsRedownload:a3 == 4];
    uint64_t v15 = [*(id *)(a1 + 40) bundleIdentifier];

    uint64_t v16 = *(void *)(a1 + 48);
    if (v15)
    {
      (*(void (**)(void, void, void))(v16 + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0);
    }
    else
    {
      id v17 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
    }
  }
}

void sub_10001FBD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001FBF0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10001FCD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
    long long v19 = a3;
    id v7 = a3;
    id v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
  }
  else
  {
    id v10 = 0;
    id v8 = [objc_alloc((Class)SSAuthenticationContext) initWithAccount:v5];
    id v11 = objc_alloc((Class)SSRedeemCodesRequest);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v12 = +[NSArray arrayWithObjects:&v17 count:1];
    id v9 = [v11 initWithRedeemCodes:v12];

    [v9 setAuthenticationContext:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10001FE9C;
    v14[3] = &unk_1000CA360;
    id v13 = *(id *)(a1 + 40);
    id v15 = 0;
    id v16 = v13;
    [v9 startWithRedeemResponseBlock:v14];
  }
}

void sub_10001FE9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
      uint64_t v12 = v8;
      id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v10 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    }
    else
    {
      id v9 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
    }
  }
  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(a1 + 40), 0);
  }
}

void sub_1000200AC(uint64_t a1, void *a2)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      id v9 = *(void **)(a1 + 32);
      id v10 = [v8 bundleID];
      LOBYTE(v9) = [v9 isEqualToString:v10];

      if (v9) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    NSErrorUserInfoKey v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 persistentID]);

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void **)(a1 + 40);
    __int16 v21 = v11;
    id v13 = +[NSArray arrayWithObjects:&v21 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_1000202CC;
    v15[3] = &unk_1000CA120;
    id v16 = *(id *)(a1 + 48);
    [v12 cancelJobsWithIDs:v13 completionBlock:v15];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v11 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }
}

void sub_1000202CC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  else
  {
    if (v5)
    {
      NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
      id v11 = v5;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      id v9 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
    }
    else
    {
      uint64_t v8 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

void sub_1000204F0(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v6 = a3;
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"DMDAppController+Remove+iphoneOS.m", 60, @"Assertion couldn't be acquired: %@", v6 object file lineNumber description];
  }
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000205F8;
  v8[3] = &unk_1000C9DA0;
  v8[4] = v5;
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  [v5 _uninstallAppWithBundleIdentifier:v9 completion:v8];
}

void sub_1000205F8(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 removeTerminationAssertionForBundleIdentifier:v4];
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100020828(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000208E4;
  void v4[3] = &unk_1000CA3D8;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  +[IXAppInstallCoordinator uninstallAppWithBundleID:v2 options:v3 completion:v4];
}

void sub_1000208E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 resumeSync];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100020948(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020F0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) _updateEndedForLifeCycle:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000211F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = DMFAppLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10007FEF8(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DMF successfully restarted app: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10002150C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000215BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021624(id a1)
{
  qword_1000FB9B0 = objc_opt_new();

  _objc_release_x1();
}

void sub_100021E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_100021E9C(id a1)
{
  uint64_t v1 = +[DMFApp stringForInstallationState:0];
  v12[0] = v1;
  v13[0] = &off_1000D34D0;
  uint64_t v2 = +[DMFApp stringForInstallationState:1];
  v12[1] = v2;
  v13[1] = &off_1000D34E8;
  id v3 = +[DMFApp stringForInstallationState:2];
  void v12[2] = v3;
  void v13[2] = &off_1000D3500;
  id v4 = +[DMFApp stringForInstallationState:3];
  v12[3] = v4;
  v13[3] = &off_1000D3518;
  id v5 = +[DMFApp stringForInstallationState:4];
  void v12[4] = v5;
  v13[4] = &off_1000D3530;
  id v6 = +[DMFApp stringForInstallationState:5];
  v12[5] = v6;
  v13[5] = &off_1000D3548;
  uint64_t v7 = +[DMFApp stringForInstallationState:6];
  v12[6] = v7;
  v13[6] = &off_1000D3560;
  int v8 = +[DMFApp stringForInstallationState:7];
  v12[7] = v8;
  v13[7] = &off_1000D3578;
  uint64_t v9 = +[DMFApp stringForInstallationState:8];
  v12[8] = v9;
  v13[8] = &off_1000D3590;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:9];
  id v11 = (void *)qword_1000FB9C0;
  qword_1000FB9C0 = v10;
}

void sub_1000220A4(uint64_t a1)
{
  uint64_t v2 = (void *)qword_1000FB9C0;
  id v6 = [*(id *)(a1 + 32) stateMachine];
  id v3 = [v6 currentState];
  id v4 = [v3 name];
  id v5 = [v2 objectForKeyedSubscript:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 unsignedIntegerValue];
}

void sub_1000222C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t sub_1000222E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000222F4(uint64_t a1)
{
}

void sub_1000222FC(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v6 currentState];
  uint64_t v3 = [v2 name];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100022408(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 willStartInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_10002263C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didStartInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100022870(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didPauseInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100022AA4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didResumeInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100022CD8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didCancelInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100022F0C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFailInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100023140(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFinishInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100023374(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 willStartUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_1000235A8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didStartUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_1000237DC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didPauseUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100023A10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didResumeUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100023C44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didCancelUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100023E78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFailUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_1000240AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFinishUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_1000242E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 willStartUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100024514(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFailUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_100024748(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  [v2 transitionWithTriggeringEvent:v4];

  id v5 = +[NSDate now];
  [*(id *)(a1 + 32) setLastModified:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 32) observers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didFinishUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_10002499C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addPointer:*(void *)(a1 + 40)];
}

void sub_100024AA4(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) observers];
  id v2 = [v8 count];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = *(id *)(a1 + 40);
      if (v5 == [v8 pointerAtIndex:v4]) {
        break;
      }
      if (v3 == (id)++v4) {
        goto LABEL_8;
      }
    }
    [v8 removePointerAtIndex:v4];
    if (![v8 count])
    {
      id v6 = objc_opt_class();
      id v7 = [*(id *)(a1 + 32) bundleIdentifier];
      [v6 _removeLifeCycleForBundleIdentifier:v7];
    }
  }
LABEL_8:
}

void sub_100024BFC(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [*(id *)(a1 + 32) observers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didChangeInstallingProgressForLifeCycle:*(void *)(a1 + 32)];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_100024DA8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [*(id *)(a1 + 32) observers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didChangeUpdatingProgressForLifeCycle:*(void *)(a1 + 32)];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_100025020(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [*(id *)(a1 + 32) observers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didResetStateForLifeCycle:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_10002579C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)4)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationsWillInstall -> willStartUpdating", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) willStartUpdating];
  }
  else if (v2)
  {
    id v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
      long long v9 = [*(id *)(a1 + 32) currentStateName];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillInstall -> <no change>", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalled -> applicationsWillInstall -> willStartInstalling", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) willStartInstalling];
  }
}

void sub_1000259DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch((unint64_t)[*(id *)(a1 + 32) currentState])
  {
    case 0uLL:
      id v4 = DMFAppLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
        int v21 = 138543362;
        uint64_t v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalled -> applicationInstallsDidStart -> willStartInstalling -> didStartInstalling", (uint8_t *)&v21, 0xCu);
      }
      [*(id *)(a1 + 32) willStartInstalling];
      goto LABEL_8;
    case 1uLL:
      id v6 = DMFAppLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [*(id *)(a1 + 32) bundleIdentifier];
        int v21 = 138543362;
        uint64_t v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartInstalling", (uint8_t *)&v21, 0xCu);
      }
LABEL_8:
      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_27;
    case 4uLL:
      long long v11 = DMFAppLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [*(id *)(a1 + 32) bundleIdentifier];
        int v21 = 138543362;
        uint64_t v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationInstallsDidStart -> willStartUpdating -> didStartUpdating", (uint8_t *)&v21, 0xCu);
      }
      [*(id *)(a1 + 32) willStartUpdating];
      goto LABEL_17;
    case 5uLL:
      long long v13 = DMFAppLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [*(id *)(a1 + 32) bundleIdentifier];
        int v21 = 138543362;
        uint64_t v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartUpdating", (uint8_t *)&v21, 0xCu);
      }
LABEL_17:
      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_27;
    case 8uLL:
      long long v15 = [v3 appState];
      if ([v15 isDowngraded])
      {
        id v16 = [v3 appState];
        unsigned int v17 = [v16 isPlaceholder];

        if (v17)
        {
          long long v18 = DMFAppLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            long long v19 = [*(id *)(a1 + 32) bundleIdentifier];
            int v21 = 138543362;
            uint64_t v22 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> didFinishUninstalling (special case)", (uint8_t *)&v21, 0xCu);
          }
          [*(id *)(a1 + 32) didFinishUninstalling];
        }
      }
      else
      {
      }
      long long v8 = DMFAppLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [*(id *)(a1 + 32) bundleIdentifier];
        int v21 = 138543362;
        uint64_t v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> <no change> (not special case)", (uint8_t *)&v21, 0xCu);
      }
      goto LABEL_26;
    default:
      long long v8 = DMFAppLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v9 = [*(id *)(a1 + 32) bundleIdentifier];
        int v10 = [*(id *)(a1 + 32) currentStateName];
        int v21 = 138543618;
        uint64_t v22 = v9;
        __int16 v23 = 2114;
        uint64_t v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidStart -> <no change>", (uint8_t *)&v21, 0x16u);
      }
LABEL_26:

LABEL_27:
      return;
  }
}

void sub_100025E68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)6)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationInstallsDidChange -> didChangeUpdatingProgress", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didChangeUpdatingProgress];
  }
  else if (v2 == (id)2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationInstallsDidChange -> didChangeInstallingProgress", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didChangeInstallingProgress];
  }
  else
  {
    id v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
      long long v9 = [*(id *)(a1 + 32) currentStateName];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidChange -> <no change>", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_1000260AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)6)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationInstallsDidPause -> didPauseUpdating", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didPauseUpdating];
  }
  else if (v2 == (id)2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationInstallsDidPause -> didPauseInstalling", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didPauseInstalling];
  }
  else
  {
    id v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
      long long v9 = [*(id *)(a1 + 32) currentStateName];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidPause -> <no change>", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_1000262F0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)7)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update paused -> applicationInstallsDidResume -> didResumeUpdating", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didResumeUpdating];
  }
  else if (v2 == (id)3)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation paused -> applicationInstallsDidResume -> didResumeInstalling", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didResumeInstalling];
  }
  else
  {
    id v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
      long long v9 = [*(id *)(a1 + 32) currentStateName];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidResume -> <no change>", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_100026534(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 5) < 3)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationInstallsDidCancel -> didCancelUpdating", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelUpdating];
  }
  else if ((unint64_t)(v2 - 1) > 2)
  {
    id v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
      long long v9 = [*(id *)(a1 + 32) currentStateName];
      int v10 = 138543618;
      long long v11 = v8;
      __int16 v12 = 2114;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidCancel -> <no change>", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v10 = 138543362;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationInstallsDidCancel -> didCancelInstalling", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelInstalling];
  }
}

void sub_100026780(uint64_t a1)
{
  switch((unint64_t)[*(id *)(a1 + 32) currentState])
  {
    case 1uLL:
      id v6 = DMFAppLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [*(id *)(a1 + 32) bundleIdentifier];
        int v13 = 138543362;
        long long v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation queued -> applicationsDidFailToInstall -> didStartInstalling -> didFailInstalling", (uint8_t *)&v13, 0xCu);
      }
      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
      id v2 = DMFAppLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = [*(id *)(a1 + 32) bundleIdentifier];
        int v13 = 138543362;
        long long v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installing | installation paused> -> applicationsDidFailToInstall -> didFailInstalling", (uint8_t *)&v13, 0xCu);
      }
LABEL_11:
      [*(id *)(a1 + 32) didFailInstalling];
      return;
    case 5uLL:
      long long v11 = DMFAppLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [*(id *)(a1 + 32) bundleIdentifier];
        int v13 = 138543362;
        long long v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update queued -> applicationsDidFailToInstall -> didStartUpdating -> didFailUpdating", (uint8_t *)&v13, 0xCu);
      }
      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_18;
    case 6uLL:
    case 7uLL:
      id v4 = DMFAppLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
        int v13 = 138543362;
        long long v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <updating | update paused> -> applicationsDidFailToInstall -> didFailUpdating", (uint8_t *)&v13, 0xCu);
      }
LABEL_18:
      [*(id *)(a1 + 32) didFailUpdating];
      break;
    default:
      long long v8 = DMFAppLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v9 = [*(id *)(a1 + 32) bundleIdentifier];
        int v10 = [*(id *)(a1 + 32) currentStateName];
        int v13 = 138543618;
        long long v14 = v9;
        __int16 v15 = 2114;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToInstall -> <no change>", (uint8_t *)&v13, 0x16u);
      }
      break;
  }
}

void sub_100026ADC(uint64_t a1)
{
  switch((unint64_t)[*(id *)(a1 + 32) currentState])
  {
    case 1uLL:
      id v2 = DMFAppLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation queued -> applicationsDidInstall -> didStartInstalling -> didFinishInstalling", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_11;
    case 2uLL:
      id v4 = DMFAppLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installing -> applicationsDidInstall -> didFinishInstalling", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_11;
    case 3uLL:
      id v6 = DMFAppLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installation paused -> applicationsDidInstall -> didResumeInstalling -> didFinishInstalling", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) didResumeInstalling];
LABEL_11:
      [*(id *)(a1 + 32) didFinishInstalling];
      return;
    case 5uLL:
      long long v11 = DMFAppLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update queued -> applicationsDidInstall -> didStartUpdating -> didFinishUpdating", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_24;
    case 6uLL:
      int v13 = DMFAppLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] updating -> applicationsDidInstall -> didFinishUpdating", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_24;
    case 7uLL:
      __int16 v15 = DMFAppLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [*(id *)(a1 + 32) bundleIdentifier];
        int v17 = 138543362;
        long long v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] update paused -> applicationsDidInstall -> didResumeUpdating -> didFinishUpdating", (uint8_t *)&v17, 0xCu);
      }
      [*(id *)(a1 + 32) didResumeUpdating];
LABEL_24:
      [*(id *)(a1 + 32) didFinishUpdating];
      break;
    default:
      long long v8 = DMFAppLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v9 = [*(id *)(a1 + 32) bundleIdentifier];
        int v10 = [*(id *)(a1 + 32) currentStateName];
        int v17 = 138543618;
        long long v18 = v9;
        __int16 v19 = 2114;
        long long v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidInstall -> <no change>", (uint8_t *)&v17, 0x16u);
      }
      break;
  }
}

void sub_100026F18(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 1) < 3)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v12 = 138543362;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsWillUninstall -> didCancelInstalling", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelInstalling];
  }
  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)4)
    {
      id v7 = DMFAppLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        long long v8 = [*(id *)(a1 + 32) bundleIdentifier];
        int v12 = 138543362;
        int v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] installed -> applicationsWillUninstall -> willStartUninstalling", (uint8_t *)&v12, 0xCu);
      }
      [*(id *)(a1 + 32) willStartUninstalling];
    }
    else
    {
      long long v9 = DMFAppLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [*(id *)(a1 + 32) bundleIdentifier];
        long long v11 = [*(id *)(a1 + 32) currentStateName];
        int v12 = 138543618;
        int v13 = v10;
        __int16 v14 = 2114;
        __int16 v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillUninstall -> <no change>", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v12 = 138543362;
      int v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsWillUninstall -> didCancelUpdating", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelUpdating];
  }
}

void sub_1000271DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  id v3 = DMFAppLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == (id)8)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
      int v8 = 138543362;
      long long v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationsDidFailToUninstall -> didFailUninstalling", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) didFailUninstalling];
  }
  else
  {
    if (v4)
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      id v7 = [*(id *)(a1 + 32) currentStateName];
      int v8 = 138543618;
      long long v9 = v6;
      __int16 v10 = 2114;
      long long v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToUninstall -> <no change>", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_100027398(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 1) < 3)
  {
    uint64_t v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleIdentifier];
      int v12 = 138543362;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsDidUninstall -> didCancelInstalling", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelInstalling];
  }
  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)8)
    {
      id v7 = DMFAppLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [*(id *)(a1 + 32) bundleIdentifier];
        int v12 = 138543362;
        int v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] uninstalling -> applicationsDidUninstall -> didFinishUninstalling", (uint8_t *)&v12, 0xCu);
      }
      [*(id *)(a1 + 32) didFinishUninstalling];
    }
    else
    {
      long long v9 = DMFAppLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = [*(id *)(a1 + 32) bundleIdentifier];
        long long v11 = [*(id *)(a1 + 32) currentStateName];
        int v12 = 138543618;
        int v13 = v10;
        __int16 v14 = 2114;
        __int16 v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidUninstall -> <no change>", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v12 = 138543362;
      int v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsDidUninstall -> didCancelUpdating", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) didCancelUpdating];
  }
}

id sub_100027B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  if (a3) {
    return [v4 endOperationWithError:];
  }
  else {
    return [v4 runWithRequest:*(void *)(a1 + 40) bundleIdentifier:a2];
  }
}

void sub_100027DC0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  id v7 = [v6 payload];
  int v8 = [v7 payloadDictionary];
  id v30 = 0;
  long long v9 = +[CEMAssetBase declarationForPayload:v8 error:&v30];
  id v10 = v30;

  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      long long v11 = [v9 unknownPayloadKeys];
      int v12 = [v11 allObjects];

      if ([v12 count])
      {
        int v13 = *(void **)(a1 + 32);
        uint64_t v36 = DMFDeclarationStateReasonKey;
        v33[0] = DMFDeclarationStateReasonKey;
        v33[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v34[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v34[1] = v12;
        __int16 v14 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
        uint64_t v35 = v14;
        __int16 v15 = +[NSArray arrayWithObjects:&v35 count:1];
        id v37 = v15;
        id v16 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        [v13 addStatusEntriesFromDictionary:v16];
      }
      int v17 = [*(id *)(a1 + 32) assetResolver];
      id v29 = v10;
      long long v18 = [v9 dmf_installAssetOperationWithReferenceResolver:v17 error:&v29];
      id v19 = v29;

      long long v20 = DMFConfigurationEngineLog();
      int v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = [v6 identifier];
          *(_DWORD *)buf = 138543362;
          id v32 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@: Asset will install", buf, 0xCu);
        }
        __int16 v23 = [*(id *)(a1 + 32) taskOperationProvider];
        uint64_t v24 = [*(id *)(a1 + 32) database];
        [v23 prepareToRunOperation:v18 withContext:0 withDatabase:v24];

        [v18 addTarget:*(void *)(a1 + 32) selector:"installOperationDidFinish:asset:" forOperationEvents:6 userInfo:v9];
        [*(id *)(a1 + 32) enqueueOperation:v18];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1000800F0();
        }

        [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v19];
      }

      id v10 = v19;
    }
    else
    {
      id v26 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100080190();
      }

      id v27 = *(void **)(a1 + 32);
      id v28 = DMFErrorWithCodeAndUserInfo();
      [v27 endOperationMarkingPayloadMetadata:v6 failedWithError:v28];
    }
  }
  else
  {
    v25 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100080050();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
}

void sub_100028268(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = DMFConfigurationEngineLog();
  long long v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100080274();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      int v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed asset successfully", buf, 0xCu);
    }
    long long v11 = *(void **)(a1 + 32);
    uint64_t v14 = DMFCommandStateStatusKey;
    uint64_t v15 = DMFDeclarationStatusInstalled;
    int v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v11 addStatusEntriesFromDictionary:v12];

    int v13 = [*(id *)(a1 + 48) resultObject];
    if (v13) {
      [v6 setInstallMetadata:v13];
    }
    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_10002850C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = [v6 payload];
  int v8 = [v7 payloadDictionary];
  id v28 = 0;
  long long v9 = +[CEMAssetBase declarationForPayload:v8 error:&v28];
  id v10 = v28;

  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v6 installed])
      {
        long long v11 = [v6 installMetadata];
        id v27 = v10;
        int v12 = [v9 dmf_removeAssetOperationWithInstallMetadata:v11 error:&v27];
        id v13 = v27;

        uint64_t v14 = DMFConfigurationEngineLog();
        uint64_t v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v16 = [v6 identifier];
            *(_DWORD *)buf = 138543362;
            id v32 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Installed asset will be removed", buf, 0xCu);
          }
          int v17 = [*(id *)(a1 + 32) taskOperationProvider];
          long long v18 = [*(id *)(a1 + 32) database];
          [v17 prepareToRunOperation:v12 withContext:0 withDatabase:v18];

          [v12 addTarget:*(void *)(a1 + 32) selector:"removeOperationDidFinish:asset:" forOperationEvents:6 userInfo:v9];
          [*(id *)(a1 + 32) enqueueOperation:v12];
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100080314();
          }

          [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v13];
        }

        id v10 = v13;
      }
      else
      {
        __int16 v23 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [v6 identifier];
          *(_DWORD *)buf = 138543362;
          id v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Uninstalled asset did remove successfully", buf, 0xCu);
        }
        v25 = *(void **)(a1 + 32);
        uint64_t v29 = DMFDeclarationStateStatusKey;
        uint64_t v30 = DMFDeclarationStatusRemoved;
        id v26 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v25 addStatusEntriesFromDictionary:v26];

        [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
      }
    }
    else
    {
      long long v20 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100080190();
      }

      int v21 = *(void **)(a1 + 32);
      uint64_t v22 = DMFErrorWithCodeAndUserInfo();
      [v21 endOperationMarkingPayloadMetadata:v6 failedWithError:v22];
    }
  }
  else
  {
    id v19 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100080050();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
}

void sub_100028988(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = DMFConfigurationEngineLog();
  long long v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000803B4();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed asset successfully", buf, 0xCu);
    }
    long long v11 = *(void **)(a1 + 32);
    uint64_t v13 = DMFCommandStateStatusKey;
    uint64_t v14 = DMFDeclarationStatusRemoved;
    int v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v11 addStatusEntriesFromDictionary:v12];

    [v6 setInstallMetadata:0];
    [v6 setInstalled:0];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_100028D80(id a1)
{
  qword_1000FB9D0 = objc_opt_new();

  _objc_release_x1();
}

void sub_100028EF4(id a1)
{
  qword_1000FB9E0 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000293C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000293E0(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000FB9F8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10002950C;
    v3[4] = &unk_1000C9F80;
    void v3[5] = v3;
    long long v4 = off_1000CA630;
    uint64_t v5 = 0;
    qword_1000FB9F8 = _sl_dlopen();
  }
  if (!qword_1000FB9F8) {
    sub_10008049C(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("STManagementState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10008051C();
  }
  qword_1000FB9F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10002950C()
{
  uint64_t result = _sl_dlopen();
  qword_1000FB9F8 = result;
  return result;
}

void sub_1000296D8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = [v6 payload];
  int v8 = [v7 payloadDictionary];
  id v44 = 0;
  long long v9 = +[CEMCommandBase commandForPayload:v8 error:&v44];
  id v10 = v44;

  if (v9)
  {
    if ([v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingCommand])
    {
      long long v11 = objc_opt_new();
      int v12 = [v9 unknownPayloadKeys];
      uint64_t v13 = [v12 allObjects];

      if ([v13 count])
      {
        uint64_t v52 = DMFCommandStateReasonKey;
        v49[0] = DMFCommandStateReasonCodeKey;
        v49[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v50[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v50[1] = v13;
        uint64_t v14 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
        id v51 = v14;
        uint64_t v15 = +[NSArray arrayWithObjects:&v51 count:1];
        uint64_t v53 = v15;
        id v16 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        [v11 addEntriesFromDictionary:v16];

        [*(id *)(a1 + 32) addStatusEntriesFromDictionary:v11];
      }
      uint64_t v40 = v11;
      id v17 = v9;
      long long v18 = [*(id *)(a1 + 32) payloadContext];
      id v19 = [v6 organization];
      long long v20 = [v19 identifier];
      [v18 setOrganizationIdentifier:v20];

      [v18 setAssetProvidersByPayloadIdentifier:0];
      id v43 = v10;
      int v21 = [v17 dmf_executeRequestWithContext:v18 error:&v43];
      id v22 = v43;

      if (!v22)
      {
        if (v21)
        {
          id v28 = [*(id *)(a1 + 32) taskOperationProvider];
          id v42 = 0;
          uint64_t v29 = (objc_class *)[v28 operationClassForRequest:v21 error:&v42];
          id v22 = v42;

          if (!v29)
          {
            __int16 v23 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_1000806D0();
            }
            goto LABEL_8;
          }
          id v30 = [[v29 alloc] initWithRequest:v21];
        }
        else
        {
          id v41 = 0;
          [v17 dmf_executeOperationWithContext:v18 error:&v41];
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          id v22 = v41;
        }
        if (v30)
        {
          id v38 = v13;
          id v31 = v30;
          id v32 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = [v6 identifier];
            *(_DWORD *)buf = 138543362;
            long long v48 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%{public}@: Execute command will start", buf, 0xCu);
          }
          if (objc_msgSend(v17, "dmf_requestExecutesWithoutReturning"))
          {
            id v34 = *(void **)(a1 + 32);
            uint64_t v45 = DMFCommandStateStatusKey;
            uint64_t v46 = DMFCommandStatusExecuted;
            uint64_t v35 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            [v34 addStatusEntriesFromDictionary:v35];

            [v6 setInstalled:1];
            [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
          }
          uint64_t v36 = [*(id *)(a1 + 32) taskOperationProvider:v38, v40];
          id v37 = [*(id *)(a1 + 32) database];
          [v36 prepareToRunOperation:v31 withContext:0 withDatabase:v37];

          [v31 addTarget:*(void *)(a1 + 32) selector:"operationDidFinish:userInfo:" forOperationEvents:6 userInfo:v17];
          [*(id *)(a1 + 32) enqueueOperation:v31];

          uint64_t v13 = v39;
          goto LABEL_9;
        }
      }
      __int16 v23 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100080634();
      }
LABEL_8:

      [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v22];
LABEL_9:

      id v10 = v22;
      goto LABEL_16;
    }
    v25 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100080770();
    }

    id v26 = *(void **)(a1 + 32);
    id v27 = DMFErrorWithCodeAndUserInfo();
    [v26 endOperationMarkingPayloadMetadata:v6 failedWithError:v27];
  }
  else
  {
    uint64_t v24 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100080598();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
LABEL_16:
}

void sub_100029D5C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = DMFConfigurationEngineLog();
  long long v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100080850();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Executed command successfully", buf, 0xCu);
    }
    long long v11 = *(void **)(a1 + 32);
    uint64_t v21 = DMFCommandStateStatusKey;
    uint64_t v22 = DMFCommandStatusExecuted;
    int v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v11 addStatusEntriesFromDictionary:v12];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingCommand])
    {
      id v13 = *(id *)(a1 + 48);
      uint64_t v14 = [*(id *)(a1 + 56) resultObject];
      uint64_t v15 = [*(id *)(a1 + 32) payloadContext];
      id v16 = [v13 dmf_statusForResult:v14 context:v15];

      if (v16)
      {
        id v17 = *(void **)(a1 + 32);
        uint64_t v19 = DMFDeclarationStatePayloadKey;
        long long v20 = v16;
        long long v18 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v17 addStatusEntriesFromDictionary:v18];
      }
    }
    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_10002A7BC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = [v6 payload];
  int v8 = [v7 payloadDictionary];
  id v15 = 0;
  long long v9 = +[CEMCommandBase commandForPayload:v8 error:&v15];
  id v10 = v15;

  long long v11 = DMFConfigurationEngineLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v12) {
      sub_1000809B4(v6, v11);
    }
  }
  else if (v12)
  {
    sub_1000808F0(v6, v10, v11);
  }

  id v13 = *(void **)(a1 + 32);
  uint64_t v16 = DMFCommandStateStatusKey;
  uint64_t v17 = DMFDeclarationStatusRemoved;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v13 addStatusEntriesFromDictionary:v14];

  [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
}

void sub_10002A9B4(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA00;
  qword_1000FBA00 = (uint64_t)&off_1000D2AF8;
}

void sub_10002AA6C(uint64_t a1)
{
  id v7 = (id)objc_opt_new();
  id v2 = [*(id *)(a1 + 32) supportedConfigurationTypes];
  [v7 addObjectsFromArray:v2];

  id v3 = [*(id *)(a1 + 32) supportedAssetTypes];
  [v7 addObjectsFromArray:v3];

  id v4 = [*(id *)(a1 + 32) supportedActivationTypes];
  [v7 addObjectsFromArray:v4];

  uint64_t v5 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  id v6 = (void *)qword_1000FBA10;
  qword_1000FBA10 = v5;
}

void sub_10002AB90(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA20;
  qword_1000FBA20 = (uint64_t)&off_1000D2B10;
}

void sub_10002ABFC(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA30;
  qword_1000FBA30 = (uint64_t)&off_1000D2B28;
}

void sub_10002AC68(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA40;
  qword_1000FBA40 = (uint64_t)&off_1000D2B40;
}

void sub_10002ACD4(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA50;
  qword_1000FBA50 = (uint64_t)&off_1000D2B58;
}

void sub_10002AD40(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA60;
  qword_1000FBA60 = (uint64_t)&off_1000D2B70;
}

void sub_10002ADAC(id a1)
{
  uint64_t v1 = (void *)qword_1000FBA70;
  qword_1000FBA70 = (uint64_t)&off_1000D2B88;
}

void sub_10002AE18(id a1)
{
  id v1 = objc_alloc((Class)NSManagedObjectModel);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v2 = [v5 URLForResource:@"DMDConfigurationDatabaseModel" withExtension:@"momd"];
  id v3 = [v1 initWithContentsOfURL:v2];
  id v4 = (void *)qword_1000FBA80;
  qword_1000FBA80 = (uint64_t)v3;
}

void sub_10002AFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002B014(uint64_t a1)
{
}

void sub_10002B01C(uint64_t a1)
{
  id v6 = +[DMDConfigurationOrganization fetchRequest];
  id v2 = [v6 execute:0];
  uint64_t v3 = [v2 description];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10002B390(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002B720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002B750(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v18 = [v9 count];
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v18];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) eventStatusMessageWithPayloadIdentifier:v7];
          [v11 addObject:v17];

          uint64_t v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002B934;
    v19[3] = &unk_1000CA7B0;
    v19[4] = v18;
    [WeakRetained sendEvents:v11 organizationIdentifier:v8 completionHandler:v19];
  }
}

void sub_10002B934(uint64_t a1, uint64_t a2)
{
  id v4 = DMFConfigurationEngineLog();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080A4C(a1, v5, v6);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Successfully sent %lu events from subscription manager", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10002BA08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained databaseInitializationOperationDidFinish];
}

void sub_10002BC9C(uint64_t a1)
{
  uint64_t v3 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Engine did resume", v4, 2u);
  }

  [*(id *)(a1 + 32) delegateDidResume];
  [*(id *)(a1 + 32) enqueueDeclarationProcessingOperationIfNeeded];
}

id sub_10002BE44(uint64_t a1)
{
  id v2 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Engine will suspend", v5, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) queue];
  [v3 setSuspended:1];

  return [*(id *)(a1 + 32) delegateWillSuspend];
}

void sub_10002C204(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) organizationControllerByIdentifier];
  objc_sync_enter(v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [[*(id *)(a1 + 32) organizationControllerByIdentifier];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) organization];
        [v2 addObject:v9];

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v3);
  id v10 = objc_opt_new();
  id v11 = objc_alloc((Class)NSDictionary);
  id v12 = [v2 valueForKey:@"identifier"];
  id v13 = [v11 initWithObjects:v2 forKeys:v12];
  [v10 setOrganizationsByIdentifier:v13];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002C3E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C530(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventSubscriptionManager];
  uint64_t v3 = [*(id *)(a1 + 40) startDate];
  id v4 = [*(id *)(a1 + 40) organizationIdentifier];
  id v5 = [v2 eventStatusesByPayloadIdentifierSinceStartDate:v3 organizationIdentifier:v4];

  id v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10002C680;
  id v12 = &unk_1000CA850;
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  id v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v9];
  [v7 setEventStatuses:v8, v9, v10, v11, v12];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002C680(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) eventIdentifiers];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [*(id *)(a1 + 32) eventIdentifiers];
    unsigned int v10 = [v9 containsObject:v5];

    if (v10)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = v6;
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          long long v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) eventStatusMessageWithPayloadIdentifier:v5, v17];
            [*(id *)(a1 + 40) addObject:v16];

            long long v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
  }
}

void sub_10002CEB8(uint64_t a1)
{
  v10[0] = 0;
  v10[1] = v10;
  void v10[2] = 0x3032000000;
  v10[3] = sub_10002D01C;
  v10[4] = sub_10002D02C;
  id v11 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) database];
  id v4 = [v3 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D034;
  v6[3] = &unk_1000CA8A0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v9 = v10;
  id v5 = v4;
  id v8 = v5;
  [v5 performBlockAndWait:v6];
  [*(id *)(a1 + 32) enqueueDeclarationProcessingOperationIfNeeded];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  _Block_object_dispose(v10, 8);
}

void sub_10002D004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D01C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002D02C(uint64_t a1)
{
}

void sub_10002D034(void *a1)
{
  id v2 = +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:a1[4]];
  uint64_t v3 = (uint64_t)(a1 + 6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 execute:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:a1[4]];
    id v8 = (void *)a1[5];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v25 = *(id *)(v9 + 40);
    unsigned int v10 = [v8 executeFetchRequest:v7 error:&v25];
    objc_storeStrong((id *)(v9 + 40), v25);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * (void)v15) setFailed:0];
          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v13);
    }

    long long v16 = (void *)a1[5];
    uint64_t v17 = *(void *)(a1[6] + 8);
    id v20 = *(id *)(v17 + 40);
    unsigned __int8 v18 = [v16 save:&v20];
    objc_storeStrong((id *)(v17 + 40), v20);
    if ((v18 & 1) == 0)
    {
      long long v19 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100080AC0(v3);
      }
    }
  }
}

void sub_10002D378(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080B44(v3);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002D538(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080B44(v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) resultObject];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v3);
}

void sub_10002D790(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[DMDEventSubscriptionRegistration alloc] initWithContext:v3];
  uint64_t v5 = [*(id *)(a1 + 32) subscriptionDeclaration];
  id v6 = [*(id *)(a1 + 32) organizationIdentifier];
  id v7 = [v5 declarationIdentifier];
  id v8 = [v5 declarationServerHash];
  uint64_t v9 = +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:v6 withIdentifier:v7 serverHash:v8];

  id v25 = 0;
  unsigned int v10 = [v3 executeFetchRequest:v9 error:&v25];
  id v11 = v25;
  id v12 = [v10 firstObject];
  [(DMDEventSubscriptionRegistration *)v4 setPayloadMetadata:v12];

  id v13 = [(DMDEventSubscriptionRegistration *)v4 payloadMetadata];

  if (v13)
  {
    uint64_t v14 = [v5 payloadEvents];
    [(DMDEventSubscriptionRegistration *)v4 setEvents:v14];

    long long v15 = [v5 payloadSchedule];
    [(DMDEventSubscriptionRegistration *)v4 setSchedule:v15];

    id v24 = v11;
    unsigned __int8 v16 = [v3 save:&v24];
    id v17 = v24;

    if (v16)
    {
      [*(id *)(a1 + 40) performSelectorOnMainThread:"updateEventSubscriptions" withObject:0 waitUntilDone:1];
    }
    else
    {
      long long v23 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100080C4C(a1 + 32);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v11 = v17;
  }
  else
  {
    unsigned __int8 v18 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100080BC8(a1 + 32);
    }

    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v26 = DMFConfigurationPayloadIdentifierErrorKey;
    id v20 = [v5 declarationIdentifier];
    id v27 = v20;
    long long v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    long long v22 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v22);
  }
}

void sub_10002DB5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 32;
  uint64_t v5 = [*(id *)(a1 + 32) organizationIdentifier];
  id v6 = [*(id *)(a1 + 32) subscriptionDeclaration];
  id v7 = [v6 declarationIdentifier];
  id v8 = +[DMDEventSubscriptionRegistration fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:v5 payloadIdentifier:v7];

  id v25 = 0;
  uint64_t v9 = [v3 executeFetchRequest:v8 error:&v25];
  id v10 = v25;
  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          [v3 deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * (void)v15)];
          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }

    id v20 = v10;
    unsigned __int8 v16 = [v3 save:&v20];
    id v17 = v20;

    if ((v16 & 1) == 0)
    {
      unsigned __int8 v18 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100080D54(v17);
      }
    }
    [*(id *)(a1 + 40) performSelectorOnMainThread:"updateEventSubscriptions" withObject:0 waitUntilDone:1];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v10 = v17;
  }
  else
  {
    uint64_t v19 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100080CD0(v4);
    }
  }
}

void sub_10002DF80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  id v3 = [v2 newBackgroundContext];

  uint64_t v4 = +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:*(void *)(a1 + 40)];
  id v43 = 0;
  id v37 = v3;
  uint64_t v5 = [v3 executeFetchRequest:v4 error:&v43];
  id v6 = v43;

  if (v5)
  {
    uint64_t v36 = [v5 firstObject];
    if (v36)
    {
      id v31 = (void *)(a1 + 40);
      uint64_t v32 = a1;
      uint64_t v33 = v5;
      id v34 = v6;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = *(id *)(a1 + 48);
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v40;
        uint64_t v10 = DMFDeclarationEventsMessageInReplyToKey;
        uint64_t v11 = DMFDeclarationEventsMessageEventTypeKey;
        uint64_t v12 = DMFDeclarationEventsMessageEventTimestampKey;
        uint64_t v13 = DMFDeclarationEventsMessageEventPayloadKey;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v40 != v9) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            unsigned __int8 v16 = [[DMDSubscriptionEvent alloc] initWithContext:v37];
            [(DMDSubscriptionEvent *)v16 setOrganization:v36];
            id v17 = [v15 objectForKeyedSubscript:v10];
            [(DMDSubscriptionEvent *)v16 setPayloadIdentifier:v17];

            unsigned __int8 v18 = [v15 objectForKeyedSubscript:v11];
            [(DMDSubscriptionEvent *)v16 setEventType:v18];

            uint64_t v19 = [v15 objectForKeyedSubscript:v12];
            [(DMDSubscriptionEvent *)v16 setDate:v19];

            id v20 = [v15 objectForKeyedSubscript:v13];
            [(DMDSubscriptionEvent *)v16 setDetails:v20];
          }
          id v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v8);
      }

      id v38 = v34;
      unsigned int v21 = [v37 save:&v38];
      id v22 = v38;

      if (v21)
      {
        long long v23 = +[NSNotificationCenter defaultCenter];
        [v23 postNotificationName:@"DMDConfigurationSourceEventsDidChange" object:*v31];
      }
      else
      {
        long long v23 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100080ED0(v22);
        }
      }
      uint64_t v5 = v33;

      (*(void (**)(void))(*(void *)(v32 + 56) + 16))();
      id v6 = v22;
    }
    else
    {
      id v25 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100080E5C((uint64_t *)(a1 + 40), v25, v26);
      }

      uint64_t v27 = *(void *)(a1 + 56);
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v45 = DMFConfigurationOrganizationIdentifierErrorKey;
      uint64_t v46 = v28;
      uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id v30 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v30);
    }
  }
  else
  {
    long long v24 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100080DD8(v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10002E9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002EA20(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080FD8((uint64_t)v2);
    }
  }
  uint64_t v5 = [*v2 resultObject];
  if ([v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained enqueueOperations:v5];
  }
}

void sub_10002F11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10002F56C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10002F59C(uint64_t a1)
{
  id v2 = +[DMDConfigurationOrganization fetchRequest];
  CFStringRef v41 = @"identifier";
  id v3 = +[NSArray arrayWithObjects:&v41 count:1];
  [v2 setPropertiesToFetch:v3];

  [v2 setResultType:2];
  id v36 = 0;
  uint64_t v4 = [v2 execute:&v36];
  id v5 = v36;
  if (!v4)
  {
    id v6 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000812E8(v5);
    }
  }
  uint64_t v7 = [v4 valueForKeyPath:@"identifier"];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &__NSArray0__struct;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v9);

  uint64_t v10 = +[DMDConfigurationPayloadMetadata fetchRequest];
  CFStringRef v40 = @"organization";
  uint64_t v11 = +[NSArray arrayWithObjects:&v40 count:1];
  [v10 setRelationshipKeyPathsForPrefetching:v11];

  id v35 = v5;
  uint64_t v12 = [v10 execute:&v35];
  id v13 = v35;

  if (v12)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v27 = v12;
      id v28 = v13;
      uint64_t v29 = v4;
      id v30 = v2;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v20 = [v19 organization];
          unsigned int v21 = [v20 identifier];

          if (v21)
          {
            id v22 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v21];

            if (v22)
            {
              long long v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v21];
              long long v24 = [v19 identifier];
              [v23 addObject:v24];
            }
            else
            {
              id v25 = objc_alloc((Class)NSMutableArray);
              long long v23 = [v19 identifier];
              id v26 = [v25 initWithObjects:v23];
              [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v26 forKeyedSubscript:v21];
            }
          }
          else
          {
            long long v23 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
              sub_100081270(v37, v19, &v38, v23);
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v16);
      uint64_t v4 = v29;
      id v2 = v30;
      id v13 = v28;
      uint64_t v12 = v27;
    }
  }
  else
  {
    uint64_t v14 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000811EC(v13);
    }
  }
}

void sub_10002F964(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    id v3 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10008136C(v2);
    }
  }
}

void sub_10002F9C0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    id v3 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000813F8(v2);
    }
  }
}

void sub_10002FBF4(id *a1)
{
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10002D01C;
  id v26 = sub_10002D02C;
  id v27 = 0;
  id v2 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v4 = [a1[4] organizationIdentifier];
  id v5 = [a1[5] database];
  id v6 = [v5 newBackgroundContext];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10002FE34;
  v16[3] = &unk_1000CAA20;
  id v7 = v4;
  id v17 = v7;
  unsigned int v21 = &v22;
  id v20 = a1[6];
  id v8 = v2;
  id v18 = v8;
  id v9 = v3;
  id v19 = v9;
  [v6 performBlockAndWait:v16];
  uint64_t v10 = v23[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_10003028C;
  v13[3] = &unk_1000CAA90;
  uint64_t v11 = (void (**)(id, id, uint64_t, void *))a1[6];
  v13[4] = a1[5];
  id v12 = v9;
  id v14 = v12;
  id v15 = &v22;
  v11[2](v11, v8, v10, v13);

  _Block_object_dispose(&v22, 8);
}

void sub_10002FE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002FE34(uint64_t a1)
{
  id v2 = +[DMDPayloadMetadata fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 execute:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    long long v33 = v2;
    id v5 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v32 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v50;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v50 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v12 = [v11 identifier];
          id v13 = [v5 objectForKeyedSubscript:v12];
          id v14 = v13;
          if (v13) {
            id v15 = v13;
          }
          else {
            id v15 = (id)objc_opt_new();
          }
          id v16 = v15;

          [v16 addObject:v11];
          id v17 = [v11 identifier];
          [v5 setObject:v16 forKeyedSubscript:v17];
        }
        id v8 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v8);
    }

    id v37 = objc_opt_new();
    [*(id *)(a1 + 40) setObject:forKeyedSubscript:];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v39 = v5;
    id v38 = [v39 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v38)
    {
      uint64_t v35 = DMFDeclarationStatusMessageInReplyToKey;
      uint64_t v36 = *(void *)v46;
      uint64_t v34 = DMFDeclarationStatusMessageStatesKey;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(v39);
          }
          uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
          CFStringRef v40 = objc_opt_new();
          [v40 setObject:v19 forKeyedSubscript:v35];
          id v20 = objc_opt_new();
          unsigned int v21 = [v39 objectForKeyedSubscript:v19];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v22 = [v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v42;
            do
            {
              for (k = 0; k != v23; k = (char *)k + 1)
              {
                if (*(void *)v42 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
                id v27 = [v26 stateDictionary];
                [v20 addObject:v27];

                id v28 = [v26 stateChangeTimestamp];
                uint64_t v29 = *(void **)(a1 + 48);
                id v30 = [v26 objectID];
                [v29 setObject:v28 forKeyedSubscript:v30];
              }
              id v23 = [v21 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v23);
          }
          [v40 setObject:v20 forKeyedSubscript:v34];
          [v37 addObject:v40];
        }
        id v38 = [v39 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v38);
    }

    uint64_t v4 = v32;
    id v2 = v33;
  }
  else
  {
    long long v31 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100081484(a1 + 64);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10003028C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100081508();
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100030398;
    v9[3] = &unk_1000CAA48;
    id v5 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    id v8 = +[DMDBlockOperation blockOperationWithBlock:v9];
    [v8 setQueuePriority:8];
    [*(id *)(a1 + 32) enqueueDatabaseModificationOperation:v8 completionHandler:&stru_1000CAA68];
  }
}

void sub_100030398(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  id v3 = [v2 newBackgroundContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030460;
  v7[3] = &unk_1000CA8A0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  [v6 performBlockAndWait:v7];
}

void sub_100030460(uint64_t a1)
{
  id v2 = +[DMDPayloadMetadata fetchRequest];
  id v3 = [*(id *)(a1 + 32) allKeys];
  id v4 = +[NSPredicate predicateWithFormat:@"self IN %@", v3];
  [v2 setPredicate:v4];

  uint64_t v5 = a1 + 48;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 execute:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
  {
    id v20 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100081574(v5);
    }
    goto LABEL_14;
  }
  uint64_t v21 = a1 + 48;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = *(void **)(a1 + 32);
        id v15 = [v13 objectID];
        id v16 = [v14 objectForKeyedSubscript:v15];
        [v13 setLastStatusReportTimestamp:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  id v17 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v22 = *(id *)(v18 + 40);
  unsigned __int8 v19 = [v17 save:&v22];
  objc_storeStrong((id *)(v18 + 40), v22);
  if ((v19 & 1) == 0)
  {
    id v20 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000815F8(v21);
    }
LABEL_14:
  }
}

void sub_1000306B4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10008167C(v2);
    }
  }
}

void sub_10003070C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100081700(v2);
    }
  }
}

void sub_100030894(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) organizationIdentifier];
  uint64_t v5 = +[DMDSubscriptionEvent fetchRequestMatchingEventsFromOrganizationWithIdentifier:v4];

  id v31 = 0;
  long long v24 = v3;
  uint64_t v6 = [v3 executeFetchRequest:v5 error:&v31];
  id v7 = v31;
  if (!v6)
  {
    id v8 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100081784(a1 + 32, v7, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  long long v23 = v7;
  id v9 = objc_opt_new();
  id v10 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v17 = [v16 dictionaryRepresentation:v23];
        if (v17) {
          [v9 addObject:v17];
        }
        uint64_t v18 = [v16 objectID];
        if (v18) {
          [v10 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v13);
  }

  uint64_t v32 = DMFDeclarationStatusMessagesKey;
  long long v33 = v9;
  unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100030B78;
  v25[3] = &unk_1000C9B78;
  uint64_t v20 = *(void *)(a1 + 48);
  void v25[4] = *(void *)(a1 + 40);
  id v26 = v10;
  uint64_t v21 = *(void (**)(uint64_t, void *, void, void *))(v20 + 16);
  id v22 = v10;
  v21(v20, v19, 0, v25);
}

void sub_100030B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100081848();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) database];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100030C58;
    v6[3] = &unk_1000CA580;
    id v7 = *(id *)(a1 + 40);
    [v5 performBackgroundTask:v6];

    id v4 = v7;
  }
}

void sub_100030C58(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 objectWithID:*(void *)(*((void *)&v14 + 1) + 8 * (void)v8)];
        [v3 deleteObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v13 = 0;
  unsigned __int8 v10 = [v3 save:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    id v12 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000818B4();
    }
  }
}

void sub_100030EBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031520(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_100031538(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 8) + 40);
}

uint64_t sub_10003154C(uint64_t a1)
{
  return *(void *)a1;
}

void sub_1000315C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) payloadMetadataObjectID];
  uint64_t v5 = [v3 objectWithID:v4];

  id v6 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = [v5 outgoingPayloadMetadataReferences];
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v13 = [v12 installMetadata];
        if (!v13)
        {
          id v37 = *(void **)(a1 + 32);
          DMFErrorWithCodeAndUserInfo();
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          [v37 endOperationWithError:v18];
          goto LABEL_19;
        }
        long long v14 = (void *)v13;
        long long v15 = [v12 identifier];
        [v6 setObject:v14 forKeyedSubscript:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  long long v16 = [v5 payload];
  long long v17 = [v16 payloadDictionary];
  id v50 = 0;
  id v18 = +[CEMConfigurationBase declarationForPayload:v17 error:&v50];
  id v7 = v50;

  if (v18)
  {
    if ([v18 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      unsigned __int8 v19 = [v18 unknownPayloadKeys];
      uint64_t v20 = [v19 allObjects];

      if ([v20 count])
      {
        long long v46 = *(void **)(a1 + 32);
        uint64_t v60 = DMFDeclarationStateReasonKey;
        v57[0] = DMFDeclarationStateReasonKey;
        v57[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v58[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v58[1] = v20;
        uint64_t v21 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        v59 = v21;
        id v22 = +[NSArray arrayWithObjects:&v59 count:1];
        v61 = v22;
        long long v23 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        [v46 addStatusEntriesFromDictionary:v23];
      }
      long long v47 = v20;
      long long v24 = [*(id *)(a1 + 32) payloadContext];
      long long v25 = [v5 organization];
      id v26 = [v25 identifier];
      [v24 setOrganizationIdentifier:v26];

      [v24 setAssetProvidersByPayloadIdentifier:v6];
      id v18 = v18;
      id v49 = v7;
      long long v27 = [v18 dmf_installRequestWithContext:v24 error:&v49];
      id v28 = v49;

      if (v27)
      {
        long long v29 = [*(id *)(a1 + 32) taskOperationProvider];
        id v48 = v28;
        long long v30 = (objc_class *)[v29 operationClassForRequest:v27 error:&v48];
        id v45 = v48;

        id v31 = DMFConfigurationEngineLog();
        uint64_t v32 = v31;
        if (v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            long long v33 = [v5 identifier];
            *(_DWORD *)buf = 138543362;
            long long v56 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%{public}@: Configuration will install", buf, 0xCu);
          }
          id v34 = [[v30 alloc] initWithRequest:v27];
          uint64_t v35 = [*(id *)(a1 + 32) taskOperationProvider];
          uint64_t v36 = [*(id *)(a1 + 32) database];
          [v35 prepareToRunOperation:v34 withContext:0 withDatabase:v36];

          [v34 addTarget:*(void *)(a1 + 32) selector:"installationOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v18];
          [*(id *)(a1 + 32) enqueueOperation:v34];

          id v28 = v45;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100081A60();
        }

        long long v43 = *(void **)(a1 + 32);
        long long v44 = v5;
        id v28 = v45;
      }
      else
      {
        long long v42 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_1000819C0();
        }

        long long v43 = *(void **)(a1 + 32);
        long long v44 = v5;
      }
      [v43 endOperationMarkingPayloadMetadata:v44 failedWithError:v28];
LABEL_33:

      id v7 = v28;
      goto LABEL_19;
    }
    id v39 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100081B04();
    }

    CFStringRef v40 = *(void **)(a1 + 32);
    long long v41 = DMFErrorWithCodeAndUserInfo();
    [v40 endOperationMarkingPayloadMetadata:v5 failedWithError:v41];
  }
  else
  {
    id v38 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100081920();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v5 failedWithError:v7];
  }
LABEL_19:
}

void sub_100031C74(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  id v8 = a1 + 5;
  id v7 = a1[5];
  if (!v7)
  {
LABEL_7:
    long long v14 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      long long v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did install successfully ", buf, 0xCu);
    }
    id v16 = a1[4];
    uint64_t v27 = DMFDeclarationStateStatusKey;
    uint64_t v28 = DMFDeclarationStatusInstalled;
    long long v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v16 addStatusEntriesFromDictionary:v17];

    if ([a1[6] conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v18 = a1[6];
      unsigned __int8 v19 = [a1[7] resultObject];
      uint64_t v20 = [a1[4] payloadContext];
      uint64_t v21 = [v18 dmf_statusForResult:v19 context:v20];

      if (v21)
      {
        id v22 = a1[4];
        uint64_t v25 = DMFDeclarationStatePayloadKey;
        id v26 = v21;
        long long v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        [v22 addStatusEntriesFromDictionary:v23];
      }
    }
    [v6 setInstalled:1];
    [a1[4] endOperationWithPayloadMetadata:v6];
    goto LABEL_18;
  }
  id v9 = [v7 domain];
  if ([v9 isEqualToString:DMFErrorDomain])
  {
    id v10 = [*v8 code];

    if (v10 == (id)1900)
    {
      id v11 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v6 identifier];
        uint64_t v13 = [*v8 verboseDescription];
        *(_DWORD *)buf = 138543618;
        long long v30 = v12;
        __int16 v31 = 2114;
        uint64_t v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring expected removal error: %{public}@", buf, 0x16u);
      }
      goto LABEL_7;
    }
  }
  else
  {
  }
  long long v24 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_100081BE8();
  }

  [a1[4] endOperationMarkingPayloadMetadata:v6 failedWithError:a1[5]];
LABEL_18:
}

void sub_100033800(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  id v7 = [v6 payload];
  id v8 = [v7 payloadDictionary];
  id v48 = 0;
  id v9 = +[CEMConfigurationBase declarationForPayload:v8 error:&v48];
  id v10 = v48;

  if (v9)
  {
    if (([v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration] & 1) == 0)
    {
      uint64_t v27 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100081B04();
      }

      uint64_t v28 = *(void **)(a1 + 32);
      id v12 = DMFErrorWithCodeAndUserInfo();
      [v28 endOperationMarkingPayloadMetadata:v6 failedWithError:v12];
      goto LABEL_30;
    }
    id v11 = [v9 unknownPayloadKeys];
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v58 = DMFDeclarationStateReasonKey;
      v55[0] = DMFCommandStateReasonCodeKey;
      v55[1] = DMFCEMReasonCodeUnknownPayloadKeys;
      v56[0] = DMFCEMReasonCodeUnknownPayloadKeys;
      v56[1] = v12;
      long long v14 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
      long long v57 = v14;
      long long v15 = +[NSArray arrayWithObjects:&v57 count:1];
      v59 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      [v13 addStatusEntriesFromDictionary:v16];
    }
    if (([v6 installed] & 1) == 0)
    {
      long long v29 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        long long v30 = [v6 identifier];
        *(_DWORD *)buf = 138543362;
        long long v54 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Uninstalled configuration did remove successfully", buf, 0xCu);
      }
      __int16 v31 = *(void **)(a1 + 32);
      uint64_t v51 = DMFDeclarationStateStatusKey;
      uint64_t v52 = DMFDeclarationStatusRemoved;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      [v31 addStatusEntriesFromDictionary:v32];

      [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
      goto LABEL_30;
    }
    long long v17 = [*(id *)(a1 + 32) payloadContext];
    id v18 = [v6 organization];
    unsigned __int8 v19 = [v18 identifier];
    [v17 setOrganizationIdentifier:v19];

    [v17 setAssetProvidersByPayloadIdentifier:0];
    id v20 = v9;
    id v47 = v10;
    uint64_t v21 = [v20 dmf_removeRequestWithContext:v17 error:&v47];
    id v22 = v47;

    if (v21 || !v22)
    {
      if (!v21)
      {
        long long v41 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [v6 identifier];
          *(_DWORD *)buf = 138543362;
          long long v54 = v45;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: Installed configuration did remove successfully", buf, 0xCu);
        }
        long long v42 = *(void **)(a1 + 32);
        uint64_t v49 = DMFDeclarationStateStatusKey;
        uint64_t v50 = DMFDeclarationStatusRemoved;
        long long v43 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        [v42 addStatusEntriesFromDictionary:v43];

        [v6 setInstalled:0];
        [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
        goto LABEL_29;
      }
      long long v33 = [*(id *)(a1 + 32) taskOperationProvider];
      id v46 = v22;
      id v34 = (objc_class *)[v33 operationClassForRequest:v21 error:&v46];
      id v44 = v46;

      uint64_t v35 = DMFConfigurationEngineLog();
      uint64_t v36 = v35;
      if (v34)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v37 = [v6 identifier];
          *(_DWORD *)buf = 138543362;
          long long v54 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@: Installed configuration will remove", buf, 0xCu);
        }
        id v38 = [[v34 alloc] initWithRequest:v21];
        id v39 = [*(id *)(a1 + 32) taskOperationProvider];
        CFStringRef v40 = [*(id *)(a1 + 32) database];
        [v39 prepareToRunOperation:v38 withContext:0 withDatabase:v40];

        [v38 addTarget:*(void *)(a1 + 32) selector:"removalOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v20];
        [*(id *)(a1 + 32) enqueueOperation:v38];

        id v22 = v44;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100081E6C();
      }

      long long v24 = *(void **)(a1 + 32);
      uint64_t v25 = v6;
      id v22 = v44;
    }
    else
    {
      long long v23 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100081DCC();
      }

      long long v24 = *(void **)(a1 + 32);
      uint64_t v25 = v6;
    }
    [v24 endOperationMarkingPayloadMetadata:v25 failedWithError:v22];
LABEL_29:

    id v10 = v22;
LABEL_30:

    goto LABEL_31;
  }
  id v26 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_100081D2C();
  }

  [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
LABEL_31:
}

void sub_100033F5C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = DMFConfigurationEngineLog();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100081F10();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      long long v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did remove successfully", buf, 0xCu);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v21 = DMFDeclarationStateStatusKey;
    uint64_t v22 = DMFDeclarationStatusRemoved;
    id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v11 addStatusEntriesFromDictionary:v12];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v13 = *(id *)(a1 + 48);
      long long v14 = [*(id *)(a1 + 56) resultObject];
      long long v15 = [*(id *)(a1 + 32) payloadContext];
      id v16 = [v13 dmf_statusForResult:v14 context:v15];

      if (v16)
      {
        long long v17 = *(void **)(a1 + 32);
        uint64_t v19 = DMFDeclarationStatePayloadKey;
        id v20 = v16;
        id v18 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v17 addStatusEntriesFromDictionary:v18];
      }
    }
    [v6 setInstalled:0];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_100034324(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = [v6 payload];
  id v8 = [v7 payloadDictionary];
  id v41 = 0;
  id v9 = +[CEMConfigurationBase declarationForPayload:v8 error:&v41];
  id v10 = v41;

  if (v9)
  {
    if ([v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v11 = [v9 unknownPayloadKeys];
      id v12 = [v11 allObjects];

      if ([v12 count])
      {
        id v13 = *(void **)(a1 + 32);
        uint64_t v47 = DMFDeclarationStateReasonKey;
        v44[0] = DMFCommandStateReasonCodeKey;
        v44[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v45[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v45[1] = v12;
        long long v14 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
        id v46 = v14;
        long long v15 = +[NSArray arrayWithObjects:&v46 count:1];
        id v48 = v15;
        id v16 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        [v13 addStatusEntriesFromDictionary:v16];
      }
      long long v17 = [*(id *)(a1 + 32) payloadContext];
      id v18 = [v6 organization];
      uint64_t v19 = [v18 identifier];
      [v17 setOrganizationIdentifier:v19];

      [v17 setAssetProvidersByPayloadIdentifier:0];
      id v20 = v9;
      id v40 = v10;
      uint64_t v21 = [v20 dmf_replaceRequestWithContext:v17 error:&v40];
      id v22 = v40;

      if (v21)
      {
        long long v23 = [*(id *)(a1 + 32) taskOperationProvider];
        id v39 = v22;
        long long v24 = (objc_class *)[v23 operationClassForRequest:v21 error:&v39];
        id v38 = v39;

        uint64_t v25 = DMFConfigurationEngineLog();
        id v26 = v25;
        if (v24)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = [v6 identifier];
            *(_DWORD *)buf = 138543362;
            long long v43 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{public}@: Configuration will replace", buf, 0xCu);
          }
          id v28 = [[v24 alloc] initWithRequest:v21];
          long long v29 = [*(id *)(a1 + 32) taskOperationProvider];
          long long v30 = [*(id *)(a1 + 32) database];
          [v29 prepareToRunOperation:v28 withContext:0 withDatabase:v30];

          [v28 addTarget:*(void *)(a1 + 32) selector:"installationOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v20];
          [*(id *)(a1 + 32) enqueueOperation:v28];

          id v22 = v38;
          goto LABEL_23;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000820F0();
        }

        uint64_t v36 = *(void **)(a1 + 32);
        id v37 = v6;
        id v22 = v38;
      }
      else
      {
        uint64_t v35 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_100082050();
        }

        uint64_t v36 = *(void **)(a1 + 32);
        id v37 = v6;
      }
      [v36 endOperationMarkingPayloadMetadata:v37 failedWithError:v22];
LABEL_23:

      id v10 = v22;
      goto LABEL_24;
    }
    uint64_t v32 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100081B04();
    }

    long long v33 = *(void **)(a1 + 32);
    id v34 = DMFErrorWithCodeAndUserInfo();
    [v33 endOperationMarkingPayloadMetadata:v6 failedWithError:v34];
  }
  else
  {
    __int16 v31 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100081FB0();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
LABEL_24:
}

void sub_1000348D8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 payloadMetadataObjectID];
  id v6 = [v4 objectWithID:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = DMFConfigurationEngineLog();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100082194();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      long long v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration did replace successfully", buf, 0xCu);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v21 = DMFDeclarationStateStatusKey;
    uint64_t v22 = DMFDeclarationStatusInstalled;
    id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v11 addStatusEntriesFromDictionary:v12];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v13 = *(id *)(a1 + 48);
      long long v14 = [*(id *)(a1 + 56) resultObject];
      long long v15 = [*(id *)(a1 + 32) payloadContext];
      id v16 = [v13 dmf_statusForResult:v14 context:v15];

      if (v16)
      {
        long long v17 = *(void **)(a1 + 32);
        uint64_t v19 = DMFDeclarationStatePayloadKey;
        id v20 = v16;
        id v18 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v17 addStatusEntriesFromDictionary:v18];
      }
    }
    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_100034CE0(id a1)
{
  id v1 = (id)objc_opt_new();
  +[DMDSecureUnarchiveFromConfigurationSourceDataTransformer setValueTransformer:v1 forName:@"DMDSecureUnarchiveFromConfigurationSourceDataTransformer"];
}

void sub_100034D94(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:2];
  id v2 = (void *)qword_1000FBA98;
  qword_1000FBA98 = v1;
}

void sub_100034EC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100082234(a1, v6);
    }

    [*(id *)(a1 + 40) assetResolutionFailedWithError:v6];
    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) assetReference];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100034FE8;
    v11[3] = &unk_1000CAB20;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v12 = 0;
    uint64_t v13 = v9;
    id v14 = v10;
    [v5 configurationEngineRequestedAsset:v8 completion:v11];
  }
}

void sub_100034FE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = DMFConfigurationEngineLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000822F4(a1, v6);
    }

    [*(id *)(a1 + 48) assetResolutionFailedWithError:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 40) controller];
      id v11 = [*(id *)(a1 + 48) assetIdentifier];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      long long v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@ successfully resolved asset %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 48) assetResolutionDidSucceedWithAssetURL:v5];
  }
  [*(id *)(a1 + 40) endOperationWithResultObject:0];
}

void sub_100035198(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100035DA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100035EBC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100082564(a1, v8);
    }
  }
  else
  {
    id v11 = [v7 objectForKeyedSubscript:DMFDeclarationEventsMessagesKey];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_1000360A0;
      v15[3] = &unk_1000CAB98;
      id v16 = 0;
      long long v17 = v13;
      id v18 = v7;
      id v19 = v9;
      [v13 fetchRemoteProxy:v15];

      goto LABEL_7;
    }
    uint64_t v10 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = [*(id *)(a1 + 32) controller];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ skipping events because there are no updates to report", buf, 0xCu);
    }
  }

  [*(id *)(a1 + 32) endOperationWithResultObject:0];
LABEL_7:
}

void sub_1000360A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    id v6 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008260C(a1, v5);
    }

    [*(id *)(a1 + 40) endOperationWithResultObject:0];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100036198;
    v8[3] = &unk_1000CAB70;
    uint64_t v7 = *(void *)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    [a2 configurationEventsDidChange:v7 completion:v8];
  }
}

void sub_100036198(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFConfigurationEngineLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000826B4(a1, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) controller];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ successfully sent events", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_1000366F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008275C(a1, v8);
    }
  }
  else
  {
    id v11 = [v7 objectForKeyedSubscript:DMFDeclarationStatusMessagesKey];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_1000368D4;
      v15[3] = &unk_1000CABE8;
      void v15[4] = v13;
      id v16 = v7;
      id v17 = v9;
      [v13 fetchRemoteProxy:v15];

      goto LABEL_7;
    }
    uint64_t v10 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = [*(id *)(a1 + 32) controller];
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ skipping status update because there are no updates to report", buf, 0xCu);
    }
  }

  [*(id *)(a1 + 32) endOperationWithResultObject:0];
LABEL_7:
}

void sub_1000368D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100082804(a1, v5);
    }

    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000369C8;
    v8[3] = &unk_1000CAB70;
    uint64_t v7 = *(void *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [a2 configurationStatusDidChange:v7 completion:v8];
  }
}

void sub_1000369C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DMFConfigurationEngineLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000828AC(a1, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) controller];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ successfully sent status updates", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_100036C98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFConfigurationEngineLog();
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connected successfully to anonymous connection", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100082954((uint64_t)v6, v8);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_100036DE8;
    v12[3] = &unk_1000CAC10;
    id v9 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    void v12[4] = v11;
    id v13 = v6;
    [v9 _tryConnectingToNamedService:1 completion:v12];
  }
}

void sub_100036DE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFConfigurationEngineLog();
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connected successfully to named connection", v10, 2u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000829CC(a1, v8);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

void sub_1000371B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000371CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000371DC(uint64_t a1)
{
}

void sub_1000371E4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10003723C(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

id sub_100037628()
{
  uint64_t v0 = sub_100037C7C();
  uint64_t v1 = sub_100037CD0(v0);
  if (v1)
  {
    id v14 = 0;
    id v2 = [v0 getMobileEquipmentInfoFor:v1 error:&v14];
    id v3 = v14;
    if (v2)
    {
      id v2 = v2;
      id v4 = v2;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100082B3C();
      }
      id v4 = 0;
    }
  }
  else
  {
    id v19 = 0;
    id v2 = [v0 getMobileEquipmentInfo:&v19];
    id v3 = v19;
    if (v2)
    {
      uint64_t v5 = [v2 meInfoList];
      id v6 = v5;
      if (v5)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v7 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v16;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              if ([v12 slotId] == (id)1)
              {
                id v4 = v12;

                goto LABEL_25;
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100082AF4();
      }
      id v4 = 0;
LABEL_25:
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100082A84();
      }
      id v4 = 0;
    }
  }

  return v4;
}

void sub_1000378C0(id a1)
{
  uint64_t v1 = sub_100037628();
  id obj = [v1 MEID];

  if ([obj length]) {
    objc_storeStrong((id *)&qword_1000FBAA8, obj);
  }
}

void sub_1000379A0(id a1)
{
  uint64_t v1 = _CTServerConnectionCreate();
  if (v1)
  {
    id v2 = (const void *)v1;
    _CTServerConnectionCopyFirmwareVersion();
    CFRelease(v2);
  }
}

void sub_100037A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    uint64_t v6 = a2;
    __int16 v7 = 2112;
    uint64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_ServerConnectionCallback: notification = %@, notificationInfo = %@", (uint8_t *)&v5, 0x16u);
  }
}

id sub_100037C7C()
{
  if (qword_1000FBAD0 != -1) {
    dispatch_once(&qword_1000FBAD0, &stru_1000CADA8);
  }
  uint64_t v0 = (void *)qword_1000FBAC8;

  return v0;
}

id sub_100037CD0(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v13 = 0;
    id v3 = [v1 getPreferredDataSubscriptionContextSync:&v13];
    id v4 = v13;
    int v5 = v4;
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync failed: %{public}@", buf, 0xCu);
      }
      id v10 = 0;
      id v7 = v5;
      goto LABEL_19;
    }
    id v12 = v4;
    uint64_t v6 = [v2 getSIMStatus:v3 error:&v12];
    id v7 = v12;

    if (v6)
    {
      if (![v6 isEqualToString:kCTSIMSupportSIMStatusNotInserted])
      {
        id v10 = v3;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = "rejecting data SIM that isn't inserted";
        uint32_t v9 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      uint64_t v8 = "getSIMStatus failed: %{public}@";
      uint32_t v9 = 12;
      goto LABEL_15;
    }
    id v10 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100082C1C();
  }
  id v10 = 0;
LABEL_20:

  return v10;
}

void sub_10003831C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100038334(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082E94();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    id v7 = sub_100037C7C();
    id v10 = 0;
    unsigned __int8 v8 = [v7 getInternationalDataAccessSync:v5 error:&v10];
    id v9 = v10;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100082E24();
      }
      unsigned __int8 v8 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  }
}

void sub_1000384B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082F74();
    }
  }
  else
  {
    id v7 = sub_100037C7C();
    unsigned __int8 v8 = [v7 setInternationalDataAccessSync:v5 status:*(unsigned __int8 *)(a1 + 32)];
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100082F04();
    }
  }
}

void sub_100038DA0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100083248(a2, (uint64_t)v5);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 && a2)
  {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v5, 0);
  }
  else
  {
    id v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void sub_100039078(uint64_t a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100083348(a2);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else
  {
    id v5 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_10003910C(id a1)
{
  qword_1000FBAC8 = objc_opt_new();

  _objc_release_x1();
}

id sub_100039284(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100039580(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10003A87C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithDMFErrorCode:1804];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10003A8E8(id a1)
{
  qword_1000FBAD8 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initPrivate];

  _objc_release_x1();
}

void sub_10003C4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003C524(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003C534(uint64_t a1)
{
}

void sub_10003C53C(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100083BA4();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 < 2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003C7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10003C7FC(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100083C14();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003CA38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10003CA54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10003D0B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_10003D0F8(uint64_t a1)
{
  id v2 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Detected keychain lock change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained keybagLockStateDidChange];
}

void sub_10003D178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained keybagLockStateDidChange];

  id v2 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Detected keychain first unlock", v3, 2u);
  }
}

void sub_10003D1F4(uint64_t a1)
{
  id v2 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Detected network change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained networkDidChange];
}

void sub_10003D5EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D6B8;
  block[3] = &unk_1000C9C08;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void sub_10003D6B8(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100083C84(v2);
    }
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    if (v3)
    {
      NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
      uint64_t v9 = v3;
      uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      id v6 = DMFErrorWithCodeAndUserInfo();
      [v4 endOperationWithError:v6];
    }
    else
    {
      uint64_t v5 = DMFErrorWithCodeAndUserInfo();
      [v4 endOperationWithError:v5];
    }
  }
  else
  {
    [*(id *)(a1 + 48) clearLastLocationRequestedDate];
    id v7 = *(void **)(a1 + 40);
    [v7 endOperationWithResultObject:0];
  }
}

uint64_t DMDPolicyFromDeclarationMode(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_8;
  }
  if (([v1 isEqualToString:DMFDeclarationPayloadModeDisallowed] & 1) == 0)
  {
    if ([v2 isEqualToString:DMFDeclarationPayloadModeAsk])
    {
      uint64_t v3 = 2;
      goto LABEL_9;
    }
    if ([v2 isEqualToString:DMFDeclarationPayloadModeWarn])
    {
      uint64_t v3 = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v3 = 0;
    goto LABEL_9;
  }
  uint64_t v3 = 4;
LABEL_9:

  return v3;
}

uint64_t DMDDeclarationModeIsValid(void *a1)
{
  uint64_t v1 = DMFDeclarationPayloadModeOverride;
  id v2 = a1;
  unsigned int v3 = [v2 isEqualToString:v1];
  unsigned int v4 = [v2 isEqualToString:DMFDeclarationPayloadModeDisallowed];
  unsigned int v5 = [v2 isEqualToString:DMFDeclarationPayloadModeAsk];
  unsigned int v6 = [v2 isEqualToString:DMFDeclarationPayloadModeWarn];
  unsigned int v7 = [v2 isEqualToString:DMFDeclarationPayloadModeAllowed];

  if (v2) {
    int v8 = v3;
  }
  else {
    int v8 = 1;
  }
  if (v8 | v4 | v5) {
    return v2 != 0;
  }
  else {
    return v6 | v7;
  }
}

void sub_10003E03C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E0F8;
  v7[3] = &unk_1000C9BE0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10003E0F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v1)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    uint64_t v7 = v1;
    id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    unsigned int v4 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v4];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    [v5 endOperationWithResultObject:0];
  }
}

void sub_10003EA98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100083FF0(v3);
    }

    [*(id *)(a1 + 32) endOperationWithError:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003EB70;
    v6[3] = &unk_1000C9B78;
    id v7 = 0;
    id v8 = v5;
    [v5 fixupDatabaseWithCompletionHandler:v6];
  }
}

void sub_10003EB70(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = DMFConfigurationEngineLog();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100084078(a1);
    }

    [*(id *)(a1 + 40) setError:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)NSErrorUserInfoKey v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "successfully loaded configuration database", v6, 2u);
    }
  }
}

void sub_10003F0A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = DMFConfigurationEngineLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v6 verboseDescription];
      *(_DWORD *)buf = 138543618;
      id v25 = v5;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "unable to load persistent store %{public}@: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100084230((uint64_t)v5, v8);
    }
  }
  uint64_t v10 = [v5 type];
  unsigned int v11 = [v10 isEqualToString:NSSQLiteStoreType];

  if (v11)
  {
    uint64_t v12 = [v5 URL];
    id v21 = 0;
    unsigned __int8 v13 = [v12 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v21];
    id v14 = v21;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10008417C((uint64_t)v5, v14, v15);
      }
    }
  }
  [*(id *)(a1 + 40) removeObject:v5];
  if (![*(id *)(a1 + 40) count])
  {
    id v16 = [*(id *)(a1 + 32) count];
    uint64_t v17 = *(void *)(a1 + 48);
    if (v16)
    {
      uint64_t v22 = DMFErrorFailedConfigurationDatabaseStoreKey;
      id v18 = [*(id *)(a1 + 32) copy];
      id v23 = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v20 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v20);
    }
    else
    {
      (*(void (**)(void, void))(v17 + 16))(*(void *)(a1 + 48), 0);
    }
  }
}

void sub_10003F3D4(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v27 = a1;
  id v3 = [*(id *)(a1 + 32) database];
  id v28 = [v3 persistentStoreCoordinator];

  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  unsigned int v4 = [v28 persistentStores];
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v10 = [v28 metadataForPersistentStore:v9];
        unsigned int v11 = [v10 objectForKeyedSubscript:@"DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey"];
        unsigned __int8 v12 = [v11 BOOLValue];

        if ((v12 & 1) == 0)
        {
          unsigned __int8 v13 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v40 = v9;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "persistent store %{public}@ has not been fixed up yet", buf, 0xCu);
          }

          char v6 = 1;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v5);

    if (v6)
    {
      id v14 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1000842A8(v14);
      }

      uint64_t v15 = +[DMDEventSubscriptionRegistration fetchRequest];
      id v30 = 0;
      id v16 = [v15 execute:&v30];
      id v17 = v30;
      id v18 = v17;
      if (v16)
      {
        id v19 = *(void **)(v27 + 32);
        id v29 = v18;
        unsigned __int8 v20 = [v19 updateMetadataForManagedObjectContext:v26 error:&v29];
        id v21 = v29;

        uint64_t v22 = *(void *)(v27 + 40);
        if (v20)
        {
          (*(void (**)(void, void))(v22 + 16))(*(void *)(v27 + 40), 0);
LABEL_31:

          goto LABEL_32;
        }
        if (v21)
        {
          NSErrorUserInfoKey v35 = NSUnderlyingErrorKey;
          id v36 = v21;
          long long v24 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          id v25 = DMFErrorWithCodeAndUserInfo();
        }
        else
        {
          id v25 = DMFErrorWithCodeAndUserInfo();
          long long v24 = v25;
        }
        (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v25);
        id v18 = v21;
        if (!v21)
        {
LABEL_30:

          id v21 = v18;
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v23 = *(void *)(v27 + 40);
        if (v17)
        {
          NSErrorUserInfoKey v37 = NSUnderlyingErrorKey;
          id v38 = v17;
          long long v24 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id v25 = DMFErrorWithCodeAndUserInfo();
        }
        else
        {
          id v25 = DMFErrorWithCodeAndUserInfo();
          long long v24 = v25;
        }
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v25);
        if (!v18) {
          goto LABEL_30;
        }
      }

      goto LABEL_30;
    }
  }
  else
  {
  }
  (*(void (**)(void))(*(void *)(v27 + 40) + 16))();
LABEL_32:
}

void sub_10003F7D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14, uint64_t a15, void (*a16)(void *a1, uint64_t a2), void *a17, id a18, uint64_t a19, id a20,id a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,__int16 buf)
{
  if (a2 == 1)
  {
    id v37 = objc_begin_catch(exception_object);
    id v38 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "configuration database has been deprecated, destroying persistent stores and reloading", (uint8_t *)&buf, 2u);
    }

    id v39 = *(void **)(a10 + 32);
    a22 = 0;
    unsigned __int8 v40 = [v39 destroyPersistentStoresWithError:&a22];
    id v41 = a22;

    if (v40)
    {
      a14 = _NSConcreteStackBlock;
      a15 = 3221225472;
      a16 = sub_10003F94C;
      a17 = &unk_1000CAEB8;
      long long v42 = *(void **)(a10 + 32);
      a21 = *(id *)(a10 + 40);
      id v43 = v41;
      uint64_t v44 = *(void *)(a10 + 32);
      a18 = v43;
      a19 = v44;
      a20 = a9;
      [v42 loadPersistentStoresWithCompletionHandler:&a14];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a10 + 40) + 16))();
    }

    objc_end_catch();
    JUMPOUT(0x10003F788);
  }
  _Unwind_Resume(exception_object);
}

void sub_10003F94C(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[7] + 16);
    v3();
  }
  else
  {
    unsigned int v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    id v12 = 0;
    unsigned __int8 v6 = [v4 updateMetadataForManagedObjectContext:v5 error:&v12];
    id v7 = v12;
    id v8 = v7;
    uint64_t v9 = a1[7];
    if (v6)
    {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
    else
    {
      if (v7)
      {
        NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
        id v14 = v7;
        uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        unsigned int v11 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
      }
      else
      {
        uint64_t v10 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      }
    }
  }
}

id sub_10004022C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performDatabaseModificationOperationWithManagedObjectContext:*(void *)(a1 + 40)];
}

void sub_100044330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_100044370(uint64_t a1, uint64_t a2)
{
  return a2;
}

int64_t sub_100044B3C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = DMFDeclarationPayloadIdentifierKey;
  uint64_t v5 = a3;
  unsigned __int8 v6 = [(NSDictionary *)a2 objectForKeyedSubscript:v4];
  id v7 = [(NSDictionary *)v5 objectForKeyedSubscript:v4];

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

void sub_10004508C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) request];
  id v3 = [v2 organizationIdentifier];
  uint64_t v4 = +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:v3];

  id v47 = 0;
  uint64_t v5 = [v4 execute:&v47];
  id v6 = v47;
  if (v5)
  {
    id v7 = [v5 firstObject];
    if (v7)
    {
      id v8 = [v2 organizationIdentifier];
      uint64_t v9 = [*(id *)(a1 + 32) clientIdentifier];
      uint64_t v10 = +[NSString stringWithFormat:@"%@:%@", v8, v9];

      unsigned int v11 = [v2 machServiceName];
      id v12 = [v11 length];

      if (v12)
      {
        id v39 = v6;
        unsigned __int8 v40 = v5;
        id v41 = v4;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v38 = v7;
        NSErrorUserInfoKey v13 = [v7 persistentConfigurationSources];
        id v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v44;
LABEL_6:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
            id v19 = [v18 identifier];
            unsigned __int8 v20 = [v19 isEqualToString:v10];

            if (v20) {
              break;
            }
            if (v15 == (id)++v17)
            {
              id v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
              if (v15) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }
          id v25 = v18;

          id v7 = v38;
          if (v25) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_12:

          id v7 = v38;
        }
        id v25 = [[DMDConfigurationSource alloc] initWithContext:*(void *)(a1 + 40)];
        [(DMDConfigurationSource *)v25 setOrganization:v7];
LABEL_19:
        [(DMDConfigurationSource *)v25 setIdentifier:v10];
        id v26 = [v2 configurationSourceName];
        [(DMDConfigurationSource *)v25 setDisplayName:v26];

        uint64_t v27 = [v2 machServiceName];
        [(DMDConfigurationSource *)v25 setMachServiceName:v27];

        id v28 = [v2 reportingRequirements];
        [(DMDConfigurationSource *)v25 setReportingRequirements:v28];

        uint64_t v23 = [[DMDConfigurationSourceRepresentation alloc] initWithConfigurationSource:v25];
        id v29 = [v2 listenerEndpoint];
        [(DMDConfigurationSourceRepresentation *)v23 setListenerEndpoint:v29];

        uint64_t v5 = v40;
        uint64_t v4 = v41;
        id v6 = v39;
      }
      else
      {
        uint64_t v23 = (DMDConfigurationSourceRepresentation *)objc_opt_new();
        [(DMDConfigurationSourceRepresentation *)v23 setIdentifier:v10];
        id v30 = [v2 organizationIdentifier];
        [(DMDConfigurationSourceRepresentation *)v23 setOrganizationIdentifier:v30];

        long long v31 = [v2 configurationSourceName];
        [(DMDConfigurationSourceRepresentation *)v23 setDisplayName:v31];

        long long v32 = [v2 machServiceName];
        [(DMDConfigurationSourceRepresentation *)v23 setMachServiceName:v32];

        long long v33 = [v2 listenerEndpoint];
        [(DMDConfigurationSourceRepresentation *)v23 setListenerEndpoint:v33];

        id v25 = [v2 reportingRequirements];
        [(DMDConfigurationSourceRepresentation *)v23 setReportingRequirements:v25];
      }

      long long v34 = *(void **)(a1 + 40);
      id v42 = v6;
      unsigned __int8 v35 = [v34 save:&v42];
      id v36 = v42;

      id v37 = *(void **)(a1 + 32);
      if (v35) {
        [v37 performSelectorOnMainThread:"delegateUpdatedDeclarationSourceAndEndOperation:" withObject:v23 waitUntilDone:0];
      }
      else {
        [v37 setError:v36];
      }
      id v6 = v36;
    }
    else
    {
      uint64_t v49 = DMFConfigurationOrganizationIdentifierErrorKey;
      uint64_t v21 = [v2 organizationIdentifier];
      uint64_t v10 = (void *)v21;
      CFStringRef v22 = @"(null)";
      if (v21) {
        CFStringRef v22 = (const __CFString *)v21;
      }
      CFStringRef v50 = v22;
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      long long v24 = DMFErrorWithCodeAndUserInfo();
      [*(id *)(a1 + 32) setError:v24];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setError:v6];
  }
}

uint64_t sub_100047018(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100047374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100047418(uint64_t a1)
{
  id v2 = (const char *)[@"com.apple.alarm" UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000475C0;
  handler[3] = &unk_1000CAF88;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v2, (dispatch_queue_t)&_dispatch_main_q, handler);
  id v3 = (const char *)[@"com.apple.distnoted.matching" UTF8String];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000477CC;
  v8[3] = &unk_1000CAF88;
  v8[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v3, (dispatch_queue_t)&_dispatch_main_q, v8);

  uint64_t v4 = (const char *)[@"com.apple.notifyd.matching" UTF8String];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000479E8;
  v7[3] = &unk_1000CAF88;
  void v7[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v4, (dispatch_queue_t)&_dispatch_main_q, v7);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100047B98;
  v6[3] = &unk_1000CB000;
  void v6[4] = *(void *)(a1 + 32);
  return +[MOEffectiveSettings startObservingChangesWithHandler:v6];
}

void sub_1000475C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, _xpc_event_key_name)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (alarm) with name: %{public}@", buf, 0xCu);
  }
  if (v4)
  {
    [@"com.apple.alarm" UTF8String];
    xpc_set_event();
    id v5 = *(id *)(*(void *)(a1 + 32) + 8);
    objc_sync_enter(v5);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 8);
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (objc_opt_respondsToSelector()) {
            [v10 handleAlarmWithIdentifier:v4];
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    objc_sync_exit(v5);
  }
}

void sub_1000477A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000477CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, _xpc_event_key_name)];
  id v5 = xpc_dictionary_get_dictionary(v3, (const char *)[@"UserInfo" UTF8String]);

  if (v5) {
    id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v6 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (distributed notification matching) with name: %{public}@ user info: %{public}@", buf, 0x16u);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[2];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100047988;
  v11[3] = &unk_1000CAFB0;
  id v12 = v4;
  id v13 = v6;
  id v9 = v6;
  id v10 = v4;
  [v7 _dispatchToListenerForKey:v10 inMap:v8 withBlock:v11];
}

void sub_100047988(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 handleDistributedNotificationWithName:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
  }
}

void sub_1000479E8(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received xpc stream event (notify matching) with name: %{public}@", buf, 0xCu);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047B38;
  v7[3] = &unk_1000CAFD8;
  id v8 = v3;
  id v6 = v3;
  [v4 _dispatchToListenerForKey:v6 inMap:v5 withBlock:v7];
}

void sub_100047B38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 handleNotifyMatchingNotificationWithName:*(void *)(a1 + 32)];
  }
}

void sub_100047B98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received effective settings change for event: %{public}@, groups: %{public}@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = (char *)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(a1 + 32) _dispatchToListenerForKey:inMap:withBlock:];
      }
      id v9 = (char *)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void sub_100047D68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 handleManagedEffectiveSettingsChangeInGroup:*(void *)(a1 + 32)];
  }
}

void sub_100047F50(_Unwind_Exception *exception_object)
{
}

void sub_1000480D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000487A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void sub_1000487C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained eventsHandler];

  if (v4) {
    ((void (**)(void, void, void, id))v4)[2](v4, *(void *)(a1 + 32), *(void *)(a1 + 40), v5);
  }
}

void sub_100048984(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [v9 organizationIdentifier];
  unsigned int v5 = [v4 isEqual:a1[4]];

  if (v5)
  {
    id v6 = [v9 eventStatusesSinceStartDate:a1[6]];
    id v7 = (void *)a1[5];
    id v8 = [v9 payloadIdentifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

void sub_100048CA0(id a1)
{
  id v1 = (id)objc_opt_new();
  +[DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer setValueTransformer:v1 forName:@"DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer"];
}

void sub_100048D54(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  void v3[2] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  id v2 = (void *)qword_1000FBAF8;
  qword_1000FBAF8 = v1;
}

void sub_1000493EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100049408(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 streamEventsHandler];
  [v4 startNotificationStreamWithEventsHandler:v5];
}

void sub_10004946C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained lastDateScheduleElapsed];
  id v2 = [WeakRetained eventStatusesSinceStartDate:v1];

  id v3 = [WeakRetained streamEventsHandler];
  ((void (**)(void, void *))v3)[2](v3, v2);

  id v4 = objc_opt_new();
  [WeakRetained setLastDateScheduleElapsed:v4];
}

uint64_t sub_100049608(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 eventStatusRollupSinceStartDate:*(void *)(a1 + 32)];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return _objc_release_x1();
}

void sub_1000499C8(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  if (a3)
  {
    [v5 endOperationWithError:a3];
  }
  else
  {
    id v6 = [objc_alloc((Class)DMFFetchAppsResultObject) initWithAppsByBundleIdentifier:v7];
    [v5 endOperationWithResultObject:v6];
  }
}

void sub_100049D8C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 48) _fetchAppsForBundleIdentifier:v5 type:[*(id *)(a1 + 32) type] completion:*(void *)(a1 + 40)];
  }
}

void sub_100049E14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v59 = [v5 mutableCopy];
    id v58 = v5;
    if ([*(id *)(a1 + 32) managedAppsOnly])
    {
      id v8 = [*(id *)(a1 + 32) bundleIdentifiers];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v9 = [*(id *)(a1 + 40) managedBundleIdentifiers];
      id v10 = [v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v70;
        long long v56 = v9;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v70 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            if (!v8 || [v8 containsObject:v14])
            {
              __int16 v16 = [v5 objectForKeyedSubscript:v14, v56];

              if (!v16)
              {
                uint64_t v17 = +[DMDAppLifeCycle lifeCycleForBundleIdentifier:v14];
                if (![v17 currentState])
                {
                  id v18 = objc_opt_new();
                  [v18 setType:0];
                  [v18 setBundleIdentifier:v14];
                  [v18 setInstallationState:0];
                  __int16 v19 = [*(id *)(a1 + 40) VPNUUIDStringForBundleIdentifier:v14];
                  [v18 setVPNUUIDString:v19];

                  id v20 = [*(id *)(a1 + 40) cellularSliceUUIDStringForBundleIdentifier:v14];
                  [v18 setCellularSliceUUIDString:v20];

                  uint64_t v21 = [*(id *)(a1 + 40) contentFilterUUIDStringForBundleIdentifier:v14];
                  [v18 setContentFilterUUIDString:v21];

                  CFStringRef v22 = [*(id *)(a1 + 40) DNSProxyUUIDStringForBundleIdentifier:v14];
                  [v18 setDNSProxyUUIDString:v22];

                  uint64_t v23 = [*(id *)(a1 + 40) relayUUIDStringForBundleIdentifier:v14];
                  [v18 setRelayUUIDString:v23];

                  long long v24 = [*(id *)(a1 + 40) associatedDomainsForBundleIdentifier:v14];
                  [v18 setAssociatedDomains:v24];

                  id v25 = [*(id *)(a1 + 40) associatedDomainsEnableDirectDownloadsForBundleIdentifier:v14];
                  [v18 setAssociatedDomainsEnableDirectDownloads:v25];

                  id v26 = [*(id *)(a1 + 40) removabilityForBundleIdentifier:v14];
                  [v18 setRemovable:v26];

                  uint64_t v27 = [*(id *)(a1 + 40) tapToPayScreenLockForBundleIdentifier:v14];
                  [v18 setTapToPayScreenLock:v27];

                  id v28 = [*(id *)(a1 + 40) allowUserToHideForBundleIdentifier:v14];
                  [v18 setAllowUserToHide:v28];

                  id v29 = [*(id *)(a1 + 40) allowUserToLockForBundleIdentifier:v14];
                  [v18 setAllowUserToLock:v29];

                  id v30 = [*(id *)(a1 + 40) configurationForBundleIdentifier:v14];
                  [v18 setConfiguration:v30];

                  long long v31 = [*(id *)(a1 + 40) feedbackForBundleIdentifier:v14];
                  [v18 setFeedback:v31];

                  long long v32 = [*(id *)(a1 + 40) managementInformationForBundleIdentifier:v14];
                  [v18 setManagementInformation:v32];

                  long long v33 = [*(id *)(a1 + 40) sourceIdentifierForBundleIdentifier:v14];
                  [v18 setSourceIdentifier:v33];

                  id v9 = v56;
                  [v59 setObject:v18 forKeyedSubscript:v14];

                  id v5 = v58;
                }
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
        }
        while (v11);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v34 = v5;
      id v35 = [v34 countByEnumeratingWithState:&v65 objects:v76 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v66;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v66 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v65 + 1) + 8 * (void)j);
            id v41 = [v34 objectForKeyedSubscript:v39];
            id v42 = [v41 managementInformation];

            if (!v42) {
              [v59 setObject:0 forKeyedSubscript:v39];
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v65 objects:v76 count:16];
        }
        while (v36);
      }

      id v5 = v58;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "advanceTransientStates", v56)) {
      [*(id *)(a1 + 40) advanceTransientStates];
    }
    if ([*(id *)(a1 + 32) deleteFeedback])
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v43 = v59;
      id v44 = [v43 countByEnumeratingWithState:&v61 objects:v75 count:16];
      if (v44)
      {
        id v45 = v44;
        id v7 = 0;
        uint64_t v46 = *(void *)v62;
        uint64_t v57 = 138543362;
        do
        {
          id v47 = 0;
          id v48 = v7;
          do
          {
            if (*(void *)v62 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v47);
            uint64_t v51 = *(void **)(a1 + 40);
            id v60 = v48;
            unsigned __int8 v52 = [v51 setFeedback:0 forBundleIdentifier:v49 error:&v60];
            id v7 = v60;

            if ((v52 & 1) == 0)
            {
              long long v53 = DMFAppLog();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v74 = v49;
                _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Could not delete feedback for bundle identifier: %{public}@", buf, 0xCu);
              }
            }
            id v47 = (char *)v47 + 1;
            id v48 = v7;
          }
          while (v45 != v47);
          id v45 = [v43 countByEnumeratingWithState:&v61 objects:v75 count:16];
        }
        while (v45);
      }
      else
      {
        id v7 = 0;
      }

      id v5 = v58;
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v54 = *(void *)(a1 + 48);
    id v55 = [v59 copy:v57];
    (*(void (**)(uint64_t, id, void))(v54 + 16))(v54, v55, 0);
  }
}

void sub_10004B240(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }
  else
  {
    id v5 = objc_opt_new();
    [v5 setPayloadDescriptions:v6];
    [*(id *)(a1 + 32) endOperationWithResultObject:v5];
  }
}

void sub_10004BA28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (a3)
  {
    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    uint64_t v12 = a3;
    id v7 = a3;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = DMFErrorWithCodeAndUserInfo();
    [v6 endOperationWithError:v9];
  }
  else
  {
    id v10 = 0;
    id v8 = [objc_alloc((Class)DMFFetchLocationResultObject) initWithLocation:v5];
    [v6 endOperationWithResultObject:v8];
  }
}

void sub_10004BC70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nonStoreBooks];
  id v3 = [*(id *)(a1 + 32) storeBooks];
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];

  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  [*(id *)(a1 + 32) moveTransientStatesForward];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        id v12 = objc_alloc((Class)DMFBook);
        id v13 = [v12 initWithBook:v11, v16];
        [v5 addObject:v13];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = *(void **)(a1 + 40);
  id v15 = [objc_alloc((Class)DMFFetchManagedBooksResultObject) initWithBooks:v5];
  [v14 endOperationWithResultObject:v15];
}

id sub_10004BF68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return [v3 endOperationWithError:];
  }
  else {
    return [v3 endOperationWithResultObject:a2];
  }
}

id sub_10004D0F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return [v3 endOperationWithError:];
  }
  else {
    return [v3 endOperationWithResultObject:a2];
  }
}

void sub_10004D6D4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }
  else
  {
    id v7 = [v5 bundleIdentifier];

    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v9 = [v6 bundleIdentifier];
      id v10 = [*(id *)(a1 + 40) personaIdentifier];
      unsigned int v11 = [v8 appCoordinatorExistsForBundleIdentifier:v9 persona:v10];

      if (!v11)
      {
        [*(id *)(a1 + 32) setMetadata:v6];
        [*(id *)(a1 + 32) _runWithRequest:*(void *)(a1 + 40)];
        goto LABEL_11;
      }
      id v12 = DMFAppLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 bundleIdentifier];
        int v16 = 138543362;
        long long v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Abandoning install because of existing install coordinator for bundle identifier %{public}@", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = 2616;
    }
    else
    {
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = 2606;
    }
    [v14 endOperationWithDMFErrorCode:v15];
  }
LABEL_11:
}

id sub_10004DB98(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10004DE18(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10004E02C(id a1)
{
  qword_1000FBB08 = +[NSSet setWithArray:&__NSArray0__struct];

  _objc_release_x1();
}

void sub_10004E3B0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    uint64_t v7 = v1;
    id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    uint64_t v4 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v4];
  }
  else
  {
    DMFErrorWithCodeAndUserInfo();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:];
  }
}

void sub_10004F8B8(id a1)
{
  CFStringRef v3 = @"whitelistedAppBundleIDs";
  uint64_t v4 = MCFeatureAppLockBundleIDs;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  id v2 = (void *)qword_1000FBB18;
  qword_1000FBB18 = v1;
}

id sub_10004FC18(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_1000500F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [*(id *)(a1 + 32) endOperationWithError:a2];
  }
  else
  {
    id v6 = objc_alloc((Class)DMFInstallManagedBookResultObject);
    id v7 = [objc_alloc((Class)DMFBook) initWithBook:v9];
    id v8 = [v6 initWithBook:v7];
    [v5 endOperationWithResultObject:v8];
  }
  [*(id *)(a1 + 40) stayAliveThroughHereAtLeast];
}

id sub_100051214(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    CFStringRef v3 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v4 = *(void *)(a1 + 32);
    id v11 = 0;
    unsigned int v5 = [v3 openSensitiveURL:v4 withOptions:0 error:&v11];
    id v6 = v11;

    id v7 = *(void **)(a1 + 40);
    if (v5)
    {
      [*(id *)(a1 + 40) endOperationWithResultObject:0];
    }
    else
    {
      if (v6)
      {
        NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
        id v13 = v6;
        id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        id v9 = DMFErrorWithCodeAndUserInfo();
        [v7 endOperationWithError:v9];
      }
      else
      {
        id v8 = DMFErrorWithCodeAndUserInfo();
        [v7 endOperationWithError:v8];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) endOperationWithDMFErrorCode:2607];
  }
  byte_1000FBB28 = 0;
  return [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
}

void *sub_100051F8C(void *result)
{
  if (result[4])
  {
    uint64_t v1 = result;
    DMFErrorWithCodeAndUserInfo();
    uint64_t result = (id)objc_claimAutoreleasedReturnValue();
    *(void *)v1[4] = result;
  }
  return result;
}

void sub_10005217C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    unsigned int v5 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v5];
  }
  else
  {
    id v4 = 0;
    [v2 endOperationWithResultObject:0];
  }
}

uint64_t sub_1000523A0()
{
  qword_1000FBB30 = objc_opt_new();

  return _objc_release_x1();
}

void sub_1000524B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    DMFErrorWithCodeAndUserInfo();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v21);
  }
  else
  {
    [*(id *)(a1 + 32) setCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setOriginator:*(void *)(a1 + 40)];
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = +[CLEmergencyEnablementAssertion newAssertionForBundle:v4 withReason:@"DMDLostDeviceLocationManager getCurrentLocationForOriginator:completion:"];
    +[CLLocationManager setAuthorizationStatusByType:3 forBundle:v4];
    id v6 = objc_alloc((Class)CLLocationManager);
    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 queue];
    id v9 = [v6 initWithEffectiveBundle:v4 delegate:v7 onQueue:v8];
    [*(id *)(a1 + 32) setLocationManager:v9];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v10 locationManager];
    [v11 setDelegate:v10];

    NSErrorUserInfoKey v12 = [*(id *)(a1 + 32) locationManager];
    [v12 setDesiredAccuracy:kCLLocationAccuracyBest];

    id v13 = [*(id *)(a1 + 32) queue];
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
    [*(id *)(a1 + 32) setTimeoutTimerDispatchSource:v14];

    uint64_t v15 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    dispatch_time_t v16 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
    dispatch_source_set_timer(v15, v16, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

    long long v17 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000527A0;
    handler[3] = &unk_1000C9BE0;
    handler[4] = *(void *)(a1 + 32);
    id v23 = v5;
    id v18 = v5;
    dispatch_source_set_event_handler(v17, handler);

    long long v19 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    dispatch_activate(v19);

    id v20 = [*(id *)(a1 + 32) locationManager];
    [v20 requestLocation];
  }
}

void sub_1000527A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3) {
    sub_10008576C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = [*(id *)(a1 + 32) completionBlock];
  [*(id *)(a1 + 32) _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (v11)
  {
    NSErrorUserInfoKey v12 = DMFErrorWithCodeAndUserInfo();
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
  }
}

void sub_100052988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000529A0(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v3 = a2;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned int v5 = [v4 removeItemAtURL:v3 error:&v9];

  id v6 = v9;
  if (v5)
  {
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) domain];
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [*(id *)(a1 + 32) code];

      if (v8 == (id)4) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100085818();
    }
  }
LABEL_9:
}

void sub_100052EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_100052F40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100052F50(uint64_t a1)
{
}

uint64_t sub_100052F58(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t v3 = +[NSDictionary dictionaryWithContentsOfURL:a2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:kMCMDMLostModeLastLocationRequestDateKey];

  return _objc_release_x1();
}

void sub_100053474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000534A0(void *a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v4 = objc_opt_new();
  [v4 timeIntervalSinceReferenceDate];
  unsigned int v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  v22[0] = kMCMDMLostModeLastLocationRequestDateKey;
  v22[1] = @"originator";
  uint64_t v6 = a1[4];
  v23[0] = v5;
  v23[1] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  if ([v7 writeToURL:v3 atomically:1])
  {
    v20[0] = NSFileProtectionKey;
    v20[1] = NSURLIsExcludedFromBackupKey;
    v21[0] = NSFileProtectionNone;
    v21[1] = &__kCFBooleanTrue;
    id v8 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v19 = 0;
    unsigned int v9 = [v3 setResourceValues:v8 error:&v19];
    id v10 = v19;

    if (v9)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100085934();
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_1000859A4(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

id sub_100053908(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 stayAliveThroughHereAtLeast];
}

void sub_100053950(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    unsigned int v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100053A48;
    v7[3] = &unk_1000CB3E0;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    [v5 promptUserForiTunesAccount:0 accountNameEditable:1 canCreateNewAccount:1 assertion:v6 completionBlock:v7];
  }
}

id sub_100053A48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, a2 == 0);
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 stayAliveThroughHereAtLeast];
}

void sub_100053BBC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t sub_100053CD8()
{
  qword_1000FBB40 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100053D64(id a1)
{
  qword_1000FBB50 = objc_opt_new();

  _objc_release_x1();
}

id sub_100053F30(uint64_t a1)
{
  return [*(id *)(a1 + 32) stayAliveThroughHereAtLeast];
}

void sub_100053FEC(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueCleanUp];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005409C;
    block[3] = &unk_1000CB4E0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t sub_10005409C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100054B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

id sub_100054B6C()
{
  if (qword_1000FBB68 != -1) {
    dispatch_once(&qword_1000FBB68, &stru_1000CB6E0);
  }
  uint64_t v0 = (void *)qword_1000FBB60;

  return v0;
}

uint64_t sub_100054BC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100054BD0(uint64_t a1)
{
}

void sub_100054BD8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 persistentIdentifier] == *(id *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

id sub_100054C58(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishDownloads:*(void *)(a1 + 40)];
}

id sub_100054C64()
{
  if (qword_1000FBB78 != -1) {
    dispatch_once(&qword_1000FBB78, &stru_1000CB700);
  }
  uint64_t v0 = (void *)qword_1000FBB70;

  return v0;
}

void sub_100055548(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueRereadNonStoreBooksManifest];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    dispatch_async(v3, v2);
  }
}

void sub_100055674(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueRereadStoreBooksManifest];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    dispatch_async(v3, v2);
  }
}

id sub_1000557D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  uint64_t v4 = [*(id *)(a1 + 40) persistentID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 memberQueueCommitNonStoreBooksManifest];
}

id sub_100055938(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) memberQueueiTunesStoreIDToStoreBook];
  uint64_t v4 = [*(id *)(a1 + 40) iTunesStoreID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 memberQueueCommitStoreBooksManifest];
}

void sub_100055A84(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    [v4 setState:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitNonStoreBooksManifest];
    uint64_t v3 = v4;
  }
}

void sub_100055BD8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) memberQueueiTunesStoreIDToStoreBook];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v4;
  if (v4)
  {
    [v4 setState:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitStoreBooksManifest];
    uint64_t v3 = v4;
  }
}

void sub_100055EDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100085B08();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

uint64_t sub_100055F40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005612C(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  uint64_t v4 = [*(id *)(a1 + 40) persistentID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  uint64_t v6 = (__CFString *)*(id *)(a1 + 48);
  if ([(__CFString *)v6 length])
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v13 = +[DMDPaths managedNonStoreBooksDirectory];
    uint64_t v14 = [*(id *)(a1 + 40) persistentID];
    uint64_t v15 = [v14 MCHashedFilenameWithPrefix:0 extension:v6];
    uint64_t v16 = [v13 stringByAppendingPathComponent:v15];
    [*(id *)(a1 + 40) setFullPath:v16];

    [*(id *)(a1 + 40) setKind:v6];
    goto LABEL_14;
  }

  uint64_t v6 = @"pdf";
  if (!v5) {
    goto LABEL_7;
  }
LABEL_3:
  id v7 = [v5 kind];
  unsigned int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    id v9 = [v5 fullPath];
    [*(id *)(a1 + 40) setFullPath:v9];

    id v10 = [v5 state];
    unsigned int v11 = [v10 isEqualToString:@"Managed"];

    if (v11)
    {
      [*(id *)(a1 + 40) setPreviousVersion:v5];
      CFStringRef v12 = @"Updating";
LABEL_15:
      [*(id *)(a1 + 40) setState:v12];
      goto LABEL_16;
    }
    CFStringRef v22 = [v5 downloadIdentifier];

    if (v22)
    {
      id v23 = [v5 downloadIdentifier];
      [v2 addObject:v23];
    }
LABEL_14:
    CFStringRef v12 = @"Installing";
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100085BA4(v5, (uint64_t)v6);
  }
  uint64_t v17 = DMFErrorWithCodeAndUserInfo();
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100056798;
    block[3] = &unk_1000CB530;
    id v52 = *(id *)(a1 + 72);
    id v49 = v18;
    id v50 = *(id *)(a1 + 40);
    id v51 = *(id *)(a1 + 56);
    id v20 = v18;
    dispatch_async(v19, block);

    id v21 = v52;
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v39 = v5;
  id v41 = v2;
  id v20 = [objc_alloc((Class)NSURLRequest) initWithURL:*(void *)(a1 + 64)];
  id v24 = objc_alloc((Class)SSDownloadMetadata);
  id v21 = [v24 initWithKind:SSDownloadKindDocument];
  id v25 = [objc_alloc((Class)SSDownload) initWithDownloadMetadata:v21];
  id v26 = [objc_alloc((Class)SSDownloadAsset) initWithURLRequest:v20];
  [v26 setValue:&off_1000D35F0 forProperty:SSDownloadAssetPropertyAllowedRetryCount];
  [v26 setValue:&__kCFBooleanTrue forProperty:SSDownloadAssetPropertyIsExternal];
  uint64_t v27 = SSDownloadAssetTypeMedia;
  [v26 setValue:SSDownloadAssetTypeMedia forProperty:SSDownloadAssetPropertyType];
  [v26 setValue:NSFileProtectionCompleteUntilFirstUserAuthentication forProperty:SSDownloadAssetPropertyFileProtectionType];
  id v28 = [*(id *)(a1 + 40) fullPath];
  id v29 = +[NSURL fileURLWithPath:v28];
  [v26 setValue:v29 forProperty:SSDownloadAssetPropertyDestinationURL];

  v53[0] = @"epub";
  v53[1] = @"ibooks";
  id v30 = v6;
  long long v31 = +[NSArray arrayWithObjects:v53 count:2];
  unsigned int v32 = [v31 containsObject:v30];

  if (v32) {
    [v26 setValue:&off_1000D3608 forProperty:SSDownloadAssetPropertyProcessingTypes];
  }
  [v25 addAsset:v26 forType:v27];
  [v25 setValue:&__kCFBooleanTrue forProperty:SSDownloadPropertyIsSharedResource];
  [v25 setValue:&__kCFBooleanTrue forProperty:SSDownloadPropertyShouldSuppressErrorDialogs];
  long long v33 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 persistentIdentifier]);
  [*(id *)(a1 + 40) setDownloadIdentifier:v33];

  uint64_t v34 = *(void *)(a1 + 40);
  id v35 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  id v36 = [*(id *)(a1 + 40) persistentID];
  [v35 setObject:v34 forKeyedSubscript:v36];

  [*(id *)(a1 + 32) memberQueueCommitNonStoreBooksManifest];
  uint64_t v37 = dispatch_get_global_queue(0, 0);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100056818;
  v42[3] = &unk_1000CB5A8;
  v42[4] = *(void *)(a1 + 32);
  uint64_t v2 = v41;
  id v43 = v41;
  id v44 = *(id *)(a1 + 40);
  id v45 = v25;
  id v47 = *(id *)(a1 + 72);
  id v46 = *(id *)(a1 + 56);
  id v38 = v25;
  dispatch_async(v37, v42);

  id v5 = v40;
LABEL_19:
}

id sub_100056798(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = (void *)a1[5];
    id v5 = [v4 state];
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, v3, v4, v5);
  }
  uint64_t v6 = (void *)a1[6];

  return [v6 stayAliveThroughHereAtLeast];
}

void sub_100056818(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000568F4;
  v6[3] = &unk_1000CB580;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v11 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 64);
  [v2 cancelNonStoreDownloadsWithDownloadIdentifiers:v3 completionBlock:v6];
}

void sub_1000568F4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [*(id *)(a1 + 32) friendlyName];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning download of book %{public}@", buf, 0xCu);
  }
  uint64_t v3 = +[NSFileManager defaultManager];
  id v4 = [*(id *)(a1 + 32) fullPath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) fullPath];
    [v3 removeItemAtPath:v6 error:0];
  }
  id v7 = sub_100054B6C();
  uint64_t v13 = *(void *)(a1 + 40);
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100056AE4;
  v9[3] = &unk_1000CB558;
  v9[4] = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  [v7 addDownloads:v8 completionBlock:v9];
}

void sub_100056AE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
    id v15 = v3;
    unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v6 = DMFErrorWithCodeAndUserInfo();

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) persistentID];
    [v7 setState:@"Failed" forNonStoreBookWithPersistentID:v8];

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, void *, void, const __CFString *))(v9 + 16))(v9, v6, *(void *)(a1 + 40), @"Failed");
    }
    [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10)
    {
      id v11 = *(void **)(a1 + 40);
      id v12 = [v11 state];
      (*(void (**)(uint64_t, void, void *, void *))(v10 + 16))(v10, 0, v11, v12);
    }
    uint64_t v13 = *(void **)(a1 + 48);
    [v13 stayAliveThroughHereAtLeast];
  }
}

void sub_100056F10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if ([v5 count])
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:0];
      if (([v10 isVPPLicensed] & 1) != 0
        || +[DMDManagedMediaManager shouldBypassVPPLicenseCheck])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v10 title];
          *(_DWORD *)buf = 138543362;
          id v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found book: %{public}@", buf, 0xCu);
        }
        id v8 = objc_opt_new();
        [v8 setITunesStoreID:*(void *)(a1 + 32)];
        id v12 = [v10 title];
        [v8 setTitle:v12];

        uint64_t v13 = [v10 author];
        [v8 setAuthor:v13];

        NSErrorUserInfoKey v14 = [v10 redownloadParameters];
        [v8 setBuyParams:v14];

        if (v8)
        {
          uint64_t v15 = *(void *)(a1 + 56);
          if (v15) {
            (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v8);
          }
          goto LABEL_24;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100085C90();
        }
      }
    }
    if (*(_DWORD *)(a1 + 64))
    {
      uint64_t v16 = *(void **)(a1 + 40);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100057288;
      v19[3] = &unk_1000CB5F8;
      v19[4] = v16;
      id v20 = *(id *)(a1 + 32);
      id v21 = *(id *)(a1 + 48);
      int v23 = *(_DWORD *)(a1 + 64);
      id v22 = *(id *)(a1 + 56);
      [v16 refreshBookPurchaseHistoryCompletion:v19];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100085C48();
      }
      uint64_t v17 = *(void *)(a1 + 56);
      if (v17)
      {
        uint64_t v18 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
      }
    }
    id v8 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100085D0C();
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
    id v27 = v6;
    id v8 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v9 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0);

LABEL_24:
  }
  [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
}

id sub_100057288(uint64_t a1)
{
  return [*(id *)(a1 + 32) searchBookPurchaseHistoryForiTunesStoreID:*(void *)(a1 + 40) assertion:*(void *)(a1 + 48) triesLeft:(*(_DWORD *)(a1 + 64) - 1) completionBlock:*(void *)(a1 + 56)];
}

id sub_100057594(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = DMFErrorWithCodeAndUserInfo();
  (*(void (**)(uint64_t, void *, void, const __CFString *))(v2 + 16))(v2, v3, 0, @"Failed");

  id v4 = *(void **)(a1 + 32);

  return [v4 stayAliveThroughHereAtLeast];
}

void sub_10005760C(uint64_t a1, char a2)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_100057748;
    v12[3] = &unk_1000CB670;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v15 = v6;
    void v12[4] = v7;
    id v13 = v8;
    id v14 = *(id *)(a1 + 32);
    [v4 searchBookPurchaseHistoryForiTunesStoreID:v3 assertion:v5 completionBlock:v12];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      uint64_t v10 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *, void, const __CFString *))(v9 + 16))(v9, v10, 0, @"Failed");
    }
    id v11 = *(void **)(a1 + 32);
    [v11 stayAliveThroughHereAtLeast];
  }
}

void sub_100057748(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = (void (**)(id, id, void, const __CFString *))a1[7];
    if (v8) {
      v8[2](v8, v5, 0, @"Failed");
    }
  }
  else
  {
    [v6 setState:@"Installing"];
    [a1[4] setStoreManagedBook:v7];
    uint64_t v9 = +[BLDownloadQueue sharedInstance];
    uint64_t v10 = [v7 buyParams];
    id v11 = [a1[5] stringValue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_1000578BC;
    v12[3] = &unk_1000CB648;
    id v15 = a1[7];
    id v13 = v7;
    id v14 = a1[6];
    [v9 addDownloadWithPurchaseParameters:v10 storeID:v11 completion:v12];
  }
  [a1[6] stayAliveThroughHereAtLeast];
}

id sub_1000578BC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1[6];
  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = a3;
    uint64_t v7 = [v5 state];
    (*(void (**)(uint64_t, id, void *, void *))(v4 + 16))(v4, v6, v5, v7);
  }
  id v8 = (void *)a1[5];

  return [v8 stayAliveThroughHereAtLeast];
}

void sub_100057A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100057A64(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSArray);
  id v7 = [*(id *)(a1 + 32) memberQueueiTunesStoreIDToStoreBook];
  uint64_t v3 = [v7 allValues];
  id v4 = [v2 initWithArray:v3 copyItems:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100057C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100057C18(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSArray);
  id v7 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  uint64_t v3 = [v7 allValues];
  id v4 = [v2 initWithArray:v3 copyItems:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id sub_1000580D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueMoveTransientStatesForward];
}

void sub_1000581DC(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueCleanUp];
  id v2 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) memberQueueCommitNonStoreBooksManifest];
    uint64_t v5 = +[NSFileManager defaultManager];
    id v6 = [v3 downloadIdentifier];

    if (v6)
    {
      id v7 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000583E0;
      block[3] = &unk_1000CB580;
      void block[4] = *(void *)(a1 + 32);
      id v14 = v3;
      id v15 = v5;
      id v17 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 48);
      dispatch_async(v7, block);
    }
    else
    {
      uint64_t v10 = [v3 fullPath];
      [v5 removeItemAtPath:v10 error:0];

      id v11 = *(void **)(a1 + 56);
      if (v11)
      {
        id v12 = dispatch_get_global_queue(0, 0);
        dispatch_async(v12, v11);
      }
      [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 56);
    if (v8)
    {
      uint64_t v9 = dispatch_get_global_queue(0, 0);
      dispatch_async(v9, v8);
    }
    [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
  }
}

void sub_1000583E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) downloadIdentifier];
  uint64_t v10 = v3;
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100058518;
  v5[3] = &unk_1000CA940;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  [v2 cancelNonStoreDownloadsWithDownloadIdentifiers:v4 completionBlock:v5];
}

id sub_100058518(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) fullPath];
  [v2 removeItemAtPath:v3 error:0];

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v5 = *(void **)(a1 + 48);

  return [v5 stayAliveThroughHereAtLeast];
}

id sub_1000586D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueueiTunesStoreIDToStoreBook];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 memberQueueCommitStoreBooksManifest];
}

uint64_t sub_100058724(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10005888C(uint64_t a1)
{
  [*(id *)(a1 + 32) finishDownloads:*(void *)(a1 + 40)];
  +[SSDownloadManager removePersistenceIdentifier:@"com.apple.mdmd.downloads.media.nonstore"];
  id v2 = [*(id *)(a1 + 48) memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058968;
  block[3] = &unk_1000CB318;
  void block[4] = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

void sub_100058968(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing managed books.", v8, 2u);
  }
  id v2 = [*(id *)(a1 + 32) memberQueuePersistentIDToNonStoreBook];
  [v2 removeAllObjects];

  uint64_t v3 = +[NSFileManager defaultManager];
  id v4 = +[DMDPaths managedNonStoreBooksDirectory];
  [v3 removeItemAtPath:v4 error:0];

  id v5 = +[DMDPaths managedStoreBooksManifestPath];
  [v3 removeItemAtPath:v5 error:0];

  MCSendManagedBooksChangedNotification();
  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, v6);
  }
  [*(id *)(a1 + 40) stayAliveThroughHereAtLeast];
}

void sub_100058B5C(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v5 = SSDownloadKindDocument;
  id v2 = +[NSArray arrayWithObjects:&v5 count:1];
  [v1 setDownloadKinds:v2];

  [v1 setPersistenceIdentifier:@"com.apple.mdmd.downloads.media.nonstore"];
  [v1 setShouldFilterExternalOriginatedDownloads:1];
  id v3 = [objc_alloc((Class)SSDownloadManager) initWithManagerOptions:v1];
  id v4 = (void *)qword_1000FBB60;
  qword_1000FBB60 = (uint64_t)v3;
}

void sub_100058C3C(id a1)
{
  v3[0] = @"Failed";
  v3[1] = @"Unknown";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:2];
  id v2 = (void *)qword_1000FBB70;
  qword_1000FBB70 = v1;
}

void sub_10005927C(id a1)
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v1 = [v3 localizedStringForKey:@"%@ is about to install and manage the app “%@” from the App Store.\nYour iTunes account will not be charged for this app." value:&stru_1000CC390 table:@"DMFNotifications"];
  id v2 = (void *)qword_1000FBB80;
  qword_1000FBB80 = v1;
}

void sub_1000594F4(uint64_t a1)
{
  id v2 = DMFAppLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start redeeming app with bundle identifier: %{public}@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) _setState:2];
  uint64_t v5 = *(void **)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059638;
  v6[3] = &unk_1000CB748;
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  [v5 startRedeemingAppWithCode:v7 completion:v6];
}

void sub_100059638(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    [*(id *)(a1 + 32) _setUnusedRedemptionCode:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
    [*(id *)(a1 + 32) _resetRemovabilityWithBundleIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _resetTapToPayScreenLock];
    [*(id *)(a1 + 32) endOperationWithError:v4];
  }
  else
  {
    uint64_t v3 = +[DMDAppController sharedController];
    [v3 sendManagedAppsChangedNotification];

    [*(id *)(a1 + 32) _endOperationWithBundleIdentifier:*(void *)(a1 + 48)];
  }
}

void sub_10005994C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  [v3 _setState:11];
  [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 metadata];
  id v6 = [v5 bundleIdentifier];
  [v4 _resetRemovabilityWithBundleIdentifier:v6];

  [*(id *)(a1 + 32) _resetTapToPayScreenLock];
  [*(id *)(a1 + 32) endOperationWithError:v7];
}

void sub_1000599F8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) removable];
  [v2 _setRemovability:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) tapToPayScreenLock];
  [v4 _setTapToPayScreenLock:v5];

  id v6 = DMFAppLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 48) host];
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start installing enterprise app with manifest URL from: %{public}@", buf, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100059B90;
  v11[3] = &unk_1000CB558;
  id v12 = v8;
  id v13 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v10;
  [v12 startInstallingEnterpriseAppWithManifestURL:v9 completion:v11];
}

void sub_100059B90(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) personaIdentifier];
    [v3 updateBundleIDPersonaIDMappingForPersonaID:v4 addingBundleID:0 completionHandler:0];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 48) _setState:6];
    [*(id *)(a1 + 48) _applyManagementPiecesForRequest:*(void *)(a1 + 40)];
    uint64_t v5 = +[DMDAppController sharedController];
    [v5 sendManagedAppsChangedNotification];

    id v6 = *(void **)(a1 + 48);
    id v7 = [v6 metadata];
    id v8 = [v7 bundleIdentifier];
    [v6 _endOperationWithBundleIdentifier:v8];
  }
}

void sub_100059C84(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) personaIdentifier];
  id v4 = [*(id *)(a1 + 48) metadata];
  uint64_t v5 = [v4 bundleIdentifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059D78;
  v7[3] = &unk_1000CB7C0;
  id v6 = *(void **)(a1 + 56);
  void v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  id v9 = *(id *)(a1 + 64);
  [v2 updateBundleIDPersonaIDMappingForPersonaID:v3 addingBundleID:v5 completionHandler:v7];
}

void sub_100059D78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100085F50();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    id v9 = v3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100059F84(int8x16_t *a1)
{
  id v2 = DMFAppLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start installing system app with bundle identifier: %{public}@", buf, 0xCu);
  }

  id v4 = +[DMDAppController sharedController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A0BC;
  v6[3] = &unk_1000C9B78;
  int8x16_t v5 = a1[2];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v4 installSystemAppWithBundleIdentifier:(id)v5.i64[0] completion:v6];
}

void sub_10005A0BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (v3)
  {
    [v4 _showInstallationFailurePromptIfNeeded];
    [*(id *)(a1 + 32) endOperationWithError:v5];
  }
  else
  {
    [v4 _endOperationWithBundleIdentifier:*(void *)(a1 + 40)];
  }
}

void sub_10005A34C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = DMFAppLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v8 = [(id)objc_opt_class() descriptionForChangeType:a2];
    *(_DWORD *)buf = 138543874;
    uint64_t v61 = v7;
    __int16 v62 = 2114;
    long long v63 = v8;
    __int16 v64 = 2114;
    id v65 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SINF swap attempt complete for %{public}@, change type = %{public}@, error = %{public}@", buf, 0x20u);
  }
  if (a2 == 4)
  {
    id v11 = DMFAppLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v61 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to re-download of device-licensed app: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _redownloadDeviceAppForRequest:*(void *)(a1 + 48)];
  }
  else
  {
    if (a2)
    {
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v9 = [v5 domain];
      if ([v9 isEqualToString:ASDServerErrorDomain]) {
        BOOL v10 = [v5 code] != (id)9610;
      }
      else {
        BOOL v10 = 1;
      }
    }
    id v13 = [*(id *)(a1 + 40) metadata];
    unsigned int v14 = [v13 isUserLicensed];

    if (v14 && v10)
    {
      id v15 = DMFAppLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v61 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to re-download a user-licensed app where we know the license exists: %{public}@", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _redownloadUserAppForRequest:*(void *)(a1 + 48)];
    }
    else
    {
      if ([*(id *)(a1 + 48) allowFreePurchases])
      {
        id v17 = +[DMDAppController sharedController];
        unsigned __int8 v18 = [v17 userIsSignedIn];
        id v19 = *(void **)(a1 + 40);
        if (v18)
        {
          id v20 = [v19 metadata];
          unsigned __int8 v21 = [v20 isFree];

          if (v21)
          {
            id v22 = DMFAppLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              uint64_t v61 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Attempting to purchase free app: %{public}@", buf, 0xCu);
            }

            [*(id *)(a1 + 40) _purchaseFreeAppForRequest:*(void *)(a1 + 48)];
          }
          else
          {
            [*(id *)(a1 + 40) _setState:1];
            [*(id *)(a1 + 40) _applyManagementPiecesForRequest:*(void *)(a1 + 48)];
            id v35 = +[DMDAppController sharedController];
            id v36 = [*(id *)(a1 + 48) removable];
            uint64_t v37 = [*(id *)(a1 + 40) metadata];
            id v38 = [v37 bundleIdentifier];
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_10005A910;
            v54[3] = &unk_1000CADD0;
            id v55 = *(id *)(a1 + 48);
            [v35 setRemovability:v36 forBundleIdentifier:v38 completion:v54];

            uint64_t v39 = +[DMDAppController sharedController];
            unsigned __int8 v40 = [*(id *)(a1 + 48) tapToPayScreenLock];
            id v41 = [*(id *)(a1 + 40) metadata];
            id v42 = [v41 bundleIdentifier];
            id v49 = _NSConcreteStackBlock;
            uint64_t v50 = 3221225472;
            id v51 = sub_10005A978;
            id v52 = &unk_1000CADD0;
            id v53 = *(id *)(a1 + 48);
            [v39 setTapToPayScreenLock:v40 forBundleIdentifier:v42 completion:&v49];

            id v43 = +[DMDAppController sharedController];
            [v43 sendManagedAppsChangedNotification];

            id v44 = *(void **)(a1 + 40);
            uint64_t v56 = DMFBundleIdentifierErrorKey;
            id v45 = [v44 metadata];
            id v46 = [v45 bundleIdentifier];
            uint64_t v57 = v46;
            id v47 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
            id v48 = DMFErrorWithCodeAndUserInfo();
            [v44 endOperationWithError:v48];
          }
        }
        else
        {
          [v19 _promptToSignInAndInstallAppForRequest:*(void *)(a1 + 48)];
        }
      }
      else
      {
        id v24 = DMFAppLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100085FEC(a1, v24, v25, v26, v27, v28, v29, v30);
        }

        long long v31 = *(void **)(a1 + 40);
        uint64_t v58 = DMFBundleIdentifierErrorKey;
        id v17 = [v31 metadata];
        unsigned int v32 = [v17 bundleIdentifier];
        id v59 = v32;
        long long v33 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v34 = DMFErrorWithCodeAndUserInfo();
        [v31 endOperationWithError:v34];
      }
    }
  }
}

void sub_10005A910(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10008605C();
    }
  }
}

void sub_10005A978(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000860E8();
    }
  }
}

void sub_10005ABA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    id v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100086174();
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void sub_10005AE50(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _setState:11];
  [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
  [*(id *)(a1 + 32) endOperationWithError:v4];
}

void sub_10005AEB8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  NSErrorUserInfoKey v8 = DMFAppLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) metadata];
    BOOL v10 = [v9 bundleIdentifier];
    int v23 = 138543618;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "appstored response for: %{public}@, metadata=%{public}@", (uint8_t *)&v23, 0x16u);
  }
  if (v7)
  {
    id v11 = DMFAppLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 32) metadata];
      id v13 = [v12 bundleIdentifier];
      int v23 = 138543618;
      id v24 = v13;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error getting app: %{public}@, %{public}@", (uint8_t *)&v23, 0x16u);
    }
    unsigned int v14 = *(void **)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) personaIdentifier];
    [v14 updateBundleIDPersonaIDMappingForPersonaID:v15 addingBundleID:0 completionHandler:0];

    uint64_t v16 = *(void **)(a1 + 32);
    id v17 = [v16 metadata];
    unsigned __int8 v18 = [v17 bundleIdentifier];
    [v16 _resetRemovabilityWithBundleIdentifier:v18];

    [*(id *)(a1 + 32) _resetTapToPayScreenLock];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _setState:6];
    [*(id *)(a1 + 32) _applyManagementPiecesForRequest:*(void *)(a1 + 48)];
    id v19 = +[DMDAppController sharedController];
    [v19 sendManagedAppsChangedNotification];

    id v20 = *(void **)(a1 + 32);
    unsigned __int8 v21 = [v20 metadata];
    id v22 = [v21 bundleIdentifier];
    [v20 _endOperationWithBundleIdentifier:v22];
  }
}

void sub_10005B120(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) personaIdentifier];
  id v4 = [*(id *)(a1 + 48) metadata];
  id v5 = [v4 bundleIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10005B240;
  v10[3] = &unk_1000CB860;
  id v6 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v13 = v6;
  id v11 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v12 = v7;
  uint64_t v15 = v8;
  id v14 = v9;
  [v2 updateBundleIDPersonaIDMappingForPersonaID:v3 addingBundleID:v5 completionHandler:v10];
}

void sub_10005B240(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100085F50();
    }

    uint64_t v5 = *(void *)(a1 + 56);
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) removable];
    [v8 _setRemovability:v9];

    BOOL v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) tapToPayScreenLock];
    [v10 _setTapToPayScreenLock:v11];

    id v12 = DMFAppLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 40) personaIdentifier];
      int v17 = 138543362;
      unsigned __int8 v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_downloadStoreAppForRequest persona:%{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v14 = *(void **)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v6 = [v14 metadata];
    id v7 = [v6 storeItemIdentifier];
    uint64_t v16 = [*(id *)(a1 + 40) personaIdentifier];
    [v15 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v7 personaIdentifier:v16 type:*(void *)(a1 + 72) skipDownloads:0 completion:*(void *)(a1 + 64)];
  }
}

uint64_t sub_10005BB30(uint64_t a1)
{
  [*(id *)(a1 + 32) _setState:0];
  id v2 = [*(id *)(a1 + 32) metadata];
  id v3 = [v2 lifeCycle];
  id v4 = +[DMDAppController sharedController];
  [v3 addObserver:v4];

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

id sub_10005BBC8(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return (id)v3();
  }
  else
  {
    [*(id *)(a1 + 32) _setState:10];
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 endOperationWithDMFErrorCode:1000];
  }
}

id sub_10005BEC4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _showStorePromptToSignInAndInstallAppForRequest:v4];
  }
  else
  {
    [v3 _setState:10];
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 endOperationWithDMFErrorCode:1000];
  }
}

void sub_10005C03C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) endOperationWithError:v6];
  }
  else if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005C148;
    v9[3] = &unk_1000CB900;
    v9[4] = *(void *)(a1 + 32);
    id v10 = 0;
    id v11 = v8;
    [v7 getMetadataForAppRequest:v8 completion:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) endOperationWithDMFErrorCode:2608];
  }
}

id sub_10005C148(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1[4];
  if (a3)
  {
    [v4 _setState:11];
    id v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    return [v5 endOperationWithError:v6];
  }
  else
  {
    [v4 setMetadata:a2];
    uint64_t v8 = (void *)a1[4];
    uint64_t v9 = a1[6];
    return [v8 _installStoreAppForRequest:v9];
  }
}

id sub_10005C5FC(uint64_t a1, void *a2)
{
  return [a2 setRedemptionCode:*(void *)(a1 + 32)];
}

id sub_10005C750(uint64_t a1, void *a2)
{
  return [a2 setUnusedRedemptionCode:*(void *)(a1 + 32)];
}

void sub_10005CABC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100086390();
    }
  }
}

void sub_10005CBA0(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000863F8();
    }
  }
}

void sub_10005CCDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100086460(a1);
    }
  }
}

void sub_10005CE28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000864D4(a1);
    }
  }
}

uint64_t sub_10005CEA8(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_10005D064(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }
  else
  {
    uint64_t v6 = [v5 bundleIdentifier];

    id v7 = *(void **)(a1 + 32);
    if (v6)
    {
      [v7 setMetadata:v8];
      [*(id *)(a1 + 32) _runWithRequest:*(void *)(a1 + 40)];
    }
    else
    {
      [v7 endOperationWithDMFErrorCode:2606];
    }
  }
}

void sub_10005D384(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _setState:18 forBundleIdentifier:*(void *)(a1 + 48)];
    uint64_t v4 = DMFAppLog();
    id v5 = v4;
    if (a2 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100086548(a1, v5);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request to manage app %{public}@ denied.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = DMFAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Request to manage app %{public}@ approved by user.", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) _manageApp];
  }
}

uint64_t sub_10005D5F8(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) recordNewPrompt];
    [*(id *)(a1 + 32) writeTimestampsToFile];
  }
  else if (!a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_6:

  return v3();
}

uint64_t sub_10005D8E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005DCE0(uint64_t a1)
{
  id v2 = DMFAppLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v4 = [*(id *)(a1 + 40) personaIdentifier];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Associating app %{public}@ with persona %{public}@ in UserManagement", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10005DF44(id a1, NSDictionary *a2, int64_t a3, NSError *a4)
{
  uint64_t v4 = a4;
  if (v4)
  {
    int v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100086680((uint64_t)v4, v5);
    }
  }
}

void sub_10005E120(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000866F8();
    }
  }
}

void sub_10005E26C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = DMFAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100086764();
    }
  }
}

void sub_10005E9C0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _systemGroupContainerPathWithGroupIdentifier:@"systemgroup.com.apple.configurationprofiles"];
  id v2 = (void *)qword_1000FBB90;
  qword_1000FBB90 = v1;

  if (qword_1000FBB90)
  {
    if ([(id)qword_1000FBB90 isEqualToString:@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"])return; {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    }
      sub_100086818();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000867D0();
  }
  id v3 = (void *)qword_1000FBB90;
  qword_1000FBB90 = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
}

void sub_10005EB0C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileStorageDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"ManagementPromptPolicy.plist"];
  id v2 = (void *)qword_1000FBBA0;
  qword_1000FBBA0 = v1;
}

void sub_10005EC0C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileStorageDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"MDMAppManagement.plist"];
  id v2 = (void *)qword_1000FBBB0;
  qword_1000FBBB0 = v1;
}

void sub_10005ED0C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) purchasedBooksDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Purchases.plist"];
  id v2 = (void *)qword_1000FBBC0;
  qword_1000FBBC0 = v1;
}

void sub_10005EE0C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _userDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"/Media/Books/Purchases"];
  id v2 = (void *)qword_1000FBBD0;
  qword_1000FBBD0 = v1;
}

void sub_10005EF0C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileStorageDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"ManagedBooks.plist"];
  id v2 = (void *)qword_1000FBBE0;
  qword_1000FBBE0 = v1;
}

void sub_10005F00C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _managedNonStoreBooksSystemGroupContainer];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Library"];
  id v2 = (void *)qword_1000FBBF0;
  qword_1000FBBF0 = v1;
}

void sub_10005F10C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) managedNonStoreBooksDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Managed.plist"];
  id v2 = (void *)qword_1000FBC00;
  qword_1000FBC00 = v1;
}

void sub_10005F20C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileStorageDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"LostModeRequest.plist"];
  id v2 = (void *)qword_1000FBC10;
  qword_1000FBC10 = v1;
}

void sub_10005F30C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileStorageDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"MDM.plist"];
  id v2 = (void *)qword_1000FBC20;
  qword_1000FBC20 = v1;
}

void sub_10005F418(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _systemProfileLibraryDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"ConfigurationProfiles"];
  id v2 = (void *)qword_1000FBC30;
  qword_1000FBC30 = v1;
}

void sub_10005F518(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) configurationProfilesSystemGroupContainer];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Library"];
  id v2 = (void *)qword_1000FBC40;
  qword_1000FBC40 = v1;
}

void sub_10005F83C(id a1)
{
  qword_1000FBC58 = objc_opt_new();

  _objc_release_x1();
}

uint64_t sub_10005FEE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100061594(id a1)
{
  id v1 = (id)objc_opt_new();
  +[DMDSecureUnarchiveFromPayloadMetadataDataTransformer setValueTransformer:v1 forName:@"DMDSecureUnarchiveFromPayloadMetadataDataTransformer"];
}

void sub_100061648(id a1)
{
  uint64_t v3 = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  id v2 = (void *)qword_1000FBC70;
  qword_1000FBC70 = v1;
}

void sub_10006171C(id a1)
{
  qword_1000FBC80 = objc_opt_new();

  _objc_release_x1();
}

void sub_100061C10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061CDC;
  block[3] = &unk_1000C9C08;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

id sub_100061CDC(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100086C14(v2);
    }
    [*(id *)(a1 + 40) endOperationWithDMFErrorCode:3200];
  }
  else
  {
    [*(id *)(a1 + 40) endOperationWithResultObject:0];
  }
  return [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
}

uint64_t sub_1000620E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000620F0(uint64_t a1)
{
}

void sub_1000620F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 domain];
    if ([v8 isEqualToString:NSCocoaErrorDomain]
      && [v7 code] == (id)256)
    {
      id v9 = [v7 userInfo];
      uint64_t v10 = [v9 objectForKeyedSubscript:NSSQLiteErrorDomain];
      unsigned int v11 = [v10 isEqualToNumber:&off_1000D3620];

      if (!v11)
      {
LABEL_8:
        id v12 = DMFPolicyLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100086D34();
        }

        id v13 = [v7 userInfo];
        id v14 = [v13 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        if (v14)
        {
          NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
          id v15 = [v7 userInfo];
          uint64_t v16 = [v15 objectForKeyedSubscript:NSLocalizedDescriptionKey];
          uint64_t v28 = v16;
          id v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        }
        else
        {
          id v17 = 0;
        }
        id v22 = [v7 domain];
        uint64_t v23 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, [v7 code], v17);
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        __int16 v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v8 = DMFPolicyLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100086DA0();
      }
    }

    goto LABEL_8;
  }
  [*(id *)(a1 + 32) setIsPersistentContainerLoaded:1];
  id v18 = [*(id *)(a1 + 40) newBackgroundContext];
  [*(id *)(a1 + 32) setInternalContext:v18];

  id v19 = [*(id *)(a1 + 40) newBackgroundContext];
  [*(id *)(a1 + 32) setRegistrationContext:v19];

  id v20 = [v5 URL];
  id v26 = 0;
  unsigned __int8 v21 = [v20 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v26];
  id v17 = v26;

  if ((v21 & 1) == 0)
  {
    id v22 = DMFPolicyLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100086C98((uint64_t)v5, v17);
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t sub_1000624EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100062958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10006298C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v8 = objc_opt_new();
    unsigned int v11 = +[DMDEffectivePolicy fetchRequest];
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"%K == %@", @"type", *(void *)(a1 + 32)];
    [v11 setPredicate:v12];

    uint64_t v13 = +[NSSortDescriptor sortDescriptorWithKey:@"priority" ascending:0];
    v104[0] = v13;
    uint64_t v14 = +[NSSortDescriptor sortDescriptorWithKey:@"policy" ascending:1];
    v104[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v104 count:2];
    [v11 setSortDescriptors:v15];

    id v100 = 0;
    uint64_t v16 = [v11 execute:&v100];
    id v17 = v100;
    if (!v16)
    {
      uint64_t v28 = DMFPolicyLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100086FE0(v17);
      }

      uint64_t v29 = DMFErrorWithCodeAndUserInfo();
      uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
      goto LABEL_66;
    }
    [v8 addObjectsFromArray:v16];
    id v18 = [*(id *)(a1 + 40) effectiveSettingsStore];
    uint64_t v87 = a1;
    v80 = v11;
    v81 = v16;
    id v78 = v17;
    v79 = v18;
    if ([*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeApplication])
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v19 = [v18 shield];
      id v20 = [v19 applications];

      id v21 = [v20 countByEnumeratingWithState:&v96 objects:v103 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v97;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v97 != v23) {
              objc_enumerationMutation(v20);
            }
            __int16 v25 = *(void **)(v87 + 40);
            id v26 = [*(id *)(*((void *)&v96 + 1) + 8 * i) bundleIdentifier];
            NSErrorUserInfoKey v27 = [v25 _effectivePolicyForManagedSettingsIdentifier:v26 type:*(void *)(v87 + 32) excludedIdentifiers:0];
            [v8 addObject:v27];
          }
          id v22 = [v20 countByEnumeratingWithState:&v96 objects:v103 count:16];
        }
        while (v22);
LABEL_24:
        unsigned int v11 = v80;
      }
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeWeb])
      {
        if ([*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeApplicationCategory])
        {
          unsigned __int8 v40 = *(void **)(a1 + 40);
          id v20 = [v18 shield];
          id v41 = [v20 applicationCategories];
          uint64_t v42 = *(void *)(a1 + 32);
          CFStringRef v43 = @"bundleIdentifier";
        }
        else
        {
          if (![*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeWebCategory])
          {
            if (![*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeiCloudAccountLogout]|| (objc_msgSend(v18, "account"), v73 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v73, "denyiCloudLogout"), uint64_t v74 = objc_claimAutoreleasedReturnValue(), v75 = objc_msgSend(v74, "BOOLValue"), v74, v73, !v75))
            {
LABEL_31:
              if (![v8 count])
              {
LABEL_65:
                id v17 = v78;
                long long v31 = v79;
LABEL_66:

                goto LABEL_67;
              }
              id v77 = v5;
              id v83 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v16 count]];
              id v45 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v16 count]];
              unint64_t v85 = DMFLowestPolicyPriority;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id obj = v8;
              id v46 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
              if (v46)
              {
                id v47 = v46;
                id v48 = 0;
                uint64_t v84 = 0;
                uint64_t v86 = *(void *)v89;
                do
                {
                  for (j = 0; j != v47; j = (char *)j + 1)
                  {
                    uint64_t v50 = v8;
                    if (*(void *)v89 != v86) {
                      objc_enumerationMutation(obj);
                    }
                    id v51 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
                    id v52 = [v51 identifier];
                    id v53 = [v51 policy];
                    id v54 = [v51 priority];
                    id v55 = v54;
                    if (v52)
                    {
                      uint64_t v56 = +[NSNumber numberWithLongLong:v53];
                      [v83 setObject:v56 forKeyedSubscript:v52];

                      uint64_t v57 = +[NSNumber numberWithLongLong:v55];
                      [v45 setObject:v57 forKeyedSubscript:v52];
                    }
                    else
                    {
                      if ((uint64_t)v53 <= v84) {
                        uint64_t v58 = v84;
                      }
                      else {
                        uint64_t v58 = (uint64_t)v53;
                      }
                      unint64_t v59 = v85;
                      if ((unint64_t)v54 < v85) {
                        unint64_t v59 = (unint64_t)v54;
                      }
                      uint64_t v84 = v58;
                      unint64_t v85 = v59;
                    }
                    id v60 = [v51 excludedIdentifiers];
                    uint64_t v61 = v60;
                    uint64_t v8 = v50;
                    if (v60)
                    {
                      if (v48) {
                        [v48 unionSet:v60];
                      }
                      else {
                        id v48 = [v60 mutableCopy];
                      }
                    }
                  }
                  id v47 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
                }
                while (v47);
              }
              else
              {
                id v48 = 0;
                uint64_t v84 = 0;
              }

              if ([*(id *)(v87 + 32) isEqualToString:DMFEffectivePolicyTypeCategory])
              {
                __int16 v62 = v83;
                unsigned __int8 v63 = [*(id *)(v87 + 40) isInLegacyDowntimeWithPolicies:v83 priorities:v45];
              }
              else
              {
                __int16 v62 = v83;
                if (([*(id *)(v87 + 32) isEqualToString:DMFEffectivePolicyTypeApplicationCategory] & 1) == 0&& !objc_msgSend(*(id *)(v87 + 32), "isEqualToString:", DMFEffectivePolicyTypeWebCategory))
                {
                  unsigned __int8 v64 = 0;
                  goto LABEL_59;
                }
                unsigned __int8 v63 = [*(id *)(v87 + 40) isInManagedSettingsDowntime];
              }
              unsigned __int8 v64 = v63;
LABEL_59:
              id v65 = objc_alloc((Class)DMFEffectivePolicy);
              uint64_t v66 = *(void *)(v87 + 32);
              long long v67 = v62;
              if (![v62 count]) {
                __int16 v62 = 0;
              }
              if ([v45 count]) {
                id v68 = v45;
              }
              else {
                id v68 = 0;
              }
              LOBYTE(v76) = v64;
              id v69 = [v65 initWithType:v66 defaultPolicy:v84 currentPoliciesByIdentifier:v62 defaultPriority:v85 prioritiesByIdentifier:v68 excludedIdentifiers:v48 downtimeEnforced:v76];
              uint64_t v70 = *(void *)(*(void *)(v87 + 56) + 8);
              long long v71 = *(void **)(v70 + 40);
              *(void *)(v70 + 40) = v69;

              long long v72 = [*(id *)(v87 + 40) effectivePolicyCache];
              [v72 setObject:*(void *)(*(void *)(*(void *)(v87 + 56) + 8) + 40) forKey:*(void *)(v87 + 32)];

              id v7 = 0;
              id v5 = v77;
              unsigned int v11 = v80;
              uint64_t v16 = v81;
              goto LABEL_65;
            }
            id v20 = [*(id *)(a1 + 40) _effectivePolicyForManagedSettingsIdentifier:0 type:*(void *)(a1 + 32) excludedIdentifiers:0];
            [v8 addObject:v20];
            goto LABEL_30;
          }
          unsigned __int8 v40 = *(void **)(a1 + 40);
          id v20 = [v18 shield];
          id v41 = [v20 webDomainCategories];
          uint64_t v42 = *(void *)(a1 + 32);
          CFStringRef v43 = @"domain";
        }
        id v44 = [v40 _effectiveCategoryPoliciesForCategoryShieldPolicy:v41 type:v42 excludedIdentifiersKey:v43];
        [v8 addObjectsFromArray:v44];

        goto LABEL_30;
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      unsigned int v32 = [v18 shield];
      id v20 = [v32 webDomains];

      id v33 = [v20 countByEnumeratingWithState:&v92 objects:v102 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v93;
        do
        {
          for (k = 0; k != v34; k = (char *)k + 1)
          {
            if (*(void *)v93 != v35) {
              objc_enumerationMutation(v20);
            }
            uint64_t v37 = *(void **)(v87 + 40);
            id v38 = [*(id *)(*((void *)&v92 + 1) + 8 * (void)k) domain];
            uint64_t v39 = [v37 _effectivePolicyForManagedSettingsIdentifier:v38 type:*(void *)(v87 + 32) excludedIdentifiers:0];
            [v8 addObject:v39];
          }
          id v34 = [v20 countByEnumeratingWithState:&v92 objects:v102 count:16];
        }
        while (v34);
        goto LABEL_24;
      }
    }
LABEL_30:

    uint64_t v16 = v81;
    goto LABEL_31;
  }
  NSErrorUserInfoKey v105 = NSUnderlyingErrorKey;
  id v106 = v6;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
  uint64_t v9 = DMFErrorWithCodeAndUserInfo();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
LABEL_67:
}

void sub_10006364C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v68 = NSUnderlyingErrorKey;
    id v69 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    uint64_t v8 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
  else
  {
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[*(id *)(a1 + 32) count]];
    uint64_t v8 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v61;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v61 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v15 = [*(id *)(a1 + 40) bundleIdentifierPolicyCache];
          uint64_t v16 = [v15 objectForKey:v14];

          if (v16) {
            [v7 setObject:v16 forKeyedSubscript:v14];
          }
          else {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      v66[0] = DMFEffectivePolicyTypeApplication;
      v66[1] = DMFEffectivePolicyTypeApplicationCategory;
      v66[2] = DMFEffectivePolicyTypeCategory;
      v66[3] = DMFEffectivePolicyTypeWeb;
      id v17 = +[NSArray arrayWithObjects:v66 count:4];
      id v18 = *(void **)(a1 + 40);
      id v59 = 0;
      id v19 = [v18 _effectivePoliciesForTypes:v17 outError:&v59];
      id v20 = v59;
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v23 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);

        id v5 = 0;
      }
      else
      {
        id v47 = v19;
        id v48 = v17;
        if ([v19 count])
        {
          uint64_t v24 = [*(id *)(a1 + 40) _fetchParentBundleIdentifiersForBundleIdentifiers:v8];
          __int16 v25 = [v8 allObjects];
          id v26 = +[NSMutableArray arrayWithArray:v25];

          NSErrorUserInfoKey v27 = v24;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v28 = [v24 allValues];
          id v29 = [v28 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v51;
            do
            {
              for (j = 0; j != v30; j = (char *)j + 1)
              {
                if (*(void *)v51 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) allObjects];
                [v26 addObjectsFromArray:v33];
              }
              id v30 = [v28 countByEnumeratingWithState:&v50 objects:v64 count:16];
            }
            while (v30);
          }

          id v34 = *(void **)(a1 + 40);
          id v49 = 0;
          uint64_t v35 = [v34 _fetchCategoriesForBundleIdentifiers:v26 withError:&v49];
          id v36 = v49;
          id v19 = v47;
          if (v35)
          {
            [*(id *)(a1 + 40) _appendPolicyForBundleIdentifiers:v8 toPolicies:v7 categories:v35 parentBundleIdentifiers:v27 policiesByType:v47];
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            id v17 = v48;
            id v5 = 0;
          }
          else
          {
            id v46 = v27;
            id v45 = DMFPolicyLog();
            id v17 = v48;
            id v5 = 0;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              sub_100087064();
            }

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            NSErrorUserInfoKey v27 = v46;
          }
        }
        else
        {
          uint64_t v37 = DMFPolicyLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No policies are set, everything is OK", buf, 2u);
          }

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v38 = v8;
          id v39 = [v38 countByEnumeratingWithState:&v54 objects:v65 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v55;
            do
            {
              for (k = 0; k != v40; k = (char *)k + 1)
              {
                if (*(void *)v55 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void *)(*((void *)&v54 + 1) + 8 * (void)k);
                id v44 = [*(id *)(a1 + 40) bundleIdentifierPolicyCache];
                [v44 setObject:&off_1000D3638 forKey:v43];

                [v7 setObject:&off_1000D3638 forKeyedSubscript:v43];
              }
              id v40 = [v38 countByEnumeratingWithState:&v54 objects:v65 count:16];
            }
            while (v40);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v17 = v48;
          id v5 = 0;
          id v19 = v47;
        }
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v5 = 0;
    }
  }
}

void sub_1000648E0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    id v17 = a3;
    id v5 = a3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v7 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_100064A4C;
    v13[3] = &unk_1000CB160;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v15 = v10;
    v13[4] = v11;
    id v14 = v12;
    id v6 = 0;
    [v8 requestPoliciesForBundleIdentifiers:v9 replyHandler:v13];

    id v7 = v15;
  }
}

void sub_100064A4C(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v34 = 0;
    uint64_t v8 = [v7 _effectivePolicyForType:DMFEffectivePolicyTypeCategory outError:&v34];
    id v9 = v34;
    id v10 = *(void **)(a1 + 32);
    id v33 = v9;
    uint64_t v11 = [v10 _effectivePolicyForType:DMFEffectivePolicyTypeApplicationCategory outError:&v33];
    id v25 = v33;

    if (v8) {
      unsigned int v12 = [v8 downtimeEnforced];
    }
    else {
      unsigned int v12 = 0;
    }
    id v26 = v8;
    uint64_t v24 = v11;
    if (v11) {
      unsigned int v13 = [v11 downtimeEnforced:v11];
    }
    else {
      unsigned int v13 = 0;
    }
    id v14 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v28, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = *(id *)(a1 + 40);
    id v15 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = v12 | v13;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v21 = [v28 objectForKeyedSubscript:v20, v24];
          id v22 = +[DMFCommunicationPolicyMonitor communicationPolicyForApplicationPolicy:v21 downtimeEnforced:v17];

          uint64_t v23 = +[NSNumber numberWithUnsignedInteger:v22];
          [v14 setObject:v23 forKeyedSubscript:v20];
        }
        id v16 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v16);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = v25;
  }
}

void sub_100064DB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v47 = NSUnderlyingErrorKey;
    id v48 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v8 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
  else
  {
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(*(id *)(a1 + 32), "count")];
    uint64_t v8 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          id v15 = [*(id *)(a1 + 40) categoryIdentifierPolicyCache];
          id v16 = [v15 objectForKey:v14];

          if (v16) {
            [v7 setObject:v16 forKeyedSubscript:v14];
          }
          else {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      v45[0] = DMFEffectivePolicyTypeApplicationCategory;
      v45[1] = DMFEffectivePolicyTypeCategory;
      void v45[2] = DMFEffectivePolicyTypeWebCategory;
      uint64_t v17 = +[NSArray arrayWithObjects:v45 count:3];
      uint64_t v18 = *(void **)(a1 + 40);
      id v39 = 0;
      id v19 = [v18 _effectivePoliciesForTypes:v17 outError:&v39];
      id v20 = v39;
      if (v20)
      {
        uint64_t v21 = *(void *)(a1 + 48);
        id v22 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);
      }
      else if ([v19 count])
      {
        [*(id *)(a1 + 40) _appendPolicyForCategoryIdentifiers:v8 toPolicies:v7 policiesByType:v19];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        long long v31 = v19;
        long long v32 = 0;
        id v33 = v17;
        uint64_t v23 = DMFPolicyLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No policies are set, everything is OK", buf, 2u);
        }

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v24 = v8;
        id v25 = [v24 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v35;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v35 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
              long long v30 = [[*(id *)(a1 + 40) categoryIdentifierPolicyCache:v31, v32, v33];
              [v30 setObject:&off_1000D3638 forKey:v29];

              [v7 setObject:&off_1000D3638 forKeyedSubscript:v29];
            }
            id v26 = [v24 countByEnumeratingWithState:&v34 objects:v44 count:16];
          }
          while (v26);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v20 = v32;
        uint64_t v17 = v33;
        id v19 = v31;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id v5 = 0;
  }
}

void sub_100065674(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v53 = NSUnderlyingErrorKey;
    id v54 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    uint64_t v8 = DMFErrorWithCodeAndUserInfo();
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
  else
  {
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(*(id *)(a1 + 32), "count")];
    uint64_t v8 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          id v15 = [*(id *)(a1 + 40) websiteURLsPolicyCache];
          id v16 = [v15 objectForKey:v14];

          if (v16) {
            [v7 setObject:v16 forKeyedSubscript:v14];
          }
          else {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      v51[0] = DMFEffectivePolicyTypeApplication;
      v51[1] = DMFEffectivePolicyTypeCategory;
      v51[2] = DMFEffectivePolicyTypeWeb;
      v51[3] = DMFEffectivePolicyTypeWebCategory;
      uint64_t v17 = +[NSArray arrayWithObjects:v51 count:4];
      uint64_t v18 = *(void **)(a1 + 40);
      id v45 = 0;
      id v19 = [v18 _effectivePoliciesForTypes:v17 outError:&v45];
      id v20 = v45;
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v23 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);

        id v5 = 0;
      }
      else if ([v19 count])
      {
        uint64_t v25 = *(void *)(a1 + 32);
        id v24 = *(void **)(a1 + 40);
        id v39 = 0;
        id v26 = [v24 _fetchCategoriesIfNeededForWebsiteURLs:v25 withError:&v39];
        id v27 = v39;
        if (v26)
        {
          [*(id *)(a1 + 40) _appendPolicyForWebsiteURLs:v8 toPolicies:v7 categories:v26 policiesByType:v19];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v5 = 0;
        }
        else
        {
          long long v36 = DMFPolicyLog();
          id v5 = 0;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1000870D0();
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      else
      {
        long long v37 = v19;
        id v38 = v17;
        id v28 = DMFPolicyLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No policies are set, everything is OK", buf, 2u);
        }

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = v8;
        id v30 = [v29 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v41;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v41 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
              long long v35 = [[*(id *)(a1 + 40) websiteURLsPolicyCache:v37, v38];
              [v35 setObject:&off_1000D3638 forKey:v34];

              [v7 setObject:&off_1000D3638 forKeyedSubscript:v34];
            }
            id v31 = [v29 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v31);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        uint64_t v17 = v38;
        id v5 = 0;
        id v19 = v37;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v5 = 0;
    }
  }
}

void sub_1000664A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000664CC(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 56)];
}

void sub_1000667DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100066804(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 56)];
}

void sub_1000669F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DMFPolicyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100086EF4(v6);
    }

    uint64_t v8 = *(void *)(a1 + 72);
    NSErrorUserInfoKey v65 = NSUnderlyingErrorKey;
    id v66 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
  }
  else
  {
    id v9 = +[DMDEffectivePolicy fetchRequest];
    if ([*(id *)(a1 + 32) count]) {
      +[NSPredicate predicateWithFormat:@"(%K IN %@) AND (%K == %@) AND (%K == %@)", @"identifier", *(void *)(a1 + 32), @"organizationIdentifier", *(void *)(a1 + 40), @"declarationIdentifier", *(void *)(a1 + 48)];
    }
    else {
    id v11 = +[NSPredicate predicateWithFormat:@"(%K == nil) AND (%K == %@) AND (%K == %@)", @"identifier", @"organizationIdentifier", *(void *)(a1 + 40), @"declarationIdentifier", *(void *)(a1 + 48), v39];
    }
    [v9 setPredicate:v11];

    id v61 = 0;
    uint64_t v12 = [v9 execute:&v61];
    id v10 = v61;
    if (v12)
    {
      id v44 = v12;
      if ([*(id *)(a1 + 32) count])
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = *(id *)(a1 + 32);
        id v47 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
        if (v47)
        {
          id v40 = v10;
          long long v41 = v9;
          char v13 = 0;
          uint64_t v45 = *(void *)v58;
          uint64_t v46 = a1;
          id v43 = v5;
          do
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v58 != v45) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              id v16 = v12;
              id v17 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v54;
                while (2)
                {
                  for (j = 0; j != v17; j = (char *)j + 1)
                  {
                    if (*(void *)v54 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    id v20 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
                    uint64_t v21 = [v20 identifier];
                    unsigned int v22 = [v21 isEqual:v15];

                    if (v22)
                    {
                      id v17 = v20;
                      goto LABEL_25;
                    }
                  }
                  id v17 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
                  if (v17) {
                    continue;
                  }
                  break;
                }
LABEL_25:
                id v5 = v43;
                uint64_t v12 = v44;
              }

              a1 = v46;
              if ([*(id *)(v46 + 56) _upsertPolicy:*(void *)(v46 + 80) forType:*(void *)(v46 + 64) identifier:v15 priority:*(void *)(v46 + 88) organizationIdentifier:*(void *)(v46 + 40) declarationIdentifier:*(void *)(v46 + 48) policyToUpdate:v17 managedObjectContext:v5])char v13 = 1; {
            }
              }
            id v47 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
          }
          while (v47);
          int v23 = v13 & 1;
          id v9 = v41;
          id v6 = 0;
          id v10 = v40;
        }
        else
        {
          int v23 = 0;
        }
      }
      else if ([v12 count])
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v27 = v12;
        id v28 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
        if (v28)
        {
          id v29 = v28;
          char v30 = 0;
          uint64_t v31 = *(void *)v50;
          do
          {
            for (k = 0; k != v29; k = (char *)k + 1)
            {
              if (*(void *)v50 != v31) {
                objc_enumerationMutation(v27);
              }
              if ([*(id *)(a1 + 56) _upsertPolicy:*(void *)(a1 + 80) forType:*(void *)(a1 + 64) identifier:0 priority:*(void *)(a1 + 88) organizationIdentifier:*(void *)(a1 + 40) declarationIdentifier:*(void *)(a1 + 48) policyToUpdate:*(void *)(*((void *)&v49 + 1) + 8 * (void)k) managedObjectContext:v5])char v30 = 1; {
            }
              }
            id v29 = [v27 countByEnumeratingWithState:&v49 objects:v62 count:16];
          }
          while (v29);
          int v23 = v30 & 1;
        }
        else
        {
          int v23 = 0;
        }

        uint64_t v12 = v44;
      }
      else
      {
        int v23 = [*(id *)(a1 + 56) _upsertPolicy:*(void *)(a1 + 80) forType:*(void *)(a1 + 64) identifier:0 priority:*(void *)(a1 + 88) organizationIdentifier:*(void *)(a1 + 40) declarationIdentifier:*(void *)(a1 + 48) policyToUpdate:0 managedObjectContext:v5];
      }
      id v48 = v10;
      unsigned int v33 = [v5 save:&v48];
      id v34 = v48;

      if (v33)
      {
        if (v23)
        {
          long long v35 = +[NSSet setWithObject:*(void *)(a1 + 64)];
          [*(id *)(a1 + 56) _handleChangesToPolicyTypes:v35];
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
      else
      {
        long long v36 = DMFPolicyLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10008726C(v34);
        }

        uint64_t v37 = *(void *)(a1 + 72);
        id v38 = DMFErrorWithCodeAndUserInfo();
        (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v38);
      }
      id v10 = v34;
    }
    else
    {
      id v24 = DMFPolicyLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000871E8(v10);
      }

      uint64_t v25 = *(void *)(a1 + 72);
      id v26 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
    }
  }
}

void sub_100067298(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DMFPolicyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100086EF4(v6);
    }

    uint64_t v8 = a1[7];
    NSErrorUserInfoKey v49 = NSUnderlyingErrorKey;
    id v50 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
  }
  else
  {
    id v9 = +[DMDEffectivePolicy fetchRequest];
    long long v35 = a1;
    id v11 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"organizationIdentifier", a1[4], @"declarationIdentifier", a1[5]];
    [v9 setPredicate:v11];

    id v41 = 0;
    uint64_t v12 = [v9 execute:&v41];
    id v33 = v41;
    id v13 = [objc_alloc((Class)NSMutableSet) initWithCapacity:objc_msgSend(v12, "count")];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v20 = [v19 type];
          [v13 addObject:v20];

          [v5 deleteObject:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v16);
    }

    id v36 = v33;
    unsigned int v21 = [v5 save:&v36];
    id v10 = v36;

    if (v21)
    {
      if ([v14 count]) {
        [(id)v35[6] _handleChangesToPolicyTypes:v13];
      }
      unsigned int v22 = DMFPolicyLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = [v13 allObjects];
        id v24 = [v23 componentsJoinedByString:@","];
        uint64_t v25 = v35[5];
        *(_DWORD *)buf = 138543618;
        id v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Successfully removed policy types %{public}@ for declaration %{public}@", buf, 0x16u);
      }
      (*(void (**)(void))(v35[7] + 16))();
    }
    else
    {
      id v26 = DMFPolicyLog();
      id v27 = v35;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v34 = [v13 allObjects];
        char v30 = [v34 componentsJoinedByString:@","];
        uint64_t v31 = v35[5];
        uint64_t v32 = [v10 verboseDescription];
        *(_DWORD *)buf = 138543874;
        id v43 = v30;
        __int16 v44 = 2114;
        uint64_t v45 = v31;
        id v27 = v35;
        __int16 v46 = 2114;
        id v47 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error removing policies types %{public}@ for declaration %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v28 = v27[7];
      id v29 = DMFErrorWithCodeAndUserInfo();
      (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);
    }
  }
}

void sub_1000677C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = +[DMDEffectivePolicy fetchRequest];
    id v6 = *(void **)(a1 + 32);
    if (!v6) {
      id v6 = &__NSArray0__struct;
    }
    id v7 = +[NSPredicate predicateWithFormat:@"NOT (%K IN %@)", @"organizationIdentifier", v6];
    [v5 setPredicate:v7];

    [*(id *)(a1 + 40) _removeOrphanedPoliciesFromFetchRequest:v5 managedObjectContext:v8 completionHandler:*(void *)(a1 + 48)];
  }
}

void sub_100067964(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = +[DMDEffectivePolicy fetchRequest];
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[*(id *)(a1 + 32) count]];
    id v8 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100067AD8;
    v11[3] = &unk_1000CBC18;
    uint64_t v12 = @"organizationIdentifier";
    id v13 = @"declarationIdentifier";
    id v9 = v7;
    id v14 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
    if ([v9 count])
    {
      id v10 = +[NSCompoundPredicate orPredicateWithSubpredicates:v9];
      [v6 setPredicate:v10];
    }
    [*(id *)(a1 + 40) _removeOrphanedPoliciesFromFetchRequest:v6 managedObjectContext:v5 completionHandler:*(void *)(a1 + 48)];
  }
}

void sub_100067AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", *(void *)(a1 + 32), a2, *(void *)(a1 + 40), a3];
  [*(id *)(a1 + 48) addObject:v4];
}

id sub_100068098(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearPolicyCachesForTypes:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _recalculateEffectivePolicyForTypes:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _notifyClientsRegisteredForPolicyTypes:v3];
}

void sub_100068174(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = DMFPolicyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100087374(a1, v7);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(a1 + 32);
    id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = [*(id *)(a1 + 40) _recalculateEffectivePolicyForType:*(void *)(*((void *)&v14 + 1) + 8 * i) outError:0, v14];
        }
        id v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void sub_10006839C(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v6);
        id v8 = [[*(id *)(a1 + 40) effectivePolicyCache]:v18];
        [v8 removeObjectForKey:v7];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  id v9 = *(void **)(a1 + 32);
  id v10 = +[DMFApplicationPolicyMonitor policyTypes];
  LODWORD(v9) = [v9 intersectsSet:v10];

  if (v9)
  {
    uint64_t v11 = [*(id *)(a1 + 40) bundleIdentifierPolicyCache];
    [v11 removeAllObjects];
  }
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = +[DMFCategoryPolicyMonitor policyTypes];
  LODWORD(v12) = [v12 intersectsSet:v13];

  if (v12)
  {
    long long v14 = [*(id *)(a1 + 40) categoryIdentifierPolicyCache];
    [v14 removeAllObjects];
  }
  long long v15 = *(void **)(a1 + 32);
  long long v16 = +[DMFWebsitePolicyMonitor policyTypes];
  LODWORD(v15) = [v15 intersectsSet:v16];

  if (v15)
  {
    long long v17 = [*(id *)(a1 + 40) websiteURLsPolicyCache];
    [v17 removeAllObjects];
  }
}

void sub_1000688FC(uint64_t a1)
{
  id v4 = +[NSDate now];
  id v2 = +[NSCalendar currentCalendar];
  id v3 = [v2 dateByAddingUnit:16 value:1 toDate:v4 options:0];

  [*(id *)(a1 + 32) _enableEmergencyModeUntilDate:v3 referenceDate:v4 withCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100068A60(uint64_t a1)
{
  id v3 = +[NSDate now];
  id v2 = [v3 dateByAddingTimeInterval:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _enableEmergencyModeUntilDate:v2 referenceDate:v3 withCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t sub_100068DD0(uint64_t a1)
{
  [@"com.apple.alarm" UTF8String];
  [@"com.apple.dmd.emergency-mode.alarm" UTF8String];
  xpc_set_event();
  notify_post((const char *)[DMFEmergencyModeChangedNotification UTF8String]);
  id v2 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disabling Emergency Mode", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000691C0(uint64_t a1)
{
  id v2 = +[NSSet setWithObject:DMFEffectivePolicyTypeCategory];
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_1000693F0(uint64_t a1)
{
  id v2 = +[NSSet setWithObject:DMFEffectivePolicyTypeCategory];
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_100069458(uint64_t a1)
{
  id v2 = +[NSSet setWithObject:DMFEffectivePolicyTypeApplication];
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_1000696A0(uint64_t a1)
{
  v4[0] = DMFEffectivePolicyTypeApplication;
  v4[1] = DMFEffectivePolicyTypeApplicationCategory;
  void v4[2] = DMFEffectivePolicyTypeWeb;
  void v4[3] = DMFEffectivePolicyTypeWebCategory;
  id v2 = +[NSArray arrayWithObjects:v4 count:4];
  id v3 = +[NSSet setWithArray:v2];

  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v3];
}

void sub_100069780(uint64_t a1)
{
  id v2 = +[NSSet setWithObject:DMFEffectivePolicyTypeiCloudAccountLogout];
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_1000697E8(uint64_t a1)
{
  v4[0] = DMFEffectivePolicyTypeApplication;
  v4[1] = DMFEffectivePolicyTypeApplicationCategory;
  void v4[2] = DMFEffectivePolicyTypeWeb;
  void v4[3] = DMFEffectivePolicyTypeWebCategory;
  id v2 = +[NSArray arrayWithObjects:v4 count:4];
  id v3 = +[NSSet setWithArray:v2];

  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v3];
}

void sub_100069AD0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1000FBC90;
  qword_1000FBC90 = v0;

  id v2 = +[UMUserManager sharedManager];
  [v2 registerUserSwitchStakeHolder:qword_1000FBC90];
}

void sub_100069B84(id a1)
{
  id v2 = +[UMUserManager sharedManager];
  if ([v2 isMultiUser])
  {
    uint64_t v1 = [v2 currentUser];
    byte_1000FBCA0 = [v1 userType] == (id)1;
  }
  else
  {
    byte_1000FBCA0 = 0;
  }
}

id _assertionQueue()
{
  if (qword_1000FBCB8 != -1) {
    dispatch_once(&qword_1000FBCB8, &stru_1000CBCD0);
  }
  uint64_t v0 = (void *)qword_1000FBCB0;

  return v0;
}

void sub_100069C60(id a1)
{
  qword_1000FBCB0 = (uint64_t)dispatch_queue_create("DMDPowerAssertion Queue", 0);

  _objc_release_x1();
}

id sub_100069E24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retain];
}

id sub_100069ED8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _release];
}

id sub_100069F6C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isParked])
  {
    id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Trying to park a power assertion that's already parked." userInfo:0];
    objc_exception_throw(v3);
  }
  [*(id *)(a1 + 32) setIsParked:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 _release];
}

id sub_10006A070(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isParked] & 1) == 0)
  {
    id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Trying to unpark a power assertion that's not parked." userInfo:0];
    objc_exception_throw(v3);
  }
  [*(id *)(a1 + 32) setIsParked:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _retain];
}

id sub_10006A56C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10006A6E0(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10006AB20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100087724((uint64_t)v6);
    }
    [*(id *)(a1 + 32) endOperationWithError:v6];
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000876A4((uint64_t)v5);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"kCTCellularPlanSlotVinylSlotInfoListKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_21;
  }
  if (!v7)
  {
LABEL_21:
    long long v16 = [*(id *)(a1 + 32) invalidResponseError:v5];
    id v8 = 0;
    goto LABEL_22;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9)
  {
LABEL_19:
    long long v16 = 0;
LABEL_28:

LABEL_22:
    long long v17 = *(void **)(a1 + 32);
    if (v16) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v25;
  id obj = v8;
LABEL_12:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v25 != v11) {
      objc_enumerationMutation(obj);
    }
    id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v16 = [*(id *)(a1 + 32) invalidResponseError:v5];
      id v8 = obj;
      goto LABEL_28;
    }
    long long v14 = [v13 objectForKeyedSubscript:@"kCTCellularPlanSlotCardType"];
    unsigned int v15 = [v14 isEqual:&off_1000D3668];

    if (v15) {
      break;
    }
    if (v10 == (id)++v12)
    {
      id v8 = obj;
      id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100087624((uint64_t)v13);
  }
  long long v16 = [v13 objectForKeyedSubscript:@"kCTCellularPlanSlotCsnKey"];
  id v8 = obj;

  if (v16)
  {
    long long v18 = *(void **)(a1 + 40);
    long long v19 = [*(id *)(a1 + 48) eSIMServerURL];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    void v22[2] = sub_10006AE84;
    v22[3] = &unk_1000C9B78;
    long long v20 = *(void **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = v20;
    [v18 refreshCellularPlansWithCSN:v16 serverURL:v19 completion:v22];

    goto LABEL_25;
  }
  long long v17 = *(void **)(a1 + 32);
LABEL_23:
  long long v16 = DMFErrorWithCodeAndUserInfo();
LABEL_24:
  [v17 endOperationWithError:v16];
LABEL_25:

LABEL_26:
}

id sub_10006AE84(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10006AFF8(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }
  else
  {
    id v5 = objc_opt_new();
    [v5 setNumberOfUpdates:v6];
    [*(id *)(a1 + 32) endOperationWithResultObject:v5];
  }
}

id sub_10006B34C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10006B5E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000877E8();
    }
    [*(id *)(a1 + 40) endOperationWithError:v3];
  }
  else
  {
    id v4 = +[DMDAppController sharedController];
    id v5 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006B6E0;
    v8[3] = &unk_1000C9B78;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    [v4 setTapToPayScreenLock:0 forBundleIdentifier:v6 completion:v8];
  }
}

void sub_10006B6E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10008785C();
    }
    [*(id *)(a1 + 40) endOperationWithError:v3];
  }
  else
  {
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = 0;
    unsigned __int8 v6 = [v4 removeAppMetadataForBundleIdentifier:v5 error:&v11];
    id v7 = v11;
    if (v6)
    {
      id v8 = objc_opt_class();
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_10006B7EC;
      v10[3] = &unk_1000CADD0;
      uint64_t v9 = *(void *)(a1 + 32);
      v10[4] = *(void *)(a1 + 40);
      [v8 removeAppWithBundleIdentifier:v9 completion:v10];
    }
    else
    {
      [*(id *)(a1 + 40) endOperationWithError:v7];
    }
  }
}

void sub_10006B7EC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    uint64_t v5 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v5];
  }
  else
  {
    id v4 = 0;
    [v2 endOperationWithResultObject:0];
  }
}

id sub_10006C148(uint64_t a1)
{
  id v2 = DMFAppLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) startUninstallingAppWithBundleIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

id sub_10006C1FC(uint64_t a1)
{
  id v2 = DMFAppLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start uninstalling app with bundle identifier: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) startUninstallingAppWithBundleIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

void sub_10006C2C8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10006C698(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v14 = 0;
      unsigned __int8 v10 = [v8 _removeRestrictionsWithRequest:v9 error:&v14];
      id v11 = v14;
      uint64_t v6 = v11;
      if ((v10 & 1) == 0)
      {
        uint64_t v12 = *(void **)(a1 + 32);
        if (!v11)
        {
          uint64_t v6 = DMFErrorWithCodeAndUserInfo();
          [v12 endOperationWithError:v6];
          goto LABEL_10;
        }
        NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
        id v16 = v11;
        id v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        id v13 = DMFErrorWithCodeAndUserInfo();
        [v12 endOperationWithError:v13];

        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    [*(id *)(a1 + 32) endOperationWithResultObject:0];
    goto LABEL_10;
  }
  int v5 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
  id v18 = v3;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v7 = DMFErrorWithCodeAndUserInfo();
  [v5 endOperationWithError:v7];
LABEL_3:

LABEL_10:
}

id sub_10006CD70(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10006D3A4(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10006D6D0(uint64_t a1)
{
  [*(id *)(a1 + 32) endOperationWithResultObject:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 stayAliveThroughHereAtLeast];
}

void sub_10006DBF8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    int v5 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v5];
  }
  else
  {
    id v4 = 0;
    [v2 endOperationWithResultObject:0];
  }
}

id sub_10006ECF4(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10006F164(id a1)
{
  qword_1000FBCD0 = objc_opt_new();

  _objc_release_x1();
}

id sub_10006F9BC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 endOperationWithError:a2];
  }
  else
  {
    int v5 = +[DMDAppController sharedController];
    [v5 sendManagedAppsChangedNotification];

    NSErrorUserInfoKey v6 = *(void **)(a1 + 32);
    return [v6 endOperationWithResultObject:0];
  }
}

void sub_10006FF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006FFAC(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained endOperationWithError:v5];
  }
  else {
    [WeakRetained endOperationWithResultObject:0];
  }
}

id sub_100070618(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100070A50(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 endOperationWithError:a2];
  }
  else
  {
    id v5 = +[DMDAppController sharedController];
    [v5 sendManagedAppsChangedNotification];

    NSErrorUserInfoKey v6 = *(void **)(a1 + 32);
    return [v6 endOperationWithResultObject:0];
  }
}

void sub_1000715DC(id a1)
{
  qword_1000FBCE0 = DMFErrorWithCodeAndUserInfo();

  _objc_release_x1();
}

uint64_t sub_100071858(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100071870(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) authenticatedAccount];
  [*(id *)(a1 + 32) setAuthenticatedAccount:0];
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v3)
    {
      (*(void (**)(void, void, void *))(v4 + 16))(*(void *)(a1 + 40), 0, v3);
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) _storeLoginFailedError];
      (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
    }
  }
}

void _performBlockOnMainThread(void *a1)
{
  uint64_t v1 = a1;
  id v2 = +[NSThread currentThread];
  id v3 = +[NSThread mainThread];

  if (v2 == v3)
  {
    v1[2](v1);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100071B30;
    block[3] = &unk_1000CB4E0;
    id v5 = v1;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_100071B30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100071D08(uint64_t a1)
{
  [*(id *)(a1 + 32) completionBlock];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_100087FD0();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100071E0C;
  v5[3] = &unk_1000CA250;
  id v6 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) setCompletionBlock:v5];
  [(id)objc_opt_class() timeout];
  id v2 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  id v3 = [*(id *)(a1 + 32) timeoutTimer];
  [v3 setFireDate:v2];

  uint64_t v4 = [*(id *)(a1 + 32) request];
  [v4 start];
}

uint64_t sub_100071E0C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100071E90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];
  if (!v2) {
    sub_100087FFC();
  }

  id v3 = +[NSDate distantFuture];
  uint64_t v4 = [*(id *)(a1 + 32) timeoutTimer];
  [v4 setFireDate:v3];

  id v5 = [*(id *)(a1 + 32) request];
  [v5 cancel];
}

uint64_t sub_100072050(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100072164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100072240(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  DMFErrorWithCodeAndUserInfo();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000725FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100088028();
    }

    [*(id *)(a1 + 40) endOperationWithError:v3];
  }
  else
  {
    id v5 = +[DMDAppController sharedController];
    uint64_t v6 = DMFBundleIdentifierErrorKey;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100072720;
    v10[3] = &unk_1000CB748;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    [v5 setTapToPayScreenLock:0 forBundleIdentifier:v6 completion:v10];
  }
}

void sub_100072720(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100088100();
    }

    [*(id *)(a1 + 40) endOperationWithError:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v17 = 0;
    unsigned __int8 v6 = +[DMDRemoveAppOperation removeAppMetadataForBundleIdentifier:v5 error:&v17];
    id v7 = v17;
    if (v6)
    {
      uint64_t v8 = +[DMDAppController sharedController];
      uint64_t v9 = *(void *)(a1 + 32);
      id v16 = 0;
      unsigned __int8 v10 = [v8 removePersonaMappingForBundleID:v9 error:&v16];
      id v11 = v16;

      if ((v10 & 1) == 0)
      {
        uint64_t v12 = DMFAppLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100088094();
        }
      }
      id v13 = +[DMDAppController sharedController];
      [v13 sendManagedAppsChangedNotification];

      if ([*(id *)(a1 + 48) options])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        void v15[2] = sub_1000728F8;
        v15[3] = &unk_1000CADD0;
        uint64_t v14 = *(void *)(a1 + 32);
        void v15[4] = *(void *)(a1 + 40);
        +[DMDRemoveAppOperation removeAppWithBundleIdentifier:v14 completion:v15];
      }
      else
      {
        [*(id *)(a1 + 40) endOperationWithResultObject:0];
      }
    }
    else
    {
      [*(id *)(a1 + 40) endOperationWithError:v7];
    }
  }
}

void sub_1000728F8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    uint64_t v5 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v5];
  }
  else
  {
    id v4 = 0;
    [v2 endOperationWithResultObject:0];
  }
}

id sub_100072B00(uint64_t a1)
{
  return [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_100072D4C(id a1)
{
  qword_1000FBCF0 = objc_opt_new();

  _objc_release_x1();
}

void sub_100073C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100073C68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100073C78(uint64_t a1)
{
}

void sub_100073C80(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000741B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000741E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100074540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100074578(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100074848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100074878(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100074B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100074B9C(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = *(void **)(*(void *)(a1[4] + 8) + 40);
  id v11 = a4;
  id v12 = a3;
  [v10 setDownload:a2];
  [*(id *)(*(void *)(a1[4] + 8) + 40) setInstallPolicy:v12];

  [*(id *)(*(void *)(a1[4] + 8) + 40) setAutoInstallOperation:v11];
  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v15 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_1000756B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000756D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained description];

  return v2;
}

void sub_100075818(id a1, NSNumber *a2, CATSerialOperationQueue *a3, BOOL *a4)
{
}

void sub_100075968(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _nameForOperationGroup:[a2 unsignedIntegerValue]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 operations];

  [v7 appendFormat:@"\nGroup: %@\n%@", v9, v8];
}

void sub_100075F60(uint64_t a1)
{
  id v6 = 0;
  uint64_t v2 = +[NSRegularExpression regularExpressionWithPattern:@"^DM[DF](\\w+)Request$" options:0 error:&v6];
  id v3 = v6;
  id v4 = (void *)qword_1000FBD00;
  qword_1000FBD00 = v2;

  if (!qword_1000FBD00)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"DMDTaskServerDelegate.m", 178, @"%@", v3 object file lineNumber description];
  }
}

void sub_100076A40(id a1)
{
  uint64_t v1 = (void *)qword_1000FBD10;
  qword_1000FBD10 = (uint64_t)&off_1000D36A8;
}

void sub_1000770C4(uint64_t a1)
{
  id v8 = 0;
  id v2 = +[Libsysdiagnose sysdiagnoseWithMetadata:0 withError:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    id v10 = v3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v7 = DMFErrorWithCodeAndUserInfo();
    [v5 endOperationWithError:v7];
  }
  else
  {
    MCSendDiagnosticsCollectedNotification();
    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }
  [*(id *)(a1 + 40) stayAliveThroughHereAtLeast];
}

void sub_10007741C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }
  else
  {
    id v6 = [v5 bundleIdentifier];

    uint64_t v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 _runWithRequest:*(void *)(a1 + 40) metadata:v8];
    }
    else {
      [v7 endOperationWithDMFErrorCode:2606];
    }
  }
}

id sub_1000777B8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 endOperationWithError:a2];
  }
  else {
    return [v3 _endOperationWithBundleIdentifier:*(void *)(a1 + 40)];
  }
}

void sub_100077BCC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) _setState:7 forBundleIdentifier:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    [v4 _startUpdateAppForRequest:v5 metadata:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 56) bundleIdentifier];
    [v3 _setState:15 forBundleIdentifier:v7];
  }
}

void sub_100077E34(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _showUpdateFailurePromptIfNeededForRequest:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) endOperationWithError:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = *(id *)(a1 + 40);
      long long v26 = +[DMDAppController sharedController];
      long long v25 = [v4 VPNUUIDString];
      long long v24 = [v4 cellularSliceUUIDString];
      id v23 = [v4 contentFilterUUIDString];
      unsigned int v22 = [v4 DNSProxyUUIDString];
      long long v21 = [v4 relayUUIDString];
      uint64_t v5 = [v4 associatedDomains];
      long long v20 = [v4 associatedDomainsEnableDirectDownloads];
      long long v19 = [v4 allowUserToHide];
      uint64_t v6 = [v4 allowUserToLock];
      id v7 = [v4 configuration];
      id v8 = [v4 managementOptions];
      NSErrorUserInfoKey v9 = [v4 sourceIdentifier];
      [v26 setVPNUUIDString:v25 cellularSliceUUIDString:v24 contentFilterUUIDString:v23 DNSProxyUUIDString:v22 relayUUIDString:v21 associatedDomains:v5 enableDirectDownloads:v20 allowUserToHide:v19 allowUserToLock:v6 configuration:v7 options:v8 sourceIdentifier:v9 forBundleIdentifier:*(void *)(a1 + 56)];

      id v10 = +[DMDAppController sharedController];
      id v11 = [v4 removable];
      uint64_t v12 = *(void *)(a1 + 56);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100078178;
      v29[3] = &unk_1000CADD0;
      id v13 = v4;
      id v30 = v13;
      [v10 setRemovability:v11 forBundleIdentifier:v12 completion:v29];

      uint64_t v14 = +[DMDAppController sharedController];
      id v15 = [v13 tapToPayScreenLock];
      uint64_t v16 = *(void *)(a1 + 56);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000781E0;
      v27[3] = &unk_1000CADD0;
      id v28 = v13;
      id v17 = v13;
      [v14 setTapToPayScreenLock:v15 forBundleIdentifier:v16 completion:v27];

      id v18 = +[DMDAppController sharedController];
      [v18 sendManagedAppsChangedNotification];
    }
    [*(id *)(a1 + 32) _endOperationWithBundleIdentifier:*(void *)(a1 + 56)];
  }
}

void sub_100078178(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10008838C(a1);
    }
  }
}

void sub_1000781E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DMFAppLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100088420(a1);
    }
  }
}

id sub_10007879C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100078A4C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

uint64_t sub_100078E1C(uint64_t a1)
{
  qword_1000FBD20 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initPrivate];

  return _objc_release_x1();
}

void sub_100079158(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [a1[4] identifier];
    int v9 = 138543362;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Adding user notification: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v3 = [a1[5] notifications];
  [v3 addObject:a1[4]];

  id v4 = [a1[6] copy];
  uint64_t v5 = [a1[5] completionsByIdentifier];
  uint64_t v6 = [a1[4] identifier];
  [v5 setObject:v4 forKeyedSubscript:v6];

  id v7 = [a1[5] notifications];
  id v8 = [v7 count];

  if (v8 == (id)1) {
    [a1[5] _showNextNotification];
  }
}

void sub_1000794F0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notifications];
  id v3 = [v2 firstObject];

  if (v3)
  {
    uint64_t v4 = [v3 defaultButtonTitle];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [v3 alternateButtonTitle];
      if (v6)
      {
        id v7 = [v3 otherButtonTitle];
        BOOL v8 = v7 != 0;

        uint64_t v6 = (void *)(32 * v8);
      }
      else
      {
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    SInt32 error = 0;
    CFDictionaryRef v9 = [*(id *)(a1 + 32) _dictFromNotification:v3];
    [v3 timeout];
    CFUserNotificationRef v11 = CFUserNotificationCreate(kCFAllocatorDefault, v10, (CFOptionFlags)v6, &error, v9);
    if (v11)
    {
      CFUserNotificationRef v12 = v11;
      [v3 setNotificationRef:v11];
      CFRelease(v12);
      id v13 = [v3 identifier];
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v12, (CFUserNotificationCallBack)sub_100079744, 0);
      if (RunLoopSource)
      {
        id v15 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v15, kCFRunLoopCommonModes);
        CFRelease(v15);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v19 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User notification started: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000885F4((uint64_t)v13);
        }
        [*(id *)(a1 + 32) _completeNotification:v3 response:4];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000885AC();
      }
      [*(id *)(a1 + 32) _completeNotification:v3 response:4];
    }
  }
}

void sub_100079744(uint64_t a1, uint64_t a2)
{
  id v4 = +[DMDUserNotificationController sharedController];
  [v4 _notificationRef:a1 wasDismissedWithFlags:a2];
}

void sub_1000799B4(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) notifications];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(id *)(*((void *)&v12 + 1) + 8 * v6);
      if ([v7 notificationRef] == *(id *)(a1 + 40)) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v7;

    if (!v8) {
      return;
    }
    unint64_t v9 = *(void *)(a1 + 48);
    if (v9 < 4) {
      unint64_t v10 = v9 + 1;
    }
    else {
      unint64_t v10 = 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CFUserNotificationRef v11 = [v8 identifier];
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User notification ended: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _completeNotification:v8 response:v10];
  }
  else
  {
LABEL_9:
    id v8 = v2;
  }
}

uint64_t sub_100079DB8()
{
  qword_1000FBD30 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100079EF0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079F74;
  block[3] = &unk_1000CA508;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100079F74(uint64_t a1)
{
  return [*(id *)(a1 + 32) mainQueueDidReceiveAppWhitelistChangedNotification];
}

id sub_10007A034()
{
  if (qword_1000FBD50 != -1) {
    dispatch_once(&qword_1000FBD50, &stru_1000CC070);
  }
  uint64_t v0 = (void *)qword_1000FBD48;

  return v0;
}

void sub_10007A088(id a1)
{
  uint64_t v1 = +[MCProfileConnection sharedConnection];
  unsigned int v2 = [v1 appWhitelistState];

  if (v2) {
    BOOL v3 = v2 == 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (qword_1000FBD40 && ([(id)qword_1000FBD40 displayInAppWhitelistModes] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Dismissing notification because we entered limited apps mode.", buf, 2u);
      }
      id v4 = [(id)qword_1000FBD40 notification];
      CFUserNotificationCancel(v4);

      uint64_t v5 = (void *)qword_1000FBD40;
      qword_1000FBD40 = 0;
    }
    uint64_t v6 = objc_opt_new();
    id v7 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = sub_10007A35C();
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 displayInAppWhitelistModes]) {
            long long v14 = v7;
          }
          else {
            long long v14 = v6;
          }
          [v14 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }

    long long v15 = sub_10007A35C();
    [v15 removeAllObjects];

    uint64_t v16 = sub_10007A35C();
    [v16 addObjectsFromArray:v7];

    if ([v6 count])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = [v6 count];
        *(_DWORD *)buf = 67109120;
        unsigned int v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Canceling %d pending notifications because we entered limited apps mode.", buf, 8u);
      }
      id v18 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007A3B0;
      block[3] = &unk_1000CA508;
      id v20 = v6;
      dispatch_async(v18, block);
    }
  }
}

id sub_10007A35C()
{
  if (qword_1000FBD60 != -1) {
    dispatch_once(&qword_1000FBD60, &stru_1000CC090);
  }
  uint64_t v0 = (void *)qword_1000FBD58;

  return v0;
}

void sub_10007A3B0(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = [v6 completionBlock:v9];

        if (v7)
        {
          id v8 = [v6 completionBlock];
          v8[2](v8, 3);
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

BOOL sub_10007A4EC(id a1, DMDUserNotificationQueueEntry *a2)
{
  return 1;
}

void sub_10007A5AC(uint64_t a1)
{
  id v2 = sub_10007A034();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  void v3[2] = sub_10007A65C;
  void v3[3] = &unk_1000CC000;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_barrier_sync(v2, v3);
}

void sub_10007A65C(uint64_t a1)
{
  if (qword_1000FBD40 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v2 = [(id)qword_1000FBD40 notification];
    CFUserNotificationCancel(v2);
  }
  id v3 = sub_10007A35C();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_10007A80C;
  v12[3] = &unk_1000CBFD8;
  id v13 = *(id *)(a1 + 32);
  id v4 = +[NSPredicate predicateWithBlock:v12];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  uint64_t v6 = sub_10007A35C();
  [v6 removeObjectsInArray:v5];

  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A81C;
  block[3] = &unk_1000CA828;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_10007A80C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10007A81C(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 completionBlock:v11];

        if (v8)
        {
          long long v9 = [v7 completionBlock];
          v9[2](v9, 3);
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10007ACA8(uint64_t a1)
{
  [*(id *)(a1 + 32) unpark];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10007AD04(uint64_t a1)
{
  id v2 = sub_10007A35C();
  [v2 addObject:*(void *)(a1 + 32)];

  sub_10007AD4C();
}

void sub_10007AD4C()
{
  if (qword_1000FBD40) {
    return;
  }
  uint64_t v0 = sub_10007A35C();
  if (![v0 count]) {
    goto LABEL_26;
  }
  CFStringRef v1 = kCFUserNotificationAlertHeaderKey;
  CFStringRef v2 = kCFUserNotificationAlertMessageKey;
  CFStringRef v3 = kCFUserNotificationDefaultButtonTitleKey;
  CFStringRef v4 = kCFUserNotificationAlternateButtonTitleKey;
  CFStringRef v5 = kCFUserNotificationOtherButtonTitleKey;
  uint64_t v43 = SBUserNotificationDontDismissOnUnlock;
  id v41 = v47;
  while (1)
  {
    uint64_t v6 = [v0 objectAtIndexedSubscript:0];
    id v7 = objc_opt_new();
    id v8 = [v6 title];
    [v7 setObject:v8 forKeyedSubscript:v1];

    long long v9 = [v6 message];
    [v7 setObject:v9 forKeyedSubscript:v2];

    id v10 = [v6 defaultButtonText];
    [v7 setObject:v10 forKeyedSubscript:v3];

    long long v11 = [v6 alternateButtonText];
    [v7 setObject:v11 forKeyedSubscript:v4];

    long long v12 = [v6 otherButtonText];
    [v7 setObject:v12 forKeyedSubscript:v5];

    long long v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 displayOnLockScreen]);
    [v7 setObject:v13 forKeyedSubscript:kCFUserNotificationAlertTopMostKey];

    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:v43];
    uint64_t v14 = [v6 defaultButtonText];
    if (v14)
    {
      long long v15 = (void *)v14;
      uint64_t v16 = [v6 alternateButtonText];
      if (v16)
      {
        unsigned int v17 = (void *)v16;
        id v18 = [v6 otherButtonText];
        long long v42 = v0;
        CFStringRef v19 = v5;
        CFStringRef v20 = v4;
        CFStringRef v21 = v3;
        CFStringRef v22 = v2;
        CFStringRef v23 = v1;
        BOOL v24 = v18 != 0;

        CFOptionFlags v25 = 32 * v24;
        CFStringRef v1 = v23;
        CFStringRef v2 = v22;
        CFStringRef v3 = v21;
        CFStringRef v4 = v20;
        CFStringRef v5 = v19;
        uint64_t v0 = v42;
        goto LABEL_9;
      }
    }
    CFOptionFlags v25 = 0;
LABEL_9:
    SInt32 error = 0;
    unsigned int v26 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v25, &error, (CFDictionaryRef)v7);
    if (!v26)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100088674(v49, &error, v50);
      }
      goto LABEL_16;
    }
    long long v27 = v26;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v26, (CFUserNotificationCallBack)sub_10007BA84, 0);
    if (RunLoopSource) {
      break;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000886C4(&v44, v45);
    }
    CFRelease(v27);
LABEL_16:

    uint64_t v0 = sub_10007A35C();
    if (![v0 count]) {
      goto LABEL_26;
    }
  }
  id v29 = RunLoopSource;
  id v30 = sub_10007A35C();
  [v30 removeObjectAtIndex:0];

  objc_storeStrong((id *)&qword_1000FBD40, v6);
  [v6 setNotification:v27];
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v29, kCFRunLoopCommonModes);
  CFRelease(v29);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v6 title];
    id v33 = [v6 message];
    id v34 = [v6 defaultButtonText];
    long long v35 = [v6 alternateButtonText];
    id v36 = [v6 otherButtonText];
    *(_DWORD *)buf = 138544386;
    long long v52 = v32;
    __int16 v53 = 2114;
    long long v54 = v33;
    __int16 v55 = 2114;
    long long v56 = v34;
    __int16 v57 = 2114;
    long long v58 = v35;
    __int16 v59 = 2114;
    long long v60 = v36;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Displaying alert: %{public}@ - %{public}@ [%{public}@] [%{public}@] [%{public}@]", buf, 0x34u);
  }
  [v6 dismissAfterTimeInterval];
  if (v37 <= 0.0)
  {
    CFRelease(v27);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      [v6 dismissAfterTimeInterval];
      *(_DWORD *)buf = 134217984;
      long long v52 = v38;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Scheduling automatic alert dismissal after %0.0f seconds.", buf, 0xCu);
    }
    CFRetain(v27);
    [v6 dismissAfterTimeInterval];
    dispatch_time_t v40 = dispatch_time(0, (uint64_t)(v39 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v47[0] = sub_10007BBA8;
    v47[1] = &unk_1000C9F80;
    v47[2] = v27;
    dispatch_after(v40, (dispatch_queue_t)&_dispatch_main_q, block);
  }

LABEL_26:
}

void sub_10007B41C(uint64_t a1)
{
  CFStringRef v2 = sub_10007B694();
  if (![v2 count])
  {
    CFStringRef v5 = *(void **)(a1 + 56);
    if (v5)
    {
      id v6 = objc_retainBlock(v5);
      [v2 addObject:v6];
    }
    CFStringRef v4 = objc_opt_new();
    [v4 setTitle:*(void *)(a1 + 32)];
    [v4 setMessage:*(void *)(a1 + 40)];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"Sign In" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v4 setDefaultButtonText:v8];

    long long v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v4 setAlternateButtonText:v10];

    [v4 setDisplayOnLockScreen:0];
    [v4 setDisplayInAppWhitelistModes:0];
    [v4 setDismissAfterTimeInterval:900.0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_10007B6E8;
    v12[3] = &unk_1000CC050;
    id v13 = *(id *)(a1 + 48);
    [v4 setCompletionBlock:v12];
    [*(id *)(a1 + 48) park];
    long long v11 = sub_10007A35C();
    [v11 addObject:v4];

    sub_10007AD4C();
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  CFStringRef v3 = *(void **)(a1 + 56);
  if (v3)
  {
    CFStringRef v4 = objc_retainBlock(v3);
    [v2 addObject:v4];
LABEL_9:
  }
  [*(id *)(a1 + 48) stayAliveThroughHereAtLeast];
}

id sub_10007B694()
{
  if (qword_1000FBD70 != -1) {
    dispatch_once(&qword_1000FBD70, &stru_1000CC0B0);
  }
  uint64_t v0 = (void *)qword_1000FBD68;

  return v0;
}

void sub_10007B6E8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unpark];
  CFStringRef v4 = sub_10007A034();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B79C;
  v5[3] = &unk_1000CA4E0;
  uint64_t v7 = a2;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);
}

void sub_10007B79C(uint64_t a1)
{
  CFStringRef v2 = sub_10007B694();
  if ([v2 count])
  {
    id v3 = [v2 copy];
    [v2 removeAllObjects];
    CFStringRef v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10007B890;
    block[3] = &unk_1000CC028;
    id v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v9 = v3;
    uint64_t v11 = v5;
    id v10 = v6;
    id v7 = v3;
    dispatch_async(v4, block);
  }
}

id sub_10007B890(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    id v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Calling completions for %lu iTunes login events.", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(a1 + 48));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 40) stayAliveThroughHereAtLeast:v11];
}

void sub_10007BA04(id a1)
{
  qword_1000FBD48 = (uint64_t)dispatch_queue_create("DMDUserNotificationManager Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);

  _objc_release_x1();
}

void sub_10007BA48(id a1)
{
  qword_1000FBD58 = objc_opt_new();

  _objc_release_x1();
}

void sub_10007BA84(uint64_t a1, unint64_t a2)
{
  if (a2 > 3)
  {
    CFStringRef v3 = @"Unknown";
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = a2;
    CFStringRef v3 = *(&off_1000CC0D0 + a2);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Alert dismissed with response: %{public}@", buf, 0xCu);
  }
  id v4 = sub_10007A034();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10007BC20;
  block[3] = &unk_1000C9F80;
  void block[4] = v2;
  dispatch_barrier_sync(v4, block);
}

void sub_10007BBA8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Automatically dismissing alert.", v2, 2u);
  }
  CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_10007BC20(uint64_t a1)
{
  id v2 = (id)qword_1000FBD40;
  CFStringRef v3 = (void *)qword_1000FBD40;
  qword_1000FBD40 = 0;

  id v4 = [v2 completionBlock];

  if (v4)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_10007BD08;
    v12[3] = &unk_1000CA4E0;
    id v10 = v2;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    dispatch_async(v9, v12);
  }
  sub_10007AD4C(v5, v6, v7, v8);
}

void sub_10007BD08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

void sub_10007BD64(id a1)
{
  qword_1000FBD68 = objc_opt_new();

  _objc_release_x1();
}

void sub_10007BEB8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    uint64_t v7 = a2;
    id v3 = a2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    uint64_t v5 = DMFErrorWithCodeAndUserInfo();
    [v2 endOperationWithError:v5];
  }
  else
  {
    id v4 = 0;
    [v2 endOperationWithResultObject:0];
  }
}

uint64_t MCProfileFilterFlagsFromDMFProfileFilterFlags(uint64_t a1)
{
  if (a1) {
    return a1 & 0x3F;
  }
  else {
    return 3;
  }
}

int main(int argc, const char **argv, const char **envp)
{
  +[NSFileManager dmd_setUserDirSuffix:"com.apple.dmd"];
  id v4 = +[NSFileManager dmd_userDarwinUserTempDirectoryURL];
  [v4 getFileSystemRepresentation:v10 maxLength:1024];

  signal(15, (void (__cdecl *)(int))1);
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  NSErrorUserInfoKey v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v5);
  dispatch_source_set_event_handler(v6, &stru_1000CC0F0);
  dispatch_activate(v6);
  uint64_t v7 = +[DMDServer sharedServer];
  [v7 run];

  uint64_t v8 = +[NSRunLoop currentRunLoop];
  [v8 run];

  return 0;
}

void sub_10007D688(id a1)
{
  CFStringRef v1 = DMFServerLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received, cleaning all outstanding XPC transactions", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

id DMDErrorChainFromError(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  id v15 = v1;
  if (v15)
  {
    uint64_t v3 = DMFDeclarationStateErrorChainLocalizedDescriptionKey;
    uint64_t v4 = DMFDeclarationStateErrorChainErrorDomainKey;
    uint64_t v5 = DMFDeclarationStateErrorChainErrorCodeKey;
    NSErrorUserInfoKey v6 = v15;
    do
    {
      uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:4];
      uint64_t v8 = [v6 userInfo];
      id v9 = [v6 localizedDescription];
      [v7 setObject:v9 forKeyedSubscript:v3];

      id v10 = [v6 domain];
      [v7 setObject:v10 forKeyedSubscript:v4];

      uint64_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
      [v7 setObject:v11 forKeyedSubscript:v5];

      [v2 addObject:v7];
      uint64_t v12 = [v8 objectForKey:NSUnderlyingErrorKey];

      NSErrorUserInfoKey v6 = (void *)v12;
    }
    while (v12);
  }
  id v13 = [v2 copy];

  return v13;
}

void sub_10007DAE0(id a1)
{
  id v4 = +[DMDPaths systemGroupContainerPath];
  id v1 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"Library" isDirectory:1];
  uint64_t v3 = (void *)qword_1000FBD78;
  qword_1000FBD78 = v2;
}

void sub_10007DCD0(id a1)
{
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100088798();
    }
    uid_t v2 = getuid();
    uint64_t v3 = getpwuid(v2);
    if (!v3)
    {
      id v10 = +[NSAssertionHandler currentHandler];
      uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke");
      uint64_t v12 = getuid();
      id v13 = __error();
      uint64_t v14 = +[NSString stringWithUTF8String:strerror(*v13)];
      [v10 handleFailureInFunction:v11, @"NSFileManager+DMDAdditions.m", 64, @"Failed to get passwd entry for uid %u: %@ (%d)", v12, v14, *__error() file lineNumber description];
    }
    pw_dir = v3->pw_dir;
  }
  if (!realpath_DARWIN_EXTSN(pw_dir, v15))
  {
    NSErrorUserInfoKey v6 = +[NSAssertionHandler currentHandler];
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke");
    uint64_t v8 = __error();
    id v9 = +[NSString stringWithUTF8String:strerror(*v8)];
    [v6 handleFailureInFunction:v7, @"NSFileManager+DMDAdditions.m", 70, @"Failed to resolve user home directory: %@ (%d)", v9, *__error() file lineNumber description];
  }
  uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:v15 isDirectory:1 relativeToURL:0];
  uint64_t v5 = (void *)qword_1000FBD88;
  qword_1000FBD88 = v4;
}

void sub_10007DF74(uint64_t a1)
{
  [*(id *)(a1 + 32) dmd_userHomeURL];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Library" isDirectory:1];
  uid_t v2 = (void *)qword_1000FBD98;
  qword_1000FBD98 = v1;
}

void sub_10007E02C(id a1)
{
  if (!confstr(65537, v12, 0x400uLL))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke");
    uint64_t v5 = __error();
    NSErrorUserInfoKey v6 = +[NSString stringWithUTF8String:strerror(*v5)];
    [v3 handleFailureInFunction:v4, @"NSFileManager+DMDAdditions.m", 91, @"Failed to initialize darwin user temp directory: %@ (%d)", v6, *__error() file lineNumber description];
  }
  if (!realpath_DARWIN_EXTSN(v12, v11))
  {
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke");
    id v9 = __error();
    id v10 = +[NSString stringWithUTF8String:strerror(*v9)];
    [v7 handleFailureInFunction:v8, @"NSFileManager+DMDAdditions.m", 94, @"Failed to resolve darwin user temp directory: %@ (%d)", v10, *__error() file lineNumber description];
  }
  uint64_t v1 = +[NSURL fileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
  uid_t v2 = (void *)qword_1000FBDA8;
  qword_1000FBDA8 = v1;
}

void sub_10007E6F8(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Request validation failed for removing profile: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10007E77C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Request validation failed for installing profile: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10007E800()
{
  sub_100007954();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%@", v1, 0xCu);
}

void sub_10007E874(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "font asset data is nil", v1, 2u);
}

void sub_10007E8B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "image asset data is nil", v1, 2u);
}

void sub_10007E8FC(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Request validation failed for setting policy: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10007E984(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Request validation failed for removing policy: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10007EA0C()
{
  sub_10000E990();
  uint64_t v3 = [*(id *)(v2 + 32) predicateType];
  uint64_t v4 = [*(id *)(v1 + 32) uniqueIdentifier];
  uint64_t v5 = [v0 debugDescription];
  sub_10000E95C();
  sub_10000E9A0((void *)&_mh_execute_header, v6, v7, "Predicate type: %{public}@ with unique identifier: %{public}@ failed stopping Usage Tracking monitor with budget identifier: %{public}@, error: %{public}@", v8, v9, v10, v11, v12);
}

void sub_10007EADC()
{
  sub_10000E978();
  [v1 predicateType];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000E984() uniqueIdentifier];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract a budget type", v5, v6, v7, v8, v9);
}

void sub_10007EB78()
{
  sub_10000E978();
  [v1 predicateType];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000E984() uniqueIdentifier];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract budgeted identifiers", v5, v6, v7, v8, v9);
}

void sub_10007EC14()
{
  sub_10000E978();
  [v1 predicateType];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000E984() uniqueIdentifier];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract a budget schedule", v5, v6, v7, v8, v9);
}

void sub_10007ECB0()
{
  sub_10000E990();
  uint64_t v2 = [v1 predicateType];
  uint64_t v3 = [v0 uniqueIdentifier];
  uint64_t v4 = [v0 calendarIdentifier];
  sub_10000E95C();
  sub_10000E9A0((void *)&_mh_execute_header, v5, v6, "Predicate type: %{public}@ with unique identifier: %{public}@ cannot have budget with invalid calendar day: %{public}@ calendar identifier: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10007ED78()
{
  sub_10000E990();
  uint64_t v4 = [v3 predicateType];
  uint64_t v5 = [v2 uniqueIdentifier];
  int v6 = 138543874;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ cannot have multiple budgets for day: %{public}@ ", (uint8_t *)&v6, 0x20u);
}

void sub_10007EE40(void *a1, void *a2, NSObject *a3)
{
  int v6 = [a1 predicateType];
  uint64_t v7 = [a1 uniqueIdentifier];
  __int16 v8 = [a2 payloadCalendarIdentifier];
  uint64_t v9 = [a2 payloadNotificationTimes];
  __int16 v10 = [a2 payloadStartDay];
  uint64_t v11 = [a2 payloadStartTime];
  uint8_t v12 = [a2 payloadEndDay];
  id v13 = [a2 payloadEndTime];
  int v14 = 138545154;
  id v15 = v6;
  __int16 v16 = 2114;
  id v17 = v7;
  __int16 v18 = 2114;
  CFStringRef v19 = v8;
  __int16 v20 = 2114;
  CFStringRef v21 = v9;
  __int16 v22 = 2114;
  CFStringRef v23 = v10;
  __int16 v24 = 2114;
  CFOptionFlags v25 = v11;
  __int16 v26 = 2114;
  long long v27 = v12;
  __int16 v28 = 2114;
  id v29 = v13;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract predicate with payload calendar identifier: %{public}@, payload notifications times: %{public}@, payload start day: %{public}@, payload start time: %{public}@, payload end day: %{public}@, payload end time: %{public}@", (uint8_t *)&v14, 0x52u);
}

void sub_10007EFC8(void *a1)
{
  uint64_t v2 = [a1 predicateType];
  __int16 v8 = [a1 uniqueIdentifier];
  sub_100010A44();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x16u);
}

void sub_10007F084(void *a1)
{
  uint64_t v2 = [a1 predicateType];
  id v3 = [a1 uniqueIdentifier];
  sub_100010A54();
  sub_100010A44();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

void sub_10007F140(void *a1)
{
  uint64_t v2 = [a1 predicateType];
  id v3 = [a1 uniqueIdentifier];
  os_log_t v4 = [a1 endDate];
  sub_100010A54();
  sub_100010A44();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x2Au);
}

void sub_10007F220()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not parse app management plist at path: %{public}@, error: %{public}@");
}

void sub_10007F288(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not write app management plist, unknown error", v1, 2u);
}

void sub_10007F2CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not write app management plist, error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10007F344(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set bundle identifiers %{public}@ for personaID %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_10007F3D8(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_10001B840();
  sub_10001B820((void *)&_mh_execute_header, v1, v2, "Could not set removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_10007F44C(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_10001B840();
  sub_10001B820((void *)&_mh_execute_header, v1, v2, "Could not get removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_10007F4C0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider removeMDMAppAttribute] since enabled was nil", v1, 2u);
}

void sub_10007F504(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider setMDMAppAttribute] enabled=%@", (uint8_t *)&v2, 0xCu);
}

void sub_10007F57C()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set management options for bundle identifier: %{public}@, error: %{public}@");
}

void sub_10007F5E4()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set source identifier for app: %{public}@, error: %{public}@");
}

void sub_10007F64C()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set configuration for app: %{public}@, error: %{public}@");
}

void sub_10007F6B4()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set allow user to lock for app: %{public}@, error: %{public}@");
}

void sub_10007F71C()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set allow user to hide for app: %{public}@, error: %{public}@");
}

void sub_10007F784()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set associated domains enable direct downloads for app: %{public}@, error: %{public}@");
}

void sub_10007F7EC()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set associated domains for app: %{public}@, error: %{public}@");
}

void sub_10007F854()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set relay UUID for app: %{public}@, error: %{public}@");
}

void sub_10007F8BC()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set DNS proxy UUID for app: %{public}@, error: %{public}@");
}

void sub_10007F924()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set content filter UUID for app: %{public}@, error: %{public}@");
}

void sub_10007F98C()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set cellular slice UUID for app: %{public}@, error: %{public}@");
}

void sub_10007F9F4()
{
  sub_10001B808();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not set VPN UUID for app: %{public}@, error: %{public}@");
}

void sub_10007FA5C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not write management info to disk for bundle identifier: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10007FAD8(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *ProximityReaderLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"DMDAppController.m" lineNumber:21 description:@"%s" a1];

  __break(1u);
}

void sub_10007FB58()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getPRSettingsProviderClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"DMDAppController.m" lineNumber:22 description:@"Unable to find class %s", "PRSettingsProvider"];

  __break(1u);
}

void sub_10007FBD4()
{
  sub_10001FBF0(__stack_chk_guard);
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Could not acquire app container path for app %{public}@ to read feedback.", v2, v3, v4, v5, 2u);
}

void sub_10007FC40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007FCB0()
{
  sub_10001FBF0(__stack_chk_guard);
  sub_10001FBFC();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not acquire sandbox extension for app %{public}@ to read feedback. Attempting to read anyway. Error: %llu", v2, 0x16u);
}

void sub_10007FD2C()
{
  sub_10001FBF0(__stack_chk_guard);
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Could not acquire app container path for app %{public}@ to write feedback.", v2, v3, v4, v5, 2u);
}

void sub_10007FD98()
{
  sub_10001FBF0(__stack_chk_guard);
  sub_10001FBFC();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not acquire sandbox extension for app %{public}@ to write feedback. Attempting to write anyway. Error: %llu", v2, 0x16u);
}

void sub_10007FE14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007FE80(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Update foreground bundle identifiers: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10007FEF8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DMF could not restart app: %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10007FF84(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not initialize app lifecycle because no LSApplicationRecord for bundle identifier %{public}@, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10008000C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "App requests must have only one of bundle identifier, store item identifier, or manifest URL", v1, 2u);
}

void sub_100080050()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for asset: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000800F0()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize install operation for asset payload: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100080190()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDOperationProvidingAsset);
  int v6 = 138543874;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: Asset class (%{public}@) does not implement %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_100080274()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Asset install operation failed: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100080314()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize remove operation for installed asset payload: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000803B4()
{
  sub_100028494();
  int v2 = [v1 identifier];
  int v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to remove asset: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100080454()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DMFBeginTransactionRequest is deprecated please use DMDActivityTransactionOperation instead", v0, 2u);
}

void sub_10008049C(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *ScreenTimeCoreLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"DMDClearRestrictionsPasswordOperation+iOS.m" lineNumber:19 description:@"%s", *a1];

  __break(1u);
}

void sub_10008051C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getSTManagementStateClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"DMDClearRestrictionsPasswordOperation+iOS.m" lineNumber:20 description:@"Unable to find class %s" argument:v1];

  __break(1u);
}

void sub_100080598()
{
  sub_100028494();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000E984() verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to initialize configuration payload for command: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100080634()
{
  sub_100028494();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000E984() verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to create request for command execution: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000806D0()
{
  sub_100028494();
  id v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000E984() identifier];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to create operation from request for command execution: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100080770()
{
  sub_100028494();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  sub_10000E984();
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingCommand);
  int v6 = 138543874;
  uint64_t v7 = v1;
  __int16 v8 = 2114;
  uint8_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ does not conform to %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_100080850()
{
  sub_100028494();
  id v2 = [v1 identifier];
  uint64_t v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Execute command failed: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000808F0(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 identifier];
  uint64_t v6 = [a2 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to initialize command payload for command removal %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_1000809B4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Command did remove successfully %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100080A4C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_100031520((void *)&_mh_execute_header, a2, a3, "Failed to send %lu events from subscription manager", (uint8_t *)&v4);
}

void sub_100080AC0(uint64_t a1)
{
  id v1 = [(id)sub_100031538(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to clear failed state for existing declarations: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080B44(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "process status operation failed with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080BC8(uint64_t a1)
{
  id v1 = [(id)sub_10003154C(a1) subscriptionDeclaration];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch payload metadata corresponding to %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080C4C(uint64_t a1)
{
  id v1 = [(id)sub_10003154C(a1) subscriptionDeclaration];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to save subscription to database %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080CD0(uint64_t a1)
{
  id v1 = [(id)sub_10003154C(a1) subscriptionDeclaration];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch registration corresponding to %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080D54(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to delete subscription from database %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080DD8(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Could not fetch organizations from database: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080E5C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_100031520((void *)&_mh_execute_header, a2, a3, "Could not find organization with identifier: %{public}@", (uint8_t *)&v4);
}

void sub_100080ED0(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to save event in database: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080F54(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Engine will suspend due to error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100080FD8(uint64_t a1)
{
  id v1 = [(id)sub_10003154C(a1) error];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Database processing operation failed with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008105C(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000810E4(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to update subscription registrations: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081168(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000811EC(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch declarations while scrubbing policy orphans %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081270(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "Declaration %{public}@ does not belong to an organization", a1, 0xCu);
}

void sub_1000812E8(void *a1)
{
  id v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to load organizations from database while scrubbing policy orphans: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008136C(void *a1)
{
  id v1 = [a1 componentsJoinedByString:@","];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Found policies orphaned from any known organization. Removed identifiers %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000813F8(void *a1)
{
  id v1 = [a1 componentsJoinedByString:@","];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Found policies orphaned from any known declarations. Removed identifiers %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081484(uint64_t a1)
{
  id v1 = [(id)sub_100031538(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "failed to fetch declarations pending status update %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081508()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "failed to update status %{public}@", v2);
}

void sub_100081574(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100031538(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "failed to fetch declarations to update their lastStatusUpdateTimestamp %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000815F8(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100031538(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "failed to save last updated timestamp in database %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008167C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "declaration update operation failed with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081700(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "status update operation failed with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100081784(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [(id)sub_10003154C(a1) organizationIdentifier];
  uint64_t v6 = [a2 verboseDescription];
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch queued events for organization '%{public}@': %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100081848()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "failed to send event %{public}@", v2);
}

void sub_1000818B4()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "failed to delete events from database: %{public}@", v2);
}

void sub_100081920()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration install: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000819C0()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for configuration install: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081A60()
{
  sub_100028494();
  id v1 = [v0 identifier];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create operation from request for configuration install for %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081B04()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
  int v6 = 138543874;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ does not conform to %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_100081BE8()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed install: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081C88(void *a1, const char *a2)
{
  uint64_t v3 = [a1 delegate];
  uint64_t v4 = NSStringFromSelector(a2);
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ does not respond to %{public}@", v7, v8, v9, v10, v11);
}

void sub_100081D2C()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration remove: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081DCC()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for installed configuration remove: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081E6C()
{
  sub_100028494();
  id v1 = [v0 identifier];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create operation from request for installed configuration removal: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081F10()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed remove: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100081FB0()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to initialize configuration payload for configuration replace: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100082050()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create request for configuration replace: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000820F0()
{
  sub_100028494();
  id v1 = [v0 identifier];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to create configuration replace operation for request: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100082194()
{
  sub_100028494();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [*v0 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "%{public}@: Configuration failed replace: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100082234(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) controller];
  uint64_t v5 = [*(id *)(a1 + 40) assetIdentifier];
  uint64_t v6 = [a2 verboseDescription];
  sub_100035178();
  sub_100035198((void *)&_mh_execute_header, v7, v8, "%{public}@ failed to initate connection to resolve asset %{public}@: %{public}@", v9, v10, v11, v12, v13);
}

void sub_1000822F4(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 40) controller];
  uint64_t v5 = [*(id *)(a1 + 48) assetIdentifier];
  uint64_t v6 = [a2 verboseDescription];
  sub_100035178();
  sub_100035198((void *)&_mh_execute_header, v7, v8, "%{public}@ failed to resolve asset %{public}@: %{public}@", v9, v10, v11, v12, v13);
}

void sub_1000823B4(void *a1)
{
  id v1 = [a1 identifier];
  sub_100035DA4((void *)&_mh_execute_header, v2, v3, "Reporting status to %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10008243C(void *a1)
{
  id v1 = [a1 identifier];
  sub_100035DA4((void *)&_mh_execute_header, v2, v3, "Reporting events to %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000824C4(NSObject *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDConfigurationSourceControllerDelegate);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "delegate does not conform to %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100082564(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to fetch events %{public}@", v7, v8, v9, v10, v11);
}

void sub_10008260C(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 40) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send events remote proxy could not be created: %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000826B4(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send events: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10008275C(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to fetch status update %{public}@", v7, v8, v9, v10, v11);
}

void sub_100082804(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send status updates remote proxy coun't be created: %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000828AC(uint64_t a1, void *a2)
{
  int v3 = [*(id *)(a1 + 32) controller];
  uint64_t v4 = [a2 verboseDescription];
  sub_10000E924();
  sub_10000E93C((void *)&_mh_execute_header, v5, v6, "%{public}@ failed to send status updates: %{public}@", v7, v8, v9, v10, v11);
}

void sub_100082954(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing establishing anonymous connection with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000829CC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) machServiceName];
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing establishing connection to named service %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100082A84()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "getMobileEquipmentInfo: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082AF4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mobileEquipmentInfoList.meInfoList was unexpectedly nil", v0, 2u);
}

void sub_100082B3C()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "getMobileEquipmentInfoFor:error: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082BAC()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "getLocalizedOperatorName:error: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082C1C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "nil client passed to _DataServiceSubscriptionContextFromClient", v0, 2u);
}

void sub_100082C64()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "could not fetch carrier name from carrier bundle: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082CD4()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleVersion:error: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082D44()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileCountryCode:error: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082DB4()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileNetworkCode:error: failed: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082E24()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "unable to determine if data roaming is allowed, assuming NO: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082E94()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "unable to get a service descriptor to determine if data roaming is enabled, assuming NO: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082F04()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "unable to set data roaming: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082F74()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "unable to get a service descriptor to set data roaming: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100082FE4(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "+[DMDCoreTelephonyUtilities isSubscriptionRoaming:client:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: copyRegistrationStatus:error: failed: %@", (uint8_t *)&v1, 0x16u);
}

void sub_100083078(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Voice roaming is already set to %d. Not setting again.", (uint8_t *)v1, 8u);
}

void sub_1000830F8()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "could not get voice roaming switch from carrier bundle, assuming NO: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100083168()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "voice roaming switch value from carrier bundle is not a BOOLean, assuming NO: %{public}@", v1, v2, v3, v4, v5);
}

void sub_1000831D8()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to fetch vinyl info, CTError = %@", v1, v2, v3, v4, v5);
}

void sub_100083248(char a1, uint64_t a2)
{
  v2[0] = 67109378;
  v2[1] = a1 & 1;
  __int16 v3 = 2112;
  uint64_t v4 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "_CTServerConnectionStandaloneGetCachedVinylInfo => uint64_t result = %d, dict = %@", (uint8_t *)v2, 0x12u);
}

void sub_1000832D8()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to download cellular profile, CTError = %@", v1, v2, v3, v4, v5);
}

void sub_100083348(char a1)
{
  v1[0] = 67109120;
  v1[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "_CTServerConnectionStandaloneDownloadProfile => uint64_t result = %d", (uint8_t *)v1, 8u);
}

void sub_1000833CC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get battery level. IOReturn Error Code: %d", (uint8_t *)v1, 8u);
}

void sub_10008344C()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Could not get Do Not Disturb state: %@", v1, v2, v3, v4, v5);
}

void sub_1000834BC()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileNetworkCode:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_100083538()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "copyMobileCountryCode:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_1000835B4()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "getLocalizedOperatorName:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_100083630()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleValue:error: (CarrierName) in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_1000836AC()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "copyCarrierBundleVersion:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_100083728()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "getSimLabel:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_1000837A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100083820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008389C()
{
  sub_10003CA24();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "getPhoneNumber:error: in %s failed: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_100083918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, a3, "getPhoneNumber:error: in %s returned nil number", a5, a6, a7, a8, 2u);
}

void sub_100083994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000839D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100083A0C(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100007954();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v2, "getSubscriptionInfoWithError: in %{public}@ failed: %{public}@", v3, v4, v5, v6, v7);
}

void sub_100083AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100083AE0(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "subscription with duplicate slotId, discarding first instance", buf, 2u);
}

void sub_100083B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100083B60(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "equipmentInfo with duplicate slotId, discarding first instance", buf, 2u);
}

void sub_100083BA4()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Can't query for device locator lock state. Error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100083C14()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Can't query for activation lock state. Error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100083C84(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not disable lost mode: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100083D08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpected use of excludedIdentifiers", v1, 2u);
}

void sub_100083D4C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  CFStringRef v5 = @"com.apple.private.dmd.emergency-mode";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %{public}@ does not have required %{public}@ entitlement", (uint8_t *)&v2, 0x16u);
}

void sub_100083DD8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DMFEndTransactionRequest is deprecated please use DMDActivityTransactionOperation instead", v0, 2u);
}

void sub_100083E20(void *a1, void *a2)
{
  uint64_t v3 = [a1 organizationIdentifier];
  uint64_t v10 = [a2 verboseDescription];
  sub_10000E93C((void *)&_mh_execute_header, v4, v5, "failed to fetch existing organizations with identifier “%{public}@”: %{public}@", v6, v7, v8, v9, 2u);
}

void sub_100083ED4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "organization of type %{public}@ already exists", (uint8_t *)&v2, 0xCu);
}

void sub_100083F4C(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 verboseDescription];
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "failed to fetch organizations of type “%{public}@”: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100083FF0(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100084078(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100084104(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 verboseDescription];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "failed to remove legacy database: %{public}@", a1, 0xCu);
}

void sub_10008417C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not set persistent store backup flag %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100084230(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "successfully loaded persistent store: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000842A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "checking database for deprecated class", v1, 2u);
}

void sub_1000842EC()
{
  sub_10004437C();
  int v2 = [[(id)sub_100044370(v0, v1) verboseDescription];
  sub_10004434C();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@ failed to fetch configuration organizations: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100084378(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing operation failed to commit changes: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000843FC()
{
  sub_10004437C();
  uint64_t v2 = [[(id)sub_100044370(v0, v1) verboseDescription];
  sub_10004434C();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@ preprocessing failed: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100084488(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to preproccess database while fetching all payloads: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008450C()
{
  sub_10004437C();
  uint64_t v3 = [[(id)sub_100044370(v1, v2) verboseDescription];
  sub_10004434C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}@ failed to fetch configurations: %{public}@", v4, 0x16u);
}

void sub_1000845A8()
{
  sub_100007954();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ failed to resolve restrictions plist URL", v1, 0xCu);
}

void sub_10008461C()
{
  sub_10004437C();
  uint64_t v2 = [sub_100044370(v0, v1) verboseDescription];
  sub_10004434C();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "%{public}@ failed to write restrictions: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000846A8(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch commands to execute %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008472C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch commands to remove %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000847B0(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch commands to delete %{public}@", v4, v5, v6, v7, v8);
}

void sub_100084834()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "---", v2, v3, v4, v5, v6);
}

void sub_100084868()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Enqueued command action operations ---", v2, v3, v4, v5, v6);
}

void sub_10008489C()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Commands pending deletion ---", v2, v3, v4, v5, v6);
}

void sub_1000848D0()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Commands pending removal ---", v2, v3, v4, v5, v6);
}

void sub_100084904()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Commands pending execution ---", v2, v3, v4, v5, v6);
}

void sub_100084938(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to process activations: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000849BC(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch declarations pending removal %{public}@", v4, v5, v6, v7, v8);
}

void sub_100084A40(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch declarations pending install %{public}@", v4, v5, v6, v7, v8);
}

void sub_100084AC4(uint64_t a1)
{
  uint64_t v1 = [(id)sub_10003154C(a1) verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Processing: Failed to fetch declarations pending delete %{public}@", v4, v5, v6, v7, v8);
}

void sub_100084B48()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Enqueued declaration action operations ---", v2, v3, v4, v5, v6);
}

void sub_100084B7C()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Declarations pending deletion ---", v2, v3, v4, v5, v6);
}

void sub_100084BB0()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Declarations pending removal ---", v2, v3, v4, v5, v6);
}

void sub_100084BE4()
{
  sub_100044364();
  sub_100044330((void *)&_mh_execute_header, v0, v1, "--- Declarations pending install ---", v2, v3, v4, v5, v6);
}

void sub_100084C18(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 organizationIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch payload metadata for organization %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100084CB0(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 count];
  uint8_t v6 = [a2 organizationIdentifier];
  int v7 = 134218242;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Refreshed %lu status items for organization %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100084D6C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100084DF4(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to initialize declarations: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100084E7C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100084F04(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to instantiate payload metadata from payload dictionary: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100084F7C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 verboseDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to save changes: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100085014(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100085098(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations for update: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008511C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to initialize declarations for update: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000851A0(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Failed to fetch existing declarations for removal: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100085224(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown event stream frequency %{public}@, defaulting to Daily", (uint8_t *)&v2, 0xCu);
}

void sub_10008529C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "fetch-os-update-status end with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100085314(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Could not serialize profile: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100085398(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Could not retrieve restrictions dictionary from payload: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008541C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Could not process restriction heuristics for payload: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000854A0(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Could not apply restrictions: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100085524()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "The app store is not allowed, so we cannot invite to VPP", v0, 2u);
}

void sub_10008556C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid VPP invitation URL", v0, 2u);
}

void sub_1000855B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error writing manage app prompt policy data to file: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10008562C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error generating manage app prompt policy data from dictionary: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000856A4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected type of data stored in LastCloudBackupDate. Ignoring.", v0, 2u);
}

void sub_1000856EC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set device name with error %d", (uint8_t *)v1, 8u);
}

void sub_10008576C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000857A8()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Could not read device last location requested file: %@", v1, v2, v3, v4, v5);
}

void sub_100085818()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove device last located file: %@", v1, v2, v3, v4, v5);
}

void sub_100085888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003CA54((void *)&_mh_execute_header, &_os_log_default, a3, "Location Manager returned a location, but we can't report it because we can't record that fact. Throwing location information away.", a5, a6, a7, a8, 0);
}

void sub_1000858C4()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Location Manager failed: error=%{public}@", v1, v2, v3, v4, v5);
}

void sub_100085934()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Could not write device last located time interval URL resourve values: %@", v1, v2, v3, v4, v5);
}

void sub_1000859A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000859E0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion on managed books directory", v0, 2u);
}

void sub_100085A28()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot write book without persistent ID to manifest: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100085A98()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot write book without iTunes Store ID to manifest: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100085B08()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Cannot cancel downloads. Ignoring. Error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100085B78()
{
}

void sub_100085BA4(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 kind];
  sub_100007954();
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Replacing a book of kind %{public}@ with a book of kind %{public}@ is not allowed.", v4, 0x16u);
}

void sub_100085C48()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not find book in VPP purchase history.", v0, 2u);
}

void sub_100085C90()
{
  sub_100007954();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "We found a book, but it was not VPP-licensed. Book %{public}@", v0, 0xCu);
}

void sub_100085D0C()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, &_os_log_default, v0, "Could not look up book purchase history. Error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100085D7C(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup. Path does not exist.", (uint8_t *)&v1, 0xCu);
}

void sub_100085DFC(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 path];
  int v4 = 138543618;
  uint8_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100085EA4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 metadata];
  int v4 = [v3 bundleIdentifier];
  sub_100007954();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failing install app request because we are already prompting the user about bundle identifier: %{public}@", v5, 0xCu);
}

void sub_100085F50()
{
  sub_100028494();
  int v1 = [(id)sub_10005CEA8(v0) metadata];
  uint64_t v2 = [v1 bundleIdentifier];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Error associating app with persona: %{public}@, %{public}@", v5, v6, v7, v8, v9);
}

void sub_100085FEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008605C()
{
  sub_100028494();
  int v1 = [(id)sub_10005CEA8(v0) removable];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "Error attempting to set removability to %{public}@ Error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000860E8()
{
  sub_100028494();
  int v1 = [(id)sub_10005CEA8(v0) tapToPayScreenLock];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "Error attempting to set tap to pay screen lock to %{public}@ Error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100086174()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Error attempting SINF swap: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000861DC()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Invalid message format, error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100086244(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Show user installation failure prompt", v1, 2u);
}

void sub_100086288()
{
  sub_100028494();
  uint64_t v1 = +[DMFAppManagementInformation stringForState:v0];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100086320(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_10001B840();
  sub_10001B820((void *)&_mh_execute_header, v1, v2, "Could not update management info for bundle identifier: %{public}@, error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_100086390()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Error attempting to reset removability. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000863F8()
{
  sub_100007954();
  sub_10001FBD4((void *)&_mh_execute_header, v0, v1, "Error attempting to reset Tap To Pay Screen Lock. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100086460(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_10001B840();
  sub_10001B820((void *)&_mh_execute_header, v1, v2, "Error attempting to set removability to %{public}@ Error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_1000864D4(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_10001B840();
  sub_10001B820((void *)&_mh_execute_header, v1, v2, "Error attempting to set tapToPayControlLock to %{public}@ Error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_100086548(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Prompt to manage app %{public}@ blocked by policy. Too many requests.", (uint8_t *)&v3, 0xCu);
}

void sub_1000865C4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = +[DMFAppManagementInformation stringForState:a1];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100086680(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error attempting SINF swap: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000866F8()
{
  sub_10005E2D4();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Error attempting to set removability to %{public}@ Error: %{public}@");
}

void sub_100086764()
{
  sub_10005E2D4();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Error attempting to set tapToPayControlLock to %{public}@ Error: %{public}@");
}

void sub_1000867D0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get profile system group container path. Overriding with expected path", v0, 2u);
}

void sub_100086818()
{
  int v0 = 138543618;
  CFStringRef v1 = @"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
  __int16 v2 = 2114;
  uint64_t v3 = qword_1000FBB90;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Received a profile system group container path we weren't expecting\nExpected: %{public}@\nActual: %{public}@\nOverriding MCM with expected path", (uint8_t *)&v0, 0x16u);
}

void sub_1000868B4()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get managed books system group container", v0, 2u);
}

void sub_1000868FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting system group container for %{public}@: %llu", (uint8_t *)&v3, 0x16u);
}

void sub_10008698C(uint64_t a1, uint64_t a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "System group container for %{public}@ path is %{public}s", (uint8_t *)&v2, 0x16u);
}

void sub_100086A18(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch organization matching identifier (%{public}@): %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100086ACC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Payload has invalid type prefix (%{public}@) defaulting to generic payload metadata", (uint8_t *)&v2, 0xCu);
}

void sub_100086B44()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Can't get personal hotspot state: no dynamic store", v2, v3, v4, v5, v6);
}

void sub_100086B78()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Can't get personal hotspot state: no dictionary returned", v2, v3, v4, v5, v6);
}

void sub_100086BAC()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Can't set personal hotspot state: no netrbClient", v2, v3, v4, v5, v6);
}

void sub_100086BE0()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Setting personal hotspot state with _NETRBClientSetGlobalServiceState() failed!", v2, v3, v4, v5, v6);
}

void sub_100086C14(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not play sound in MDM Lost Mode: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100086C98(uint64_t a1, void *a2)
{
  int v2 = [a2 verboseDescription];
  sub_1000699A0();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Could not set persistent store backup flag %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100086D34()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "Could not load effective policy persistent store with error: %{public}@", v2);
}

void sub_100086DA0()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Could not load effective policy persistent store, the device is locked, unlock it and this should never happen again.", v2, v3, v4, v5, v6);
}

void sub_100086DD4(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error fetching existing policy registration: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100086E58(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 verboseDescription];
  sub_1000699A0();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Error saving policy registration %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100086EF4(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error loading persistent store: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100086F78(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error recalculating effectivePolicy for type %{public}@: %{public}@", buf, 0x16u);
}

void sub_100086FE0(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error fetching existing policy by type: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100087064()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "Failed fetching categories for bundle identifiers with error: %{public}@", v2);
}

void sub_1000870D0()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "Failed fetching categories for websites with error: %{public}@", v2);
}

void sub_10008713C(uint8_t *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = DMFPolicyUnlocalizedDisplayName();
  *(_DWORD *)a1 = 138543362;
  *a2 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Requested website URL does not have a host, marking policy %{public}@", a1, 0xCu);
}

void sub_1000871B4()
{
  sub_100044364();
  sub_10003CA54((void *)&_mh_execute_header, v0, v1, "Categories lookup timed out", v2, v3, v4, v5, v6);
}

void sub_1000871E8(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error fetching existing policies: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10008726C(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error saving policies: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000872F0(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error fetching orphanied policies: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100087374(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 verboseDescription];
  sub_1000699A0();
  sub_10000E93C((void *)&_mh_execute_header, v3, v4, "Error recalculating effectivePolicy for types %{public}@: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100087410(void *a1)
{
  uint64_t v1 = [a1 verboseDescription];
  sub_100007954();
  sub_100007934((void *)&_mh_execute_header, v2, v3, "Error fetching registrations to notify: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100087494()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "Failed to enable Emergency Mode because end date %@{public}@ is in the past", v2);
}

void sub_100087500()
{
  sub_100007954();
  sub_100031520((void *)&_mh_execute_header, v0, v1, "Failed to enable Emergency Mode because end date %@{public}@ does not have a positive Unix Epoch time", v2);
}

void sub_10008756C()
{
  sub_100044364();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Emergency Mode does not have an end date", v1, 2u);
}

void sub_1000875AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %@ does not have required com.apple.private.dmd.policy entitlement", (uint8_t *)&v2, 0xCu);
}

void sub_100087624(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Found supported vinyl record: %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000876A4(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Fetched vinylInfo response = %@", (uint8_t *)&v1, 0xCu);
}

void sub_100087724(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to retrieve vinylInfo response = %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000877A4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unable to register configuration source because client doesn't have a valid entitlement for application-identifier", v1, 2u);
}

void sub_1000877E8()
{
  sub_10005E2D4();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove app removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10008785C()
{
  sub_10005E2D4();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove app tap to pay lock screen flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_1000878D0()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove mapping to persona for for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087940()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove management information for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_1000879B0()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove configuration for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087A20()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove allow user to lock flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087A90()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove allow user to hide flag for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087B00()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove associated domains enable direct downloads for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087B70()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove associated domains for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087BE0()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove relay UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087C50()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove DNS proxy UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087CC0()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove content filter UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087D30()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove CellularSlice UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087DA0()
{
  sub_10006C2C8(__stack_chk_guard);
  sub_10006C2B0();
  sub_10003CA38((void *)&_mh_execute_header, &_os_log_default, v0, "Could not remove VPN UUID for bundle identifier: %{bundleIdentifier}@, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100087E10(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 verboseDescription];
  int v4 = 138543362;
  uint8_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not remove restrictions: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100087EA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "remove-os-update end with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100087F20(void *a1)
{
  int v1 = 134217984;
  id v2 = [a1 authenticateResponseType];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "User failed to log into iTunes account. Reason code: %ld", (uint8_t *)&v1, 0xCu);
}

void sub_100087FA4()
{
}

void sub_100087FD0()
{
}

void sub_100087FFC()
{
}

void sub_100088028()
{
  sub_10005E2D4();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not remove app removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@");
}

void sub_100088094()
{
  sub_10005E2D4();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not remove UserManagement persona mapping for app %{public}@, error: %{public}@");
}

void sub_100088100()
{
  sub_10005E2D4();
  sub_10001B820((void *)&_mh_execute_header, v0, v1, "Could not remove app tap to pay screen lock setting for bundle identifier: %{bundleIdentifier}@, error: %{public}@");
}

void sub_10008816C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "remove software update failed: no error returned", v0, 2u);
}

void sub_1000881B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 40);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "remove software update failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10008823C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "remove software update started", v0, 2u);
}

void sub_100088284(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 40);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "could not get current software update status: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10008830C(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Operation did finish: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_10008838C(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) removable];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "Error attempting to set removability to %{public}@ Error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100088420(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) tapToPayScreenLock];
  sub_10005CE90();
  sub_10000E93C((void *)&_mh_execute_header, v2, v3, "Error attempting to set tapToPayScreenLock to %{public}@ Error:%{public}@", v4, v5, v6, v7, v8);
}

void sub_1000884B4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Show user update failure prompt", v1, 2u);
}

void sub_1000884F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[DMFAppManagementInformation stringForState:a1];
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not mark app state as %{public}@ for bundle identifier: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000885AC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get notification ref for user notification.", v0, 2u);
}

void sub_1000885F4(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get run loop source for user notification: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_100088674(uint8_t *buf, int *a2, _DWORD *a3)
{
  int v3 = *a2;
  *(_DWORD *)buf = 67109120;
  *a3 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Cannot create alert. Error: %d", buf, 8u);
}

void sub_1000886C4(uint8_t *buf, unsigned char *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Cannot display alert: can't create run loop source.", buf, 2u);
}

void sub_100088708()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not get file information", v0, 2u);
}

void sub_100088750()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Memory mapping failed", v0, 2u);
}

void sub_100088798()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
}

uint64_t CATGetCatalystQueue()
{
  return _CATGetCatalystQueue();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return _CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
}

uint64_t CTSubscriptionSlotAsString()
{
  return _CTSubscriptionSlotAsString();
}

uint64_t DMFAllConfigurationOrganizationTypes()
{
  return _DMFAllConfigurationOrganizationTypes();
}

uint64_t DMFAppLog()
{
  return _DMFAppLog();
}

uint64_t DMFConfigurationEngineLog()
{
  return _DMFConfigurationEngineLog();
}

uint64_t DMFConfigurationSourceClientXPCInterface()
{
  return _DMFConfigurationSourceClientXPCInterface();
}

uint64_t DMFEmergencyModeLog()
{
  return _DMFEmergencyModeLog();
}

uint64_t DMFErrorWithCodeAndUserInfo()
{
  return _DMFErrorWithCodeAndUserInfo();
}

uint64_t DMFOSUpdateLog()
{
  return _DMFOSUpdateLog();
}

uint64_t DMFObjectDescription()
{
  return _DMFObjectDescription();
}

uint64_t DMFObjectDescriptionWithProperties()
{
  return _DMFObjectDescriptionWithProperties();
}

uint64_t DMFPersonalHotspotLog()
{
  return _DMFPersonalHotspotLog();
}

uint64_t DMFPolicyLog()
{
  return _DMFPolicyLog();
}

uint64_t DMFPolicyUnlocalizedDisplayName()
{
  return _DMFPolicyUnlocalizedDisplayName();
}

uint64_t DMFServerLog()
{
  return _DMFServerLog();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t MCHasMDMMigrated()
{
  return _MCHasMDMMigrated();
}

uint64_t MCIsEffectivelyInAppWhitelistMode()
{
  return _MCIsEffectivelyInAppWhitelistMode();
}

uint64_t MCSendDiagnosticsCollectedNotification()
{
  return _MCSendDiagnosticsCollectedNotification();
}

uint64_t MCSendManagedBooksChangedNotification()
{
  return _MCSendManagedBooksChangedNotification();
}

uint64_t MCStringForBool()
{
  return _MCStringForBool();
}

uint64_t MCUSEnglishNumberFormatter()
{
  return _MCUSEnglishNumberFormatter();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MISAppApprovalState()
{
  return _MISAppApprovalState();
}

uint64_t MISCopyProvisioningProfile()
{
  return _MISCopyProvisioningProfile();
}

uint64_t MISProvisioningProfileGetExpirationDate()
{
  return _MISProvisioningProfileGetExpirationDate();
}

uint64_t MISProvisioningProfileGetName()
{
  return _MISProvisioningProfileGetName();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return _MISProvisioningProfileGetUUID();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return _MRAVOutputContextCopyOutputDevices();
}

uint64_t MRAVOutputDeviceCopyMACAddress()
{
  return _MRAVOutputDeviceCopyMACAddress();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return _MRAVOutputDeviceCopyName();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return _MRAVOutputDeviceCopyUniqueIdentifier();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return _MRAVReconnaissanceSessionBeginSearch();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return _MRAVReconnaissanceSessionCreateWithEndpointFeatures();
}

uint64_t MRAVReconnaissanceSessionSetUseWeakMatching()
{
  return _MRAVReconnaissanceSessionSetUseWeakMatching();
}

uint64_t MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback()
{
  return _MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
}

uint64_t MRAVRoutingDiscoverySessionCreate()
{
  return _MRAVRoutingDiscoverySessionCreate();
}

uint64_t MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback()
{
  return _MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
}

uint64_t MRAVRoutingDiscoverySessionSetDiscoveryMode()
{
  return _MRAVRoutingDiscoverySessionSetDiscoveryMode();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

uint64_t SecCertificateCopyCommonNames()
{
  return _SecCertificateCopyCommonNames();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateGetBytePtr()
{
  return _SecCertificateGetBytePtr();
}

uint64_t SecCertificateGetLength()
{
  return _SecCertificateGetLength();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return _SecIdentityGetTypeID();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return __CFPreferencesAppSynchronizeWithContainer();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return __CFPreferencesCopyAppValueWithContainer();
}

uint64_t _CFPreferencesCopyPathForManagedDomain()
{
  return __CFPreferencesCopyPathForManagedDomain();
}

uint64_t _CFPreferencesManagementStatusChangedForDomains()
{
  return __CFPreferencesManagementStatusChangedForDomains();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return __CFPreferencesPostValuesChangedInDomains();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return __CFPreferencesSetAppValueWithContainer();
}

uint64_t _CFPreferencesWriteManagedDomain()
{
  return __CFPreferencesWriteManagedDomain();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CTServerConnectionCopyFirmwareVersion()
{
  return __CTServerConnectionCopyFirmwareVersion();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionGetEnableOnlyHomeNetwork()
{
  return __CTServerConnectionGetEnableOnlyHomeNetwork();
}

uint64_t _CTServerConnectionSendBarrier()
{
  return __CTServerConnectionSendBarrier();
}

uint64_t _CTServerConnectionSetEnableOnlyHomeNetwork()
{
  return __CTServerConnectionSetEnableOnlyHomeNetwork();
}

uint64_t _CTServerConnectionStandaloneDownloadProfile()
{
  return __CTServerConnectionStandaloneDownloadProfile();
}

uint64_t _CTServerConnectionStandaloneGetCachedVinylInfo()
{
  return __CTServerConnectionStandaloneGetCachedVinylInfo();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientDestroy()
{
  return __NETRBClientDestroy();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return __NETRBClientSetGlobalServiceState();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t container_acquire_sandbox_extension()
{
  return _container_acquire_sandbox_extension();
}

uint64_t container_copy_path()
{
  return _container_copy_path();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return _container_create_or_lookup_for_current_user();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return _ether_aton(a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t lockdown_connect()
{
  return _lockdown_connect();
}

uint64_t lockdown_copy_value()
{
  return _lockdown_copy_value();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_set_value()
{
  return _lockdown_set_value();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t rootless_convert_to_datavault()
{
  return _rootless_convert_to_datavault();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t xpc_copy_event()
{
  return _xpc_copy_event();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_date(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_CSN(void *a1, const char *a2, ...)
{
  return [a1 CSN];
}

id objc_msgSend_DNSProxyUUIDString(void *a1, const char *a2, ...)
{
  return [a1 DNSProxyUUIDString];
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_ICCID(void *a1, const char *a2, ...)
{
  return [a1 ICCID];
}

id objc_msgSend_IMEI(void *a1, const char *a2, ...)
{
  return [a1 IMEI];
}

id objc_msgSend_MCMutableDeepCopy(void *a1, const char *a2, ...)
{
  return [a1 MCMutableDeepCopy];
}

id objc_msgSend_MEID(void *a1, const char *a2, ...)
{
  return [a1 MEID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_VPNUUIDString(void *a1, const char *a2, ...)
{
  return [a1 VPNUUIDString];
}

id objc_msgSend__allPropertyKeys(void *a1, const char *a2, ...)
{
  return [a1 _allPropertyKeys];
}

id objc_msgSend__attemptSINFSwap(void *a1, const char *a2, ...)
{
  return [a1 _attemptSINFSwap];
}

id objc_msgSend__cleanUpStaleManagementStatesAndStartObservingApps(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpStaleManagementStatesAndStartObservingApps];
}

id objc_msgSend__cleanupAfterResponseFromLocationManagerOrTimeout(void *a1, const char *a2, ...)
{
  return [a1 _cleanupAfterResponseFromLocationManagerOrTimeout];
}

id objc_msgSend__cleanupOrphanedPolicies(void *a1, const char *a2, ...)
{
  return [a1 _cleanupOrphanedPolicies];
}

id objc_msgSend__datesForNextCurfewBoundary(void *a1, const char *a2, ...)
{
  return [a1 _datesForNextCurfewBoundary];
}

id objc_msgSend__getRequiredAppIDFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _getRequiredAppIDFromDisk];
}

id objc_msgSend__intersectionAliasToFeatures(void *a1, const char *a2, ...)
{
  return [a1 _intersectionAliasToFeatures];
}

id objc_msgSend__isInTransitoryState(void *a1, const char *a2, ...)
{
  return [a1 _isInTransitoryState];
}

id objc_msgSend__isStale(void *a1, const char *a2, ...)
{
  return [a1 _isStale];
}

id objc_msgSend__lifeCycleByBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _lifeCycleByBundleIdentifier];
}

id objc_msgSend__manageApp(void *a1, const char *a2, ...)
{
  return [a1 _manageApp];
}

id objc_msgSend__managedNonStoreBooksSystemGroupContainer(void *a1, const char *a2, ...)
{
  return [a1 _managedNonStoreBooksSystemGroupContainer];
}

id objc_msgSend__metadataByBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _metadataByBundleIdentifier];
}

id objc_msgSend__newMetadataDictionary(void *a1, const char *a2, ...)
{
  return [a1 _newMetadataDictionary];
}

id objc_msgSend__now(void *a1, const char *a2, ...)
{
  return [a1 _now];
}

id objc_msgSend__registerEventStreamHandlers(void *a1, const char *a2, ...)
{
  return [a1 _registerEventStreamHandlers];
}

id objc_msgSend__registerPredicateObserver(void *a1, const char *a2, ...)
{
  return [a1 _registerPredicateObserver];
}

id objc_msgSend__resetTapToPayScreenLock(void *a1, const char *a2, ...)
{
  return [a1 _resetTapToPayScreenLock];
}

id objc_msgSend__sendAppStatusChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendAppStatusChangeNotification];
}

id objc_msgSend__showInstallationFailurePromptIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _showInstallationFailurePromptIfNeeded];
}

id objc_msgSend__showNextNotification(void *a1, const char *a2, ...)
{
  return [a1 _showNextNotification];
}

id objc_msgSend__specialCasedRequestNamesToOperationNames(void *a1, const char *a2, ...)
{
  return [a1 _specialCasedRequestNamesToOperationNames];
}

id objc_msgSend__storeAppFormat(void *a1, const char *a2, ...)
{
  return [a1 _storeAppFormat];
}

id objc_msgSend__storeLoginFailedError(void *a1, const char *a2, ...)
{
  return [a1 _storeLoginFailedError];
}

id objc_msgSend__supportsVoiceRoaming(void *a1, const char *a2, ...)
{
  return [a1 _supportsVoiceRoaming];
}

id objc_msgSend__systemProfileLibraryDirectory(void *a1, const char *a2, ...)
{
  return [a1 _systemProfileLibraryDirectory];
}

id objc_msgSend__systemProfileStorageDirectory(void *a1, const char *a2, ...)
{
  return [a1 _systemProfileStorageDirectory];
}

id objc_msgSend__testEvent(void *a1, const char *a2, ...)
{
  return [a1 _testEvent];
}

id objc_msgSend__timestampDataForWritingToFile(void *a1, const char *a2, ...)
{
  return [a1 _timestampDataForWritingToFile];
}

id objc_msgSend__timestampDictionaryForWritingToFile(void *a1, const char *a2, ...)
{
  return [a1 _timestampDictionaryForWritingToFile];
}

id objc_msgSend__updateAllActivationPredicateObserverRegistrations(void *a1, const char *a2, ...)
{
  return [a1 _updateAllActivationPredicateObserverRegistrations];
}

id objc_msgSend__userDirectory(void *a1, const char *a2, ...)
{
  return [a1 _userDirectory];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activationPredicateObserverManager(void *a1, const char *a2, ...)
{
  return [a1 activationPredicateObserverManager];
}

id objc_msgSend_activationPredicateObserversByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activationPredicateObserversByIdentifier];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return [a1 active];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_activeRestrictionsURL(void *a1, const char *a2, ...)
{
  return [a1 activeRestrictionsURL];
}

id objc_msgSend_activeSyncDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activeSyncDeviceIdentifier];
}

id objc_msgSend_addCommands(void *a1, const char *a2, ...)
{
  return [a1 addCommands];
}

id objc_msgSend_advanceTransientStates(void *a1, const char *a2, ...)
{
  return [a1 advanceTransientStates];
}

id objc_msgSend_alarms(void *a1, const char *a2, ...)
{
  return [a1 alarms];
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return [a1 all];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return [a1 allUsers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowFreePurchases(void *a1, const char *a2, ...)
{
  return [a1 allowFreePurchases];
}

id objc_msgSend_allowUserToHide(void *a1, const char *a2, ...)
{
  return [a1 allowUserToHide];
}

id objc_msgSend_allowUserToLock(void *a1, const char *a2, ...)
{
  return [a1 allowUserToLock];
}

id objc_msgSend_alternateButtonText(void *a1, const char *a2, ...)
{
  return [a1 alternateButtonText];
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 alternateButtonTitle];
}

id objc_msgSend_anonymousEndpoint(void *a1, const char *a2, ...)
{
  return [a1 anonymousEndpoint];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appWhitelistState(void *a1, const char *a2, ...)
{
  return [a1 appWhitelistState];
}

id objc_msgSend_applicationCategories(void *a1, const char *a2, ...)
{
  return [a1 applicationCategories];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_applications(void *a1, const char *a2, ...)
{
  return [a1 applications];
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifier];
}

id objc_msgSend_assetProvidersByPayloadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 assetProvidersByPayloadIdentifier];
}

id objc_msgSend_assetReference(void *a1, const char *a2, ...)
{
  return [a1 assetReference];
}

id objc_msgSend_assetReferences(void *a1, const char *a2, ...)
{
  return [a1 assetReferences];
}

id objc_msgSend_assetResolver(void *a1, const char *a2, ...)
{
  return [a1 assetResolver];
}

id objc_msgSend_associatedDomains(void *a1, const char *a2, ...)
{
  return [a1 associatedDomains];
}

id objc_msgSend_associatedDomainsEnableDirectDownloads(void *a1, const char *a2, ...)
{
  return [a1 associatedDomainsEnableDirectDownloads];
}

id objc_msgSend_authenticateResponseType(void *a1, const char *a2, ...)
{
  return [a1 authenticateResponseType];
}

id objc_msgSend_authenticatedAccount(void *a1, const char *a2, ...)
{
  return [a1 authenticatedAccount];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_autoInstallOperation(void *a1, const char *a2, ...)
{
  return [a1 autoInstallOperation];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_blockingTask(void *a1, const char *a2, ...)
{
  return [a1 blockingTask];
}

id objc_msgSend_bluetoothManager(void *a1, const char *a2, ...)
{
  return [a1 bluetoothManager];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDsToAssertions(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsToAssertions];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleIdentifierPolicyCache(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifierPolicyCache];
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifiers];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_buyParams(void *a1, const char *a2, ...)
{
  return [a1 buyParams];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_categoryIdentifierPolicyCache(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifierPolicyCache];
}

id objc_msgSend_categoryShieldPolicies(void *a1, const char *a2, ...)
{
  return [a1 categoryShieldPolicies];
}

id objc_msgSend_cellularSliceUUIDString(void *a1, const char *a2, ...)
{
  return [a1 cellularSliceUUIDString];
}

id objc_msgSend_certificatePersistentID(void *a1, const char *a2, ...)
{
  return [a1 certificatePersistentID];
}

id objc_msgSend_changedValues(void *a1, const char *a2, ...)
{
  return [a1 changedValues];
}

id objc_msgSend_clearLastLocationRequestedDate(void *a1, const char *a2, ...)
{
  return [a1 clearLastLocationRequestedDate];
}

id objc_msgSend_clearStoredActivationLockBypassCode(void *a1, const char *a2, ...)
{
  return [a1 clearStoredActivationLockBypassCode];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientBundleIdentifier];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_clientUserInfo(void *a1, const char *a2, ...)
{
  return [a1 clientUserInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_completionsByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 completionsByIdentifier];
}

id objc_msgSend_concurrentOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 concurrentOperationQueue];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationEngine(void *a1, const char *a2, ...)
{
  return [a1 configurationEngine];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_configurationProfilesSystemGroupContainer(void *a1, const char *a2, ...)
{
  return [a1 configurationProfilesSystemGroupContainer];
}

id objc_msgSend_configurationSource(void *a1, const char *a2, ...)
{
  return [a1 configurationSource];
}

id objc_msgSend_configurationSourceControllers(void *a1, const char *a2, ...)
{
  return [a1 configurationSourceControllers];
}

id objc_msgSend_configurationSourceName(void *a1, const char *a2, ...)
{
  return [a1 configurationSourceName];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contentFilterUUIDString(void *a1, const char *a2, ...)
{
  return [a1 contentFilterUUIDString];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextForSignIn(void *a1, const char *a2, ...)
{
  return [a1 contextForSignIn];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDevicePropertyKeys(void *a1, const char *a2, ...)
{
  return [a1 currentDevicePropertyKeys];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRestrictions(void *a1, const char *a2, ...)
{
  return [a1 currentRestrictions];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentStateName(void *a1, const char *a2, ...)
{
  return [a1 currentStateName];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_currentlyPickedDestinationDeviceID(void *a1, const char *a2, ...)
{
  return [a1 currentlyPickedDestinationDeviceID];
}

id objc_msgSend_currentlyPickedDestinationName(void *a1, const char *a2, ...)
{
  return [a1 currentlyPickedDestinationName];
}

id objc_msgSend_dataQuota(void *a1, const char *a2, ...)
{
  return [a1 dataQuota];
}

id objc_msgSend_dataRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 dataRoamingEnabled];
}

id objc_msgSend_dataUsed(void *a1, const char *a2, ...)
{
  return [a1 dataUsed];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseInitializationOperation(void *a1, const char *a2, ...)
{
  return [a1 databaseInitializationOperation];
}

id objc_msgSend_databaseInitializationOperationDidFinish(void *a1, const char *a2, ...)
{
  return [a1 databaseInitializationOperationDidFinish];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 declarationIdentifier];
}

id objc_msgSend_declarationServerHash(void *a1, const char *a2, ...)
{
  return [a1 declarationServerHash];
}

id objc_msgSend_declarations(void *a1, const char *a2, ...)
{
  return [a1 declarations];
}

id objc_msgSend_defaultButtonText(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonText];
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultProductKey(void *a1, const char *a2, ...)
{
  return [a1 defaultProductKey];
}

id objc_msgSend_defaultRestrictions(void *a1, const char *a2, ...)
{
  return [a1 defaultRestrictions];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateDidResume(void *a1, const char *a2, ...)
{
  return [a1 delegateDidResume];
}

id objc_msgSend_delegateWillSuspend(void *a1, const char *a2, ...)
{
  return [a1 delegateWillSuspend];
}

id objc_msgSend_deleteFeedback(void *a1, const char *a2, ...)
{
  return [a1 deleteFeedback];
}

id objc_msgSend_denyiCloudLogout(void *a1, const char *a2, ...)
{
  return [a1 denyiCloudLogout];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return [a1 dependencies];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptiveProperties(void *a1, const char *a2, ...)
{
  return [a1 descriptiveProperties];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_destinationDeviceID(void *a1, const char *a2, ...)
{
  return [a1 destinationDeviceID];
}

id objc_msgSend_destinationName(void *a1, const char *a2, ...)
{
  return [a1 destinationName];
}

id objc_msgSend_destroyLegacyDatabaseIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 destroyLegacyDatabaseIfNeeded];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceInfoDeviceChannelKeys(void *a1, const char *a2, ...)
{
  return [a1 deviceInfoDeviceChannelKeys];
}

id objc_msgSend_deviceInfoRMDKeys(void *a1, const char *a2, ...)
{
  return [a1 deviceInfoRMDKeys];
}

id objc_msgSend_deviceStateObserver(void *a1, const char *a2, ...)
{
  return [a1 deviceStateObserver];
}

id objc_msgSend_deviceStateProvider(void *a1, const char *a2, ...)
{
  return [a1 deviceStateProvider];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didCancelInstalling(void *a1, const char *a2, ...)
{
  return [a1 didCancelInstalling];
}

id objc_msgSend_didCancelUpdating(void *a1, const char *a2, ...)
{
  return [a1 didCancelUpdating];
}

id objc_msgSend_didChangeInstallingProgress(void *a1, const char *a2, ...)
{
  return [a1 didChangeInstallingProgress];
}

id objc_msgSend_didChangeUpdatingProgress(void *a1, const char *a2, ...)
{
  return [a1 didChangeUpdatingProgress];
}

id objc_msgSend_didFailInstalling(void *a1, const char *a2, ...)
{
  return [a1 didFailInstalling];
}

id objc_msgSend_didFailUninstalling(void *a1, const char *a2, ...)
{
  return [a1 didFailUninstalling];
}

id objc_msgSend_didFailUpdating(void *a1, const char *a2, ...)
{
  return [a1 didFailUpdating];
}

id objc_msgSend_didFinishInstalling(void *a1, const char *a2, ...)
{
  return [a1 didFinishInstalling];
}

id objc_msgSend_didFinishUninstalling(void *a1, const char *a2, ...)
{
  return [a1 didFinishUninstalling];
}

id objc_msgSend_didFinishUpdating(void *a1, const char *a2, ...)
{
  return [a1 didFinishUpdating];
}

id objc_msgSend_didPauseInstalling(void *a1, const char *a2, ...)
{
  return [a1 didPauseInstalling];
}

id objc_msgSend_didPauseUpdating(void *a1, const char *a2, ...)
{
  return [a1 didPauseUpdating];
}

id objc_msgSend_didPromptUser(void *a1, const char *a2, ...)
{
  return [a1 didPromptUser];
}

id objc_msgSend_didResetState(void *a1, const char *a2, ...)
{
  return [a1 didResetState];
}

id objc_msgSend_didResumeInstalling(void *a1, const char *a2, ...)
{
  return [a1 didResumeInstalling];
}

id objc_msgSend_didResumeUpdating(void *a1, const char *a2, ...)
{
  return [a1 didResumeUpdating];
}

id objc_msgSend_didStartInstalling(void *a1, const char *a2, ...)
{
  return [a1 didStartInstalling];
}

id objc_msgSend_didStartUpdating(void *a1, const char *a2, ...)
{
  return [a1 didStartUpdating];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_dismissAfterTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 dismissAfterTimeInterval];
}

id objc_msgSend_displayCSN(void *a1, const char *a2, ...)
{
  return [a1 displayCSN];
}

id objc_msgSend_displayInAppWhitelistModes(void *a1, const char *a2, ...)
{
  return [a1 displayInAppWhitelistModes];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayOnLockScreen(void *a1, const char *a2, ...)
{
  return [a1 displayOnLockScreen];
}

id objc_msgSend_displayWhenLocked(void *a1, const char *a2, ...)
{
  return [a1 displayWhenLocked];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distributedNotificationNames(void *a1, const char *a2, ...)
{
  return [a1 distributedNotificationNames];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return [a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return [a1 distributorInfo];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_download(void *a1, const char *a2, ...)
{
  return [a1 download];
}

id objc_msgSend_downloadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 downloadIdentifier];
}

id objc_msgSend_downloadPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 downloadPercentComplete];
}

id objc_msgSend_downloadPhaseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 downloadPhaseIdentifier];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return [a1 downloads];
}

id objc_msgSend_downtimeCategoryIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 downtimeCategoryIdentifiers];
}

id objc_msgSend_downtimeEnforced(void *a1, const char *a2, ...)
{
  return [a1 downtimeEnforced];
}

id objc_msgSend_dynamicUsage(void *a1, const char *a2, ...)
{
  return [a1 dynamicUsage];
}

id objc_msgSend_eSIMServerURL(void *a1, const char *a2, ...)
{
  return [a1 eSIMServerURL];
}

id objc_msgSend_echo(void *a1, const char *a2, ...)
{
  return [a1 echo];
}

id objc_msgSend_effectivePolicyCache(void *a1, const char *a2, ...)
{
  return [a1 effectivePolicyCache];
}

id objc_msgSend_effectiveSettingsStore(void *a1, const char *a2, ...)
{
  return [a1 effectiveSettingsStore];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_effectiveWhitelistedAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 effectiveWhitelistedAppBundleIDs];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_emergencyModeListener(void *a1, const char *a2, ...)
{
  return [a1 emergencyModeListener];
}

id objc_msgSend_emergencyModeQueue(void *a1, const char *a2, ...)
{
  return [a1 emergencyModeQueue];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endDay(void *a1, const char *a2, ...)
{
  return [a1 endDay];
}

id objc_msgSend_endHour(void *a1, const char *a2, ...)
{
  return [a1 endHour];
}

id objc_msgSend_endMinute(void *a1, const char *a2, ...)
{
  return [a1 endMinute];
}

id objc_msgSend_endSecond(void *a1, const char *a2, ...)
{
  return [a1 endSecond];
}

id objc_msgSend_enforcedSoftwareUpdateDelayInDays(void *a1, const char *a2, ...)
{
  return [a1 enforcedSoftwareUpdateDelayInDays];
}

id objc_msgSend_enqueueDeclarationProcessingOperationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 enqueueDeclarationProcessingOperationIfNeeded];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_enumeratorForOrdinaryApps(void *a1, const char *a2, ...)
{
  return [a1 enumeratorForOrdinaryApps];
}

id objc_msgSend_enumeratorForSystemAppPlaceholders(void *a1, const char *a2, ...)
{
  return [a1 enumeratorForSystemAppPlaceholders];
}

id objc_msgSend_enumeratorForUserAppPlaceholders(void *a1, const char *a2, ...)
{
  return [a1 enumeratorForUserAppPlaceholders];
}

id objc_msgSend_ephemeralConfigurationSourceControllersByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 ephemeralConfigurationSourceControllersByIdentifier];
}

id objc_msgSend_ephemeralConfigurationSources(void *a1, const char *a2, ...)
{
  return [a1 ephemeralConfigurationSources];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_equivalentBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 equivalentBundleIdentifiers];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorsByPropertyKey(void *a1, const char *a2, ...)
{
  return [a1 errorsByPropertyKey];
}

id objc_msgSend_errorsForKeys(void *a1, const char *a2, ...)
{
  return [a1 errorsForKeys];
}

id objc_msgSend_eventIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 eventIdentifiers];
}

id objc_msgSend_eventStreamByEventType(void *a1, const char *a2, ...)
{
  return [a1 eventStreamByEventType];
}

id objc_msgSend_eventSubscriptionManager(void *a1, const char *a2, ...)
{
  return [a1 eventSubscriptionManager];
}

id objc_msgSend_eventSubscriptionsByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventSubscriptionsByIdentifier];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_eventsHandler(void *a1, const char *a2, ...)
{
  return [a1 eventsHandler];
}

id objc_msgSend_excludedBoolRestrictions(void *a1, const char *a2, ...)
{
  return [a1 excludedBoolRestrictions];
}

id objc_msgSend_excludedContent(void *a1, const char *a2, ...)
{
  return [a1 excludedContent];
}

id objc_msgSend_excludedIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 excludedIdentifiers];
}

id objc_msgSend_expiredNotificationTimes(void *a1, const char *a2, ...)
{
  return [a1 expiredNotificationTimes];
}

id objc_msgSend_externalVersionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalVersionIdentifier];
}

id objc_msgSend_failureError(void *a1, const char *a2, ...)
{
  return [a1 failureError];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filterFlags(void *a1, const char *a2, ...)
{
  return [a1 filterFlags];
}

id objc_msgSend_filterQueryForScope(void *a1, const char *a2, ...)
{
  return [a1 filterQueryForScope];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontDeclaration(void *a1, const char *a2, ...)
{
  return [a1 fontDeclaration];
}

id objc_msgSend_fontURL(void *a1, const char *a2, ...)
{
  return [a1 fontURL];
}

id objc_msgSend_footnote(void *a1, const char *a2, ...)
{
  return [a1 footnote];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return [a1 force];
}

id objc_msgSend_forceDeletion(void *a1, const char *a2, ...)
{
  return [a1 forceDeletion];
}

id objc_msgSend_foregroundBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 foregroundBundleIdentifiers];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return [a1 friendlyName];
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return [a1 fullPath];
}

id objc_msgSend_hasAppleInternalInstallCapability(void *a1, const char *a2, ...)
{
  return [a1 hasAppleInternalInstallCapability];
}

id objc_msgSend_hasCDMA(void *a1, const char *a2, ...)
{
  return [a1 hasCDMA];
}

id objc_msgSend_hasCellularDataCapability(void *a1, const char *a2, ...)
{
  return [a1 hasCellularDataCapability];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasDataToSync(void *a1, const char *a2, ...)
{
  return [a1 hasDataToSync];
}

id objc_msgSend_hasGSM(void *a1, const char *a2, ...)
{
  return [a1 hasGSM];
}

id objc_msgSend_hasKeychainUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 hasKeychainUnlockedSinceBoot];
}

id objc_msgSend_hasPersonalHotspotCapability(void *a1, const char *a2, ...)
{
  return [a1 hasPersonalHotspotCapability];
}

id objc_msgSend_hasTelephonyCapability(void *a1, const char *a2, ...)
{
  return [a1 hasTelephonyCapability];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_homeSharingCloudClient(void *a1, const char *a2, ...)
{
  return [a1 homeSharingCloudClient];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableUpdateName];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_iTunesStoreID(void *a1, const char *a2, ...)
{
  return [a1 iTunesStoreID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_imageDeclaration(void *a1, const char *a2, ...)
{
  return [a1 imageDeclaration];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return [a1 imageURL];
}

id objc_msgSend_inEDUMode(void *a1, const char *a2, ...)
{
  return [a1 inEDUMode];
}

id objc_msgSend_inReplyTo(void *a1, const char *a2, ...)
{
  return [a1 inReplyTo];
}

id objc_msgSend_includeInternalState(void *a1, const char *a2, ...)
{
  return [a1 includeInternalState];
}

id objc_msgSend_includePayloadContents(void *a1, const char *a2, ...)
{
  return [a1 includePayloadContents];
}

id objc_msgSend_incomingPayloadMetadataReferences(void *a1, const char *a2, ...)
{
  return [a1 incomingPayloadMetadataReferences];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return [a1 initPrivate];
}

id objc_msgSend_initializationError(void *a1, const char *a2, ...)
{
  return [a1 initializationError];
}

id objc_msgSend_initializationOperation(void *a1, const char *a2, ...)
{
  return [a1 initializationOperation];
}

id objc_msgSend_installMetadata(void *a1, const char *a2, ...)
{
  return [a1 installMetadata];
}

id objc_msgSend_installProgress(void *a1, const char *a2, ...)
{
  return [a1 installProgress];
}

id objc_msgSend_installState(void *a1, const char *a2, ...)
{
  return [a1 installState];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_installationSize(void *a1, const char *a2, ...)
{
  return [a1 installationSize];
}

id objc_msgSend_installed(void *a1, const char *a2, ...)
{
  return [a1 installed];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_internalContext(void *a1, const char *a2, ...)
{
  return [a1 internalContext];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAdHocCodeSigned(void *a1, const char *a2, ...)
{
  return [a1 isAdHocCodeSigned];
}

id objc_msgSend_isAppAnalyticsAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAppAnalyticsAllowed];
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return [a1 isAppStoreVendable];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_isAsynchronous(void *a1, const char *a2, ...)
{
  return [a1 isAsynchronous];
}

id objc_msgSend_isAutoDownload(void *a1, const char *a2, ...)
{
  return [a1 isAutoDownload];
}

id objc_msgSend_isAwaitingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 isAwaitingConfiguration];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return [a1 isBetaApp];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isDeviceBasedVPP(void *a1, const char *a2, ...)
{
  return [a1 isDeviceBasedVPP];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return [a1 isDone];
}

id objc_msgSend_isDowngraded(void *a1, const char *a2, ...)
{
  return [a1 isDowngraded];
}

id objc_msgSend_isDownloadComplete(void *a1, const char *a2, ...)
{
  return [a1 isDownloadComplete];
}

id objc_msgSend_isDownloadOnly(void *a1, const char *a2, ...)
{
  return [a1 isDownloadOnly];
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return [a1 isDownloading];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isEnterpriseBookBackupAllowed(void *a1, const char *a2, ...)
{
  return [a1 isEnterpriseBookBackupAllowed];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isFree(void *a1, const char *a2, ...)
{
  return [a1 isFree];
}

id objc_msgSend_isInManagedSettingsDowntime(void *a1, const char *a2, ...)
{
  return [a1 isInManagedSettingsDowntime];
}

id objc_msgSend_isInSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 isInSingleAppMode];
}

id objc_msgSend_isInserted(void *a1, const char *a2, ...)
{
  return [a1 isInserted];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInstalling(void *a1, const char *a2, ...)
{
  return [a1 isInstalling];
}

id objc_msgSend_isKeychainUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isKeychainUnlocked];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return [a1 isLoginUser];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isManagedByMDM(void *a1, const char *a2, ...)
{
  return [a1 isManagedByMDM];
}

id objc_msgSend_isManagedLostModeActive(void *a1, const char *a2, ...)
{
  return [a1 isManagedLostModeActive];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isNetworkTethered(void *a1, const char *a2, ...)
{
  return [a1 isNetworkTethered];
}

id objc_msgSend_isParked(void *a1, const char *a2, ...)
{
  return [a1 isParked];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isPermittedOnCurrentPlatform(void *a1, const char *a2, ...)
{
  return [a1 isPermittedOnCurrentPlatform];
}

id objc_msgSend_isPersistentContainerLoaded(void *a1, const char *a2, ...)
{
  return [a1 isPersistentContainerLoaded];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isPromptAllowedRightNow(void *a1, const char *a2, ...)
{
  return [a1 isPromptAllowedRightNow];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return [a1 isRestricted];
}

id objc_msgSend_isRoaming(void *a1, const char *a2, ...)
{
  return [a1 isRoaming];
}

id objc_msgSend_isSetupBuddyDone(void *a1, const char *a2, ...)
{
  return [a1 isSetupBuddyDone];
}

id objc_msgSend_isSplatOnly(void *a1, const char *a2, ...)
{
  return [a1 isSplatOnly];
}

id objc_msgSend_isStoreApp(void *a1, const char *a2, ...)
{
  return [a1 isStoreApp];
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return [a1 isSupervised];
}

id objc_msgSend_isUserLicensed(void *a1, const char *a2, ...)
{
  return [a1 isUserLicensed];
}

id objc_msgSend_isVPPLicensed(void *a1, const char *a2, ...)
{
  return [a1 isVPPLicensed];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return [a1 itemName];
}

id objc_msgSend_jobManager(void *a1, const char *a2, ...)
{
  return [a1 jobManager];
}

id objc_msgSend_keybagLockStateDidChange(void *a1, const char *a2, ...)
{
  return [a1 keybagLockStateDidChange];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastDateScheduleElapsed(void *a1, const char *a2, ...)
{
  return [a1 lastDateScheduleElapsed];
}

id objc_msgSend_lastLocationRequestedDateMessage(void *a1, const char *a2, ...)
{
  return [a1 lastLocationRequestedDateMessage];
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return [a1 lastModified];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastPredicateEvaluationValue(void *a1, const char *a2, ...)
{
  return [a1 lastPredicateEvaluationValue];
}

id objc_msgSend_lastStatusReportTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastStatusReportTimestamp];
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 layoutMonitor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_licenseType(void *a1, const char *a2, ...)
{
  return [a1 licenseType];
}

id objc_msgSend_lifeCycle(void *a1, const char *a2, ...)
{
  return [a1 lifeCycle];
}

id objc_msgSend_listAllPersonaWithAttributes(void *a1, const char *a2, ...)
{
  return [a1 listAllPersonaWithAttributes];
}

id objc_msgSend_listenerEndpoint(void *a1, const char *a2, ...)
{
  return [a1 listenerEndpoint];
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return [a1 localTime];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockDevice(void *a1, const char *a2, ...)
{
  return [a1 lockDevice];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return [a1 mainThread];
}

id objc_msgSend_managedAppsOnly(void *a1, const char *a2, ...)
{
  return [a1 managedAppsOnly];
}

id objc_msgSend_managedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 managedBundleIdentifiers];
}

id objc_msgSend_managedNonStoreBooksDirectory(void *a1, const char *a2, ...)
{
  return [a1 managedNonStoreBooksDirectory];
}

id objc_msgSend_managedNonStoreBooksManifestPath(void *a1, const char *a2, ...)
{
  return [a1 managedNonStoreBooksManifestPath];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_managedOnly(void *a1, const char *a2, ...)
{
  return [a1 managedOnly];
}

id objc_msgSend_managedSettingsGroups(void *a1, const char *a2, ...)
{
  return [a1 managedSettingsGroups];
}

id objc_msgSend_managedStoreBooksManifestPath(void *a1, const char *a2, ...)
{
  return [a1 managedStoreBooksManifestPath];
}

id objc_msgSend_managementInformation(void *a1, const char *a2, ...)
{
  return [a1 managementInformation];
}

id objc_msgSend_managementOptions(void *a1, const char *a2, ...)
{
  return [a1 managementOptions];
}

id objc_msgSend_managementPromptPolicyPath(void *a1, const char *a2, ...)
{
  return [a1 managementPromptPolicyPath];
}

id objc_msgSend_managingProfileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 managingProfileIdentifier];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return [a1 manifest];
}

id objc_msgSend_manifestDictionary(void *a1, const char *a2, ...)
{
  return [a1 manifestDictionary];
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return [a1 manifestURL];
}

id objc_msgSend_maxNumberOfUsers(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfUsers];
}

id objc_msgSend_mdmFilePath(void *a1, const char *a2, ...)
{
  return [a1 mdmFilePath];
}

id objc_msgSend_meInfoList(void *a1, const char *a2, ...)
{
  return [a1 meInfoList];
}

id objc_msgSend_memberQueue(void *a1, const char *a2, ...)
{
  return [a1 memberQueue];
}

id objc_msgSend_memberQueueCleanUp(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCleanUp];
}

id objc_msgSend_memberQueueCommitNonStoreBooksManifest(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCommitNonStoreBooksManifest];
}

id objc_msgSend_memberQueueCommitStoreBooksManifest(void *a1, const char *a2, ...)
{
  return [a1 memberQueueCommitStoreBooksManifest];
}

id objc_msgSend_memberQueuePersistentIDToNonStoreBook(void *a1, const char *a2, ...)
{
  return [a1 memberQueuePersistentIDToNonStoreBook];
}

id objc_msgSend_memberQueueRereadNonStoreBooksManifest(void *a1, const char *a2, ...)
{
  return [a1 memberQueueRereadNonStoreBooksManifest];
}

id objc_msgSend_memberQueueRereadStoreBooksManifest(void *a1, const char *a2, ...)
{
  return [a1 memberQueueRereadStoreBooksManifest];
}

id objc_msgSend_memberQueueiTunesStoreIDToStoreBook(void *a1, const char *a2, ...)
{
  return [a1 memberQueueiTunesStoreIDToStoreBook];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataPath(void *a1, const char *a2, ...)
{
  return [a1 metadataPath];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_moveTransientStatesForward(void *a1, const char *a2, ...)
{
  return [a1 moveTransientStatesForward];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsRedownload(void *a1, const char *a2, ...)
{
  return [a1 needsRedownload];
}

id objc_msgSend_netrbClient(void *a1, const char *a2, ...)
{
  return [a1 netrbClient];
}

id objc_msgSend_networkDidChange(void *a1, const char *a2, ...)
{
  return [a1 networkDidChange];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_newUserDatabase(void *a1, const char *a2, ...)
{
  return [a1 newUserDatabase];
}

id objc_msgSend_nonStoreBooks(void *a1, const char *a2, ...)
{
  return [a1 nonStoreBooks];
}

id objc_msgSend_normalizedPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 normalizedPercentComplete];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationRef(void *a1, const char *a2, ...)
{
  return [a1 notificationRef];
}

id objc_msgSend_notificationTimes(void *a1, const char *a2, ...)
{
  return [a1 notificationTimes];
}

id objc_msgSend_notifications(void *a1, const char *a2, ...)
{
  return [a1 notifications];
}

id objc_msgSend_notifyMatchingNotifications(void *a1, const char *a2, ...)
{
  return [a1 notifyMatchingNotifications];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_onDemandResourcesUsage(void *a1, const char *a2, ...)
{
  return [a1 onDemandResourcesUsage];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return [a1 organization];
}

id objc_msgSend_organizationControllerByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 organizationControllerByIdentifier];
}

id objc_msgSend_organizationDisplayName(void *a1, const char *a2, ...)
{
  return [a1 organizationDisplayName];
}

id objc_msgSend_organizationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 organizationIdentifier];
}

id objc_msgSend_organizationType(void *a1, const char *a2, ...)
{
  return [a1 organizationType];
}

id objc_msgSend_originator(void *a1, const char *a2, ...)
{
  return [a1 originator];
}

id objc_msgSend_otherButtonText(void *a1, const char *a2, ...)
{
  return [a1 otherButtonText];
}

id objc_msgSend_otherButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 otherButtonTitle];
}

id objc_msgSend_outgoingPayloadMetadataReferences(void *a1, const char *a2, ...)
{
  return [a1 outgoingPayloadMetadataReferences];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_parentApplicationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 parentApplicationIdentifiers];
}

id objc_msgSend_park(void *a1, const char *a2, ...)
{
  return [a1 park];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_payloadApps(void *a1, const char *a2, ...)
{
  return [a1 payloadApps];
}

id objc_msgSend_payloadCalendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 payloadCalendarIdentifier];
}

id objc_msgSend_payloadCategories(void *a1, const char *a2, ...)
{
  return [a1 payloadCategories];
}

id objc_msgSend_payloadCategoriesVersion2(void *a1, const char *a2, ...)
{
  return [a1 payloadCategoriesVersion2];
}

id objc_msgSend_payloadContext(void *a1, const char *a2, ...)
{
  return [a1 payloadContext];
}

id objc_msgSend_payloadDSID(void *a1, const char *a2, ...)
{
  return [a1 payloadDSID];
}

id objc_msgSend_payloadDateTime(void *a1, const char *a2, ...)
{
  return [a1 payloadDateTime];
}

id objc_msgSend_payloadDay(void *a1, const char *a2, ...)
{
  return [a1 payloadDay];
}

id objc_msgSend_payloadDays(void *a1, const char *a2, ...)
{
  return [a1 payloadDays];
}

id objc_msgSend_payloadDescription(void *a1, const char *a2, ...)
{
  return [a1 payloadDescription];
}

id objc_msgSend_payloadDescriptor(void *a1, const char *a2, ...)
{
  return [a1 payloadDescriptor];
}

id objc_msgSend_payloadDictionary(void *a1, const char *a2, ...)
{
  return [a1 payloadDictionary];
}

id objc_msgSend_payloadEcho(void *a1, const char *a2, ...)
{
  return [a1 payloadEcho];
}

id objc_msgSend_payloadEndDay(void *a1, const char *a2, ...)
{
  return [a1 payloadEndDay];
}

id objc_msgSend_payloadEndTime(void *a1, const char *a2, ...)
{
  return [a1 payloadEndTime];
}

id objc_msgSend_payloadEvents(void *a1, const char *a2, ...)
{
  return [a1 payloadEvents];
}

id objc_msgSend_payloadFrequency(void *a1, const char *a2, ...)
{
  return [a1 payloadFrequency];
}

id objc_msgSend_payloadHostnames(void *a1, const char *a2, ...)
{
  return [a1 payloadHostnames];
}

id objc_msgSend_payloadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentifier];
}

id objc_msgSend_payloadIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentifiers];
}

id objc_msgSend_payloadIdentifiersVersion2(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentifiersVersion2];
}

id objc_msgSend_payloadLocalTime(void *a1, const char *a2, ...)
{
  return [a1 payloadLocalTime];
}

id objc_msgSend_payloadMessage(void *a1, const char *a2, ...)
{
  return [a1 payloadMessage];
}

id objc_msgSend_payloadMetadata(void *a1, const char *a2, ...)
{
  return [a1 payloadMetadata];
}

id objc_msgSend_payloadMetadataObjectID(void *a1, const char *a2, ...)
{
  return [a1 payloadMetadataObjectID];
}

id objc_msgSend_payloadMetadatas(void *a1, const char *a2, ...)
{
  return [a1 payloadMetadatas];
}

id objc_msgSend_payloadMode(void *a1, const char *a2, ...)
{
  return [a1 payloadMode];
}

id objc_msgSend_payloadMonitor(void *a1, const char *a2, ...)
{
  return [a1 payloadMonitor];
}

id objc_msgSend_payloadMonitors(void *a1, const char *a2, ...)
{
  return [a1 payloadMonitors];
}

id objc_msgSend_payloadNotificationTimes(void *a1, const char *a2, ...)
{
  return [a1 payloadNotificationTimes];
}

id objc_msgSend_payloadPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 payloadPhoneNumber];
}

id objc_msgSend_payloadPredicate(void *a1, const char *a2, ...)
{
  return [a1 payloadPredicate];
}

id objc_msgSend_payloadPredicates(void *a1, const char *a2, ...)
{
  return [a1 payloadPredicates];
}

id objc_msgSend_payloadQueries(void *a1, const char *a2, ...)
{
  return [a1 payloadQueries];
}

id objc_msgSend_payloadRatingRegion(void *a1, const char *a2, ...)
{
  return [a1 payloadRatingRegion];
}

id objc_msgSend_payloadReference(void *a1, const char *a2, ...)
{
  return [a1 payloadReference];
}

id objc_msgSend_payloadReturnStatus(void *a1, const char *a2, ...)
{
  return [a1 payloadReturnStatus];
}

id objc_msgSend_payloadSchedule(void *a1, const char *a2, ...)
{
  return [a1 payloadSchedule];
}

id objc_msgSend_payloadSeconds(void *a1, const char *a2, ...)
{
  return [a1 payloadSeconds];
}

id objc_msgSend_payloadSpread(void *a1, const char *a2, ...)
{
  return [a1 payloadSpread];
}

id objc_msgSend_payloadStandardConfigurations(void *a1, const char *a2, ...)
{
  return [a1 payloadStandardConfigurations];
}

id objc_msgSend_payloadStartDay(void *a1, const char *a2, ...)
{
  return [a1 payloadStartDay];
}

id objc_msgSend_payloadStartTime(void *a1, const char *a2, ...)
{
  return [a1 payloadStartTime];
}

id objc_msgSend_payloadTimeBudget(void *a1, const char *a2, ...)
{
  return [a1 payloadTimeBudget];
}

id objc_msgSend_payloadType(void *a1, const char *a2, ...)
{
  return [a1 payloadType];
}

id objc_msgSend_payloadWebSites(void *a1, const char *a2, ...)
{
  return [a1 payloadWebSites];
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return [a1 payloads];
}

id objc_msgSend_persistentConfigurationSourceControllersByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentConfigurationSourceControllersByIdentifier];
}

id objc_msgSend_persistentConfigurationSources(void *a1, const char *a2, ...)
{
  return [a1 persistentConfigurationSources];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStoreDescriptions(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreDescriptions];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return [a1 personaID];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_policyPersistence(void *a1, const char *a2, ...)
{
  return [a1 policyPersistence];
}

id objc_msgSend_policyServerListener(void *a1, const char *a2, ...)
{
  return [a1 policyServerListener];
}

id objc_msgSend_policyTypes(void *a1, const char *a2, ...)
{
  return [a1 policyTypes];
}

id objc_msgSend_predicatePayloadMetadata(void *a1, const char *a2, ...)
{
  return [a1 predicatePayloadMetadata];
}

id objc_msgSend_predicateType(void *a1, const char *a2, ...)
{
  return [a1 predicateType];
}

id objc_msgSend_primaryAppleID(void *a1, const char *a2, ...)
{
  return [a1 primaryAppleID];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productKey(void *a1, const char *a2, ...)
{
  return [a1 productKey];
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return [a1 productSystemName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return [a1 productVersionExtra];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return [a1 profileData];
}

id objc_msgSend_profileDescription(void *a1, const char *a2, ...)
{
  return [a1 profileDescription];
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 profileIdentifier];
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return [a1 profileValidated];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_promptResetTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 promptResetTimeInterval];
}

id objc_msgSend_promptTimestamps(void *a1, const char *a2, ...)
{
  return [a1 promptTimestamps];
}

id objc_msgSend_promptWindowInterval(void *a1, const char *a2, ...)
{
  return [a1 promptWindowInterval];
}

id objc_msgSend_promptsAllowed(void *a1, const char *a2, ...)
{
  return [a1 promptsAllowed];
}

id objc_msgSend_promptsAllowedBeforeAutomaticDenial(void *a1, const char *a2, ...)
{
  return [a1 promptsAllowedBeforeAutomaticDenial];
}

id objc_msgSend_propertyKeys(void *a1, const char *a2, ...)
{
  return [a1 propertyKeys];
}

id objc_msgSend_purchasedBooksDirectory(void *a1, const char *a2, ...)
{
  return [a1 purchasedBooksDirectory];
}

id objc_msgSend_purchasedBooksManifest(void *a1, const char *a2, ...)
{
  return [a1 purchasedBooksManifest];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queueGroup(void *a1, const char *a2, ...)
{
  return [a1 queueGroup];
}

id objc_msgSend_readTimestampsFromFile(void *a1, const char *a2, ...)
{
  return [a1 readTimestampsFromFile];
}

id objc_msgSend_recordNewPrompt(void *a1, const char *a2, ...)
{
  return [a1 recordNewPrompt];
}

id objc_msgSend_redemptionCode(void *a1, const char *a2, ...)
{
  return [a1 redemptionCode];
}

id objc_msgSend_redownloadParameters(void *a1, const char *a2, ...)
{
  return [a1 redownloadParameters];
}

id objc_msgSend_registrationContext(void *a1, const char *a2, ...)
{
  return [a1 registrationContext];
}

id objc_msgSend_relayUUIDString(void *a1, const char *a2, ...)
{
  return [a1 relayUUIDString];
}

id objc_msgSend_remoteInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteInterface];
}

id objc_msgSend_removable(void *a1, const char *a2, ...)
{
  return [a1 removable];
}

id objc_msgSend_removalPasscode(void *a1, const char *a2, ...)
{
  return [a1 removalPasscode];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeDeclarations(void *a1, const char *a2, ...)
{
  return [a1 removeDeclarations];
}

id objc_msgSend_reportActivationPredicateObserverDidTrigger(void *a1, const char *a2, ...)
{
  return [a1 reportActivationPredicateObserverDidTrigger];
}

id objc_msgSend_reportingRequirements(void *a1, const char *a2, ...)
{
  return [a1 reportingRequirements];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return [a1 requestLocation];
}

id objc_msgSend_requiredEntitlements(void *a1, const char *a2, ...)
{
  return [a1 requiredEntitlements];
}

id objc_msgSend_requiresNetworkTether(void *a1, const char *a2, ...)
{
  return [a1 requiresNetworkTether];
}

id objc_msgSend_requiresUnlockedKeychain(void *a1, const char *a2, ...)
{
  return [a1 requiresUnlockedKeychain];
}

id objc_msgSend_rereadManagedAppAttributes(void *a1, const char *a2, ...)
{
  return [a1 rereadManagedAppAttributes];
}

id objc_msgSend_resolver(void *a1, const char *a2, ...)
{
  return [a1 resolver];
}

id objc_msgSend_restrictedAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 restrictedAppBundleIDs];
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return [a1 resultObject];
}

id objc_msgSend_resultStatus(void *a1, const char *a2, ...)
{
  return [a1 resultStatus];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return [a1 resumeSync];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runAsUser(void *a1, const char *a2, ...)
{
  return [a1 runAsUser];
}

id objc_msgSend_runConcurrently(void *a1, const char *a2, ...)
{
  return [a1 runConcurrently];
}

id objc_msgSend_runOnMainThread(void *a1, const char *a2, ...)
{
  return [a1 runOnMainThread];
}

id objc_msgSend_scDynamicStore(void *a1, const char *a2, ...)
{
  return [a1 scDynamicStore];
}

id objc_msgSend_scanWaitInterval(void *a1, const char *a2, ...)
{
  return [a1 scanWaitInterval];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_scheduledAlarmIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 scheduledAlarmIdentifiers];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenTime(void *a1, const char *a2, ...)
{
  return [a1 screenTime];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return [a1 seconds];
}

id objc_msgSend_sendManagedAppsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 sendManagedAppsChangedNotification];
}

id objc_msgSend_serialOperationQueuesByGroup(void *a1, const char *a2, ...)
{
  return [a1 serialOperationQueuesByGroup];
}

id objc_msgSend_serverHash(void *a1, const char *a2, ...)
{
  return [a1 serverHash];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setNeedsRefreshStatus(void *a1, const char *a2, ...)
{
  return [a1 setNeedsRefreshStatus];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedCategories(void *a1, const char *a2, ...)
{
  return [a1 sharedCategories];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedDeclarationOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedDeclarationOperationQueue];
}

id objc_msgSend_sharedHacks(void *a1, const char *a2, ...)
{
  return [a1 sharedHacks];
}

id objc_msgSend_sharedInstallTask(void *a1, const char *a2, ...)
{
  return [a1 sharedInstallTask];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedReader(void *a1, const char *a2, ...)
{
  return [a1 sharedReader];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return [a1 sharedStakeholder];
}

id objc_msgSend_sharedUsage(void *a1, const char *a2, ...)
{
  return [a1 sharedUsage];
}

id objc_msgSend_shield(void *a1, const char *a2, ...)
{
  return [a1 shield];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_shouldBypassVPPLicenseCheck(void *a1, const char *a2, ...)
{
  return [a1 shouldBypassVPPLicenseCheck];
}

id objc_msgSend_signerCertificates(void *a1, const char *a2, ...)
{
  return [a1 signerCertificates];
}

id objc_msgSend_singleAppModeBundleIndentifier(void *a1, const char *a2, ...)
{
  return [a1 singleAppModeBundleIndentifier];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_slotId(void *a1, const char *a2, ...)
{
  return [a1 slotId];
}

id objc_msgSend_softwareUpdateServices(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateServices];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_specificCategories(void *a1, const char *a2, ...)
{
  return [a1 specificCategories];
}

id objc_msgSend_spread(void *a1, const char *a2, ...)
{
  return [a1 spread];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startDay(void *a1, const char *a2, ...)
{
  return [a1 startDay];
}

id objc_msgSend_startHour(void *a1, const char *a2, ...)
{
  return [a1 startHour];
}

id objc_msgSend_startMinute(void *a1, const char *a2, ...)
{
  return [a1 startMinute];
}

id objc_msgSend_startObservingChanges(void *a1, const char *a2, ...)
{
  return [a1 startObservingChanges];
}

id objc_msgSend_startSecond(void *a1, const char *a2, ...)
{
  return [a1 startSecond];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateChangeTimestamp(void *a1, const char *a2, ...)
{
  return [a1 stateChangeTimestamp];
}

id objc_msgSend_stateDictionary(void *a1, const char *a2, ...)
{
  return [a1 stateDictionary];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return [a1 stateMachine];
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return [a1 staticUsage];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stayAliveThroughHereAtLeast(void *a1, const char *a2, ...)
{
  return [a1 stayAliveThroughHereAtLeast];
}

id objc_msgSend_stillNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 stillNeedsUpdate];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_storeBooks(void *a1, const char *a2, ...)
{
  return [a1 storeBooks];
}

id objc_msgSend_storeItemID(void *a1, const char *a2, ...)
{
  return [a1 storeItemID];
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeItemIdentifier];
}

id objc_msgSend_streamEventsHandler(void *a1, const char *a2, ...)
{
  return [a1 streamEventsHandler];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subOperations(void *a1, const char *a2, ...)
{
  return [a1 subOperations];
}

id objc_msgSend_subPredicateObserver(void *a1, const char *a2, ...)
{
  return [a1 subPredicateObserver];
}

id objc_msgSend_subPredicateObservers(void *a1, const char *a2, ...)
{
  return [a1 subPredicateObservers];
}

id objc_msgSend_subscriptionDeclaration(void *a1, const char *a2, ...)
{
  return [a1 subscriptionDeclaration];
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsInUse];
}

id objc_msgSend_supportedActivationTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedActivationTypes];
}

id objc_msgSend_supportedAssetTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedAssetTypes];
}

id objc_msgSend_supportedCommandTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedCommandTypes];
}

id objc_msgSend_supportedConfigurationTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedConfigurationTypes];
}

id objc_msgSend_supportedEventTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedEventTypes];
}

id objc_msgSend_supportedMessageTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedMessageTypes];
}

id objc_msgSend_supportedPredicateTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedPredicateTypes];
}

id objc_msgSend_supportsBlockLevelEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsBlockLevelEncryption];
}

id objc_msgSend_supportsFileLevelEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsFileLevelEncryption];
}

id objc_msgSend_syncToken(void *a1, const char *a2, ...)
{
  return [a1 syncToken];
}

id objc_msgSend_systemGroupContainerPath(void *a1, const char *a2, ...)
{
  return [a1 systemGroupContainerPath];
}

id objc_msgSend_systemLostModeRequestPath(void *a1, const char *a2, ...)
{
  return [a1 systemLostModeRequestPath];
}

id objc_msgSend_systemProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 systemProfileRestrictions];
}

id objc_msgSend_tapToPayScreenLock(void *a1, const char *a2, ...)
{
  return [a1 tapToPayScreenLock];
}

id objc_msgSend_taskOperationProvider(void *a1, const char *a2, ...)
{
  return [a1 taskOperationProvider];
}

id objc_msgSend_taskOperationServiceListener(void *a1, const char *a2, ...)
{
  return [a1 taskOperationServiceListener];
}

id objc_msgSend_taskServer(void *a1, const char *a2, ...)
{
  return [a1 taskServer];
}

id objc_msgSend_taskServerDelegate(void *a1, const char *a2, ...)
{
  return [a1 taskServerDelegate];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_timeoutTimerDispatchSource(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimerDispatchSource];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timestampsKey(void *a1, const char *a2, ...)
{
  return [a1 timestampsKey];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unblockableBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 unblockableBundleIdentifiers];
}

id objc_msgSend_unblockableCategoryIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 unblockableCategoryIdentifiers];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unknownPayloadKeys(void *a1, const char *a2, ...)
{
  return [a1 unknownPayloadKeys];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unpark(void *a1, const char *a2, ...)
{
  return [a1 unpark];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unusedRedemptionCode(void *a1, const char *a2, ...)
{
  return [a1 unusedRedemptionCode];
}

id objc_msgSend_updateCoalescenceInterval(void *a1, const char *a2, ...)
{
  return [a1 updateCoalescenceInterval];
}

id objc_msgSend_updateEventSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 updateEventSubscriptions];
}

id objc_msgSend_updateObserverRegistration(void *a1, const char *a2, ...)
{
  return [a1 updateObserverRegistration];
}

id objc_msgSend_updateOrganizationControllers(void *a1, const char *a2, ...)
{
  return [a1 updateOrganizationControllers];
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return [a1 updateState];
}

id objc_msgSend_updateStateDictionaryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateStateDictionaryIfNeeded];
}

id objc_msgSend_updateStatusChangeListener(void *a1, const char *a2, ...)
{
  return [a1 updateStatusChangeListener];
}

id objc_msgSend_updateType(void *a1, const char *a2, ...)
{
  return [a1 updateType];
}

id objc_msgSend_updatesService(void *a1, const char *a2, ...)
{
  return [a1 updatesService];
}

id objc_msgSend_upsertDeclarations(void *a1, const char *a2, ...)
{
  return [a1 upsertDeclarations];
}

id objc_msgSend_usageBudget(void *a1, const char *a2, ...)
{
  return [a1 usageBudget];
}

id objc_msgSend_usageMonitor(void *a1, const char *a2, ...)
{
  return [a1 usageMonitor];
}

id objc_msgSend_useDelay(void *a1, const char *a2, ...)
{
  return [a1 useDelay];
}

id objc_msgSend_userDefaultVoice(void *a1, const char *a2, ...)
{
  return [a1 userDefaultVoice];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userIsSignedIn(void *a1, const char *a2, ...)
{
  return [a1 userIsSignedIn];
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return [a1 userPersonaBundleIDList];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_userProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 userProfileRestrictions];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return [a1 userType];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_valuesByPropertyKey(void *a1, const char *a2, ...)
{
  return [a1 valuesByPropertyKey];
}

id objc_msgSend_verboseDescription(void *a1, const char *a2, ...)
{
  return [a1 verboseDescription];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_viewContext(void *a1, const char *a2, ...)
{
  return [a1 viewContext];
}

id objc_msgSend_voiceRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceRoamingEnabled];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_webDomainCategories(void *a1, const char *a2, ...)
{
  return [a1 webDomainCategories];
}

id objc_msgSend_webDomains(void *a1, const char *a2, ...)
{
  return [a1 webDomains];
}

id objc_msgSend_websiteURLsPolicyCache(void *a1, const char *a2, ...)
{
  return [a1 websiteURLsPolicyCache];
}

id objc_msgSend_whitelistedClassesForRequest(void *a1, const char *a2, ...)
{
  return [a1 whitelistedClassesForRequest];
}

id objc_msgSend_willStartInstalling(void *a1, const char *a2, ...)
{
  return [a1 willStartInstalling];
}

id objc_msgSend_willStartUninstalling(void *a1, const char *a2, ...)
{
  return [a1 willStartUninstalling];
}

id objc_msgSend_willStartUpdating(void *a1, const char *a2, ...)
{
  return [a1 willStartUpdating];
}

id objc_msgSend_writeTimestampsToFile(void *a1, const char *a2, ...)
{
  return [a1 writeTimestampsToFile];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 options:x1 error:x2];
}