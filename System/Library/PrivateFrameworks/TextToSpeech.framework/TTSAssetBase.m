@interface TTSAssetBase
+ (BOOL)supportsSecureCoding;
- (NSNumber)compatibilityVersion;
- (NSNumber)contentVersion;
- (NSString)bundleIdentifier;
- (NSString)masteredVersion;
- (TTSAssetBase)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
- (void)setContentVersion:(id)a3;
- (void)setMasteredVersion:(id)a3;
@end

@implementation TTSAssetBase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)bundleIdentifier, @"_bundleIdentifier", v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_compatibilityVersion, @"_compatibilityVersion", v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_contentVersion, @"_contentVersion", v10);
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_masteredVersion, @"_masteredVersion", v12);
}

- (TTSAssetBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TTSAssetBase;
  v5 = [(TTSAssetBase *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_bundleIdentifier", v8);
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_compatibilityVersion", v13);
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"_contentVersion", v18);
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"_masteredVersion", v23);
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v24;
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (void)setMasteredVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end