@interface SUCoreDDMDeclaration
+ (BOOL)supportsSecureCoding;
- (BOOL)enableNotifications;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstallOverdue;
- (BOOL)isValidDeclaration;
- (BOOL)isValidDeclarationWithReason:(id *)a3;
- (NSDate)enforcedInstallDate;
- (NSDictionary)additionalOptions;
- (NSString)buildVersionString;
- (NSString)companyName;
- (NSString)declarationKey;
- (NSString)detailsURL;
- (NSString)versionString;
- (SUCoreDDMDeclaration)initWithCoder:(id)a3;
- (SUCoreDDMDeclaration)initWithDeclarationKeys:(id)a3;
- (SUCoreDevice)device;
- (id)_dateFromString:(id)a3;
- (id)_stringFromDate:(id)a3;
- (id)copy;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBuildVersionString:(id)a3;
- (void)setCompanyName:(id)a3;
- (void)setDeclarationKey:(id)a3;
- (void)setDetailsURL:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnableNotifications:(BOOL)a3;
- (void)setEnforcedInstallDate:(id)a3;
- (void)setVersionString:(id)a3;
@end

@implementation SUCoreDDMDeclaration

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
  if (!v5) {
    goto LABEL_14;
  }
  v6 = (void *)v5;
  v7 = [v4 enforcedInstallDate];

  if (!v7
    || ([(SUCoreDDMDeclaration *)self enforcedInstallDate],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 enforcedInstallDate],
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = (void *)[v8 compare:v9],
        v9,
        v8,
        !v10))
  {
LABEL_14:
    uint64_t v11 = [(SUCoreDDMDeclaration *)self versionString];
    if (!v11) {
      goto LABEL_7;
    }
    v12 = (void *)v11;
    v13 = [v4 versionString];

    if (!v13
      || ([(SUCoreDDMDeclaration *)self versionString],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v4 versionString],
          v15 = objc_claimAutoreleasedReturnValue(),
          v10 = (void *)[v14 compare:v15 options:64],
          v15,
          v14,
          !v10))
    {
LABEL_7:
      v10 = [(SUCoreDDMDeclaration *)self buildVersionString];
      if (v10)
      {
        v16 = [v4 buildVersionString];

        if (v16)
        {
          v17 = [(SUCoreDDMDeclaration *)self buildVersionString];
          v18 = [v4 buildVersionString];
          v10 = (void *)[v17 compare:v18 options:64];
        }
        else
        {
          v10 = 0;
        }
      }
    }
  }

  return (int64_t)v10;
}

- (SUCoreDDMDeclaration)initWithDeclarationKeys:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUCoreDDMDeclaration;
  uint64_t v5 = [(SUCoreDDMDeclaration *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 safeStringForKey:@"RMStoreDeclarationKey"];
    declarationKey = v5->_declarationKey;
    v5->_declarationKey = (NSString *)v6;

    v8 = [v4 safeStringForKey:@"TargetLocalDateTime"];
    uint64_t v9 = [(SUCoreDDMDeclaration *)v5 _dateFromString:v8];
    enforcedInstallDate = v5->_enforcedInstallDate;
    v5->_enforcedInstallDate = (NSDate *)v9;

    uint64_t v11 = [v4 safeStringForKey:@"TargetOSVersion"];
    versionString = v5->_versionString;
    v5->_versionString = (NSString *)v11;

    uint64_t v13 = [v4 safeStringForKey:@"TargetBuildVersion"];
    buildVersionString = v5->_buildVersionString;
    v5->_buildVersionString = (NSString *)v13;

    v5->_enableNotifications = 1;
    uint64_t v15 = [v4 safeStringForKey:@"DetailsURL"];
    detailsURL = v5->_detailsURL;
    v5->_detailsURL = (NSString *)v15;

    uint64_t v17 = [v4 safeStringForKey:@"CompanyName"];
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v17;

    uint64_t v19 = [v4 safeDictionaryForKey:@"AdditionalOptions"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = (NSDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263F77DA0] sharedDevice];
    device = v5->_device;
    v5->_device = (SUCoreDevice *)v21;
  }
  return v5;
}

- (SUCoreDDMDeclaration)initWithCoder:(id)a3
{
  v11[14] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  v11[12] = objc_opt_class();
  v11[13] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:14];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ddmDeclaration"];

  uint64_t v9 = [(SUCoreDDMDeclaration *)self initWithDeclarationKeys:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreDDMDeclaration *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"ddmDeclaration"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (id)_dateFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  uint64_t v6 = [v5 dateFromString:v4];

  return v6;
}

- (id)_stringFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  uint64_t v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUCoreDDMDeclaration *)self declarationKey];
  id v5 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
  uint64_t v6 = [(SUCoreDDMDeclaration *)self _stringFromDate:v5];
  v7 = [(SUCoreDDMDeclaration *)self versionString];
  v8 = [(SUCoreDDMDeclaration *)self buildVersionString];
  uint64_t v9 = [(SUCoreDDMDeclaration *)self detailsURL];
  v10 = [(SUCoreDDMDeclaration *)self companyName];
  BOOL v11 = [(SUCoreDDMDeclaration *)self enableNotifications];
  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  uint64_t v13 = [v3 stringWithFormat:@"SUCoreDDMDeclaration (DeclarationKey:%@|EnforcedInstallDate:%@|VersionString:%@|BuildVersionString:%@|DetailsURL:%@|companyName:%@|NotificationsEnabled:%@)", v4, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(SUCoreDDMDeclaration *)self declarationKey];
  [v3 setSafeObject:v4 forKey:@"RMStoreDeclarationKey"];

  id v5 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
  uint64_t v6 = [(SUCoreDDMDeclaration *)self _stringFromDate:v5];
  [v3 setSafeObject:v6 forKey:@"TargetLocalDateTime"];

  v7 = [(SUCoreDDMDeclaration *)self versionString];
  [v3 setSafeObject:v7 forKey:@"TargetOSVersion"];

  v8 = [(SUCoreDDMDeclaration *)self buildVersionString];
  [v3 setSafeObject:v8 forKey:@"TargetBuildVersion"];

  uint64_t v9 = [(SUCoreDDMDeclaration *)self companyName];
  [v3 setSafeObject:v9 forKey:@"CompanyName"];

  v10 = [(SUCoreDDMDeclaration *)self additionalOptions];
  [v3 setSafeObject:v10 forKey:@"AdditionalOptions"];

  BOOL v11 = [(SUCoreDDMDeclaration *)self detailsURL];
  [v3 setSafeObject:v11 forKey:@"DetailsURL"];

  v12 = (void *)[v3 copy];

  return v12;
}

- (BOOL)isValidDeclaration
{
  return [(SUCoreDDMDeclaration *)self isValidDeclarationWithReason:0];
}

- (BOOL)isInstallOverdue
{
  v2 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
  v3 = [MEMORY[0x263EFF910] now];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (BOOL)isValidDeclarationWithReason:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreDDMDeclaration *)self declarationKey];

  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid declaration: invalid declaration key"];
    uint64_t v9 = +[SUCoreDDMUtilities sharedLogger];
    v10 = [v9 oslog];

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];

  if (!v6)
  {
    id v8 = [NSString stringWithFormat:@"Invalid declaration: invalid enforced install date"];
    BOOL v11 = +[SUCoreDDMUtilities sharedLogger];
    v10 = [v11 oslog];

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = [(SUCoreDDMDeclaration *)self versionString];
  if (v7)
  {

LABEL_13:
    id v8 = [(SUCoreDDMDeclaration *)self device];
    if (!v8)
    {
      id v14 = [NSString stringWithFormat:@"Internal error: failed to get a core device"];
      uint64_t v21 = +[SUCoreDDMUtilities sharedLogger];
      v22 = [v21 oslog];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDDMDeclaration isValidDeclarationWithReason:]();
      }

      if (a3)
      {
        id v14 = v14;
        BOOL v12 = 0;
        *a3 = v14;
      }
      else
      {
        BOOL v12 = 0;
      }
      goto LABEL_43;
    }
    id v14 = [(SUCoreDDMDeclaration *)self versionString];
    uint64_t v15 = [v8 productVersion];
    v16 = [(SUCoreDDMDeclaration *)self buildVersionString];
    uint64_t v17 = [(SUCoreDDMDeclaration *)self versionString];

    if (!v17) {
      goto LABEL_23;
    }
    if (([v8 isCorrectlyFormattedProductVersion:v14] & 1) == 0)
    {
      v18 = [NSString stringWithFormat:@"Invalid declaration: target OS version (%@) has an invalid format", v14];
      v29 = +[SUCoreDDMUtilities sharedLogger];
      v20 = [v29 oslog];

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if ([v15 compare:v14 options:64] == 1)
    {
      v18 = [NSString stringWithFormat:@"Invalid declaration: target OS version (%@) is older than current version (%@)", v14, v15];
      uint64_t v19 = +[SUCoreDDMUtilities sharedLogger];
      v20 = [v19 oslog];

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
    }
    else
    {
LABEL_23:
      v23 = [(SUCoreDDMDeclaration *)self buildVersionString];

      if (!v23 || ([v8 isCorrectlyFormattedBuildVersion:v16] & 1) != 0)
      {
        if ([(SUCoreDDMDeclaration *)self isInstallOverdue])
        {
          objc_super v24 = +[SUCoreDDMUtilities sharedLogger];
          v25 = [v24 oslog];

          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
            v27 = [(SUCoreDDMDeclaration *)self _stringFromDate:v26];
            *(_DWORD *)buf = 136315394;
            v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
            __int16 v35 = 2112;
            v36 = v27;
            _os_log_impl(&dword_20C8EA000, v25, OS_LOG_TYPE_DEFAULT, "%s: Past-due declaration: enforced install date is in the past (%@)", buf, 0x16u);
          }
        }
        v28 = +[SUCoreDDMUtilities sharedLogger];
        v18 = [v28 oslog];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
          __int16 v35 = 2112;
          v36 = self;
          _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "%s: %@ is (likely) good to go!", buf, 0x16u);
        }
        BOOL v12 = 1;
        goto LABEL_42;
      }
      v18 = [NSString stringWithFormat:@"Invalid declaration: target build version (%@) has an invalid format", v16];
      v31 = +[SUCoreDDMUtilities sharedLogger];
      v20 = [v31 oslog];

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_39:

        if (a3)
        {
          v18 = v18;
          BOOL v12 = 0;
          *a3 = v18;
        }
        else
        {
          BOOL v12 = 0;
        }
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
    }
LABEL_38:
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:]();
    goto LABEL_39;
  }
  uint64_t v13 = [(SUCoreDDMDeclaration *)self buildVersionString];

  if (v13) {
    goto LABEL_13;
  }
  id v8 = [NSString stringWithFormat:@"Invalid declaration: no target version set"];
  v30 = +[SUCoreDDMUtilities sharedLogger];
  v10 = [v30 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_8:
  }
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:]();
LABEL_9:

  if (a3)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_44:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (SUCoreDDMDeclaration *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x263F77D78];
      v7 = [(SUCoreDDMDeclaration *)self enforcedInstallDate];
      id v8 = [(SUCoreDDMDeclaration *)v5 enforcedInstallDate];
      if ([v6 dateIsEqual:v7 to:v8])
      {
        uint64_t v9 = (void *)MEMORY[0x263F77D78];
        v10 = [(SUCoreDDMDeclaration *)self versionString];
        BOOL v11 = [(SUCoreDDMDeclaration *)v5 versionString];
        if ([v9 stringIsEqual:v10 to:v11])
        {
          BOOL v12 = (void *)MEMORY[0x263F77D78];
          uint64_t v13 = [(SUCoreDDMDeclaration *)self buildVersionString];
          v26 = [(SUCoreDDMDeclaration *)v5 buildVersionString];
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            v25 = v13;
            id v14 = (void *)MEMORY[0x263F77D78];
            uint64_t v15 = [(SUCoreDDMDeclaration *)self detailsURL];
            uint64_t v16 = [(SUCoreDDMDeclaration *)v5 detailsURL];
            objc_super v24 = (void *)v15;
            uint64_t v17 = v15;
            v18 = (void *)v16;
            if ([v14 stringIsEqual:v17 to:v16])
            {
              v23 = (void *)MEMORY[0x263F77D78];
              uint64_t v19 = [(SUCoreDDMDeclaration *)self companyName];
              v20 = [(SUCoreDDMDeclaration *)v5 companyName];
              char v21 = [v23 stringIsEqual:v19 to:v20];
            }
            else
            {
              char v21 = 0;
            }

            uint64_t v13 = v25;
          }
          else
          {
            char v21 = 0;
          }
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (NSString)declarationKey
{
  return self->_declarationKey;
}

- (void)setDeclarationKey:(id)a3
{
}

- (NSDate)enforcedInstallDate
{
  return self->_enforcedInstallDate;
}

- (void)setEnforcedInstallDate:(id)a3
{
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
}

- (NSString)buildVersionString
{
  return self->_buildVersionString;
}

- (void)setBuildVersionString:(id)a3
{
}

- (NSString)detailsURL
{
  return self->_detailsURL;
}

- (void)setDetailsURL:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (BOOL)enableNotifications
{
  return self->_enableNotifications;
}

- (void)setEnableNotifications:(BOOL)a3
{
  self->_enableNotifications = a3;
}

- (SUCoreDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_detailsURL, 0);
  objc_storeStrong((id *)&self->_buildVersionString, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_enforcedInstallDate, 0);

  objc_storeStrong((id *)&self->_declarationKey, 0);
}

- (void)isValidDeclarationWithReason:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_4(&dword_20C8EA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

@end