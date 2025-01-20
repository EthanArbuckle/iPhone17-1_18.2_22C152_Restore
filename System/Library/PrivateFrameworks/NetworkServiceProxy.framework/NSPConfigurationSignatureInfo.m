@interface NSPConfigurationSignatureInfo
+ (BOOL)supportsSecureCoding;
+ (void)removeFromPreferences;
- (BOOL)saveToPreferences;
- (NSArray)certificates;
- (NSData)signature;
- (NSPConfigurationSignatureInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromPreferences;
- (unint64_t)signatureAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignatureAlgorithm:(unint64_t)a3;
@end

@implementation NSPConfigurationSignatureInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConfigurationSignatureInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSPConfigurationSignatureInfo;
  v5 = [(NSPConfigurationSignatureInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v8;

    v5->_signatureAlgorithm = (int)[v4 decodeIntForKey:@"signatureAlgorithm"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(NSPConfigurationSignatureInfo *)self certificates];
  [v6 encodeObject:v4 forKey:@"certificates"];

  v5 = [(NSPConfigurationSignatureInfo *)self signature];
  [v6 encodeObject:v5 forKey:@"signature"];

  objc_msgSend(v6, "encodeInt:forKey:", -[NSPConfigurationSignatureInfo signatureAlgorithm](self, "signatureAlgorithm"), @"signatureAlgorithm");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPConfigurationSignatureInfo allocWithZone:a3] init];
  v5 = [(NSPConfigurationSignatureInfo *)self certificates];
  [(NSPConfigurationSignatureInfo *)v4 setCertificates:v5];

  id v6 = [(NSPConfigurationSignatureInfo *)self signature];
  [(NSPConfigurationSignatureInfo *)v4 setSignature:v6];

  [(NSPConfigurationSignatureInfo *)v4 setSignatureAlgorithm:[(NSPConfigurationSignatureInfo *)self signatureAlgorithm]];
  return v4;
}

- (BOOL)saveToPreferences
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  if (!v3)
  {
    v7 = nplog_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      BOOL v8 = 0;
      goto LABEL_9;
    }
    __int16 v14 = 0;
    v9 = "NSKeyedArchiver initialize failed";
    v10 = (uint8_t *)&v14;
LABEL_11:
    _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_8;
  }
  [(NSPConfigurationSignatureInfo *)self encodeWithCoder:v3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  _CFPreferencesSetFileProtectionClass();
  v5 = [v3 encodedData];
  CFPreferencesSetAppValue(@"NSPSignatureInfo", v5, v4);

  LODWORD(v5) = CFPreferencesAppSynchronize(v4);
  id v6 = nplog_obj();
  v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v9 = "Failed to write nsp signature info to preference file";
    v10 = buf;
    goto LABEL_11;
  }
  BOOL v8 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "Saved signature info to preference file", v12, 2u);
  }
LABEL_9:

  return v8;
}

+ (void)removeFromPreferences
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"NSPSignatureInfo", 0, v2);
  int v3 = CFPreferencesAppSynchronize(v2);
  CFStringRef v4 = nplog_obj();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Removed signature info to preference file", v6, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "Failed to remove signature info from preference file", buf, 2u);
  }
}

- (id)initFromPreferences
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"NSPSignatureInfo", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  if (v3)
  {
    CFStringRef v4 = v3;
    id v15 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v15];
    id v6 = v15;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      CFRelease(v4);
      v14.receiver = self;
      v14.super_class = (Class)NSPConfigurationSignatureInfo;
      objc_super v11 = [(NSPConfigurationSignatureInfo *)&v14 init];
      if (!v11 || (objc_super v11 = [(NSPConfigurationSignatureInfo *)v11 initWithCoder:v5]) != 0)
      {
        self = v11;
        v10 = self;
        goto LABEL_16;
      }
      v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_ERROR, "Failed to decode NSP signature info", buf, 2u);
      }

      self = 0;
    }
    else
    {
      v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP signature info: %@", buf, 0xCu);
      }

      CFRelease(v4);
    }
    v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "no saved signature info", buf, 2u);
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (unint64_t)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (void)setSignatureAlgorithm:(unint64_t)a3
{
  self->_signatureAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end