@interface OspreyConnectionPreferences
- (BOOL)isDeviceAttestionExpired;
- (BOOL)setDeviceAttestationData:(id)a3 withExpiration:(id)a4;
- (NSData)certificateData;
- (NSDate)deviceAttestionExpireOn;
- (NSNumber)deviceAttestionVersion;
- (NSNumber)deviceAuthenticationVersion;
- (NSString)connectionHost;
- (OspreyConnectionPreferences)initWithConnectionHost:(id)a3 keychain:(id)a4;
- (OspreyConnectionPreferences)initWithDictionary:(id)a3 keychain:(id)a4;
- (id)_certificateDataKey;
- (id)_deviceAttestationDataKey;
- (id)deviceAttestationData;
- (id)dictionaryRepresentation;
- (void)deleteAll;
- (void)deleteCertificateData;
- (void)deleteDeviceAttestationData;
- (void)resetCachedDeviceAttestation;
- (void)setCertificateData:(id)a3;
- (void)setConnectionHost:(id)a3;
- (void)setDeviceAttestionExpireOn:(id)a3;
- (void)setDeviceAttestionVersion:(id)a3;
- (void)setDeviceAuthenticationVersion:(id)a3;
@end

@implementation OspreyConnectionPreferences

- (OspreyConnectionPreferences)initWithConnectionHost:(id)a3 keychain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OspreyConnectionPreferences;
  v8 = [(OspreyConnectionPreferences *)&v13 init];
  if (v8)
  {
    v9 = [v6 lowercaseString];
    uint64_t v10 = [v9 copy];
    connectionHost = v8->_connectionHost;
    v8->_connectionHost = (NSString *)v10;

    objc_storeStrong((id *)&v8->_keychain, a4);
  }

  return v8;
}

- (OspreyConnectionPreferences)initWithDictionary:(id)a3 keychain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"host"];
  v9 = [(OspreyConnectionPreferences *)self initWithConnectionHost:v8 keychain:v7];

  if (v9 == self)
  {
    uint64_t v10 = [v6 objectForKey:@"deviceAttestationExpireOn"];
    deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
    self->_deviceAttestionExpireOn = v10;

    v12 = [v6 objectForKey:@"deviceAttestationVersion"];
    deviceAttestionVersion = self->_deviceAttestionVersion;
    self->_deviceAttestionVersion = v12;

    v14 = [v6 objectForKey:@"deviceAuthenticationVersion"];
    deviceAuthenticationVersion = self->_deviceAuthenticationVersion;
    self->_deviceAuthenticationVersion = v14;
  }
  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:self->_connectionHost forKey:@"host"];
  [v3 setValue:self->_deviceAttestionExpireOn forKey:@"deviceAttestationExpireOn"];
  [v3 setValue:self->_deviceAttestionVersion forKey:@"deviceAttestationVersion"];
  [v3 setValue:self->_deviceAuthenticationVersion forKey:@"deviceAuthenticationVersion"];

  return v3;
}

- (void)deleteAll
{
  [(OspreyConnectionPreferences *)self deleteCertificateData];

  [(OspreyConnectionPreferences *)self deleteDeviceAttestationData];
}

- (void)resetCachedDeviceAttestation
{
  [(OspreyConnectionPreferences *)self deleteCertificateData];
  [(OspreyConnectionPreferences *)self deleteDeviceAttestationData];
  deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
  self->_deviceAttestionExpireOn = 0;

  deviceAttestionVersion = self->_deviceAttestionVersion;
  self->_deviceAttestionVersion = 0;
}

- (id)_certificateDataKey
{
  return (id)[NSString stringWithFormat:@"deviceAttestation.certificate.for.%@", self->_connectionHost];
}

- (NSData)certificateData
{
  if (!self->_certificateDataFetched)
  {
    keychain = self->_keychain;
    v4 = [(OspreyConnectionPreferences *)self _certificateDataKey];
    v5 = [(OspreyKeychain *)keychain fetchDataWithIdentifier:v4];
    certificateData = self->_certificateData;
    self->_certificateData = v5;

    self->_certificateDataFetched = 1;
  }
  id v7 = self->_certificateData;

  return v7;
}

- (void)setCertificateData:(id)a3
{
  if (a3)
  {
    v4 = (NSData *)[a3 copy];
    certificateData = self->_certificateData;
    self->_certificateData = v4;

    self->_certificateDataFetched = 1;
    keychain = self->_keychain;
    id v7 = self->_certificateData;
    id v9 = [(OspreyConnectionPreferences *)self _certificateDataKey];
    [(OspreyKeychain *)keychain saveData:v7 withIdentifier:v9];
  }
  else
  {
    OspreyLoggingInit();
    v8 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyConnectionPreferences setCertificateData:](v8);
    }
  }
}

- (void)deleteCertificateData
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyConnectionPreferences deleteCertificateData]";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s Error deleting certificate from keychain.", (uint8_t *)&v1, 0xCu);
}

- (id)_deviceAttestationDataKey
{
  return (id)[NSString stringWithFormat:@"deviceAttestation.for.%@", self->_connectionHost];
}

- (BOOL)isDeviceAttestionExpired
{
  deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(deviceAttestionExpireOn) = [(NSDate *)deviceAttestionExpireOn compare:v3] == NSOrderedAscending;

  return (char)deviceAttestionExpireOn;
}

- (BOOL)setDeviceAttestationData:(id)a3 withExpiration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_deviceAttestionExpireOn, a4);
    v8 = (NSData *)[v6 copy];
    deviceAttestationData = self->_deviceAttestationData;
    self->_deviceAttestationData = v8;

    uint64_t v10 = [(OspreyConnectionPreferences *)self _deviceAttestationDataKey];
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextPreferences, OS_LOG_TYPE_DEBUG)) {
      -[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:]();
    }
    BOOL v11 = [(OspreyKeychain *)self->_keychain saveData:self->_deviceAttestationData withIdentifier:v10];
  }
  else
  {
    deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
    self->_deviceAttestionExpireOn = 0;

    objc_super v13 = self->_deviceAttestationData;
    self->_deviceAttestationData = 0;

    OspreyLoggingInit();
    v14 = OspreyLogContextPreferences;
    if (os_log_type_enabled((os_log_t)OspreyLogContextPreferences, OS_LOG_TYPE_ERROR)) {
      -[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:]((uint64_t)self, v14);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)deviceAttestationData
{
  uint64_t v3 = [(OspreyConnectionPreferences *)self _deviceAttestationDataKey];
  if ([(OspreyConnectionPreferences *)self isDeviceAttestionExpired])
  {
    [(OspreyKeychain *)self->_keychain deleteDataWithIdentifier:v3];
    deviceAttestationData = self->_deviceAttestationData;
    self->_deviceAttestationData = 0;

    v5 = 0;
  }
  else
  {
    id v6 = self->_deviceAttestationData;
    if (!v6)
    {
      id v7 = [(OspreyKeychain *)self->_keychain fetchDataWithIdentifier:v3];
      v8 = self->_deviceAttestationData;
      self->_deviceAttestationData = v7;

      id v6 = self->_deviceAttestationData;
    }
    v5 = v6;
  }

  return v5;
}

- (void)deleteDeviceAttestationData
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_DEBUG, "%s Deleted with key: '%@'", (uint8_t *)v1, 0x16u);
}

- (NSString)connectionHost
{
  return self->_connectionHost;
}

- (void)setConnectionHost:(id)a3
{
}

- (NSNumber)deviceAuthenticationVersion
{
  return self->_deviceAuthenticationVersion;
}

- (void)setDeviceAuthenticationVersion:(id)a3
{
}

- (NSNumber)deviceAttestionVersion
{
  return self->_deviceAttestionVersion;
}

- (void)setDeviceAttestionVersion:(id)a3
{
}

- (NSDate)deviceAttestionExpireOn
{
  return self->_deviceAttestionExpireOn;
}

- (void)setDeviceAttestionExpireOn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAttestionExpireOn, 0);
  objc_storeStrong((id *)&self->_deviceAttestionVersion, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticationVersion, 0);
  objc_storeStrong((id *)&self->_connectionHost, 0);
  objc_storeStrong((id *)&self->_deviceAttestationData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);

  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)setCertificateData:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyConnectionPreferences setCertificateData:]";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s Attempted to save nil data for certificate.", (uint8_t *)&v1, 0xCu);
}

- (void)setDeviceAttestationData:(uint64_t)a1 withExpiration:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315394;
  v4 = "-[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1BEDB4000, a2, OS_LOG_TYPE_ERROR, "%s Attempted to save nil data for device attestation data for host: %@", (uint8_t *)&v3, 0x16u);
}

- (void)setDeviceAttestationData:withExpiration:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1BEDB4000, v2, OS_LOG_TYPE_DEBUG, "%s Saved with key: '%@' and expiration: %@", (uint8_t *)v3, 0x20u);
}

@end