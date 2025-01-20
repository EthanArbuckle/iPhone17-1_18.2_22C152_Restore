@interface KTAccountPublicID
+ (BOOL)supportsSecureCoding;
+ (KTAccountPublicID)ktAccountPublicIDWithPKIString:(id)a3 error:(id *)a4;
+ (KTAccountPublicID)ktAccountPublicIDWithPublicKeyInfo:(id)a3 error:(id *)a4;
+ (KTAccountPublicID)ktAccountPublicIDWithStorageString:(id)a3 error:(id *)a4;
+ (KTAccountPublicID)ktAccountPublicIDWithString:(id)a3 error:(id *)a4;
+ (id)encodePublicKeyInfoDigestSuffix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (KTAccountPublicID)initWithCoder:(id)a3;
- (KTAccountPublicID)initWithPublicKeyIdentity:(id)a3 error:(id *)a4;
- (KTAccountPublicID)initWithPublicKeyInfo:(id)a3 error:(id *)a4;
- (KTAccountPublicID)initWithStorageString:(id)a3 error:(id *)a4;
- (NSData)publicKeyInfo;
- (NSString)ktStorageString;
- (NSString)publicAccountIdentity;
- (NSString)publicAccountPKI;
- (NSString)publicID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPublicID:(id)a3;
@end

@implementation KTAccountPublicID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[KTAccountPublicID allocWithZone:](KTAccountPublicID, "allocWithZone:") init];
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    v7 = (_PCSPublicIdentityData *)CFRetain(publicIdentity);
    publicID = v5->_publicID;
    v5->_publicIdentity = v7;
    v5->_publicID = 0;
  }
  else
  {
    v5->_publicIdentity = 0;
    uint64_t v9 = [(NSString *)self->_publicID copyWithZone:a3];
    publicID = v5->_publicID;
    v5->_publicID = (NSString *)v9;
  }

  return v5;
}

- (NSData)publicKeyInfo
{
  publicIdentity = self->_publicIdentity;
  if (publicIdentity) {
    publicIdentity = (void *)PCSPublicIdentityCopyPublicKeyInfo();
  }

  return (NSData *)publicIdentity;
}

+ (id)encodePublicKeyInfoDigestSuffix:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "kt_sha256");
  if (v4)
  {
    v5 = (void *)[v3 mutableCopy];
    objc_msgSend(v5, "appendBytes:length:", objc_msgSend(v4, "bytes"), 2);
    v6 = [v5 base64EncodedStringWithOptions:0];
    v7 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    v8 = [v7 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"="];
      v10 = [v8 stringByTrimmingCharactersInSet:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)publicAccountIdentity
{
  if (self->_publicIdentity)
  {
    v2 = [(KTAccountPublicID *)self publicKeyInfo];
    id v3 = objc_msgSend(v2, "kt_sha256");
    v4 = (void *)[v3 mutableCopy];

    if (v4 && [v4 length] == 32)
    {
      v5 = +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:v4];
      if (v5)
      {
        v6 = [NSString stringWithFormat:@"%@%@", @"APKTID", v5];
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = [NSString stringWithFormat:@"%@%@", @"APKTID", self->_publicID];
  }

  return (NSString *)v6;
}

- (NSString)ktStorageString
{
  if (self->_publicIdentity)
  {
    v2 = [(KTAccountPublicID *)self publicKeyInfo];
    id v3 = objc_msgSend(v2, "kt_sha256");
    v4 = (void *)[v3 mutableCopy];

    if (v4 && [v4 length] == 32)
    {
      v5 = +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v2 = [(KTAccountPublicID *)self publicID];
    v5 = (void *)[v2 copy];
  }

  return (NSString *)v5;
}

- (NSString)publicAccountPKI
{
  v2 = [(KTAccountPublicID *)self publicKeyInfo];
  id v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "kt_sha256");
    if (v4)
    {
      v5 = (void *)[v3 mutableCopy];
      if (v5)
      {
        objc_msgSend(v5, "appendBytes:length:", objc_msgSend(v4, "bytes"), 2);
        v6 = [v5 base64EncodedStringWithOptions:0];
        if (v6)
        {
          v7 = [NSString stringWithFormat:@"%@%@", @"apple-ktpki:", v6];
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

+ (KTAccountPublicID)ktAccountPublicIDWithString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasPrefix:@"apple-ktid:"]
    && (unint64_t)[v6 length] >= 0x47)
  {
    v7 = [v6 stringByReplacingOccurrencesOfString:@"apple-ktid:" withString:@"apple-ktpki:"];
    v8 = [a1 ktAccountPublicIDWithPKIString:v7 error:a4];
  }
  else
  {
    v8 = [[KTAccountPublicID alloc] initWithPublicKeyIdentity:v6 error:a4];
  }

  return v8;
}

- (KTAccountPublicID)initWithPublicKeyInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v10 = +[TransparencyError errorWithDomain:@"TransparencyErrorInternal" code:-366 description:@"No publicKeyInfo"];
    v11 = v10;
    if (a4 && v10) {
      *a4 = v10;
    }

    goto LABEL_14;
  }
  v15.receiver = self;
  v15.super_class = (Class)KTAccountPublicID;
  v7 = [(KTAccountPublicID *)&v15 init];
  if (v7)
  {
    self = v7;
    v8 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateWithPublicKeyInfo();
    if (v8)
    {
      self->_publicIdentity = v8;
      uint64_t v9 = self;
LABEL_15:

      goto LABEL_16;
    }
    v12 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-296 underlyingError:0 description:@"Failed to parse publicKeyInfo"];
    v13 = v12;
    if (a4 && v12) {
      *a4 = v12;
    }

LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = 0;
LABEL_16:

  return v9;
}

- (KTAccountPublicID)initWithPublicKeyIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasPrefix:@"APKTID"])
  {
    id v7 = [v6 substringFromIndex:objc_msgSend(@"APKTID", "length")];
    self = [(KTAccountPublicID *)self initWithStorageString:v7 error:a4];
    v8 = self;
  }
  else
  {
    uint64_t v9 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-291 description:@"kt-id prefix missing"];
    id v7 = v9;
    v8 = 0;
    if (a4 && v9)
    {
      id v7 = v9;
      v8 = 0;
      *a4 = v7;
    }
  }

  return v8;
}

- (KTAccountPublicID)initWithStorageString:(id)a3 error:(id *)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

  if (v8)
  {
    uint64_t v9 = [v8 length] & 3;
    if (v9)
    {
      v10 = [@"====" substringToIndex:v9];
      uint64_t v11 = [v8 stringByAppendingString:v10];

      v8 = (void *)v11;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBase64EncodedString:v8 options:1];
    if ((unint64_t)[v12 length] > 1)
    {
      v16 = objc_msgSend(v12, "subdataWithRange:", 0, objc_msgSend(v12, "length") - 2);
      v17 = objc_msgSend(v12, "subdataWithRange:", objc_msgSend(v12, "length") - 2, 2);
      v18 = objc_msgSend(v16, "kt_sha256");
      if (v18)
      {
        [v17 bytes];
        [v18 bytes];
        if (cc_cmp_safe())
        {
          v23 = v17;
          v24[0] = *MEMORY[0x263F08320];
          v24[1] = @"storageString";
          v25[0] = @"initWithStorageString signature wrong ";
          v25[1] = v6;
          v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
          v20 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-293 userInfo:v19];

          if (a4 && v20) {
            *a4 = v20;
          }

          objc_super v15 = 0;
          v17 = v23;
        }
        else
        {
          v21 = +[KTAccountPublicID encodePublicKeyInfoDigestSuffix:v16];
          if (v21)
          {
            objc_storeStrong((id *)&self->_publicID, v21);
            objc_super v15 = self;
          }
          else
          {
            objc_super v15 = 0;
          }
        }
      }
      else
      {
        objc_super v15 = 0;
      }
    }
    else
    {
      v13 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-292 description:@"info+signature too short"];
      v14 = v13;
      if (a4 && v13) {
        *a4 = v13;
      }

      objc_super v15 = 0;
    }
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

+ (KTAccountPublicID)ktAccountPublicIDWithPKIString:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 hasPrefix:@"apple-ktpki:"])
  {
    id v6 = [v5 substringFromIndex:objc_msgSend(@"apple-ktpki:", "length")];
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBase64EncodedString:v6 options:1];
    if ((unint64_t)[v7 length] <= 1)
    {
      v8 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-292 description:@"info+signature too short"];
      uint64_t v9 = v8;
      if (a4 && v8) {
        *a4 = v8;
      }

      v10 = 0;
      goto LABEL_27;
    }
    v13 = objc_msgSend(v7, "subdataWithRange:", 0, objc_msgSend(v7, "length") - 2);
    v14 = objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 2, 2);
    objc_super v15 = objc_msgSend(v13, "kt_sha256");
    if (v15)
    {
      [v14 bytes];
      [v15 bytes];
      if (cc_cmp_safe())
      {
        uint64_t v23 = *MEMORY[0x263F08320];
        v24[0] = @"ktAccountPublicIDWithPKIString signature wrong ";
        v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        v17 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-293 userInfo:v16];

        if (a4 && v17) {
          *a4 = v17;
        }
      }
      else
      {
        uint64_t v18 = PCSPublicIdentityCreateWithPublicKeyInfo();
        if (v18)
        {
          v10 = objc_alloc_init(KTAccountPublicID);
          v10->_publicIdentity = (_PCSPublicIdentityData *)v18;
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        v19 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode", -294, 0, @"Failed to parse kt-id", 0 code underlyingError description];
        v20 = v19;
        if (a4 && v19) {
          *a4 = v19;
        }
        if (cf) {
          CFRelease(cf);
        }
      }
    }
    v10 = 0;
    goto LABEL_26;
  }
  uint64_t v11 = +[TransparencyError errorWithDomain:@"TransparencyErrorDecode" code:-291 description:@"kt-id prefix missing"];
  v12 = v11;
  if (a4 && v11) {
    *a4 = v11;
  }

  v10 = 0;
LABEL_28:

  return v10;
}

+ (KTAccountPublicID)ktAccountPublicIDWithPublicKeyInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[KTAccountPublicID alloc] initWithPublicKeyInfo:v5 error:a4];

  return v6;
}

+ (KTAccountPublicID)ktAccountPublicIDWithStorageString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[KTAccountPublicID alloc] initWithStorageString:v5 error:a4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_publicIdentity)
  {
    id v7 = v4;
    id v5 = (void *)PCSPublicIdentityCopyPublicKeyInfo();
    id v6 = @"pki";
  }
  else
  {
    if (!self->_publicID) {
      goto LABEL_6;
    }
    id v7 = v4;
    id v5 = [(KTAccountPublicID *)self publicAccountIdentity];
    id v6 = @"publicID";
  }
  [v7 encodeObject:v5 forKey:v6];

LABEL_6:

  MEMORY[0x270F9A758]();
}

- (KTAccountPublicID)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pki"];
  if (v5)
  {
    id v6 = [(KTAccountPublicID *)self initWithPublicKeyInfo:v5 error:0];
    id v7 = v6;
    if (v6)
    {
      id v7 = v6;
      self = v7;
      v8 = v7;
    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_15);
      }
      v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = 0;
        _os_log_impl(&dword_226345000, v13, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: pki %@", buf, 0xCu);
      }
      self = 0;
      v8 = 0;
    }
  }
  else
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicID"];
    if (v7)
    {
      id v17 = 0;
      uint64_t v9 = [(KTAccountPublicID *)self initWithPublicKeyIdentity:v7 error:&v17];
      id v10 = v17;
      uint64_t v11 = v9;
      self = v11;
      if (v11)
      {
        v12 = v11;
      }
      else
      {
        if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
          dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_69);
        }
        objc_super v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
        if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v7;
          __int16 v20 = 2112;
          id v21 = v10;
          _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: publicID %@ %@", buf, 0x16u);
        }
      }

      v8 = self;
    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_72);
      }
      v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226345000, v14, OS_LOG_TYPE_ERROR, "[KTAccountPublicID initWithCoder:]: unknown", buf, 2u);
      }
      v8 = 0;
    }
  }

  return v8;
}

uint64_t __35__KTAccountPublicID_initWithCoder___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __35__KTAccountPublicID_initWithCoder___block_invoke_67()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __35__KTAccountPublicID_initWithCoder___block_invoke_70()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = (void *)v5[2];
    if (v6 && self->_publicID)
    {
      char v7 = objc_msgSend(v6, "isEqual:");
    }
    else
    {
      v8 = (const void *)v5[1];
      if (v8 && (publicIdentity = self->_publicIdentity) != 0)
      {
        char v7 = CFEqual(v8, publicIdentity) != 0;
      }
      else
      {
        id v10 = [v5 publicAccountIdentity];
        uint64_t v11 = [(KTAccountPublicID *)self publicAccountIdentity];
        v12 = (void *)v11;
        char v7 = 0;
        if (v10 && v11) {
          char v7 = [v10 isEqual:v11];
        }
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)KTAccountPublicID;
  [(KTAccountPublicID *)&v4 dealloc];
}

- (NSString)publicID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPublicID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end