@interface POJWT
- (BOOL)isJWE;
- (NSString)rawAuthenticationTag;
- (NSString)rawBody;
- (NSString)rawCipherText;
- (NSString)rawEncryptedKey;
- (NSString)rawHeader;
- (NSString)rawIV;
- (NSString)rawSignature;
- (POJWT)initWithString:(id)a3;
- (POJWTHeader)decodedHeader;
- (__SecKey)decodeEphemeralPublicKey;
- (id)mutableCopy;
- (id)stringRepresentation;
- (void)setDecodedHeader:(id)a3;
- (void)setRawAuthenticationTag:(id)a3;
- (void)setRawBody:(id)a3;
- (void)setRawCipherText:(id)a3;
- (void)setRawEncryptedKey:(id)a3;
- (void)setRawHeader:(id)a3;
- (void)setRawIV:(id)a3;
- (void)setRawSignature:(id)a3;
@end

@implementation POJWT

- (POJWT)initWithString:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POJWT;
  v5 = [(POJWT *)&v33 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 componentsSeparatedByString:@"."];
  if (![v6 count])
  {
    id v19 = __24__POJWT_initWithString___block_invoke();

LABEL_13:
    v27 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  rawHeader = v5->_rawHeader;
  v5->_rawHeader = (NSString *)v7;

  id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
  v10 = objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v5->_rawHeader);

  if (v10)
  {
    v11 = [[POJWTHeader alloc] initWithJWTData:v10];
    decodedHeader = v5->_decodedHeader;
    v5->_decodedHeader = v11;
  }
  uint64_t v13 = [v6 count];
  if (v13 == 5)
  {
    char v17 = 1;
    uint64_t v20 = [v6 objectAtIndexedSubscript:1];
    rawEncryptedKey = v5->_rawEncryptedKey;
    v5->_rawEncryptedKey = (NSString *)v20;

    uint64_t v22 = [v6 objectAtIndexedSubscript:2];
    rawIV = v5->_rawIV;
    v5->_rawIV = (NSString *)v22;

    uint64_t v24 = [v6 objectAtIndexedSubscript:3];
    rawCipherText = v5->_rawCipherText;
    v5->_rawCipherText = (NSString *)v24;

    uint64_t v26 = [v6 objectAtIndexedSubscript:4];
    rawAuthenticationTag = v5->_rawAuthenticationTag;
    v5->_rawAuthenticationTag = (NSString *)v26;
    goto LABEL_10;
  }
  if (v13 != 3)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __24__POJWT_initWithString___block_invoke_7;
    v31[3] = &unk_265463860;
    id v32 = v6;
    id v28 = v6;
    id v29 = __24__POJWT_initWithString___block_invoke_7((uint64_t)v31);

    goto LABEL_13;
  }
  uint64_t v14 = [v6 objectAtIndexedSubscript:1];
  rawBody = v5->_rawBody;
  v5->_rawBody = (NSString *)v14;

  uint64_t v16 = [v6 objectAtIndexedSubscript:2];
  char v17 = 0;
  rawAuthenticationTag = v5->_rawSignature;
  v5->_rawSignature = (NSString *)v16;
LABEL_10:

  v5->_jwe = v17;
LABEL_11:
  v27 = v5;
LABEL_14:

  return v27;
}

id __24__POJWT_initWithString___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Missing JWT parts."];
  v1 = PO_LOG_POJWT();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POJWT_initWithString___block_invoke_7(uint64_t a1)
{
  v2 = +[POError errorWithCode:-1008 description:@"Incorrect number of JWT parts."];
  v3 = PO_LOG_POJWT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_7_cold_1((uint64_t)v2, a1, v3);
  }

  return v2;
}

- (id)mutableCopy
{
  return 0;
}

- (id)stringRepresentation
{
  BOOL v3 = [(POJWT *)self isJWE];
  id v4 = NSString;
  v5 = [(POJWT *)self rawHeader];
  if (v3)
  {
    v6 = [(POJWT *)self rawEncryptedKey];
    uint64_t v7 = [(POJWT *)self rawIV];
    v8 = [(POJWT *)self rawCipherText];
    id v9 = [(POJWT *)self rawAuthenticationTag];
    v10 = [v4 stringWithFormat:@"%@.%@.%@.%@.%@", v5, v6, v7, v8, v9];
  }
  else
  {
    v6 = [(POJWT *)self rawBody];
    uint64_t v7 = [(POJWT *)self rawSignature];
    v10 = [v4 stringWithFormat:@"%@.%@.%@", v5, v6, v7];
  }

  return v10;
}

- (__SecKey)decodeEphemeralPublicKey
{
  v27[2] = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v4 = [(POJWT *)self decodedHeader];
  v5 = [v4 epk];
  v6 = [v5 objectForKeyedSubscript:@"x"];
  uint64_t v7 = objc_msgSend(v3, "psso_initWithBase64URLEncodedString:", v6);

  id v8 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v9 = [(POJWT *)self decodedHeader];
  v10 = [v9 epk];
  v11 = [v10 objectForKeyedSubscript:@"y"];
  v12 = objc_msgSend(v8, "psso_initWithBase64URLEncodedString:", v11);

  if (!v7 || [v7 length] != 32)
  {
    id v20 = __33__POJWT_decodeEphemeralPublicKey__block_invoke();
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (!v12 || [v12 length] != 32)
  {
    id v21 = __33__POJWT_decodeEphemeralPublicKey__block_invoke_30();
    goto LABEL_10;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v24 = 4;
  [v13 appendBytes:&v24 length:1];
  [v13 appendData:v7];
  [v13 appendData:v12];
  uint64_t v14 = *MEMORY[0x263F16FB8];
  uint64_t v15 = *MEMORY[0x263F16F68];
  v26[0] = *MEMORY[0x263F16FA8];
  v26[1] = v15;
  uint64_t v16 = *MEMORY[0x263F16F80];
  v27[0] = v14;
  v27[1] = v16;
  CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v18 = SecKeyCreateWithData((CFDataRef)v13, v17, &error);
  if (error)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __33__POJWT_decodeEphemeralPublicKey__block_invoke_38;
    v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v23[4] = error;
    id v19 = __33__POJWT_decodeEphemeralPublicKey__block_invoke_38((uint64_t)v23);
  }

LABEL_11:
  return v18;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"epk X value is missing or invalid when decrypting JWT."];
  v1 = PO_LOG_POJWT();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke_30()
{
  v0 = +[POError errorWithCode:-1008 description:@"epk Y value is missing or invalid when decrypting JWT."];
  v1 = PO_LOG_POJWT();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke_38(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error importing epk when decrypting JWT"];

  id v3 = PO_LOG_POJWT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

- (BOOL)isJWE
{
  return self->_jwe;
}

- (NSString)rawHeader
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRawHeader:(id)a3
{
}

- (POJWTHeader)decodedHeader
{
  return (POJWTHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDecodedHeader:(id)a3
{
}

- (NSString)rawEncryptedKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRawEncryptedKey:(id)a3
{
}

- (NSString)rawIV
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRawIV:(id)a3
{
}

- (NSString)rawBody
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRawBody:(id)a3
{
}

- (NSString)rawCipherText
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRawCipherText:(id)a3
{
}

- (NSString)rawSignature
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRawSignature:(id)a3
{
}

- (NSString)rawAuthenticationTag
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawAuthenticationTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAuthenticationTag, 0);
  objc_storeStrong((id *)&self->_rawSignature, 0);
  objc_storeStrong((id *)&self->_rawCipherText, 0);
  objc_storeStrong((id *)&self->_rawBody, 0);
  objc_storeStrong((id *)&self->_rawIV, 0);
  objc_storeStrong((id *)&self->_rawEncryptedKey, 0);
  objc_storeStrong((id *)&self->_decodedHeader, 0);
  objc_storeStrong((id *)&self->_rawHeader, 0);
}

void __24__POJWT_initWithString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DFE000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void __24__POJWT_initWithString___block_invoke_7_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a2 + 32), "count"));
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_259DFE000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);
}

@end