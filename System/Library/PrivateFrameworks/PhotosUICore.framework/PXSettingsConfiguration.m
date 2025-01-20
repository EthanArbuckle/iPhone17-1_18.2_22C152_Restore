@interface PXSettingsConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationsFromSharableString:(id)a3;
+ (id)sharableStringForConfigurations:(id)a3;
- (NSDictionary)archive;
- (NSString)name;
- (PXSettings)settings;
- (PXSettingsConfiguration)init;
- (PXSettingsConfiguration)initWithCoder:(id)a3;
- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4;
- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4 archive:(id)a5;
- (id)copyWithName:(id)a3;
- (id)copyWithUpdatedSettingsValues;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PXSettingsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)archive
{
  return self->_archive;
}

- (PXSettings)settings
{
  return self->_settings;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PXSettingsConfiguration *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(PXSettingsConfiguration *)self settings];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 encodeObject:v8 forKey:@"settingsClass"];

  id v9 = [(PXSettingsConfiguration *)self archive];
  [v4 encodeObject:v9 forKey:@"archive"];
}

- (id)copyWithUpdatedSettingsValues
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(PXSettingsConfiguration *)self name];
  v5 = [(PXSettingsConfiguration *)self settings];
  v6 = (void *)[v3 initWithName:v4 settings:v5];

  return v6;
}

- (id)copyWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(PXSettingsConfiguration *)self settings];
  v7 = [(PXSettingsConfiguration *)self archive];
  v8 = (void *)[v5 initWithName:v4 settings:v6 archive:v7];

  return v8;
}

- (PXSettingsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsClass"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archive"];

  if (!v6
    || (Class v8 = NSClassFromString(v6),
        ![(objc_class *)v8 isSubclassOfClass:objc_opt_class()]))
  {
    v10 = 0;
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [(objc_class *)v8 sharedInstance];
  v10 = (void *)v9;
  if (!v5 || !v9 || !v7) {
    goto LABEL_8;
  }
  v11 = [(PXSettingsConfiguration *)self initWithName:v5 settings:v9 archive:v7];
LABEL_9:

  return v11;
}

- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4 archive:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSettingsConfiguration;
  v11 = [(PXSettingsConfiguration *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_settings, a4);
    uint64_t v14 = [v10 copy];
    archive = v11->_archive;
    v11->_archive = (NSDictionary *)v14;
  }
  return v11;
}

- (PXSettingsConfiguration)initWithName:(id)a3 settings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 archiveDictionary];
  id v9 = [(PXSettingsConfiguration *)self initWithName:v7 settings:v6 archive:v8];

  return v9;
}

- (PXSettingsConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsConfiguration.m", 29, @"%s is not available as initializer", "-[PXSettingsConfiguration init]");

  abort();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)configurationsFromSharableString:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[[NSString alloc] initWithFormat:@"\n%@\n", @"========="];
  id v5 = [v3 componentsSeparatedByString:v4];
  if ((unint64_t)[v5 count] < 2)
  {
    id v7 = 0;
    goto LABEL_29;
  }
  id v6 = [v5 objectAtIndexedSubscript:1];
  id v7 = v6;
  if (!v6)
  {
LABEL_29:
    id v33 = 0;
    goto LABEL_34;
  }
  id v8 = [v6 dataUsingEncoding:4];
  id v39 = 0;
  id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v39];
  id v10 = v39;
  v11 = v10;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v11;
      v28 = v8;
      v29 = v7;
      v30 = v5;
      v31 = v4;
      id v32 = v3;
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v27 = v9;
      id obj = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v12) {
        goto LABEL_27;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSLog(&cfstr_UnexpectedObje_3.isa, v16);
            continue;
          }
          objc_super v17 = [v16 objectForKeyedSubscript:@"name"];
          v18 = [v16 objectForKeyedSubscript:@"settingsClass"];
          v19 = [v16 objectForKeyedSubscript:@"archive"];
          if (!v18)
          {
            v21 = 0;
LABEL_23:
            NSLog(&cfstr_MalformedConfi.isa, v16);
            v23 = v19;
            goto LABEL_24;
          }
          Class v20 = NSClassFromString(v18);
          if ([(objc_class *)v20 isSubclassOfClass:objc_opt_class()])
          {
            v21 = [(objc_class *)v20 sharedInstance];
          }
          else
          {
            v21 = 0;
          }
          v22 = [(objc_class *)v20 settingsFromArchiveDictionary:v19];
          v23 = [v22 archiveDictionary];

          if (!v17)
          {
            v19 = v23;
            goto LABEL_23;
          }
          if (!v21 || !v23)
          {
            v19 = v23;
            goto LABEL_23;
          }
          v24 = [[PXSettingsConfiguration alloc] initWithName:v17 settings:v21 archive:v23];
          [v33 addObject:v24];

LABEL_24:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (!v13)
        {
LABEL_27:

          id v4 = v31;
          id v3 = v32;
          id v7 = v29;
          id v5 = v30;
          id v9 = v27;
          id v8 = v28;
          v11 = v26;
          goto LABEL_33;
        }
      }
    }
    NSLog(&cfstr_UnexpectedObje_2.isa, v9);
  }
  else
  {
    NSLog(&cfstr_FailedToDeseri.isa, v10);
  }
  id v33 = 0;
LABEL_33:

LABEL_34:
  return v33;
}

+ (id)sharableStringForConfigurations:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v30[0] = @"name";
        v11 = [v10 name];
        v31[0] = v11;
        v30[1] = @"settingsClass";
        uint64_t v12 = [v10 settings];
        uint64_t v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        v31[1] = v14;
        v30[2] = @"archive";
        v15 = [v10 archive];
        v31[2] = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
        [v4 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  id v25 = 0;
  objc_super v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:1 error:&v25];
  id v18 = v25;
  if (!v17)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXSettingsConfiguration.m", 86, @"failed to serialize configurations: %@", v18 object file lineNumber description];
  }
  v19 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
  Class v20 = (void *)[[NSString alloc] initWithFormat:@"Photos internal settings configurations. To import, copy this whole text and select Photos > Internal Settings > (…) > Configurations > Import…\n\n%@\n%@\n%@\n", @"=========", v19, @"========="];

  return v20;
}

@end