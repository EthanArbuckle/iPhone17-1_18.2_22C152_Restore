@interface PublicKey
- (BOOL)isEqual:(id)a3;
- (P256PublicKeyProtocol)key;
- (PublicKey)initWithData:(id)a3 error:(id *)a4;
- (PublicKey)initWithKey:(id)a3;
- (id)dataRepresentation;
- (id)description;
- (void)setKey:(id)a3;
@end

@implementation PublicKey

- (PublicKey)initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PublicKey;
  v6 = [(PublicKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PublicKey *)self key];
    v7 = [v6 dataRepresentation];
    v8 = [v5 key];

    objc_super v9 = [v8 dataRepresentation];
    char v10 = [v7 isEqualToData:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (PublicKey)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[SecKeyP256Public alloc] initWithData:v6 error:a4];
  if (v7)
  {
    self = [(PublicKey *)self initWithKey:v7];
    v8 = self;
  }
  else
  {
    objc_super v9 = MessageProtectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PublicKey initWithData:error:]((uint64_t)v6, (uint64_t *)a4, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (id)dataRepresentation
{
  return (id)[(P256PublicKeyProtocol *)self->_key dataRepresentation];
}

- (id)description
{
  v2 = NSString;
  v3 = [(PublicKey *)self dataRepresentation];
  id v4 = [v2 stringWithFormat:@"PublicKey with data representation: %@", v3];

  return v4;
}

- (P256PublicKeyProtocol)key
{
  return (P256PublicKeyProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithData:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Attempting to initialize public key with invalid format: %@ and error: %@", (uint8_t *)&v4, 0x16u);
}

@end