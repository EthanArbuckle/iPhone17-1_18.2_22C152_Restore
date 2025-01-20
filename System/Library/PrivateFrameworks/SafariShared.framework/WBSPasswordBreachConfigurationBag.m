@interface WBSPasswordBreachConfigurationBag
- (NSString)description;
- (WBSPasswordBreachConfigurationBag)initWithBagDictionary:(id)a3;
- (WBSPasswordBreachConfigurationBag)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)firstConfigurationForSupportedProtocolVersion:(unint64_t)a3 rampIdentifier:(unint64_t)a4 allowValuesForTesting:(BOOL)a5;
- (id)snapshotData;
@end

@implementation WBSPasswordBreachConfigurationBag

- (WBSPasswordBreachConfigurationBag)initWithSnapshotData:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithJSONOrPropertyListData:", a3);
  if (!v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSPasswordBreachConfigurationBag initWithSnapshotData:error:](v8);
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = 0;
    goto LABEL_8;
  }
  self = [(WBSPasswordBreachConfigurationBag *)self initWithBagDictionary:v6];
  v7 = self;
LABEL_8:

  return v7;
}

- (WBSPasswordBreachConfigurationBag)initWithBagDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSPasswordBreachConfigurationBag;
  v5 = [(WBSPasswordBreachConfigurationBag *)&v14 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_numberForKey:", @"BagVersion");
    v7 = v6;
    if (v6)
    {
      if ((unint64_t)[v6 unsignedIntegerValue] < 2)
      {
        uint64_t v11 = [v4 copy];
        bag = v5->_bag;
        v5->_bag = (NSDictionary *)v11;

        v9 = v5;
        goto LABEL_11;
      }
      v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachConfigurationBag initWithBagDictionary:]((uint64_t)v7, v8);
      }
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachConfigurationBag initWithBagDictionary:](v10);
      }
    }
    v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)firstConfigurationForSupportedProtocolVersion:(unint64_t)a3 rampIdentifier:(unint64_t)a4 allowValuesForTesting:(BOOL)a5
{
  BOOL v25 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v7 = [(NSDictionary *)self->_bag safari_arrayContainingObjectsOfClass:objc_opt_class() forKey:@"Configurations"];
  v8 = v7;
  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v24 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F97EF8]) initWithDictionary:v14];
          [v15 unsignedIntegerForKey:@"ProtocolVersion" minimumValue:1 maximumValue:a3];
          if ([v15 errorOccurred])
          {
            v16 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[WBSPasswordBreachConfigurationBag firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:](v33, &v33[1], v16);
            }
          }
          else
          {
            [v15 unsignedIntegerForKey:@"MaximumRampIdentifier" minimumValue:a4 maximumValue:-1];
            if ([v15 errorOccurred])
            {
              v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
                -[WBSPasswordBreachConfigurationBag firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:](&v27, v28, v17);
              }
            }
            else
            {
              id v18 = objc_alloc(MEMORY[0x1E4F97EF0]);
              uint64_t v19 = [v18 initWithDictionary:v14 protocolClasses:MEMORY[0x1E4F1CBF0] allowValuesForTesting:v25];
              if (v19)
              {
                v21 = (void *)v19;

                goto LABEL_23;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v20 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v20, OS_LOG_TYPE_INFO, "No valid configuration available in the bag.", buf, 2u);
    }
    v21 = 0;
LABEL_23:
    v8 = v24;
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_INFO, "No configurations were found in the bag.", v33, 2u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)snapshotData
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_bag format:200 options:0 error:0];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, bag: %@>", objc_opt_class(), self, self->_bag];
}

- (void).cxx_destruct
{
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to decode configuration bag plist data.", v1, 2u);
}

- (void)initWithBagDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Missing bag version.", v1, 2u);
}

- (void)initWithBagDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Unsupported bag version %@", (uint8_t *)&v2, 0xCu);
}

- (void)firstConfigurationForSupportedProtocolVersion:(uint8_t *)buf rampIdentifier:(unsigned char *)a2 allowValuesForTesting:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Skipping configuration with ineligible protocol version.", buf, 2u);
}

- (void)firstConfigurationForSupportedProtocolVersion:(uint8_t *)buf rampIdentifier:(unsigned char *)a2 allowValuesForTesting:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Skipping configuration with ineligible maximum ramp identifier.", buf, 2u);
}

@end