@interface PFAdjustment
+ (BOOL)isValidArchiveDictionary:(id)a3 errors:(id)a4;
- (BOOL)enabled;
- (NSDictionary)autoSettings;
- (NSDictionary)settings;
- (NSString)autoIdentifier;
- (NSString)identifier;
- (NSString)maskUUID;
- (PFAdjustment)init;
- (PFAdjustment)initWithArchiveDictionary:(id)a3;
- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7;
- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7 maskUUID:(id)a8;
- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 enabled:(BOOL)a5;
- (id)archiveDictionary;
- (id)debugDescription;
- (unint64_t)formatVersion;
@end

@implementation PFAdjustment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskUUID, 0);
  objc_storeStrong((id *)&self->_autoSettings, 0);
  objc_storeStrong((id *)&self->_autoIdentifier, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)maskUUID
{
  return self->_maskUUID;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDictionary)autoSettings
{
  return self->_autoSettings;
}

- (NSString)autoIdentifier
{
  return self->_autoIdentifier;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (id)debugDescription
{
  v3 = [NSString stringWithFormat:@"<%@:%p identifer=%@ maskUUID=%@ enabled=%d settings=%@", objc_opt_class(), self, self->_identifier, self->_maskUUID, self->_enabled, self->_settings];
  v4 = v3;
  if (*(_OWORD *)&self->_autoIdentifier != 0)
  {
    uint64_t v5 = [v3 stringByAppendingFormat:@" autoIdentifier=%@ autoSettings=%@", self->_autoIdentifier, self->_autoSettings];

    v4 = (void *)v5;
  }
  v6 = [v4 stringByAppendingString:@">"];

  return v6;
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7 maskUUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v26 = a6;
  id v17 = a8;
  if (!v14)
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    v23 = @"Attempting to initialize adjustment with nil identifier";
LABEL_8:
    [v21 raise:v22 format:v23];
    v20 = 0;
    goto LABEL_9;
  }
  if (!v15)
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    v23 = @"Attempting to initialize adjustment with nil settings";
    goto LABEL_8;
  }
  v27.receiver = self;
  v27.super_class = (Class)PFAdjustment;
  v18 = [(PFAdjustment *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_settings, a4);
    objc_storeStrong((id *)&v19->_autoIdentifier, a5);
    objc_storeStrong((id *)&v19->_autoSettings, a6);
    v19->_enabled = a7;
    objc_storeStrong((id *)&v19->_maskUUID, a8);
    v19->_formatVersion = 1;
  }
  self = v19;
  v20 = self;
LABEL_9:

  return v20;
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7
{
  return [(PFAdjustment *)self initWithIdentifier:a3 settings:a4 autoIdentifier:a5 autoSettings:a6 enabled:a7 maskUUID:0];
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 enabled:(BOOL)a5
{
  return [(PFAdjustment *)self initWithIdentifier:a3 settings:a4 autoIdentifier:0 autoSettings:0 enabled:a5];
}

- (PFAdjustment)init
{
  return 0;
}

- (id)archiveDictionary
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [NSNumber numberWithUnsignedInteger:self->_formatVersion];
  [v3 setObject:v4 forKeyedSubscript:PFAdjustmentFormatVersionKey];

  [v3 setObject:self->_identifier forKeyedSubscript:PFAdjustmentIdentifierKey];
  uint64_t v5 = [NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v5 forKeyedSubscript:PFAdjustmentEnabledKey];

  maskUUID = self->_maskUUID;
  if (maskUUID) {
    [v3 setObject:maskUUID forKeyedSubscript:PFAdjustmentMaskUUIDKey];
  }
  settings = self->_settings;
  if (settings) {
    [v3 setObject:settings forKeyedSubscript:PFAdjustmentArchivedSettingsKey];
  }
  autoIdentifier = self->_autoIdentifier;
  if (autoIdentifier)
  {
    autoSettings = self->_autoSettings;
    if (autoSettings)
    {
      v12[0] = PFAdjustmentSettingsAutoCurrentKey;
      v12[1] = autoIdentifier;
      v13[0] = autoIdentifier;
      v13[1] = autoSettings;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
      [v3 setObject:v10 forKeyedSubscript:PFAdjustmentAutoKey];
    }
  }
  return v3;
}

- (PFAdjustment)initWithArchiveDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = PFAdjustmentFormatVersionKey;
    id v5 = a3;
    v6 = [v5 objectForKeyedSubscript:v4];
    v7 = [v5 objectForKeyedSubscript:PFAdjustmentIdentifierKey];
    v8 = [v5 objectForKeyedSubscript:PFAdjustmentArchivedSettingsKey];
    v9 = [v5 objectForKeyedSubscript:PFAdjustmentEnabledKey];
    v10 = [v5 objectForKeyedSubscript:PFAdjustmentMaskUUIDKey];
    v11 = [v5 objectForKeyedSubscript:PFAdjustmentAutoKey];

    if (v11)
    {
      v12 = [v11 objectForKeyedSubscript:PFAdjustmentSettingsAutoCurrentKey];
      if (v12)
      {
        v13 = [v11 objectForKeyedSubscript:v12];
        goto LABEL_8;
      }
    }
    else
    {
      v12 = 0;
    }
    v13 = 0;
LABEL_8:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v6 unsignedIntegerValue];
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [v6 integerValue];
        if (!v7) {
          goto LABEL_24;
        }
      }
      else
      {
        if (v6) {
          goto LABEL_24;
        }
        uint64_t v15 = 0;
        if (!v7) {
          goto LABEL_24;
        }
      }
    }
    unint64_t v18 = v15;
    objc_opt_class();
    id v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    if (!v8) {
      goto LABEL_25;
    }
    objc_opt_class();
    id v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v9) {
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = -[PFAdjustment initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:](self, "initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:", v7, v8, v12, v13, [v9 BOOLValue], v10);
      if (v16) {
        v16->_formatVersion = v18;
      }
      self = v16;
      id v14 = self;
      goto LABEL_25;
    }
LABEL_24:
    id v14 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v14 = 0;
LABEL_26:

  return v14;
}

+ (BOOL)isValidArchiveDictionary:(id)a3 errors:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (+[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentFormatVersionKey ofType:objc_opt_class() errors:v6])
    {
      v7 = [v5 objectForKeyedSubscript:PFAdjustmentFormatVersionKey];
      uint64_t v8 = [v7 unsignedIntegerValue];
      BOOL v9 = v8 == 1;
      if (v8 != 1)
      {
        v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = PFAdjustmentFormatVersionKey;
        v22[0] = v7;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        v12 = [v10 errorWithDomain:@"PFAdjustmentErrorDomain" code:4 userInfo:v11];
        [v6 addObject:v12];
      }
    }
    else
    {
      BOOL v9 = 0;
    }
    int v15 = v9 & +[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentIdentifierKey ofType:objc_opt_class() errors:v6];
    BOOL v16 = +[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentArchivedSettingsKey ofType:objc_opt_class() errors:v6];
    BOOL v14 = (+[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentEnabledKey ofType:objc_opt_class() errors:v6]&& v16) & v15;
    id v17 = [v5 objectForKeyedSubscript:PFAdjustmentAutoKey];
    if (v17)
    {
      if (+[PFAdjustmentSerialization validateValue:v17 isOfType:objc_opt_class() errors:v6]&& v14)
      {
        unint64_t v18 = [v17 objectForKeyedSubscript:PFAdjustmentSettingsAutoCurrentKey];

        if (v18)
        {
          v19 = [v17 objectForKeyedSubscript:PFAdjustmentSettingsAutoCurrentKey];
          BOOL v14 = +[PFAdjustmentSerialization validateValue:v19 isOfType:objc_opt_class() errors:v6];
          if (v14 && v19) {
            LOBYTE(v14) = +[PFAdjustmentSerialization validateArchive:v17 containsEntryWithKey:v19 ofType:objc_opt_class() errors:v6];
          }
        }
        else
        {
          v19 = 0;
          LOBYTE(v14) = 1;
        }
      }
      else
      {
        v19 = 0;
        LOBYTE(v14) = 0;
      }
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFAdjustmentErrorDomain" code:1 userInfo:0];
    [v6 addObject:v13];

    LOBYTE(v14) = 0;
  }

  return v14;
}

@end