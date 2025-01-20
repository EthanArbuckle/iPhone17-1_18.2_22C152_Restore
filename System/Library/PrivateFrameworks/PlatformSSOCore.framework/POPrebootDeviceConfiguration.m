@interface POPrebootDeviceConfiguration
+ (BOOL)supportsSecureCoding;
- (NSData)deviceConfigurationData;
- (NSData)encryptionKeyData;
- (NSData)loginConfigurationData;
- (NSDate)encryptionKeySaveDate;
- (POPrebootDeviceConfiguration)initWithCoder:(id)a3;
- (POPrebootDeviceConfiguration)initWithData:(id)a3;
- (POPrebootDeviceConfiguration)initWithDictionary:(id)a3;
- (id)dataRepresentation;
- (id)dataRepresentationForDisplay:(BOOL)a3;
- (id)description;
- (id)dictionaryRepresentationForDisplay:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceConfigurationData:(id)a3;
- (void)setEncryptionKeyData:(id)a3;
- (void)setLoginConfigurationData:(id)a3;
@end

@implementation POPrebootDeviceConfiguration

- (void)setEncryptionKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKeyData, a3);
  id v7 = a3;
  v5 = [MEMORY[0x263EFF910] date];
  encryptionKeySaveDate = self->_encryptionKeySaveDate;
  self->_encryptionKeySaveDate = v5;
}

- (id)dataRepresentation
{
  return [(POPrebootDeviceConfiguration *)self dataRepresentationForDisplay:0];
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v5 setFormatOptions:1907];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  encryptionKeyData = self->_encryptionKeyData;
  if (v3) {
    [(NSData *)encryptionKeyData psso_sha256HashString];
  }
  else {
  v8 = [(NSData *)encryptionKeyData psso_base64URLEncodedString];
  }
  v9 = NSStringFromSelector(sel_encryptionKeyData);
  [v6 setObject:v8 forKeyedSubscript:v9];

  if (v3)
  {
    [v5 stringFromDate:self->_encryptionKeySaveDate];
  }
  else
  {
    v10 = NSNumber;
    [(NSDate *)self->_encryptionKeySaveDate timeIntervalSince1970];
    objc_msgSend(v10, "numberWithDouble:");
  v11 = };
  v12 = NSStringFromSelector(sel_encryptionKeySaveDate);
  [v6 setObject:v11 forKeyedSubscript:v12];

  v13 = [MEMORY[0x263EFF910] date];
  v14 = [v5 stringFromDate:v13];
  [v6 setObject:v14 forKeyedSubscript:@"created"];

  return v6;
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  BOOL v3 = [(POPrebootDeviceConfiguration *)self dictionaryRepresentationForDisplay:a3];
  id v13 = 0;
  v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:11 error:&v13];
  id v5 = v13;
  id v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke;
    v11[3] = &unk_265463860;
    id v12 = v5;
    id v7 = __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v11);

    id v8 = 0;
  }
  else
  {
    v9 = PO_LOG_POPrebootDeviceConfiguration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POPrebootDeviceConfiguration dataRepresentationForDisplay:]((uint64_t)v4, v9);
    }

    id v8 = v4;
  }

  return v8;
}

id __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user login config."];
  v2 = PO_LOG_POPrebootDeviceConfiguration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

- (POPrebootDeviceConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(POPrebootDeviceConfiguration *)self init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_encryptionKeyData);
    id v7 = [v4 objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x263EFF8F8]);
      v9 = NSStringFromSelector(sel_encryptionKeyData);
      v10 = [v4 objectForKeyedSubscript:v9];
      uint64_t v11 = objc_msgSend(v8, "psso_initWithBase64URLEncodedString:", v10);

      encryptionKeyData = v5->_encryptionKeyData;
      v5->_encryptionKeyData = (NSData *)v11;
    }
    id v13 = NSStringFromSelector(sel_encryptionKeySaveDate);
    v14 = [v4 objectForKeyedSubscript:v13];

    if (v14)
    {
      v15 = NSStringFromSelector(sel_encryptionKeySaveDate);
      v16 = [v4 objectForKeyedSubscript:v15];

      uint64_t v17 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v16, "intValue"));
      encryptionKeySaveDate = v5->_encryptionKeySaveDate;
      v5->_encryptionKeySaveDate = (NSDate *)v17;
    }
  }

  return v5;
}

- (POPrebootDeviceConfiguration)initWithData:(id)a3
{
  uint64_t v8 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v8];
  if (v8)
  {
    id v5 = __45__POPrebootDeviceConfiguration_initWithData___block_invoke();
    id v6 = 0;
  }
  else
  {
    self = [(POPrebootDeviceConfiguration *)self initWithDictionary:v4];
    id v6 = self;
  }

  return v6;
}

id __45__POPrebootDeviceConfiguration_initWithData___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error deserializing user login config."];
  v1 = PO_LOG_POPrebootDeviceConfiguration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1);
  }

  return v0;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(POPrebootDeviceConfiguration *)self dataRepresentation];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POPrebootDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_dataRepresentation);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = [(POPrebootDeviceConfiguration *)self initWithData:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(POPrebootDeviceConfiguration *)self dataRepresentation];
  uint64_t v5 = NSStringFromSelector(sel_dataRepresentation);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSData)encryptionKeyData
{
  return self->_encryptionKeyData;
}

- (NSDate)encryptionKeySaveDate
{
  return self->_encryptionKeySaveDate;
}

- (NSData)deviceConfigurationData
{
  return self->_deviceConfigurationData;
}

- (void)setDeviceConfigurationData:(id)a3
{
}

- (NSData)loginConfigurationData
{
  return self->_loginConfigurationData;
}

- (void)setLoginConfigurationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginConfigurationData, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationData, 0);
  objc_storeStrong((id *)&self->_encryptionKeySaveDate, 0);
  objc_storeStrong((id *)&self->_encryptionKeyData, 0);
}

- (void)dataRepresentationForDisplay:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "serialized configuration: %{public}@", (uint8_t *)&v4, 0xCu);
}

void __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_259DFE000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end