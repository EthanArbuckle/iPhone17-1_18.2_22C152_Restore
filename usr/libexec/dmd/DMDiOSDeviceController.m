@interface DMDiOSDeviceController
+ (id)_stringFromSubscriptionSlot:(int64_t)a3;
- (BOOL)_equipmentInfoHasEsimIdentifier:(id)a3;
- (id)EASIdentifier;
- (id)ICCID;
- (id)IMEI;
- (id)MEID;
- (id)_deviceInformationForEquipmentInfo:(id)a3 subscription:(id)a4 esimIdentifier:(id)a5 withClient:(id)a6;
- (id)_esimIdentifierFromEquipmentInfoArray:(id)a3;
- (id)_isCloudBackupEnabled;
- (id)_isPersonalHotspotEnabled;
- (id)_skippedSetupPanes;
- (id)availableCapacity;
- (id)batteryLevel;
- (id)capacity;
- (id)carrierSettingsVersion;
- (id)cellularTechnology;
- (id)currentCarrierNetwork;
- (id)currentMCC;
- (id)currentMNC;
- (id)deviceLocatorServiceEnabledWithError:(id *)a3;
- (id)enforcedSoftwareUpdateDelay;
- (id)isActivationLockEnabled;
- (id)isActivationLockEnabledWithError:(id *)a3;
- (id)isAppAnalyticsEnabled;
- (id)isCloudBackupEnabled;
- (id)isDataRoamingEnabled;
- (id)isDeviceLocatorServiceEnabled;
- (id)isDiagnosticSubmissionEnabled;
- (id)isDoNotDisturbInEffect;
- (id)isEphemeralMultiUser;
- (id)isLostModeEnabled;
- (id)isNetworkTethered;
- (id)isPersonalHotspotEnabled;
- (id)isRoaming;
- (id)isVoiceRoamingEnabled;
- (id)maximumResidentUsers;
- (id)modemFirmwareVersion;
- (id)phoneNumber;
- (id)serviceSubscriptions;
- (id)skippedSetupPanes;
- (id)subscriberCarrierNetwork;
- (id)subscriberMCC;
- (id)subscriberMNC;
@end

@implementation DMDiOSDeviceController

- (id)availableCapacity
{
  return +[DMDMobileGestalt dataAvailable];
}

- (id)batteryLevel
{
  int v2 = IOPSGetPercentRemaining();
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000833CC(v3);
    }
    v4 = &off_1000D3698;
  }
  else
  {
    v4 = +[NSNumber numberWithDouble:(double)0 / 100.0];
  }

  return v4;
}

- (id)capacity
{
  return +[DMDMobileGestalt dataCapacity];
}

- (id)isDeviceLocatorServiceEnabled
{
  return [(DMDiOSDeviceController *)self deviceLocatorServiceEnabledWithError:0];
}

- (id)isDoNotDisturbInEffect
{
  int v2 = +[DNDStateService serviceForClientIdentifier:@"com.apple.dmd"];
  id v7 = 0;
  int v3 = [v2 queryCurrentStateWithError:&v7];
  id v4 = v7;
  if (v3)
  {
    v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isActive]);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10008344C();
    }
    v5 = 0;
  }

  return v5;
}

- (id)isLostModeEnabled
{
  int v2 = +[FMDFMIPManager sharedInstance];
  int v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isManagedLostModeActive]);

  return v3;
}

- (id)isDiagnosticSubmissionEnabled
{
  int v2 = +[MCProfileConnection sharedConnection];
  int v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isDiagnosticSubmissionAllowed]);

  return v3;
}

- (id)isAppAnalyticsEnabled
{
  int v2 = +[MCProfileConnection sharedConnection];
  int v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isAppAnalyticsAllowed]);

  return v3;
}

- (id)isCloudBackupEnabled
{
  return [(DMDiOSDeviceController *)self _isCloudBackupEnabled];
}

- (id)carrierSettingsVersion
{
  return +[DMDCoreTelephonyUtilities carrierBundleVersion];
}

- (id)cellularTechnology
{
  unsigned int v2 = +[DMDCoreTelephonyUtilities hasGSM];
  if (+[DMDCoreTelephonyUtilities hasCDMA]) {
    uint64_t v3 = v2 | 2;
  }
  else {
    uint64_t v3 = v2;
  }

  return +[NSNumber numberWithInt:v3];
}

- (id)currentCarrierNetwork
{
  return +[DMDCoreTelephonyUtilities currentNetworkName];
}

- (id)currentMCC
{
  return +[DMDCoreTelephonyUtilities currentMobileCountryCode];
}

- (id)currentMNC
{
  return +[DMDCoreTelephonyUtilities currentMobileNetworkCode];
}

- (id)isDataRoamingEnabled
{
  BOOL v2 = +[DMDCoreTelephonyUtilities dataRoamingEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (id)EASIdentifier
{
  BOOL v2 = +[DADConnection sharedConnection];
  uint64_t v3 = [v2 activeSyncDeviceIdentifier];

  return v3;
}

- (id)enforcedSoftwareUpdateDelay
{
  BOOL v2 = +[MCProfileConnection sharedConnection];
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 enforcedSoftwareUpdateDelayInDays]);

  return v3;
}

- (id)ICCID
{
  return +[DMDCoreTelephonyUtilities ICCID];
}

- (id)IMEI
{
  return +[DMDCoreTelephonyUtilities IMEI];
}

- (id)isActivationLockEnabled
{
  return [(DMDiOSDeviceController *)self isActivationLockEnabledWithError:0];
}

- (id)isEphemeralMultiUser
{
  BOOL v2 = +[UMUserManager sharedManager];
  if ([v2 isMultiUser]
    && ([v2 currentUser],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 userType],
        v3,
        v4 == (id)1))
  {
    v5 = &__kCFBooleanTrue;
  }
  else
  {
    v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (id)isNetworkTethered
{
  BOOL v2 = +[DMDNetworkTetherUtilities isNetworkTethered];

  return +[NSNumber numberWithBool:v2];
}

- (id)isPersonalHotspotEnabled
{
  return [(DMDiOSDeviceController *)self _isPersonalHotspotEnabled];
}

- (id)isRoaming
{
  BOOL v2 = +[DMDCoreTelephonyUtilities isRoaming];

  return +[NSNumber numberWithBool:v2];
}

- (id)maximumResidentUsers
{
  BOOL v2 = +[UMUserManager sharedManager];
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 maxNumberOfUsers]);

  return v3;
}

- (id)MEID
{
  return +[DMDCoreTelephonyUtilities MEID];
}

- (id)modemFirmwareVersion
{
  return +[DMDCoreTelephonyUtilities modemFirmwareVersion];
}

- (id)phoneNumber
{
  return +[DMDMobileGestalt phoneNumber];
}

- (id)skippedSetupPanes
{
  return [(DMDiOSDeviceController *)self _skippedSetupPanes];
}

- (id)subscriberCarrierNetwork
{
  return +[DMDCoreTelephonyUtilities carrierName];
}

- (id)subscriberMCC
{
  return +[DMDMobileGestalt mobileSubscriberCountryCode];
}

- (id)subscriberMNC
{
  return +[DMDMobileGestalt mobileSubscriberNetworkCode];
}

- (id)isVoiceRoamingEnabled
{
  BOOL v2 = +[DMDCoreTelephonyUtilities voiceRoamingEnabled];

  return +[NSNumber numberWithBool:v2];
}

+ (id)_stringFromSubscriptionSlot:(int64_t)a3
{
  uint64_t v3 = (void *)CTSubscriptionSlotAsString();
  if (v3)
  {
    uint64_t v3 = +[NSString stringWithUTF8String:v3];
  }

  return v3;
}

- (id)_deviceInformationForEquipmentInfo:(id)a3 subscription:(id)a4 esimIdentifier:(id)a5 withClient:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v72 = +[NSAssertionHandler currentHandler];
    [v72 handleFailureInMethod:a2, self, @"DMDDeviceController+iOS.m", 229, @"Invalid parameter not satisfying: %@", @"equipmentInfo != nil" object file lineNumber description];

    if (v15)
    {
LABEL_61:
      id v70 = &__NSDictionary0__struct;
      goto LABEL_56;
    }
LABEL_60:
    v73 = +[NSAssertionHandler currentHandler];
    [v73 handleFailureInMethod:a2, self, @"DMDDeviceController+iOS.m", 230, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

    goto LABEL_61;
  }
  if (!v14) {
    goto LABEL_60;
  }
  id v16 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  v17 = objc_opt_new();
  id v94 = 0;
  uint64_t v18 = [v15 getPreferredDataSubscriptionContextSync:&v94];
  id v19 = v94;
  id v20 = v19;
  v86 = (void *)v18;
  if (!v18 && v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v96 = "-[DMDiOSDeviceController _deviceInformationForEquipmentInfo:subscription:esimIdentifier:withClient:]";
    __int16 v97 = 2114;
    id v98 = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync: in %s failed: %{public}@", buf, 0x16u);
  }
  v85 = v20;
  v21 = [objc_opt_class() _stringFromSubscriptionSlot:[v11 slotId]];
  [v17 setObject:v21 forKeyedSubscript:DMFDeviceServiceSubscriptionSlotKey];

  v22 = [v11 ICCID];
  v23 = +[DMDCoreTelephonyUtilities formattedICCIDStringFromString:v22];
  [v17 setObject:v23 forKeyedSubscript:DMFDeviceICCIDKey];

  v24 = [v11 IMEI];
  v25 = +[DMDCoreTelephonyUtilities formattedIMEIStringFromString:v24];
  [v17 setObject:v25 forKeyedSubscript:DMFDeviceIMEIKey];

  v26 = [v11 MEID];
  [v17 setObject:v26 forKeyedSubscript:DMFDeviceMEIDKey];

  v27 = [v11 CSN];
  uint64_t v28 = DMFDeviceEIDKey;
  [v17 setObject:v27 forKeyedSubscript:DMFDeviceEIDKey];

  if ([(DMDiOSDeviceController *)self _equipmentInfoHasEsimIdentifier:v11]) {
    [v17 setObject:v13 forKeyedSubscript:v28];
  }
  id v29 = [v11 slotId];
  if (v13
    && v29 == (id)2
    && ![(DMDiOSDeviceController *)self _equipmentInfoHasEsimIdentifier:v11])
  {
    [v17 setObject:v13 forKeyedSubscript:v28];
  }
  if (v12)
  {
    id v93 = 0;
    v30 = [v15 getPhoneNumber:v12 error:&v93];
    id v31 = v93;
    v77 = v30;
    if (v30)
    {
      v32 = [v30 number];
      if (v32)
      {
        [v17 setObject:v32 forKeyedSubscript:DMFDevicePhoneNumberKey];
      }
      else
      {
        BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v33) {
          sub_100083918(v33, v34, v35, v36, v37, v38, v39, v40);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10008389C();
    }
    v41 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isEqual:v86]);
    [v17 setObject:v41 forKeyedSubscript:DMFDeviceServiceSubscriptionIsDataPreferredKey];

    v42 = [v12 userDefaultVoice];
    [v17 setObject:v42 forKeyedSubscript:DMFDeviceServiceSubscriptionIsVoicePreferredKey];

    id v92 = 0;
    v43 = [v15 getSimLabel:v12 error:&v92];
    id v83 = v92;
    id v84 = v16;
    if (v43)
    {
      v44 = [v43 text];
      if (v44)
      {
        [v17 setObject:v44 forKeyedSubscript:DMFDeviceServiceSubscriptionLabelKey];
      }
      else
      {
        BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v45) {
          sub_100083820(v45, v46, v47, v48, v49, v50, v51, v52);
        }
      }
      v53 = v43;
      v54 = [v43 unique_id];
      if (v54)
      {
        [v17 setObject:v54 forKeyedSubscript:DMFDeviceServiceSubscriptionLabelIDKey];
      }
      else
      {
        BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v55) {
          sub_1000837A4(v55, v56, v57, v58, v59, v60, v61, v62);
        }
      }

      v43 = v53;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100083728();
    }
    id v91 = 0;
    id v63 = [v15 copyCarrierBundleVersion:v12 error:&v91];
    id v82 = v91;
    v74 = v63;
    if (v63)
    {
      [v17 setObject:v63 forKeyedSubscript:DMFDeviceCarrierSettingsVersionKey];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000836AC();
    }
    id v90 = 0;
    id v64 = [v15 copyCarrierBundleValue:v12 key:@"CarrierName" bundleType:v16 error:&v90];
    id v81 = v90;
    if (v64)
    {
      [v17 setObject:v64 forKeyedSubscript:DMFDeviceSubscriberCarrierNetworkKey];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100083630();
    }
    id v89 = 0;
    v65 = [v15 getLocalizedOperatorName:v12 error:&v89];
    id v80 = v89;
    v76 = v31;
    if (v65)
    {
      [v17 setObject:v65 forKeyedSubscript:DMFDeviceCurrentCarrierNetworkKey];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000835B4();
    }
    id v88 = 0;
    id v66 = [v15 copyMobileCountryCode:v12 error:&v88];
    id v78 = v13;
    id v79 = v88;
    v75 = v43;
    if (v66)
    {
      [v17 setObject:v66 forKeyedSubscript:DMFDeviceCurrentMCCKey];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100083538();
    }
    id v87 = 0;
    id v67 = [v15 copyMobileNetworkCode:v12 error:&v87];
    id v68 = v87;
    if (v67)
    {
      [v17 setObject:v67 forKeyedSubscript:DMFDeviceCurrentMNCKey];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000834BC();
    }
    v69 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMDCoreTelephonyUtilities isSubscriptionRoaming:v12 client:v15]);
    [v17 setObject:v69 forKeyedSubscript:DMFDeviceIsRoamingKey];

    id v13 = v78;
    id v16 = v84;
  }
  id v70 = [v17 copy];

LABEL_56:

  return v70;
}

- (BOOL)_equipmentInfoHasEsimIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 displayCSN];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 CSN];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)serviceSubscriptions
{
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  if (!v3)
  {
    v74 = +[NSAssertionHandler currentHandler];
    [v74 handleFailureInMethod:a2 object:self file:@"DMDDeviceController+iOS.m" lineNumber:382 description:@"could not create CoreTelephonyClient"];

    id v3 = 0;
  }
  v85 = objc_opt_new();
  id v4 = objc_opt_new();
  id v103 = 0;
  BOOL v5 = [v3 getMobileEquipmentInfo:&v103];
  id v6 = v103;
  if (v5)
  {
    id v7 = [v5 meInfoList];
    if (!v7)
    {
      BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v39) {
        sub_100083994(v39, v40, v41, v42, v43, v44, v45, v46);
      }
      id v18 = 0;
      goto LABEL_54;
    }
    v76 = a2;
    id v81 = v6;
    id v82 = v5;
    v8 = [(DMDiOSDeviceController *)self _esimIdentifierFromEquipmentInfoArray:v7];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v80 = v7;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v99 objects:v106 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v100;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v100 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          id v15 = [v14 slotId];
          if (!v15)
          {
            BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v19) {
              sub_100083B24(v19, v20, v21, v22, v23, v24, v25, v26);
            }
            goto LABEL_22;
          }
          id v16 = +[NSNumber numberWithInteger:v15];
          v17 = [v4 objectForKeyedSubscript:v16];
          if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100083B60(&v97, v98);
          }
          [v4 setObject:v14 forKeyedSubscript:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v99 objects:v106 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    v27 = objc_opt_new();
    id v96 = 0;
    uint64_t v28 = [v3 getSubscriptionInfoWithError:&v96];
    id v83 = v4;
    id v78 = v96;
    id v79 = v28;
    if (v28)
    {
      id v29 = [v28 subscriptionsInUse];
      if (v29)
      {
        id v77 = v3;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v30 = v29;
        id v31 = [v30 countByEnumeratingWithState:&v92 objects:v105 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v93;
          v75 = v91;
          while (2)
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v93 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
              id v36 = [v35 slotID:v75];
              if (!v36)
              {
                BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v56) {
                  sub_100083AA4(v56, v57, v58, v59, v60, v61, v62, v63);
                }
                goto LABEL_45;
              }
              uint64_t v37 = +[NSNumber numberWithInteger:v36];
              uint64_t v38 = [v27 objectForKeyedSubscript:v37];
              if (v38 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100083AE0(&buf, v75);
              }
              [v27 setObject:v35 forKeyedSubscript:v37];
            }
            id v32 = [v30 countByEnumeratingWithState:&v92 objects:v105 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
LABEL_45:
        id v47 = v77;

        goto LABEL_46;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100083A0C(v76);
    }
    id v47 = v3;
    BOOL v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v48) {
      sub_1000839D0(v48, v49, v50, v51, v52, v53, v54, v55);
    }
LABEL_46:
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v64 = [v83 allValues];
    id v65 = [v64 countByEnumeratingWithState:&v86 objects:v104 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v87;
      do
      {
        for (k = 0; k != v66; k = (char *)k + 1)
        {
          if (*(void *)v87 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = *(void **)(*((void *)&v86 + 1) + 8 * (void)k);
          id v70 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v69 slotId]);
          v71 = [v27 objectForKeyedSubscript:v70];

          v72 = [(DMDiOSDeviceController *)self _deviceInformationForEquipmentInfo:v69 subscription:v71 esimIdentifier:v8 withClient:v47];
          [v85 addObject:v72];
        }
        id v66 = [v64 countByEnumeratingWithState:&v86 objects:v104 count:16];
      }
      while (v66);
    }

    id v18 = [v85 copy];
    id v3 = v47;
    BOOL v5 = v82;
    id v4 = v83;
    id v7 = v80;
    id v6 = v81;
LABEL_54:

    goto LABEL_55;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100082A84();
  }
  id v18 = 0;
LABEL_55:

  return v18;
}

- (id)_esimIdentifierFromEquipmentInfoArray:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = [v7 displayCSN:v19];
        if (v8)
        {
          id v9 = (void *)v8;
          id v10 = [v7 displayCSN];
          id v11 = [v10 length];

          if (v11)
          {
            uint64_t v16 = [v7 displayCSN];
LABEL_15:
            id v4 = (id)v16;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v7 CSN];
        if (v12)
        {
          id v13 = (void *)v12;
          id v14 = [v7 CSN];
          id v15 = [v14 length];

          if (v15)
          {
            uint64_t v16 = [v7 CSN];
            goto LABEL_15;
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  id v17 = [v4 copy];

  return v17;
}

- (id)deviceLocatorServiceEnabledWithError:(id *)a3
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = sub_10003C524;
  long long v22 = sub_10003C534;
  id v23 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = +[FMDFMIPManager sharedInstance];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10003C53C;
  id v14 = &unk_1000CAE18;
  uint64_t v16 = &v18;
  id v17 = &v24;
  id v6 = v4;
  id v15 = v6;
  [v5 fmipStateWithCompletion:&v11];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = v19[5];
  if (v7)
  {
    if (a3)
    {
      NSErrorUserInfoKey v28 = NSUnderlyingErrorKey;
      uint64_t v29 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, v11, v12, v13, v14);
      DMFErrorWithCodeAndUserInfo();
      id v9 = objc_claimAutoreleasedReturnValue();
      *a3 = v9;

      a3 = 0;
    }
  }
  else
  {
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v25 + 24), v11, v12, v13, v14);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return a3;
}

- (id)isActivationLockEnabledWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_10003C524;
  id v23 = sub_10003C534;
  id v24 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = +[FMDFMIPManager sharedInstance];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10003C7FC;
  id v15 = &unk_1000CAE40;
  id v17 = &v19;
  uint64_t v18 = &v25;
  id v6 = v4;
  uint64_t v16 = v6;
  [v5 isActivationLockedWithCompletion:&v12];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    uint64_t v7 = v20[5];
    if (v7)
    {
      NSErrorUserInfoKey v29 = NSUnderlyingErrorKey;
      uint64_t v30 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, v12, v13, v14, v15);
      DMFErrorWithCodeAndUserInfo();
      id v9 = objc_claimAutoreleasedReturnValue();
      *a3 = v9;
    }
  }
  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v26 + 24), v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

- (id)_isCloudBackupEnabled
{
  BOOL v2 = objc_opt_new();
  id v3 = [v2 aa_primaryAppleAccountWithPreloadedDataclasses];

  if (v3 && [v3 isEnabledForDataclass:kAccountDataclassBackup]) {
    id v4 = [v3 aa_isPrimaryEmailVerified];
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)_isPersonalHotspotEnabled
{
  if (+[DMDMobileGestalt hasPersonalHotspotCapability])
  {
    BOOL v2 = +[DMDPersonalHotspotManager sharedManager];
    id v3 = [v2 enabled];
  }
  else
  {
    id v3 = 0;
  }

  return +[NSNumber numberWithBool:v3];
}

- (id)_skippedSetupPanes
{
  BOOL v2 = objc_opt_new();
  id v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:@"/private/var/mobile/Library/Application Support/com.apple.dmd-setup-option"];

  if (v4) {
    [v2 addObject:kMCCCSkipSetupTapToSetup];
  }
  id v5 = [v2 copy];

  return v5;
}

@end