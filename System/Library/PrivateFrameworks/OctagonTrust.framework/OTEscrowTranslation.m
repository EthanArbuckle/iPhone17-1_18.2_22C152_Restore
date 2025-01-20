@interface OTEscrowTranslation
+ (BOOL)supportedRestorePath:(id)a3;
+ (id)CDPRecordContextToDictionary:(id)a3;
+ (id)_dateWithSecureBackupDateString:(id)a3;
+ (id)_stringWithSecureBackupDate:(id)a3;
+ (id)cdpRecoveryInformationToDictionary:(id)a3;
+ (id)dictionaryToCDPRecordContext:(id)a3;
+ (id)dictionaryToCDPRecoveryInformation:(id)a3;
+ (id)dictionaryToEscrowAuthenticationInfo:(id)a3;
+ (id)dictionaryToEscrowRecord:(id)a3;
+ (id)dictionaryToMetadata:(id)a3;
+ (id)escrowAuthenticationInfoToDictionary:(id)a3;
+ (id)escrowRecordToDictionary:(id)a3;
+ (id)metadataToDictionary:(id)a3;
@end

@implementation OTEscrowTranslation

+ (BOOL)supportedRestorePath:(id)a3
{
  id v5 = a3;
  v6 = [v5 authInfo];
  if (([v6 idmsRecovery] & 1) == 0)
  {
    v8 = [v5 authInfo];
    v9 = [v8 fmipUuid];
    if (v9)
    {
      v3 = [v5 authInfo];
      v4 = [v3 fmipUuid];
      if (![v4 isEqualToString:&stru_1EED4A680])
      {
        LOBYTE(v7) = 0;
        goto LABEL_8;
      }
    }
    v10 = [v5 authInfo];
    if ([v10 fmipRecovery])
    {

      LOBYTE(v7) = 0;
      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:

      goto LABEL_9;
    }
    v12 = [v5 cdpInfo];
    v13 = [v12 recoveryKey];
    if (v13)
    {
      v14 = [v5 cdpInfo];
      v16 = [v14 recoveryKey];
      v18 = v14;
      if (![v16 isEqualToString:&stru_1EED4A680])
      {
        LOBYTE(v7) = 0;
        goto LABEL_18;
      }
      v17 = v12;
    }
    else
    {
      v17 = v12;
    }
    v15 = [v5 cdpInfo];
    int v7 = [v15 usePreviouslyCachedRecoveryKey] ^ 1;

    if (!v13)
    {

LABEL_20:
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    v12 = v17;
LABEL_18:

    goto LABEL_20;
  }
  LOBYTE(v7) = 0;
LABEL_10:

  return v7;
}

+ (id)CDPRecordContextToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 authInfo];
    v6 = +[OTEscrowTranslation escrowAuthenticationInfoToDictionary:v5];
    [v4 addEntriesFromDictionary:v6];

    int v7 = [v3 cdpInfo];
    v8 = +[OTEscrowTranslation cdpRecoveryInformationToDictionary:v7];
    [v4 addEntriesFromDictionary:v8];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToCDPRecordContext:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(OTICDPRecordContext);
    id v5 = +[OTEscrowTranslation dictionaryToEscrowAuthenticationInfo:v3];
    [(OTICDPRecordContext *)v4 setAuthInfo:v5];

    v6 = +[OTEscrowTranslation dictionaryToCDPRecoveryInformation:v3];
    [(OTICDPRecordContext *)v4 setCdpInfo:v6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)escrowRecordToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v3, "creationDate"));
    v6 = getkSecureBackupEscrowDateKey();
    [v4 setObject:v5 forKeyedSubscript:v6];

    int v7 = [v3 escrowInformationMetadata];
    v8 = +[OTEscrowTranslation metadataToDictionary:v7];
    [v4 setObject:v8 forKeyedSubscript:@"metadata"];

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithUnsignedLongLong:", objc_msgSend(v3, "remainingAttempts"));
    v10 = getkSecureBackupRemainingAttemptsKey();
    [v4 setObject:v9 forKeyedSubscript:v10];

    v11 = [v3 label];
    v12 = getkSecureBackupRecordLabelKey();
    [v4 setObject:v11 forKeyedSubscript:v12];

    if ([v3 recordStatus]) {
      v13 = @"invalid";
    }
    else {
      v13 = @"valid";
    }
    v14 = getkSecureBackupRecordStatusKey();
    [v4 setObject:v13 forKeyedSubscript:v14];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithUnsignedLongLong:", objc_msgSend(v3, "silentAttemptAllowed"));
    [v4 setObject:v15 forKeyedSubscript:@"silentAttemptAllowed"];

    v16 = [v3 federationId];
    [v4 setObject:v16 forKeyedSubscript:@"FEDERATIONID"];

    v17 = [v3 expectedFederationId];
    [v4 setObject:v17 forKeyedSubscript:@"EXPECTEDFEDERATIONID"];

    v18 = [v3 recordId];
    v19 = getkSecureBackupRecordIDKey();
    [v4 setObject:v18 forKeyedSubscript:v19];

    v20 = [v3 serialNumber];
    v21 = getkSecureBackupPeerInfoSerialNumberKey();
    [v4 setObject:v20 forKeyedSubscript:v21];

    v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "coolOffEnd"));
    v23 = getkSecureBackupCoolOffEndKey();
    [v4 setObject:v22 forKeyedSubscript:v23];

    v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v3, "recoveryStatus"));
    v25 = getkSecureBackupRecoveryStatusKey();
    [v4 setObject:v24 forKeyedSubscript:v25];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)metadataToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    v6 = getkSecureBackupClientMetadataKey();
    [v4 setObject:v5 forKeyedSubscript:v6];

    int v7 = [v3 backupKeybagDigest];
    [v4 setObject:v7 forKeyedSubscript:@"BackupKeybagDigest"];

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithUnsignedLongLong:", objc_msgSend(v3, "secureBackupUsesMultipleIcscs"));
    v9 = getkSecureBackupUsesMultipleiCSCKey();
    [v4 setObject:v8 forKeyedSubscript:v9];

    v10 = [v3 bottleId];
    v11 = getkSecureBackupBottleIDKey();
    [v4 setObject:v10 forKeyedSubscript:v11];

    v12 = [v3 bottleValidity];
    [v4 setObject:v12 forKeyedSubscript:@"bottleValid"];

    v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v3, "secureBackupTimestamp"));
    v14 = +[OTEscrowTranslation _stringWithSecureBackupDate:v13];
    [v4 setObject:v14 forKeyedSubscript:@"com.apple.securebackup.timestamp"];

    v15 = [v3 escrowedSpki];
    v16 = getkSecureBackupEscrowedSPKIKey();
    [v4 setObject:v15 forKeyedSubscript:v16];

    v17 = [v3 peerInfo];
    v18 = getkSecureBackupPeerInfoDataKey();
    [v4 setObject:v17 forKeyedSubscript:v18];

    v19 = [v3 serial];
    v20 = getkSecureBackupSerialNumberKey();
    [v4 setObject:v19 forKeyedSubscript:v20];

    v21 = [v3 build];
    v22 = getkSecureBackupBuildVersionKey();
    [v4 setObject:v21 forKeyedSubscript:v22];

    v23 = [v3 passcodeGeneration];
    LODWORD(v22) = [v23 hasValue];

    if (v22)
    {
      v24 = (void *)MEMORY[0x1E4F28ED0];
      v25 = [v3 passcodeGeneration];
      v26 = objc_msgSend(v24, "numberWithUnsignedLongLong:", objc_msgSend(v25, "value"));
      v27 = getkSecureBackupPasscodeGenerationKey();
      [v4 setObject:v26 forKeyedSubscript:v27];
    }
    id v28 = objc_alloc(MEMORY[0x1E4F28ED0]);
    v29 = [v3 clientMetadata];
    v30 = objc_msgSend(v28, "initWithUnsignedLongLong:", objc_msgSend(v29, "devicePlatform"));
    v31 = getkSecureBackupClientMetadataKey();
    v32 = [v4 objectForKeyedSubscript:v31];
    [v32 setObject:v30 forKeyedSubscript:@"device_platform"];

    v33 = (void *)MEMORY[0x1E4F1C9C8];
    v34 = [v3 clientMetadata];
    v35 = objc_msgSend(v33, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v34, "secureBackupMetadataTimestamp"));
    v36 = +[OTEscrowTranslation _stringWithSecureBackupDate:v35];
    v37 = getkSecureBackupClientMetadataKey();
    v38 = [v4 objectForKeyedSubscript:v37];
    [v38 setObject:v36 forKeyedSubscript:@"SecureBackupMetadataTimestamp"];

    id v39 = objc_alloc(MEMORY[0x1E4F28ED0]);
    v40 = [v3 clientMetadata];
    v41 = objc_msgSend(v39, "initWithUnsignedLongLong:", objc_msgSend(v40, "secureBackupNumericPassphraseLength"));
    v42 = getkSecureBackupClientMetadataKey();
    v43 = [v4 objectForKeyedSubscript:v42];
    v44 = getkSecureBackupNumericPassphraseLengthKey();
    [v43 setObject:v41 forKeyedSubscript:v44];

    id v45 = objc_alloc(MEMORY[0x1E4F28ED0]);
    v46 = [v3 clientMetadata];
    v47 = objc_msgSend(v45, "initWithUnsignedLongLong:", objc_msgSend(v46, "secureBackupUsesComplexPassphrase"));
    v48 = getkSecureBackupClientMetadataKey();
    v49 = [v4 objectForKeyedSubscript:v48];
    v50 = getkSecureBackupUsesComplexPassphraseKey();
    [v49 setObject:v47 forKeyedSubscript:v50];

    id v51 = objc_alloc(MEMORY[0x1E4F28ED0]);
    v52 = [v3 clientMetadata];
    v53 = objc_msgSend(v51, "initWithUnsignedLongLong:", objc_msgSend(v52, "secureBackupUsesNumericPassphrase"));
    v54 = getkSecureBackupClientMetadataKey();
    v55 = [v4 objectForKeyedSubscript:v54];
    v56 = getkSecureBackupUsesNumericPassphraseKey();
    [v55 setObject:v53 forKeyedSubscript:v56];

    v57 = [v3 clientMetadata];
    v58 = [v57 deviceColor];
    v59 = getkSecureBackupClientMetadataKey();
    v60 = [v4 objectForKeyedSubscript:v59];
    [v60 setObject:v58 forKeyedSubscript:@"device_color"];

    v61 = [v3 clientMetadata];
    v62 = [v61 deviceEnclosureColor];
    v63 = getkSecureBackupClientMetadataKey();
    v64 = [v4 objectForKeyedSubscript:v63];
    [v64 setObject:v62 forKeyedSubscript:@"device_enclosure_color"];

    v65 = [v3 clientMetadata];
    v66 = [v65 deviceMid];
    v67 = getkSecureBackupClientMetadataKey();
    v68 = [v4 objectForKeyedSubscript:v67];
    [v68 setObject:v66 forKeyedSubscript:@"device_mid"];

    v69 = [v3 clientMetadata];
    v70 = [v69 deviceModel];
    v71 = getkSecureBackupClientMetadataKey();
    v72 = [v4 objectForKeyedSubscript:v71];
    [v72 setObject:v70 forKeyedSubscript:@"device_model"];

    v73 = [v3 clientMetadata];
    v74 = [v73 deviceModelClass];
    v75 = getkSecureBackupClientMetadataKey();
    v76 = [v4 objectForKeyedSubscript:v75];
    [v76 setObject:v74 forKeyedSubscript:@"device_model_class"];

    v77 = [v3 clientMetadata];
    v78 = [v77 deviceModelVersion];
    v79 = getkSecureBackupClientMetadataKey();
    v80 = [v4 objectForKeyedSubscript:v79];
    [v80 setObject:v78 forKeyedSubscript:@"device_model_version"];

    v81 = [v3 clientMetadata];
    v82 = [v81 deviceName];
    v83 = getkSecureBackupClientMetadataKey();
    v84 = [v4 objectForKeyedSubscript:v83];
    [v84 setObject:v82 forKeyedSubscript:@"device_name"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToEscrowRecord:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(OTEscrowRecord);
    id v5 = getkSecureBackupEscrowDateKey();
    v6 = [v3 objectForKeyedSubscript:v5];

    [v6 timeIntervalSince1970];
    [(OTEscrowRecord *)v4 setCreationDate:(unint64_t)v7];
    v8 = [v3 objectForKeyedSubscript:@"metadata"];
    v9 = +[OTEscrowTranslation dictionaryToMetadata:v8];
    [(OTEscrowRecord *)v4 setEscrowInformationMetadata:v9];

    v10 = getkSecureBackupRemainingAttemptsKey();
    v11 = [v3 objectForKeyedSubscript:v10];

    -[OTEscrowRecord setRemainingAttempts:](v4, "setRemainingAttempts:", [v11 longLongValue]);
    v12 = getkSecureBackupRecordLabelKey();
    v13 = [v3 objectForKeyedSubscript:v12];
    [(OTEscrowRecord *)v4 setLabel:v13];

    v14 = getkSecureBackupRecordStatusKey();
    v15 = [v3 objectForKeyedSubscript:v14];
    -[OTEscrowRecord setRecordStatus:](v4, "setRecordStatus:", [v15 isEqualToString:@"valid"] ^ 1);

    v16 = [v3 objectForKeyedSubscript:@"silentAttemptAllowed"];
    -[OTEscrowRecord setSilentAttemptAllowed:](v4, "setSilentAttemptAllowed:", [v16 BOOLValue]);

    v17 = [v3 objectForKeyedSubscript:@"FEDERATIONID"];
    [(OTEscrowRecord *)v4 setFederationId:v17];

    v18 = [v3 objectForKeyedSubscript:@"EXPECTEDFEDERATIONID"];
    [(OTEscrowRecord *)v4 setExpectedFederationId:v18];

    v19 = getkSecureBackupRecordIDKey();
    v20 = [v3 objectForKeyedSubscript:v19];
    [(OTEscrowRecord *)v4 setRecordId:v20];

    v21 = getkSecureBackupPeerInfoSerialNumberKey();
    v22 = [v3 objectForKeyedSubscript:v21];
    [(OTEscrowRecord *)v4 setSerialNumber:v22];

    v23 = getkSecureBackupCoolOffEndKey();
    v24 = [v3 objectForKeyedSubscript:v23];

    if (v24)
    {
      v25 = getkSecureBackupCoolOffEndKey();
      v26 = [v3 objectForKeyedSubscript:v25];
      -[OTEscrowRecord setCoolOffEnd:](v4, "setCoolOffEnd:", [v26 longLongValue]);
    }
    v27 = getkSecureBackupRecoveryStatusKey();
    id v28 = [v3 objectForKeyedSubscript:v27];
    -[OTEscrowRecord setRecoveryStatus:](v4, "setRecoveryStatus:", [v28 intValue]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToMetadata:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(OTEscrowRecordMetadata);
    id v5 = [v3 objectForKeyedSubscript:@"BackupKeybagDigest"];
    [(OTEscrowRecordMetadata *)v4 setBackupKeybagDigest:v5];

    v6 = getkSecureBackupUsesMultipleiCSCKey();
    double v7 = [v3 objectForKeyedSubscript:v6];
    -[OTEscrowRecordMetadata setSecureBackupUsesMultipleIcscs:](v4, "setSecureBackupUsesMultipleIcscs:", [v7 BOOLValue]);

    v8 = getkSecureBackupBottleIDKey();
    v9 = [v3 objectForKeyedSubscript:v8];
    [(OTEscrowRecordMetadata *)v4 setBottleId:v9];

    v10 = [v3 objectForKeyedSubscript:@"bottleValid"];
    [(OTEscrowRecordMetadata *)v4 setBottleValidity:v10];

    v11 = [v3 objectForKeyedSubscript:@"com.apple.securebackup.timestamp"];
    v12 = +[OTEscrowTranslation _dateWithSecureBackupDateString:v11];

    v67 = v12;
    [v12 timeIntervalSince1970];
    [(OTEscrowRecordMetadata *)v4 setSecureBackupTimestamp:(unint64_t)v13];
    v14 = getkSecureBackupEscrowedSPKIKey();
    v15 = [v3 objectForKeyedSubscript:v14];
    [(OTEscrowRecordMetadata *)v4 setEscrowedSpki:v15];

    v16 = getkSecureBackupPeerInfoDataKey();
    v17 = [v3 objectForKeyedSubscript:v16];
    [(OTEscrowRecordMetadata *)v4 setPeerInfo:v17];

    v18 = getkSecureBackupSerialNumberKey();
    v19 = [v3 objectForKeyedSubscript:v18];
    [(OTEscrowRecordMetadata *)v4 setSerial:v19];

    v20 = getkSecureBackupBuildVersionKey();
    v21 = [v3 objectForKeyedSubscript:v20];
    [(OTEscrowRecordMetadata *)v4 setBuild:v21];

    v22 = getkSecureBackupPasscodeGenerationKey();
    v23 = [v3 objectForKeyedSubscript:v22];

    if (v23)
    {
      v24 = objc_alloc_init(OTEscrowRecordMetadataPasscodeGeneration);
      [(OTEscrowRecordMetadata *)v4 setPasscodeGeneration:v24];

      v25 = getkSecureBackupPasscodeGenerationKey();
      v26 = [v3 objectForKeyedSubscript:v25];

      uint64_t v27 = [v26 longLongValue];
      id v28 = [(OTEscrowRecordMetadata *)v4 passcodeGeneration];
      [v28 setValue:v27];
    }
    v29 = getkSecureBackupClientMetadataKey();
    v30 = [v3 objectForKeyedSubscript:v29];

    v31 = objc_alloc_init(OTEscrowRecordMetadataClientMetadata);
    [(OTEscrowRecordMetadata *)v4 setClientMetadata:v31];

    v32 = [v30 objectForKeyedSubscript:@"device_platform"];
    uint64_t v33 = [v32 longLongValue];
    v34 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v34 setDevicePlatform:v33];

    v35 = [v30 objectForKeyedSubscript:@"SecureBackupMetadataTimestamp"];
    v36 = +[OTEscrowTranslation _dateWithSecureBackupDateString:v35];

    [v36 timeIntervalSince1970];
    unint64_t v38 = (unint64_t)v37;
    id v39 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v39 setSecureBackupMetadataTimestamp:v38];

    v40 = getkSecureBackupNumericPassphraseLengthKey();
    v41 = [v30 objectForKeyedSubscript:v40];

    uint64_t v42 = [v41 longLongValue];
    v43 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v43 setSecureBackupNumericPassphraseLength:v42];

    v44 = getkSecureBackupUsesComplexPassphraseKey();
    id v45 = [v30 objectForKeyedSubscript:v44];
    uint64_t v46 = [v45 BOOLValue];
    v47 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v47 setSecureBackupUsesComplexPassphrase:v46];

    v48 = getkSecureBackupUsesNumericPassphraseKey();
    v49 = [v30 objectForKeyedSubscript:v48];
    uint64_t v50 = [v49 BOOLValue];
    id v51 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v51 setSecureBackupUsesNumericPassphrase:v50];

    v52 = [v30 objectForKeyedSubscript:@"device_color"];
    v53 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v53 setDeviceColor:v52];

    v54 = [v30 objectForKeyedSubscript:@"device_enclosure_color"];
    v55 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v55 setDeviceEnclosureColor:v54];

    v56 = [v30 objectForKeyedSubscript:@"device_mid"];
    v57 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v57 setDeviceMid:v56];

    v58 = [v30 objectForKeyedSubscript:@"device_model"];
    v59 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v59 setDeviceModel:v58];

    v60 = [v30 objectForKeyedSubscript:@"device_model_class"];
    v61 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v61 setDeviceModelClass:v60];

    v62 = [v30 objectForKeyedSubscript:@"device_model_version"];
    v63 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v63 setDeviceModelVersion:v62];

    v64 = [v30 objectForKeyedSubscript:@"device_name"];
    v65 = [(OTEscrowRecordMetadata *)v4 clientMetadata];
    [v65 setDeviceName:v64];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_stringWithSecureBackupDate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v6 = [v4 stringFromDate:v3];

  return v6;
}

+ (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
  id v5 = [v4 dateFromString:v3];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v4 setTimeZone:v8];

    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v7 = [v4 dateFromString:v3];
  }
  v9 = v7;

  return v9;
}

+ (id)cdpRecoveryInformationToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 recoverySecret];
    v6 = getkSecureBackupPassphraseKey();
    [v4 setObject:v5 forKeyedSubscript:v6];

    int v7 = [v3 useCachedSecret];
    uint64_t v8 = MEMORY[0x1E4F1CC28];
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    if (v7) {
      uint64_t v10 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v10 = MEMORY[0x1E4F1CC28];
    }
    v11 = getkSecureBackupUseCachedPassphraseKey();
    [v4 setObject:v10 forKeyedSubscript:v11];

    v12 = [v3 recoveryKey];
    double v13 = getkSecureBackupRecoveryKeyKey();
    [v4 setObject:v12 forKeyedSubscript:v13];

    if ([v3 usePreviouslyCachedRecoveryKey]) {
      uint64_t v14 = v9;
    }
    else {
      uint64_t v14 = v8;
    }
    v15 = getkSecureBackupUsesRecoveryKeyKey();
    [v4 setObject:v14 forKeyedSubscript:v15];

    if ([v3 silentRecoveryAttempt]) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = v8;
    }
    v17 = getkSecureBackupSilentRecoveryAttemptKey();
    [v4 setObject:v16 forKeyedSubscript:v17];

    if ([v3 containsIcdpData]) {
      uint64_t v18 = v9;
    }
    else {
      uint64_t v18 = v8;
    }
    v19 = getkSecureBackupContainsiCDPDataKey();
    [v4 setObject:v18 forKeyedSubscript:v19];

    if ([v3 usesMultipleIcsc]) {
      uint64_t v20 = v9;
    }
    else {
      uint64_t v20 = v8;
    }
    v21 = getkSecureBackupUsesMultipleiCSCKey();
    [v4 setObject:v20 forKeyedSubscript:v21];

    if ([v3 nonViableRepair]) {
      uint64_t v22 = v9;
    }
    else {
      uint64_t v22 = v8;
    }
    v23 = getkSecureBackupNonViableRepairKey();
    [v4 setObject:v22 forKeyedSubscript:v23];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToCDPRecoveryInformation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(OTCDPRecoveryInformation);
    id v5 = getkSecureBackupPassphraseKey();
    v6 = [v3 objectForKeyedSubscript:v5];
    [(OTCDPRecoveryInformation *)v4 setRecoverySecret:v6];

    int v7 = getkSecureBackupUseCachedPassphraseKey();
    uint64_t v8 = [v3 objectForKeyedSubscript:v7];
    -[OTCDPRecoveryInformation setUseCachedSecret:](v4, "setUseCachedSecret:", [v8 BOOLValue]);

    uint64_t v9 = getkSecureBackupRecoveryKeyKey();
    uint64_t v10 = [v3 objectForKeyedSubscript:v9];
    [(OTCDPRecoveryInformation *)v4 setRecoveryKey:v10];

    v11 = getkSecureBackupUsesRecoveryKeyKey();
    v12 = [v3 objectForKeyedSubscript:v11];
    -[OTCDPRecoveryInformation setUsePreviouslyCachedRecoveryKey:](v4, "setUsePreviouslyCachedRecoveryKey:", [v12 BOOLValue]);

    double v13 = getkSecureBackupSilentRecoveryAttemptKey();
    uint64_t v14 = [v3 objectForKeyedSubscript:v13];
    -[OTCDPRecoveryInformation setSilentRecoveryAttempt:](v4, "setSilentRecoveryAttempt:", [v14 BOOLValue]);

    v15 = getkSecureBackupContainsiCDPDataKey();
    uint64_t v16 = [v3 objectForKeyedSubscript:v15];
    -[OTCDPRecoveryInformation setContainsIcdpData:](v4, "setContainsIcdpData:", [v16 BOOLValue]);

    v17 = getkSecureBackupUsesMultipleiCSCKey();
    uint64_t v18 = [v3 objectForKeyedSubscript:v17];
    -[OTCDPRecoveryInformation setUsesMultipleIcsc:](v4, "setUsesMultipleIcsc:", [v18 BOOLValue]);

    v19 = getkSecureBackupNonViableRepairKey();
    uint64_t v20 = [v3 objectForKeyedSubscript:v19];
    -[OTCDPRecoveryInformation setNonViableRepair:](v4, "setNonViableRepair:", [v20 BOOLValue]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)escrowAuthenticationInfoToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 authenticationAppleid];
    char v6 = [v5 isEqualToString:&stru_1EED4A680];

    if ((v6 & 1) == 0)
    {
      int v7 = [v3 authenticationAppleid];
      uint64_t v8 = getkSecureBackupAuthenticationAppleID();
      [v4 setObject:v7 forKeyedSubscript:v8];
    }
    uint64_t v9 = [v3 authenticationAuthToken];
    char v10 = [v9 isEqualToString:&stru_1EED4A680];

    if ((v10 & 1) == 0)
    {
      v11 = [v3 authenticationAuthToken];
      v12 = getkSecureBackupAuthenticationAuthToken();
      [v4 setObject:v11 forKeyedSubscript:v12];
    }
    double v13 = [v3 authenticationDsid];
    char v14 = [v13 isEqualToString:&stru_1EED4A680];

    if ((v14 & 1) == 0)
    {
      v15 = [v3 authenticationDsid];
      uint64_t v16 = getkSecureBackupAuthenticationDSID();
      [v4 setObject:v15 forKeyedSubscript:v16];
    }
    v17 = [v3 authenticationEscrowproxyUrl];
    char v18 = [v17 isEqualToString:&stru_1EED4A680];

    if ((v18 & 1) == 0)
    {
      v19 = [v3 authenticationEscrowproxyUrl];
      uint64_t v20 = getkSecureBackupAuthenticationEscrowProxyURL();
      [v4 setObject:v19 forKeyedSubscript:v20];
    }
    v21 = [v3 authenticationIcloudEnvironment];
    char v22 = [v21 isEqualToString:&stru_1EED4A680];

    if ((v22 & 1) == 0)
    {
      v23 = [v3 authenticationIcloudEnvironment];
      v24 = getkSecureBackupAuthenticationiCloudEnvironment();
      [v4 setObject:v23 forKeyedSubscript:v24];
    }
    v25 = [v3 authenticationPassword];
    char v26 = [v25 isEqualToString:&stru_1EED4A680];

    if ((v26 & 1) == 0)
    {
      uint64_t v27 = [v3 authenticationPassword];
      id v28 = getkSecureBackupAuthenticationPassword();
      [v4 setObject:v27 forKeyedSubscript:v28];
    }
    v29 = [v3 fmipUuid];
    char v30 = [v29 isEqualToString:&stru_1EED4A680];

    if ((v30 & 1) == 0)
    {
      v31 = [v3 fmipUuid];
      v32 = getkSecureBackupFMiPUUIDKey();
      [v4 setObject:v31 forKeyedSubscript:v32];
    }
    int v33 = [v3 fmipRecovery];
    uint64_t v34 = MEMORY[0x1E4F1CC28];
    uint64_t v35 = MEMORY[0x1E4F1CC38];
    if (v33) {
      uint64_t v36 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v36 = MEMORY[0x1E4F1CC28];
    }
    double v37 = getkSecureBackupFMiPRecoveryKey();
    [v4 setObject:v36 forKeyedSubscript:v37];

    if ([v3 idmsRecovery]) {
      uint64_t v38 = v35;
    }
    else {
      uint64_t v38 = v34;
    }
    id v39 = getkSecureBackupIDMSRecoveryKey();
    [v4 setObject:v38 forKeyedSubscript:v39];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryToEscrowAuthenticationInfo:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F3B430] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(OTEscrowAuthenticationInformation);
    id v5 = getkSecureBackupAuthenticationAppleID();
    char v6 = [v3 objectForKeyedSubscript:v5];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationAppleid:v6];

    int v7 = getkSecureBackupAuthenticationAuthToken();
    uint64_t v8 = [v3 objectForKeyedSubscript:v7];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationAuthToken:v8];

    uint64_t v9 = getkSecureBackupAuthenticationDSID();
    char v10 = [v3 objectForKeyedSubscript:v9];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationDsid:v10];

    v11 = getkSecureBackupAuthenticationEscrowProxyURL();
    v12 = [v3 objectForKeyedSubscript:v11];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationEscrowproxyUrl:v12];

    double v13 = getkSecureBackupAuthenticationiCloudEnvironment();
    char v14 = [v3 objectForKeyedSubscript:v13];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationIcloudEnvironment:v14];

    v15 = getkSecureBackupAuthenticationPassword();
    uint64_t v16 = [v3 objectForKeyedSubscript:v15];
    [(OTEscrowAuthenticationInformation *)v4 setAuthenticationPassword:v16];

    v17 = getkSecureBackupFMiPUUIDKey();
    char v18 = [v3 objectForKeyedSubscript:v17];
    [(OTEscrowAuthenticationInformation *)v4 setFmipUuid:v18];

    v19 = getkSecureBackupFMiPRecoveryKey();
    uint64_t v20 = [v3 objectForKeyedSubscript:v19];
    -[OTEscrowAuthenticationInformation setFmipRecovery:](v4, "setFmipRecovery:", [v20 BOOLValue]);

    v21 = getkSecureBackupIDMSRecoveryKey();
    char v22 = [v3 objectForKeyedSubscript:v21];
    -[OTEscrowAuthenticationInformation setIdmsRecovery:](v4, "setIdmsRecovery:", [v22 BOOLValue]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end