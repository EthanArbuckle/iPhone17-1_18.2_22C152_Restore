@interface SESConfigDCK
+ (BOOL)evaluateCondition:(id)a3 operator:(id)a4 value:(id)a5 brand:(id)a6 uuid:(id)a7 deviceClass:(id)a8 productVersion:(id)a9 error:(id *)a10;
+ (BOOL)evaluateOperator:(id)a3 valueFromDevice:(id)a4 valueFromConfig:(id)a5 error:(id *)a6;
+ (BOOL)isConfigurationApplicable:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8;
+ (id)getResolvedSettingsFrom:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8;
- (BOOL)isDCKConfigurationAvailableFor:(id)a3 error:(id *)a4;
- (SESConfigDCK)init;
- (id)BOOLValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7;
- (id)arrayValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7;
- (id)dictValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7;
- (id)getCertificate:(id)a3 manufacturer:(id)a4 environment:(id)a5 region:(id)a6 prodSE:(id)a7 keyID:(id)a8 error:(id *)a9;
- (id)getEncryptionCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6;
- (id)getExternalCACertificateFor:(id)a3 environment:(id)a4 prodSE:(BOOL)a5 error:(id *)a6;
- (id)getRootCertificateFor:(id)a3 keyID:(id)a4 error:(id *)a5;
- (id)getSettingForKey:(id)a3 error:(id *)a4;
- (id)getSettingsFor:(id)a3 brand:(id)a4 uuid:(id)a5 error:(id *)a6;
- (id)getSignatureCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6;
- (id)initAtPath:(id)a3 deviceClass:(id)a4 productVersion:(id)a5;
- (id)intValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7;
@end

@implementation SESConfigDCK

- (SESConfigDCK)init
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)SESConfigDCK;
  v2 = [(SESConfigDCK *)&v27 init];
  if (!v2) {
    goto LABEL_17;
  }
  uint64_t v3 = MGGetStringAnswer();
  mgDeviceClass = v2->_mgDeviceClass;
  v2->_mgDeviceClass = (NSString *)v3;

  if (!v2->_mgDeviceClass)
  {
    v10 = SESDefaultLogObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v16 = "Failed to read DeviceClass from device";
LABEL_13:
    _os_log_impl(&dword_263826000, v10, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  uint64_t v5 = MGGetStringAnswer();
  mgProductVersion = v2->_mgProductVersion;
  v2->_mgProductVersion = (NSString *)v5;

  v7 = v2->_mgProductVersion;
  if (!v7)
  {
    v10 = SESDefaultLogObject();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v16 = "Failed to read ProductVersion from device";
    goto LABEL_13;
  }
  id v26 = 0;
  +[SESConfigUtilities getVersion:v7 error:&v26];
  int v9 = v8;
  v10 = v26;
  if (!v10)
  {
    v18 = [SESConfig alloc];
    LODWORD(v19) = v9;
    uint64_t v20 = [(SESConfig *)v18 initWithDeviceClass:v2->_mgDeviceClass productVersion:v19];
    config = v2->_config;
    v2->_config = (SESConfig *)v20;

    if (!v2->_config)
    {
      v11 = SESDefaultLogObject();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      v13 = "Failed to initialize SESConfig";
      v14 = v11;
      uint32_t v15 = 2;
      goto LABEL_7;
    }
    vehicleBrand = v2->_vehicleBrand;
    v2->_vehicleBrand = 0;

    vehicleUUID = v2->_vehicleUUID;
    v2->_vehicleUUID = 0;

    settings = v2->_settings;
    v2->_settings = 0;

LABEL_17:
    v17 = v2;
    goto LABEL_18;
  }
  v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = v2->_mgProductVersion;
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    v13 = "Invalid ProductVersion value %@";
    v14 = v11;
    uint32_t v15 = 12;
LABEL_7:
    _os_log_impl(&dword_263826000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
  }
LABEL_8:

LABEL_14:
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)initAtPath:(id)a3 deviceClass:(id)a4 productVersion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SESConfigDCK *)self init];
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v11->_mgDeviceClass, a4);
  objc_storeStrong((id *)&v12->_mgProductVersion, a5);
  id v26 = 0;
  +[SESConfigUtilities getVersion:v10 error:&v26];
  int v14 = v13;
  id v15 = v26;
  if (!v15)
  {
    v21 = [SESConfig alloc];
    LODWORD(v22) = v14;
    uint64_t v23 = [(SESConfig *)v21 initWithDeviceClass:v9 productVersion:v8 path:v22];
    config = v12->_config;
    v12->_config = (SESConfig *)v23;

    if (!v12->_config)
    {
      v16 = SESDefaultLogObject();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_WORD *)buf = 0;
      v17 = "Failed to initialize SESConfig";
      v18 = v16;
      uint32_t v19 = 2;
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v20 = v12;
    goto LABEL_9;
  }
  v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v10;
    v17 = "Invalid ProductVersion value %@";
    v18 = v16;
    uint32_t v19 = 12;
LABEL_5:
    _os_log_impl(&dword_263826000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
  }
LABEL_6:

  uint64_t v20 = 0;
LABEL_9:

  return v20;
}

- (id)getSettingForKey:(id)a3 error:(id *)a4
{
  config = self->_config;
  id v12 = 0;
  id v6 = a3;
  v7 = [(SESConfig *)config getContentsOfAssetFile:@"_settings" component:1 error:&v12];
  id v8 = v12;
  id v9 = v8;
  if (a4) {
    *a4 = v8;
  }
  id v10 = [v7 objectForKeyedSubscript:v6];

  return v10;
}

- (BOOL)isDCKConfigurationAvailableFor:(id)a3 error:(id *)a4
{
  config = self->_config;
  id v15 = 0;
  id v6 = [(SESConfig *)config getConfigForManufacturer:a3 component:1 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (a4 && v7)
  {
    id v9 = SESDefaultLogObject();
    SESCreateAndLogError(v8, v9, SESErrorDomain, 0, @"Failed to retrieve configuration", v10, v11, v12, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 != 0;
}

- (id)getExternalCACertificateFor:(id)a3 environment:(id)a4 prodSE:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v10 = NSNumber;
  id v11 = a4;
  id v12 = a3;
  int v13 = [v10 numberWithBool:v7];
  uint64_t v14 = [(SESConfigDCK *)self getCertificate:@"ExternalCA" manufacturer:v12 environment:v11 region:0 prodSE:v13 keyID:0 error:a6];

  return v14;
}

- (id)getEncryptionCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6
{
  return [(SESConfigDCK *)self getCertificate:@"Encryption" manufacturer:a3 environment:a4 region:a5 prodSE:0 keyID:0 error:a6];
}

- (id)getSignatureCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6
{
  return [(SESConfigDCK *)self getCertificate:@"Signature" manufacturer:a3 environment:a4 region:a5 prodSE:0 keyID:0 error:a6];
}

- (id)getRootCertificateFor:(id)a3 keyID:(id)a4 error:(id *)a5
{
  return [(SESConfigDCK *)self getCertificate:@"Root" manufacturer:a3 environment:0 region:0 prodSE:0 keyID:a4 error:a5];
}

- (id)getCertificate:(id)a3 manufacturer:(id)a4 environment:(id)a5 region:(id)a6 prodSE:(id)a7 keyID:(id)a8 error:(id *)a9
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  config = self->_config;
  id v74 = 0;
  v21 = [(SESConfig *)config getConfigForManufacturer:a4 component:1 error:&v74];
  id v22 = v74;
  if (v22)
  {
    id v23 = v22;
    if (a9)
    {
      v24 = SESDefaultLogObject();
      SESCreateAndLogError(v23, v24, SESErrorDomain, 0, @"Failed to retrieve configuration", v25, v26, v27, v59);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_4;
  }
  uint64_t v30 = +[SESConfigUtilities validateKey:@"Certificates" expectedClass:objc_opt_class() dictionary:v21];
  if (v30)
  {
    id v23 = v30;
    if (a9)
    {
      id v23 = v30;
      id v28 = 0;
      *a9 = v23;
      goto LABEL_5;
    }
LABEL_4:
    id v28 = 0;
    goto LABEL_5;
  }
  v31 = [v21 objectForKeyedSubscript:@"Certificates"];
  v32 = +[SESConfigUtilities validateKey:v15 expectedClass:objc_opt_class() dictionary:v31];
  if (v32)
  {
    id v23 = v32;
    if (a9)
    {
      id v23 = v32;
      id v28 = 0;
      *a9 = v23;
    }
    else
    {
      id v28 = 0;
    }
    goto LABEL_53;
  }
  v63 = v31;
  v33 = [v31 objectForKeyedSubscript:v15];
  v34 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v33;
  v64 = v34;
  uint64_t v67 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (!v67) {
    goto LABEL_35;
  }
  uint64_t v68 = *(void *)v71;
  id v62 = v15;
  v65 = v19;
  while (2)
  {
    for (uint64_t i = 0; i != v67; ++i)
    {
      if (*(void *)v71 != v68) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a9)
        {
          v49 = SESDefaultLogObject();
          SESCreateAndLogError(0, v49, SESErrorDomain, 0, @"Wrong class for certificate", v50, v51, v52, v59);
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v23 = 0;
        goto LABEL_45;
      }
      if (!v16) {
        goto LABEL_57;
      }
      v37 = +[SESConfigUtilities validateKey:@"Environment" expectedClass:objc_opt_class() dictionary:v36];
      if (v37) {
        goto LABEL_40;
      }
      v38 = [v36 objectForKeyedSubscript:@"Environment"];
      int v39 = [v16 isEqualToString:v38];

      if (v39)
      {
LABEL_57:
        if (!v17) {
          goto LABEL_26;
        }
        v37 = +[SESConfigUtilities validateKey:@"Region" expectedClass:objc_opt_class() dictionary:v36];
        if (v37) {
          goto LABEL_40;
        }
        v40 = [v36 objectForKeyedSubscript:@"Region"];
        int v41 = [v17 isEqualToString:v40];

        if (v41)
        {
LABEL_26:
          if (!v18) {
            goto LABEL_29;
          }
          v37 = +[SESConfigUtilities validateKey:@"ProdSE" expectedClass:objc_opt_class() dictionary:v36];
          if (v37) {
            goto LABEL_40;
          }
          int v42 = [v18 BOOLValue];
          v43 = [v36 objectForKeyedSubscript:@"ProdSE"];
          int v44 = [v43 BOOLValue];

          if (v42 == v44)
          {
LABEL_29:
            if (!v65)
            {
LABEL_32:
              [v64 addObject:v36];
              continue;
            }
            v37 = +[SESConfigUtilities validateKey:@"KeyID" expectedClass:objc_opt_class() dictionary:v36];
            if (!v37)
            {
              v45 = [v36 objectForKeyedSubscript:@"KeyID"];
              int v46 = [v65 isEqualToData:v45];

              if (!v46) {
                continue;
              }
              goto LABEL_32;
            }
LABEL_40:
            id v23 = v37;
            if (a9)
            {
              id v23 = v37;
              id v28 = 0;
              *a9 = v23;
LABEL_46:
              id v19 = v65;
              v47 = obj;
              id v15 = v62;
              goto LABEL_51;
            }
LABEL_45:
            id v28 = 0;
            goto LABEL_46;
          }
        }
      }
    }
    id v15 = v62;
    v34 = v64;
    id v19 = v65;
    uint64_t v67 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v67) {
      continue;
    }
    break;
  }
LABEL_35:

  if ([v34 count] == 1)
  {
    v47 = [v34 firstObject];
    v48 = +[SESConfigUtilities validateKey:@"Certificate" expectedClass:objc_opt_class() dictionary:v47];
    id v23 = v48;
    if (v48)
    {
      if (a9)
      {
        id v23 = v48;
        id v28 = 0;
        *a9 = v23;
        goto LABEL_51;
      }
LABEL_49:
      id v28 = 0;
    }
    else
    {
      id v28 = [v47 objectForKeyedSubscript:@"Certificate"];
    }
LABEL_51:
  }
  else
  {
    if (a9)
    {
      v47 = SESDefaultLogObject();
      v69 = SESErrorDomain;
      v53 = v19;
      id v54 = v15;
      uint64_t v55 = [v34 count];
      v61 = [v53 base64];
      uint64_t v60 = v55;
      id v15 = v54;
      id v19 = v53;
      SESCreateAndLogError(0, v47, v69, 0, @"%lu matches for type %@ environment %@ region %@ prodSE %@ keyID %@", v56, v57, v58, v60);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      id v23 = 0;
      goto LABEL_49;
    }
    id v23 = 0;
    id v28 = 0;
  }
  v31 = v63;

LABEL_53:
LABEL_5:

  return v28;
}

- (id)BOOLValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v19 = 0;
  id v9 = [(SESConfigDCK *)self getSettingsFor:a4 brand:a5 uuid:a6 error:&v19];
  id v10 = v19;
  if (v10)
  {
    id v11 = v10;
    if (a7)
    {
LABEL_3:
      id v11 = v11;
      id v12 = 0;
      *a7 = v11;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a3 >= 8)
  {
    if (a7)
    {
      uint64_t v14 = SESDefaultLogObject();
      SESCreateAndLogError(0, v14, SESErrorDomain, 1, @"Invalid BOOL setting input %lu", v15, v16, v17, a3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = 0;
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  int v13 = off_2655D6618[a3];
  id v11 = +[SESConfigUtilities validateKey:v13 expectedClass:objc_opt_class() dictionary:v9];
  if (v11)
  {
    if (a7) {
      goto LABEL_3;
    }
    goto LABEL_11;
  }
  id v12 = [v9 objectForKeyedSubscript:v13];
LABEL_12:

  return v12;
}

- (id)intValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v24 = 0;
  id v10 = [(SESConfigDCK *)self getSettingsFor:a4 brand:a5 uuid:a6 error:&v24];
  id v11 = v24;
  if (v11)
  {
    id v12 = v11;
    if (a7)
    {
LABEL_3:
      id v12 = v12;
      int v13 = 0;
      *a7 = v12;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (!a3)
  {
    uint64_t v14 = @"KeyRoleOnUpgrade";
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    if ([@"iPhone" isEqualToString:self->_mgDeviceClass])
    {
      uint64_t v14 = @"RSSIFurtherPhone";
      goto LABEL_18;
    }
    if ([@"Watch" isEqualToString:self->_mgDeviceClass])
    {
      uint64_t v14 = @"RSSIFurtherWatch";
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  if (a3 != 1)
  {
    if (a7)
    {
      uint64_t v15 = SESDefaultLogObject();
      SESCreateAndLogError(0, v15, SESErrorDomain, 1, @"Invalid int setting input %lu", v16, v17, v18, a3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_24;
  }
  if (([@"iPhone" isEqualToString:self->_mgDeviceClass] & 1) == 0)
  {
    if ([@"Watch" isEqualToString:self->_mgDeviceClass])
    {
      uint64_t v14 = @"RSSICloserWatch";
      goto LABEL_18;
    }
LABEL_22:
    if (a7)
    {
      id v19 = SESDefaultLogObject();
      SESCreateAndLogError(0, v19, SESErrorDomain, 1, @"Invalid DeviceClass %@", v20, v21, v22, (uint64_t)self->_mgDeviceClass);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:
    id v12 = 0;
    goto LABEL_25;
  }
  uint64_t v14 = @"RSSICloserPhone";
LABEL_18:
  id v12 = +[SESConfigUtilities validateKey:v14 expectedClass:objc_opt_class() dictionary:v10];
  if (!v12)
  {
    int v13 = [v10 objectForKeyedSubscript:v14];
    goto LABEL_26;
  }
  if (a7) {
    goto LABEL_3;
  }
LABEL_25:
  int v13 = 0;
LABEL_26:

  return v13;
}

- (id)arrayValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v18 = 0;
  id v9 = [(SESConfigDCK *)self getSettingsFor:a4 brand:a5 uuid:a6 error:&v18];
  id v10 = v18;
  if (v10)
  {
    id v11 = v10;
    if (a7)
    {
LABEL_3:
      id v11 = v11;
      id v12 = 0;
      *a7 = v11;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    if (a7)
    {
      int v13 = SESDefaultLogObject();
      SESCreateAndLogError(0, v13, SESErrorDomain, 1, @"Invalid array setting input %lu", v14, v15, v16, a3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = 0;
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  id v11 = +[SESConfigUtilities validateKey:@"RKEDisabledFunctions" expectedClass:objc_opt_class() dictionary:v9];
  if (v11)
  {
    if (a7) {
      goto LABEL_3;
    }
    goto LABEL_8;
  }
  id v12 = [v9 objectForKeyedSubscript:@"RKEDisabledFunctions"];
LABEL_9:

  return v12;
}

- (id)dictValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v18 = 0;
  id v9 = [(SESConfigDCK *)self getSettingsFor:a4 brand:a5 uuid:a6 error:&v18];
  id v10 = v18;
  if (v10)
  {
    id v11 = v10;
    if (a7)
    {
LABEL_3:
      id v11 = v11;
      id v12 = 0;
      *a7 = v11;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    if (a7)
    {
      int v13 = SESDefaultLogObject();
      SESCreateAndLogError(0, v13, SESErrorDomain, 1, @"Invalid dict setting input %lu", v14, v15, v16, a3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = 0;
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  id v11 = +[SESConfigUtilities validateKey:@"RKETimeout" expectedClass:objc_opt_class() dictionary:v9];
  if (v11)
  {
    if (a7) {
      goto LABEL_3;
    }
    goto LABEL_8;
  }
  id v12 = [v9 objectForKeyedSubscript:@"RKETimeout"];
LABEL_9:

  return v12;
}

- (id)getSettingsFor:(id)a3 brand:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  vehicleBrand = self->_vehicleBrand;
  int v14 = (v11 | (unint64_t)vehicleBrand) == 0;
  id obj = a4;
  if (v11 && vehicleBrand) {
    int v14 = [(id)v11 isEqualToString:a4];
  }
  vehicleUUID = self->_vehicleUUID;
  int v16 = (v12 | (unint64_t)vehicleUUID) == 0;
  id v37 = a5;
  uint64_t v17 = a6;
  if (v12 && vehicleUUID) {
    int v16 = [v12 isEqualToData:];
  }
  id v18 = [(SESConfig *)self->_config cachedFileName];
  int v19 = [v18 isEqualToString:v10] & v14;

  if (v19 == 1 && v16 != 0)
  {
    uint64_t v30 = self->_settings;
    goto LABEL_24;
  }
  config = self->_config;
  id v39 = 0;
  uint64_t v22 = [(SESConfig *)config getConfigForManufacturer:v10 component:1 error:&v39];
  id v23 = v39;
  if (!v23)
  {
    mgDeviceClass = self->_mgDeviceClass;
    mgProductVersion = self->_mgProductVersion;
    id v38 = 0;
    uint64_t v25 = +[SESConfigDCK getResolvedSettingsFrom:v22 brand:v11 uuid:v12 deviceClass:mgDeviceClass productVersion:mgProductVersion error:&v38];
    id v33 = v38;
    id v24 = v33;
    if (!v33)
    {
      objc_storeStrong((id *)&self->_vehicleBrand, obja);
      objc_storeStrong((id *)&self->_vehicleUUID, v37);
      objc_storeStrong((id *)&self->_settings, v25);
      uint64_t v30 = self->_settings;
      goto LABEL_22;
    }
    if (!v17)
    {
      uint64_t v30 = 0;
      goto LABEL_22;
    }
    id v29 = v33;
    id v24 = v29;
LABEL_18:
    uint64_t v30 = 0;
    id *v17 = v29;
LABEL_22:

    goto LABEL_23;
  }
  id v24 = v23;
  if (v17)
  {
    uint64_t v25 = SESDefaultLogObject();
    SESCreateAndLogError(v24, v25, SESErrorDomain, 0, @"Failed to retrieve configuration", v26, v27, v28, (uint64_t)obja);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  uint64_t v30 = 0;
LABEL_23:

LABEL_24:

  return v30;
}

+ (id)getResolvedSettingsFrom:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = SESDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v12 objectForKeyedSubscript:@"Manufacturer"];
    int v19 = [v14 base64];
    *(_DWORD *)buf = 138413314;
    v66 = v18;
    __int16 v67 = 2112;
    id v68 = v13;
    __int16 v69 = 2112;
    long long v70 = v19;
    __int16 v71 = 2112;
    id v72 = v15;
    __int16 v73 = 2112;
    id v74 = v16;
    _os_log_impl(&dword_263826000, v17, OS_LOG_TYPE_INFO, "Resolving settings for manufacturer %@ brand %@ uuid %@ device class %@ product version %@", buf, 0x34u);
  }
  unint64_t v20 = 0x263EFF000uLL;
  uint64_t v21 = +[SESConfigUtilities validateKey:@"DefaultSettings" expectedClass:objc_opt_class() dictionary:v12];
  if (v21)
  {
    id v22 = v21;
    if (a8)
    {
      id v22 = v21;
      id v23 = 0;
      *a8 = v22;
    }
    else
    {
      id v23 = 0;
    }
    goto LABEL_45;
  }
  id v24 = [v12 objectForKeyedSubscript:@"DefaultSettings"];
  uint64_t v25 = (void *)[v24 mutableCopy];

  uint64_t v26 = SESDefaultLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v25;
    _os_log_impl(&dword_263826000, v26, OS_LOG_TYPE_INFO, "Default settings %@", buf, 0xCu);
  }
  uint64_t v52 = v25;

  uint64_t v27 = +[SESConfigUtilities validateKey:@"Configurations" expectedClass:objc_opt_class() dictionary:v12];
  id v22 = v27;
  if (v27)
  {
    id v23 = 0;
    if (a8) {
      *a8 = v27;
    }
    goto LABEL_44;
  }
  id v54 = v15;
  [v12 objectForKeyedSubscript:@"Configurations"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (!v50)
  {
LABEL_40:
    id v37 = obj;

    int v46 = SESDefaultLogObject();
    id v15 = v54;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v25;
      _os_log_impl(&dword_263826000, v46, OS_LOG_TYPE_INFO, "Resolved settings %@", buf, 0xCu);
    }

    id v23 = v25;
    goto LABEL_43;
  }
  uint64_t v51 = *(void *)v61;
  id v55 = v16;
  id v53 = v13;
LABEL_14:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v61 != v51) {
      objc_enumerationMutation(obj);
    }
    id v29 = *(void **)(*((void *)&v60 + 1) + 8 * v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = v53;
      id v15 = v54;
      v36 = a8;
      id v37 = obj;
      if (!a8)
      {
LABEL_36:

        id v23 = 0;
        goto LABEL_43;
      }
      id v38 = SESDefaultLogObject();
      SESCreateAndLogError(0, v38, SESErrorDomain, 0, @"Wrong class for configuration", v39, v40, v41, v48);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    uint64_t v30 = +[SESConfigUtilities validateKey:@"Conditions" expectedClass:objc_opt_class() dictionary:v29];
    if (v30)
    {
      id v38 = v30;
      v36 = a8;
      if (!a8)
      {
        id v13 = v53;
        id v15 = v54;
        id v37 = obj;
        goto LABEL_35;
      }
      id v42 = v30;
      id v13 = v53;
      id v15 = v54;
      id v37 = obj;
LABEL_29:
      id *v36 = v42;
LABEL_35:

      id v16 = v55;
      goto LABEL_36;
    }
    id v31 = v12;
    unint64_t v32 = v20;
    id v33 = [v29 objectForKeyedSubscript:@"Conditions"];
    id v59 = 0;
    BOOL v34 = +[SESConfigDCK isConfigurationApplicable:v33 brand:v53 uuid:v14 deviceClass:v54 productVersion:v55 error:&v59];
    id v35 = v59;
    if (v35) {
      goto LABEL_31;
    }
    if (v34) {
      break;
    }

    ++v28;
    id v16 = v55;
    unint64_t v20 = v32;
    id v12 = v31;
    if (v50 == v28)
    {
      id v13 = v53;
      uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v50) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  id v35 = +[SESConfigUtilities validateKey:@"Settings" expectedClass:objc_opt_class() dictionary:v29];
  if (!v35)
  {
    int v44 = [v29 objectForKeyedSubscript:@"Settings"];
    v45 = SESDefaultLogObject();
    id v12 = v31;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v44;
      _os_log_impl(&dword_263826000, v45, OS_LOG_TYPE_INFO, "Configuration overrides %@", buf, 0xCu);
    }

    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke;
    v57[3] = &unk_2655D65F8;
    id v58 = v25;
    [v44 enumerateKeysAndObjectsUsingBlock:v57];

    id v13 = v53;
    id v16 = v55;
    goto LABEL_40;
  }
LABEL_31:
  id v43 = v35;
  id v37 = obj;
  id v12 = v31;
  if (a8)
  {
    id v43 = v35;
    *a8 = v43;
  }

  id v23 = 0;
  id v13 = v53;
  id v15 = v54;
  id v16 = v55;
LABEL_43:

LABEL_44:
LABEL_45:

  return v23;
}

void __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    id v9 = v8;
    if (v8)
    {
      id v10 = (void *)[v8 mutableCopy];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke_2;
      v12[3] = &unk_2655D65F8;
      id v13 = v10;
      id v11 = v10;
      [v7 enumerateKeysAndObjectsUsingBlock:v12];
      [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

uint64_t __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (BOOL)isConfigurationApplicable:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v41 = a4;
  id v40 = a5;
  id v39 = a6;
  id v38 = a7;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v13;
  uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v36)
  {
    LOBYTE(v26) = 1;
    goto LABEL_25;
  }
  BOOL v34 = a8;
  unint64_t v14 = 0x2655D6000uLL;
  uint64_t v37 = *(void *)v43;
  id v15 = @"Key";
  while (2)
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v43 != v37) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v26 = v34;
        if (!v34) {
          goto LABEL_25;
        }
        uint64_t v27 = SESDefaultLogObject();
        SESCreateAndLogError(0, v27, SESErrorDomain, 0, @"Wrong class for condition", v29, v30, v31, v33);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      id v18 = [*(id *)(v14 + 896) validateKey:v15 expectedClass:objc_opt_class() dictionary:v17];
      if (v18
        || ([*(id *)(v14 + 896) validateKey:@"Operator" expectedClass:objc_opt_class() dictionary:v17], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v27 = v18;
        uint64_t v26 = v34;
        if (!v34)
        {
LABEL_23:

LABEL_24:
          LOBYTE(v26) = 0;
          goto LABEL_25;
        }
        id v28 = v18;
        uint64_t v27 = v28;
LABEL_19:
        *uint64_t v26 = v28;
        goto LABEL_23;
      }
      unint64_t v19 = v14;
      unint64_t v20 = v15;
      uint64_t v21 = [v17 objectForKeyedSubscript:v15];
      id v22 = [v17 objectForKeyedSubscript:@"Operator"];
      id v23 = [v17 objectForKeyedSubscript:@"Value"];
      uint64_t v33 = (uint64_t)v38;
      BOOL v24 = +[SESConfigDCK evaluateCondition:operator:value:brand:uuid:deviceClass:productVersion:error:](SESConfigDCK, "evaluateCondition:operator:value:brand:uuid:deviceClass:productVersion:error:", v21, v22, v23, v41, v40, v39);
      id v25 = 0;
      if (v25)
      {
        uint64_t v27 = v25;
        if (v34) {
          id *v34 = v25;
        }

        goto LABEL_23;
      }

      if (!v24) {
        goto LABEL_24;
      }
      unint64_t v14 = v19;
      id v15 = v20;
    }
    LOBYTE(v26) = 1;
    uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v36) {
      continue;
    }
    break;
  }
LABEL_25:

  return (char)v26;
}

+ (BOOL)evaluateCondition:(id)a3 operator:(id)a4 value:(id)a5 brand:(id)a6 uuid:(id)a7 deviceClass:(id)a8 productVersion:(id)a9 error:(id *)a10
{
  char v15 = (char)a10;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (![v16 isEqualToString:@"DeviceClass"])
  {
    if ([v16 isEqualToString:@"DeviceProductVersion"])
    {
      if ([&unk_270EB3ED8 containsObject:v17])
      {
        id v23 = v17;
        id v24 = v22;
        goto LABEL_13;
      }
    }
    else if ([v16 isEqualToString:@"VehicleBrand"])
    {
      if ([&unk_270EB3EF0 containsObject:v17])
      {
        id v23 = v17;
        id v24 = v19;
        goto LABEL_13;
      }
    }
    else
    {
      if (![v16 isEqualToString:@"VehicleUUID"])
      {
        if (!a10) {
          goto LABEL_17;
        }
        id v25 = SESDefaultLogObject();
        SESCreateAndLogError(0, v25, SESErrorDomain, 1, @"Invalid key for condition %@", v30, v31, v32, (uint64_t)v16);
        goto LABEL_16;
      }
      if ([&unk_270EB3F08 containsObject:v17])
      {
        id v23 = v17;
        id v24 = v20;
        goto LABEL_13;
      }
    }
LABEL_14:
    if (!a10) {
      goto LABEL_17;
    }
    id v25 = SESDefaultLogObject();
    SESCreateAndLogError(0, v25, SESErrorDomain, 1, @"Invalid operator %@ for key %@", v26, v27, v28, (uint64_t)v17);
LABEL_16:
    *a10 = (id)objc_claimAutoreleasedReturnValue();

    char v15 = 0;
    goto LABEL_17;
  }
  if (([&unk_270EB3EC0 containsObject:v17] & 1) == 0) {
    goto LABEL_14;
  }
  id v23 = v17;
  id v24 = v21;
LABEL_13:
  char v15 = +[SESConfigDCK evaluateOperator:v23 valueFromDevice:v24 valueFromConfig:v18 error:a10];
LABEL_17:

  return v15;
}

+ (BOOL)evaluateOperator:(id)a3 valueFromDevice:(id)a4 valueFromConfig:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"Eq"])
  {
    char v12 = [v11 isEqual:v10];
LABEL_3:
    BOOL v13 = v12;
    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"In"])
  {
    if (!v10)
    {
LABEL_21:
      BOOL v13 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v12 = [v11 containsObject:v10];
      goto LABEL_3;
    }
LABEL_19:
    if (a6)
    {
      id v18 = SESDefaultLogObject();
      SESCreateAndLogError(0, v18, SESErrorDomain, 0, @"Invalid value %@", v19, v20, v21, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_21;
  }
  if ([v9 isEqualToString:@"Present"])
  {
    BOOL v13 = v10 != 0;
    goto LABEL_22;
  }
  char v14 = [v9 isEqualToString:@"Absent"];
  if (v10) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v14;
  }
  if ((v14 & 1) == 0 && v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v31 = 0;
    +[SESConfigUtilities getVersion:v10 error:&v31];
    float v16 = v15;
    id v17 = v31;
    if (v17)
    {
      if (a6)
      {
LABEL_18:
        id v17 = v17;
        BOOL v13 = 0;
        *a6 = v17;
LABEL_26:

        goto LABEL_22;
      }
    }
    else
    {
      id v30 = 0;
      +[SESConfigUtilities getVersion:v11 error:&v30];
      float v24 = v23;
      id v17 = v30;
      if (!v17)
      {
        if ([v9 isEqualToString:@"GT"])
        {
          id v17 = 0;
          BOOL v13 = v16 > v24;
        }
        else if ([v9 isEqualToString:@"GE"])
        {
          id v17 = 0;
          BOOL v13 = v16 >= v24;
        }
        else if ([v9 isEqualToString:@"LT"])
        {
          id v17 = 0;
          BOOL v13 = v16 < v24;
        }
        else if ([v9 isEqualToString:@"LE"])
        {
          id v17 = 0;
          BOOL v13 = v16 <= v24;
        }
        else
        {
          if (a6)
          {
            id v25 = SESDefaultLogObject();
            SESCreateAndLogError(0, v25, SESErrorDomain, 0, @"Invalid condition", v26, v27, v28, v29);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          BOOL v13 = 0;
          id v17 = 0;
        }
        goto LABEL_26;
      }
      if (a6) {
        goto LABEL_18;
      }
    }
    BOOL v13 = 0;
    goto LABEL_26;
  }
LABEL_22:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleUUID, 0);
  objc_storeStrong((id *)&self->_vehicleBrand, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_mgProductVersion, 0);

  objc_storeStrong((id *)&self->_mgDeviceClass, 0);
}

@end